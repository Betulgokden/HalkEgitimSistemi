using Microsoft.AspNetCore.Mvc;
using HalkEgitimSistemi.Models;
using HalkEgitimSistemi.Data;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace HalkEgitimSistemi.Controllers
{
    [Microsoft.AspNetCore.Authorization.Authorize]
    public class ChatController : Controller
    {
        private readonly AppDbContext _context;

        public ChatController(AppDbContext context)
        {
            _context = context;
        }

        // Employer initiates or views chat with a student
        [Microsoft.AspNetCore.Authorization.Authorize(Roles = "Employer,Admin")]
        public async Task<IActionResult> EmployerChat(int studentId)
        {
            var employerEmail = User.Identity!.Name;
            var employer = await _context.Employers.FirstOrDefaultAsync(e => e.Email == employerEmail);
            
            // Security: Ensure Admin can also view, but Employer must own the profile if not admin
            if (employer == null && !User.IsInRole("Admin")) return Unauthorized();

            var student = await _context.Students.FindAsync(studentId);
            if (student == null) return NotFound();

            // Secure Data Retrieval: Only messages involving this specific student and employer
            var query = _context.Messages.AsQueryable();
            if (User.IsInRole("Employer"))
            {
                query = query.Where(m => m.EmployerId == employer.Id && m.StudentId == studentId);
            }
            else // Admin can see all
            {
                query = query.Where(m => m.StudentId == studentId);
            }

            var messages = await query.OrderBy(m => m.Date).ToListAsync();

            ViewBag.StudentName = $"{student.FirstName} {student.LastName}";
            ViewBag.StudentPhone = student.PhoneNumber; // Visible to Employer/Admin
            ViewBag.StudentId = studentId;
            ViewBag.EmployerId = employer?.Id ?? 0;

            return View(messages);
        }

        // Student views their chats (Only if employer has initiated)
        [Microsoft.AspNetCore.Authorization.Authorize(Roles = "Student")]
        public async Task<IActionResult> StudentMessages()
        {
            var studentEmail = User.Identity!.Name;
            var student = await _context.Students.FirstOrDefaultAsync(s => s.Email == studentEmail);
            if (student == null) return Unauthorized();

            // Security: Only show employers who have ALREADY sent a message to this student
            var initiatedEmployerIds = await _context.Messages
                .Where(m => m.StudentId == student.Id && m.SenderRole == "Employer")
                .Select(m => m.EmployerId)
                .Distinct()
                .ToListAsync();

            var employers = await _context.Employers
                .Where(e => initiatedEmployerIds.Contains(e.Id))
                .ToListAsync();

            return View(employers);
        }

        [Microsoft.AspNetCore.Authorization.Authorize(Roles = "Student")]
        public async Task<IActionResult> StudentChat(int employerId)
        {
            var studentEmail = User.Identity!.Name;
            var student = await _context.Students.FirstOrDefaultAsync(s => s.Email == studentEmail);
            if (student == null) return Unauthorized();

            // Security Check: Has the employer initiated?
            var hasInitiated = await _context.Messages.AnyAsync(m => m.EmployerId == employerId && m.StudentId == student.Id && m.SenderRole == "Employer");
            if (!hasInitiated) return Forbid("İşveren mesaj atmadan bu sohbete erişemezsiniz.");

            var messages = await _context.Messages
                .Where(m => m.EmployerId == employerId && m.StudentId == student.Id)
                .OrderBy(m => m.Date)
                .ToListAsync();

            var employer = await _context.Employers.FindAsync(employerId);
            ViewBag.EmployerName = employer?.CompanyName ?? "İşveren";
            ViewBag.EmployerId = employerId;

            return View(messages);
        }

        public IActionResult Index(string? targetEmail, string? targetName)
        {
            ViewBag.TargetEmail = targetEmail;
            ViewBag.TargetName = targetName;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SendMessage(int? studentId, int? employerId, string content)
        {
            if (string.IsNullOrWhiteSpace(content)) return BadRequest();

            // XSS Prevention: Sanitize content
            var sanitizedContent = System.Net.WebUtility.HtmlEncode(content);
            var currentEmail = User.Identity!.Name;
            
            var message = new Message
            {
                Content = sanitizedContent,
                Date = DateTime.Now,
                SenderUsername = currentEmail,
                IsRead = false,
                IpAddress = HttpContext.Connection.RemoteIpAddress?.ToString(),
                UserAgent = Request.Headers["User-Agent"].ToString()
            };

            if (User.IsInRole("Employer"))
            {
                var employer = await _context.Employers.FirstOrDefaultAsync(e => e.Email == currentEmail);
                if (employer == null) return Unauthorized();
                
                message.EmployerId = employer.Id;
                message.StudentId = studentId;
                message.SenderRole = "Employer";
                message.ReceiverRole = "Student";
            }
            else if (User.IsInRole("Student"))
            {
                var student = await _context.Students.FirstOrDefaultAsync(s => s.Email == currentEmail);
                if (student == null) return Unauthorized();

                message.StudentId = student.Id;
                message.EmployerId = employerId;
                message.SenderRole = "Student";
                message.ReceiverRole = "Employer";
                
                // Security: Student cannot initiate chat
                var isInitiated = await _context.Messages.AnyAsync(m => m.EmployerId == employerId && m.StudentId == student.Id && m.SenderRole == "Employer");
                if (!isInitiated) return Forbid();
            }

            _context.Messages.Add(message);
            await _context.SaveChangesAsync();

            return RedirectToAction(User.IsInRole("Employer") ? "EmployerChat" : "StudentChat", 
                new { studentId = message.StudentId, employerId = message.EmployerId });
        }
    }
}
