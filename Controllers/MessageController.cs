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

        // EĞİTMEN TARAFINDAN CEVAP VERME
        [HttpPost]
        [Authorize(Roles = "Instructor")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CevapGonder(int messageId, string content)
        {
            var originalMessage = await _context.Messages.FindAsync(messageId);
            if (originalMessage == null) return NotFound();

            var reply = new Message
            {
                SenderUsername = User.Identity?.Name ?? "Eğitmen",
                ReceiverInstructorId = originalMessage.ReceiverInstructorId,
                ReceiverUsername = originalMessage.SenderUsername,
                Subject = "RE: " + originalMessage.Subject,
                Content = content,
                Date = DateTime.Now,
                IsRead = false,
                IsFromInstructor = true
            };

            // Orijinal mesajı okundu olarak işaretle
            originalMessage.IsRead = true;

            _context.Messages.Add(reply);
            await _context.SaveChangesAsync();

            TempData["Success"] = "Cevabınız gönderildi.";
            return RedirectToAction("Dashboard", "Teacher");
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
