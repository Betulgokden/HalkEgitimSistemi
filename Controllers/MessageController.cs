using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize]
    public class MessageController : Controller
    {
        private readonly AppDbContext _context;

        public MessageController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var username = User.Identity?.Name;
            if (string.IsNullOrEmpty(username)) return Forbid();

            // Admin is redirected to their own log
            if (User.IsInRole("Admin")) return RedirectToAction("MessageLog", "Admin");

            var instructorIdStr = User.FindFirst("InstructorId")?.Value;
            int? instructorId = string.IsNullOrEmpty(instructorIdStr) ? null : int.Parse(instructorIdStr);

            var messages = await _context.Messages
                .Include(m => m.ReceiverInstructor)
                .Where(m => m.SenderUsername == username 
                         || m.ReceiverUsername == username 
                         || (instructorId.HasValue && m.ReceiverInstructorId == instructorId.Value))
                .OrderByDescending(m => m.Date)
                .ToListAsync();

            return View(messages);
        }

        // ÖĞRENCİ TARAFINDAN MESAJ GÖNDERME
        [HttpPost]
        [Authorize(Roles = "Student")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> MesajGonder(int instructorId, string subject, string content)
        {
            if (string.IsNullOrEmpty(content))
            {
                if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
                    return Json(new { success = false, message = "Mesaj içeriği boş olamaz." });

                TempData["Error"] = "Mesaj içeriği boş olamaz.";
                return RedirectToAction("Details", "Instructors", new { id = instructorId });
            }

            var message = new Message
            {
                SenderUsername = User.Identity?.Name ?? "Öğrenci",
                ReceiverInstructorId = instructorId,
                Subject = subject ?? "Eğitmene Soru",
                Content = content,
                Date = DateTime.Now,
                IsRead = false,
                IsFromInstructor = false
            };

            _context.Messages.Add(message);
            await _context.SaveChangesAsync();

            if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
                return Json(new { success = true, message = "Mesajınız eğitmene başarıyla iletildi." });

            TempData["Success"] = "Mesajınız eğitmene başarıyla iletildi.";
            return RedirectToAction("Details", "Instructors", new { id = instructorId });
        }

        // EĞİTMEN VEYA KULLANICI TARAFINDAN CEVAP VERME
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CevapGonder(int messageId, string content)
        {
            var originalMessage = await _context.Messages.FindAsync(messageId);
            if (originalMessage == null) return NotFound();

            bool isInstructor = User.IsInRole("Instructor");

            var reply = new Message
            {
                SenderUsername = User.Identity?.Name ?? (isInstructor ? "Eğitmen" : "Kullanıcı"),
                ReceiverInstructorId = originalMessage.ReceiverInstructorId,
                ReceiverUsername = originalMessage.SenderUsername,
                Subject = originalMessage.Subject.StartsWith("RE: ") ? originalMessage.Subject : "RE: " + originalMessage.Subject,
                Content = content,
                Date = DateTime.Now,
                IsRead = false,
                IsFromInstructor = isInstructor
            };

            // Orijinal mesajı okundu olarak işaretle
            originalMessage.IsRead = true;

            _context.Messages.Add(reply);
            await _context.SaveChangesAsync();

            TempData["Success"] = "Cevabınız gönderildi.";

            // Redirection logic
            if (Request.Headers["Referer"].ToString().Contains("Message"))
                return RedirectToAction("Index");

            if (isInstructor)
                return RedirectToAction("Dashboard", "Teacher");
            
            return RedirectToAction("Dashboard", "Student");
        }

        // MESAJI OKUNDU İŞARETLE
        [HttpPost]
        public async Task<IActionResult> MarkAsRead(int id)
        {
            var msg = await _context.Messages.FindAsync(id);
            if (msg != null)
            {
                msg.IsRead = true;
                await _context.SaveChangesAsync();
            }
            return Ok();
        }
    }
}
