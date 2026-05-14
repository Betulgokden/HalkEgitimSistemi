using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;

namespace HalkEgitimSistemi.Controllers
{
    public class HalkPointController : Controller
    {
        private readonly AppDbContext _context;

        public HalkPointController(AppDbContext context)
        {
            _context = context;
        }

        // 1. Halk Point Rehberi Sayfası
        public async Task<IActionResult> Guide()
        {
            if (User.Identity.IsAuthenticated && User.IsInRole("Student"))
            {
                var userEmail = User.FindFirst(ClaimTypes.Email)?.Value;
                var student = await _context.Students.FirstOrDefaultAsync(s => s.Email == userEmail && !s.IsDeleted);
                ViewBag.UserPoints = student?.Points ?? 0;
                ViewBag.Student = student;
            }
            else
            {
                ViewBag.UserPoints = 0;
            }
            return View();
        }

        // 2. Günlük Giriş Bonusu (Ajax ile çağrılabilir)
        [Authorize(Roles = "Student")]
        [HttpPost]
        public async Task<IActionResult> ClaimDailyBonus()
        {
            var userEmail = User.FindFirst(ClaimTypes.Email)?.Value;
            var student = await _context.Students.FirstOrDefaultAsync(s => s.Email == userEmail && !s.IsDeleted);
            
            if (student == null) return Json(new { success = false, message = "Öğrenci profiliniz bulunamadı. Puan sistemi sadece kursiyerler içindir." });

            // SQL Kontrolü: Bugün puan almış mı?
            var today = DateTime.Today;
            var alreadyClaimed = await _context.HalkPointActivities
                .AnyAsync(a => a.UserId == student.Id && a.ActivityType == "DailyLogin" && a.Date.Date == today);

            if (alreadyClaimed)
                return Json(new { success = false, message = "Bugünkü bonusunuzu zaten aldınız!" });

            // Puan Ekle
            student.Points += 10;
            
            // Aktivite Kaydı
            _context.HalkPointActivities.Add(new HalkPointActivity
            {
                UserId = student.Id,
                ActivityType = "DailyLogin",
                PointAmount = 10,
                Date = DateTime.Now
            });

            await _context.SaveChangesAsync();

            return Json(new { success = true, newBalance = student.Points, message = "Tebrikler! 10 Halk Point hesabınıza tanımlandı." });
        }
    }
}
