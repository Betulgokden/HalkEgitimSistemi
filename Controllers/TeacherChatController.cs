using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize]
    public class TeacherChatController : Controller
    {
        private readonly AppDbContext _context;

        public TeacherChatController(AppDbContext context)
        {
            _context = context;
        }

        // Öğretmen grup chat sayfası
        [Authorize(Roles = "Instructor,Admin")]
        public async Task<IActionResult> Index()
        {
            if (User.IsInRole("Instructor"))
            {
                var instIdClaim = User.Claims.FirstOrDefault(c => c.Type == "InstructorId")?.Value;
                if (int.TryParse(instIdClaim, out int instId))
                {
                    var instructor = await _context.Instructors.AsNoTracking().FirstOrDefaultAsync(i => i.Id == instId && !i.IsDeleted);
                    if (instructor == null)
                    {
                        TempData["Error"] = "Eğitmen kaydı bulunamadı veya silinmiş.";
                        return RedirectToAction("Dashboard", "Teacher");
                    }
                    // IsApproved kontrolü dashboard erişiminde yapılmalı, chat içinde engelleyici olmamalı.
                }
            }

            // Son 50 mesajı getir
            var messages = await _context.TeacherChatMessages
                .Include(m => m.Instructor)
                .OrderByDescending(m => m.SentAt)
                .Take(50)
                .ToListAsync();

            messages = messages.OrderBy(m => m.SentAt).ToList();

            // Bağlı öğretmen sayısı (Silinmemiş tüm öğretmenleri getir)
            var instructors = await _context.Instructors
                .Where(i => !i.IsDeleted)
                .Select(i => new { i.Id, i.FullName, i.Title })
                .ToListAsync();

            ViewBag.Instructors = instructors;
            ViewBag.InstructorCount = instructors.Count;
            
            // Profesyonel İsim Alma
            string senderName = User.Claims.FirstOrDefault(c => c.Type == "FullName")?.Value 
                                ?? User.Identity?.Name 
                                ?? (User.IsInRole("Admin") ? "Yönetici" : "Öğretmen");
            
            ViewBag.SenderName = senderName;

            return View(messages);
        }

        // Kurs Sohbet Odası (Unify to CourseChatController)
        public IActionResult CourseChat(int? courseId)
        {
            if (courseId == null) return RedirectToAction("Index", "Home");
            return RedirectToAction("Index", "CourseChat", new { courseId = courseId });
        }

        [Authorize(Roles = "Instructor,Admin")]
        [HttpPost]
        public async Task<IActionResult> SendPrivateMessage(int receiverId, string content)
        {
            if (string.IsNullOrWhiteSpace(content)) return BadRequest();

            var senderName = User.Identity?.Name ?? "Öğretmen";
            
            var msg = new Message
            {
                SenderUsername = senderName,
                ReceiverInstructorId = receiverId,
                Subject = "Özel Mesaj (Öğretmenler Odası)",
                Content = content,
                Date = DateTime.Now,
                IsRead = false,
                IsFromInstructor = User.IsInRole("Instructor")
            };

            _context.Messages.Add(msg);
            await _context.SaveChangesAsync();

            return Ok();
        }
    }
}
