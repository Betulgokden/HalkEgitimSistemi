using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using HalkEgitimSistemi.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace HalkEgitimSistemi.Hubs
{
    /// <summary>
    /// Kurs bazlı grup sohbeti — o kursa kayıtlı öğrenciler + kursun öğretmeni.
    /// Oda adı: "course-{courseId}"
    /// </summary>
    [Authorize]
    public class CourseChatHub : Hub
    {
        private readonly AppDbContext _context;
        private readonly IProfanityFilterService _filter;

        // User tracking: Dictionary<courseId, List<UserInfo>>
        private static readonly System.Collections.Concurrent.ConcurrentDictionary<int, List<CourseUser>> _activeUsers = new();

        public CourseChatHub(AppDbContext context, IProfanityFilterService filter)
        {
            _context = context;
            _filter = filter;
        }

        public async Task JoinCourse(int courseId)
        {
            var user = Context.User;
            if (user == null) return;

            string email = user.FindFirstValue(ClaimTypes.Email) ?? string.Empty;
            bool hasAccess = false;

            if (user.IsInRole("Admin")) { hasAccess = true; }
            else if (user.IsInRole("Instructor"))
            {
                var instIdClaim = user.FindFirstValue("InstructorId");
                if (int.TryParse(instIdClaim, out int instId))
                {
                    // IsApproved kontrolü esnetildi
                    var instructor = await _context.Instructors.AsNoTracking().FirstOrDefaultAsync(i => i.Id == instId && !i.IsDeleted);
                    if (instructor != null && (instructor.CourseId == courseId)) hasAccess = true;
                }
            }
            else // Student
            {
                var application = await _context.Applications.Include(a => a.Course).FirstOrDefaultAsync(a => a.CourseId == courseId && (a.Email == email || (user.Identity != null && a.Email.ToLower() == user.Identity.Name!.ToLower())) && a.Status == ApplicationStatus.Approved && !a.IsDeleted);
                if (application != null)
                {
                    if (application.Course != null && DateTime.Now > application.Course.EndDate) { await Clients.Caller.SendAsync("ReceiveSystemWarning", "Bu kurs sona erdiği için sohbet odası salt okunur veya kapalıdır."); hasAccess = false; }
                    else { hasAccess = true; }
                }
            }

            if (!hasAccess)
            {
                await Clients.Caller.SendAsync("ReceiveSystemWarning", "Bu kursun sohbet odasına erişim yetkiniz bulunmamaktadır.");
                return;
            }

            await Groups.AddToGroupAsync(Context.ConnectionId, $"course-{courseId}");

            string name = GetSenderName();
            string role = user.IsInRole("Admin") ? "Yönetici" : (user.IsInRole("Instructor") ? "Eğitmen" : "Kursiyer");

            var userInfo = new CourseUser { ConnectionId = Context.ConnectionId, Email = email, Name = name, Role = role, CourseId = courseId };
            
            _activeUsers.AddOrUpdate(courseId, 
                new List<CourseUser> { userInfo }, 
                (id, list) => { 
                    list.RemoveAll(u => u.Email == email); // Avoid duplicates if same user joins from another tab (optional, depends on policy)
                    list.Add(userInfo); 
                    return list; 
                });

            await BroadcastUserList(courseId);
            await Clients.OthersInGroup($"course-{courseId}").SendAsync("UserJoined", name, courseId);
        }

        public async Task LeaveCourse(int courseId)
        {
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, $"course-{courseId}");
            RemoveUserFromList(Context.ConnectionId);
            await BroadcastUserList(courseId);
        }

        public async Task SendMessageToCourse(int courseId, string message)
        {
            var user = Context.User;
            if (user == null || string.IsNullOrWhiteSpace(message)) return;

            string email = user.FindFirstValue(ClaimTypes.Email) ?? string.Empty;
            string senderName = GetSenderName();
            string role = user.IsInRole("Admin") ? "Admin" : (user.IsInRole("Instructor") ? "Instructor" : "Student");

            if (await _filter.IsUserBannedAsync(email))
            {
                await Clients.Caller.SendAsync("SystemAlert", "Hesabınızdaki ihlal puanları nedeniyle mesaj gönderiminiz kısıtlanmıştır.");
                return;
            }

            string filtered = _filter.Filter(message, out bool wasCensored);
            if (wasCensored)
            {
                await _filter.ApplyPenaltyAsync(email, senderName, message);
                await Clients.Caller.SendAsync("ReceiveSystemWarning", "Sistem Botu: Lütfen nezaket kurallarına uyunuz. İhlal puanınız arttı!");
            }

            var chatMsg = new CourseChatMessage
            {
                CourseId = courseId,
                SenderName = senderName,
                SenderRole = role,
                SenderEmail = email,
                Message = filtered,
                OriginalMessage = message,
                IsCensored = wasCensored,
                SentAt = DateTime.Now
            };
            _context.CourseChatMessages.Add(chatMsg);
            await _context.SaveChangesAsync();

            await Clients.Group($"course-{courseId}").SendAsync(
                "ReceiveCourseMessage",
                senderName,
                role,
                filtered,
                DateTime.Now.ToString("dd.MM.yyyy HH:mm"),
                wasCensored,
                courseId,
                email
            );
        }

        [Authorize(Roles = "Instructor,Admin")]
        public async Task KickUser(int courseId, string targetEmail, string reason)
        {
            await Clients.Group($"course-{courseId}").SendAsync("UserKicked", targetEmail, reason);
        }

        private async Task BroadcastUserList(int courseId)
        {
            if (_activeUsers.TryGetValue(courseId, out var users))
            {
                // Unique users by email for display
                var displayList = users.GroupBy(u => u.Email).Select(g => g.First()).ToList();
                await Clients.Group($"course-{courseId}").SendAsync("UpdateUserList", displayList);
            }
        }

        private void RemoveUserFromList(string connectionId)
        {
            foreach (var courseId in _activeUsers.Keys)
            {
                if (_activeUsers.TryGetValue(courseId, out var list))
                {
                    list.RemoveAll(u => u.ConnectionId == connectionId);
                }
            }
        }

        private string GetSenderName()
        {
            var user = Context.User;
            return user?.FindFirstValue("FullName") ?? user?.FindFirstValue(ClaimTypes.Name) ?? "Kullanıcı";
        }

        public override async Task OnDisconnectedAsync(Exception? exception)
        {
            RemoveUserFromList(Context.ConnectionId);
            // We'd need the courseId here to broadcast the update. 
            // In a real app, we might store ConnectionId -> CourseId mapping.
            await base.OnDisconnectedAsync(exception);
        }
    }

    public class CourseUser
    {
        public string ConnectionId { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Name { get; set; } = string.Empty;
        public string Role { get; set; } = string.Empty;
        public int CourseId { get; set; }
    }
}
