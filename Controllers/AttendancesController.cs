using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize(Roles = "Admin,Instructor")]
    public class AttendancesController : Controller
    {
        private readonly AppDbContext _context;
        private readonly Services.IAuditService _auditService;

        public AttendancesController(AppDbContext context, Services.IAuditService auditService)
        {
            _context = context;
            _auditService = auditService;
        }

        // Yoklama Alma Ekranı (Kurs Seçimi)
        public async Task<IActionResult> Index()
        {
            var courses = await _context.Courses.Where(c => !c.IsDeleted && c.IsActive).ToListAsync();
            return View(courses);
        }

        // Belirli bir kurs ve tarih için yoklama listesi
        public async Task<IActionResult> Take(int courseId, DateTime? date)
        {
            var course = await _context.Courses.FindAsync(courseId);
            if (course == null) return NotFound();

            var selectedDate = date ?? DateTime.Now.Date;
            
            // Onaylı öğrencileri getir
            var students = await _context.Applications
                .Where(a => a.CourseId == courseId && a.Status == ApplicationStatus.Approved && !a.IsDeleted)
                .ToListAsync();

            // Mevcut yoklamaları getir
            var existingAttendances = await _context.Attendances
                .Where(at => at.CourseId == courseId && at.Date == selectedDate)
                .ToDictionaryAsync(at => at.ApplicationId, at => at.IsPresent);

            ViewBag.Course = course;
            ViewBag.SelectedDate = selectedDate;
            ViewBag.ExistingAttendances = existingAttendances;

            return View(students);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Save(int courseId, DateTime date, Dictionary<int, bool> attendanceData)
        {
            var course = await _context.Courses.FindAsync(courseId);
            if (course == null) return NotFound();

            // Eski yoklamaları temizle (veya güncelle)
            var oldAttendances = await _context.Attendances
                .Where(at => at.CourseId == courseId && at.Date == date.Date)
                .ToListAsync();
            _context.Attendances.RemoveRange(oldAttendances);

            foreach (var item in attendanceData)
            {
                _context.Attendances.Add(new Attendance
                {
                    ApplicationId = item.Key,
                    CourseId = courseId,
                    Date = date.Date,
                    IsPresent = item.Value
                });
            }

            await _context.SaveChangesAsync();
            await _auditService.LogActionAsync("Yoklama Alındı", $"{course.CourseName} kursu için {date.ToShortDateString()} tarihli yoklama kaydedildi.", "Attendance");

            TempData["Success"] = "Yoklama başarıyla kaydedildi.";
            return RedirectToAction(nameof(Take), new { courseId, date = date.ToString("yyyy-MM-dd") });
        }
    }
}
