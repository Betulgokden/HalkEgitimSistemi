using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using HalkEgitimSistemi.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using System.Collections.Concurrent;
using System.Linq;

namespace HalkEgitimSistemi.Hubs
{
    /// <summary>
    /// Yalnızca öğretmenlerin katılabildiği gerçek zamanlı grup sohbeti.
    /// </summary>
    [Authorize(Roles = "Instructor,Admin")]
    public class TeacherChatHub : Hub
    {
        private readonly AppDbContext _context;
        private readonly IProfanityFilterService _filter;

        // Bağlı kullanıcıları takip etmek için (ConnectionId -> { Name, Role })
        private static readonly ConcurrentDictionary<string, (string Name, string Role)> _connectedUsers = new();

        public TeacherChatHub(AppDbContext context, IProfanityFilterService filter)
        {
            _context = context;
            _filter = filter;
        }

        public async Task SendMessage(string message)
        {
            var user = Context.User;
            if (user == null) return;

            string senderName = user.FindFirstValue("FullName")
                             ?? user.Identity?.Name
                             ?? "Yetkili";

            int? instructorId = null;
            var instIdClaim = user.FindFirstValue("InstructorId");
            if (!string.IsNullOrEmpty(instIdClaim) && int.TryParse(instIdClaim, out int iid))
            {
                instructorId = iid;
            }

            // Küfür filtresi
            string filtered = _filter.Filter(message, out bool wasCensored);

            // Eğer küfür tespit edildiyse ceza uygula
            if (wasCensored)
            {
                string email = user.FindFirstValue(ClaimTypes.Email) ?? string.Empty;
                await _filter.ApplyPenaltyAsync(email, senderName, message);
            }

            // Mesajı kaydet
            var chatMsg = new TeacherChatMessage
            {
                InstructorId = instructorId,
                SenderName = senderName,
                Message = filtered,
                OriginalMessage = message,
                IsCensored = wasCensored,
                SentAt = DateTime.Now
            };
            _context.TeacherChatMessages.Add(chatMsg);
            await _context.SaveChangesAsync();

            await Clients.All.SendAsync("ReceiveMessage", senderName, filtered, DateTime.Now.ToString("dd.MM.yyyy HH:mm"), wasCensored);
        }

        public override async Task OnConnectedAsync()
        {
            var user = Context.User;
            if (user == null) return;

            // Admin geçiş kontrolü atlar - sadece Instructor için kontrol yap
            if (user.IsInRole("Instructor"))
            {
                var instIdClaim = user.FindFirstValue("InstructorId");
                if (int.TryParse(instIdClaim, out int instId))
                {
                    // IsApproved kontrolü kaldırıldı
                    var instructor = await _context.Instructors.AsNoTracking().FirstOrDefaultAsync(i => i.Id == instId && !i.IsDeleted);
                    if (instructor == null)
                    {
                        await Clients.Caller.SendAsync("ReceiveSystemWarning", "Eğitmen kaydınız bulunamadı.");
                        Context.Abort();
                        return;
                    }
                }
            }

            string name;
            string role;

            if (user.IsInRole("Admin"))
            {
                name = user.FindFirstValue("FullName")
                    ?? user.FindFirstValue(ClaimTypes.Name)
                    ?? user.Identity?.Name
                    ?? "Yönetici";
                role = "Yönetici";
            }
            else
            {
                name = user.FindFirstValue("FullName")
                    ?? user.Identity?.Name
                    ?? "Öğretmen";
                role = "Öğretmen";
            }

            _connectedUsers[Context.ConnectionId] = (name, role);

            await Clients.Others.SendAsync("UserJoined", name);
            await BroadcastUserList();
            await base.OnConnectedAsync();
        }

        public override async Task OnDisconnectedAsync(Exception? exception)
        {
            if (_connectedUsers.TryRemove(Context.ConnectionId, out var userInfo))
            {
                await Clients.Others.SendAsync("UserLeft", userInfo.Name);
                await BroadcastUserList();
            }
            await base.OnDisconnectedAsync(exception);
        }

        private async Task BroadcastUserList()
        {
            var users = _connectedUsers.Values
                .Select(u => new { name = u.Name, role = u.Role })
                .DistinctBy(u => u.name)
                .ToList();
            await Clients.All.SendAsync("UpdateUserList", users);
        }
    }
}
