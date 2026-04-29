using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize(Roles = "Instructor")]
    public class TeacherController : Controller
    {
        private readonly AppDbContext _context;

        public TeacherController(AppDbContext context)
        {
            _context = context;
        }

        private int GetCourseId() => int.Parse(User.FindFirstValue("CourseId") ?? "0");
        private int GetInstructorId() => int.Parse(User.FindFirstValue("InstructorId") ?? "0");

        // ===================== DASHBOARD =====================
        public async Task<IActionResult> Dashboard()
        {
            int courseId = GetCourseId();
            if (courseId == 0)
            {
                ViewBag.Error = "Atanmış bir kursunuz bulunamadı.";
                return View(new List<Application>());
            }

            var course = await _context.Courses.Include(c => c.Category).FirstOrDefaultAsync(c => c.Id == courseId);
            ViewBag.Course = course;
            ViewBag.CourseName = course?.CourseName ?? "Bilinmeyen Kurs";

            var myStudents = await _context.Applications
                .Where(a => a.CourseId == courseId)
                .OrderByDescending(a => a.ApplyDate)
                .ToListAsync();

            return View(myStudents);
        }

        // ===================== PROFİLİM =====================
        public async Task<IActionResult> MyProfile()
        {
            var instructor = await _context.Instructors
                .Include(i => i.Course)
                .FirstOrDefaultAsync(i => i.Id == GetInstructorId());
            if (instructor == null) return NotFound();

            return View(instructor);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> MyProfile(Instructor instructor)
        {
            if (instructor.Id != GetInstructorId()) return Forbid();

            var entry = await _context.Instructors.FindAsync(instructor.Id);
            if (entry == null) return NotFound();

            entry.FullName = instructor.FullName;
            entry.Title = instructor.Title;
            entry.ImageUrl = instructor.ImageUrl;
            entry.Username = instructor.FullName; // Username her zaman FullName
            if (!string.IsNullOrEmpty(instructor.Password))
            {
                entry.Password = instructor.Password;
            }

            await _context.SaveChangesAsync();
            TempData["Success"] = "Profiliniz başarıyla güncellendi.";
            return RedirectToAction(nameof(MyProfile));
        }

        // ===================== KURS DÜZENLEME =====================
        public async Task<IActionResult> EditCourse()
        {
            int courseId = GetCourseId();
            var course = await _context.Courses
                .Include(c => c.Category)
                .FirstOrDefaultAsync(c => c.Id == courseId);

            if (course == null) return NotFound();

            ViewBag.CategoryId = new SelectList(_context.Categories, "Id", "CategoryName", course.CategoryId);
            return View(course);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditCourse(Course course)
        {
            int myCourseId = GetCourseId();
            if (course.Id != myCourseId) return Forbid();

            var entry = await _context.Courses.FindAsync(course.Id);
            if (entry == null) return NotFound();

            // Güncelle
            entry.CourseName = course.CourseName;
            entry.Description = course.Description;
            entry.ImageUrl = course.ImageUrl;
            entry.Quota = course.Quota;
            entry.DurationHours = course.DurationHours;
            entry.StartDate = course.StartDate;
            entry.EndDate = course.EndDate;
            entry.IsActive = course.IsActive;
            entry.CategoryId = course.CategoryId;

            await _context.SaveChangesAsync();
            TempData["Success"] = "Kurs bilgileri başarıyla güncellendi!";
            return RedirectToAction(nameof(Dashboard));
        }

        // ===================== ÖĞRENCİ TAM GÜNCELLEME =====================
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UpdateStudentStatus(
            int id,
            ApplicationStatus status,
            string? adminNote,
            string? firstName,
            string? lastName,
            string? email,
            string? phoneNumber,
            string? tcNo,
            string? birthPlace,
            DateTime? dateOfBirth,
            string? educationLevel)
        {
            var application = await _context.Applications.FindAsync(id);
            if (application == null) return NotFound();

            if (application.CourseId != GetCourseId()) return Forbid();

            // Durum & Not
            application.Status = status;
            application.AdminNote = adminNote;

            // Öğrenci bilgileri (boş gelmediyse güncelle)
            if (!string.IsNullOrWhiteSpace(firstName))   application.FirstName   = firstName;
            if (!string.IsNullOrWhiteSpace(lastName))    application.LastName    = lastName;
            if (!string.IsNullOrWhiteSpace(email))       application.Email       = email;
            if (!string.IsNullOrWhiteSpace(phoneNumber)) application.PhoneNumber = phoneNumber;
            if (!string.IsNullOrWhiteSpace(tcNo))        application.TcNo        = tcNo;
            if (!string.IsNullOrWhiteSpace(birthPlace))  application.BirthPlace  = birthPlace;
            if (dateOfBirth.HasValue)                    application.DateOfBirth = dateOfBirth.Value;
            if (!string.IsNullOrWhiteSpace(educationLevel)) application.EducationLevel = educationLevel;

            await _context.SaveChangesAsync();
            TempData["Success"] = $"{application.FirstName} {application.LastName} bilgileri güncellendi.";
            return RedirectToAction(nameof(Dashboard));
        }
    }
}
