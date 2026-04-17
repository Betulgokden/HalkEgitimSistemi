using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        private readonly AppDbContext _context;

        public AdminController(AppDbContext context)
        {
            _context = context;
        }

        // Admin Dashboard - İstatistikler
        public async Task<IActionResult> Dashboard()
        {
            // Genel İstatistikler
            ViewBag.TotalStudents = await _context.Applications.Select(a => a.Email).Distinct().CountAsync();
            ViewBag.TotalCourses = await _context.Courses.CountAsync();
            ViewBag.TotalInstructors = await _context.Instructors.CountAsync();
            ViewBag.TotalCategories = await _context.Categories.CountAsync();
            ViewBag.TotalApplications = await _context.Applications.CountAsync();

            // Başvuru İstatistikleri
            ViewBag.PendingCount = await _context.Applications.CountAsync(a => a.Status == ApplicationStatus.Pending);
            ViewBag.ApprovedCount = await _context.Applications.CountAsync(a => a.Status == ApplicationStatus.Approved);
            ViewBag.RejectedCount = await _context.Applications.CountAsync(a => a.Status == ApplicationStatus.Rejected);

            // Aktif/Pasif Kurs Sayısı
            ViewBag.ActiveCourses = await _context.Courses.CountAsync(c => c.IsActive);
            ViewBag.InactiveCourses = await _context.Courses.CountAsync(c => !c.IsActive);

            // Kurs Bazında Başvuru Sayıları (Top 8)
            var courseStats = await _context.Courses
                .Select(c => new {
                    CourseName = c.CourseName,
                    Quota = c.Quota,
                    TotalApplications = _context.Applications.Count(a => a.CourseId == c.Id),
                    ApprovedCount = _context.Applications.Count(a => a.CourseId == c.Id && a.Status == ApplicationStatus.Approved),
                    PendingCount = _context.Applications.Count(a => a.CourseId == c.Id && a.Status == ApplicationStatus.Pending)
                })
                .OrderByDescending(x => x.TotalApplications)
                .Take(8)
                .ToListAsync();

            ViewBag.CourseStats = courseStats;

            // Kategori Bazında Kurs Sayıları
            var categoryStats = await _context.Categories
                .Include(c => c.Courses)
                .Select(c => new {
                    CategoryName = c.CategoryName,
                    CourseCount = c.Courses!.Count,
                    IconClass = c.IconClass ?? "bi-tag"
                })
                .ToListAsync();

            ViewBag.CategoryStats = categoryStats;

            // Son 5 Başvuru
            var recentApplications = await _context.Applications
                .Include(a => a.Course)
                .OrderByDescending(a => a.ApplyDate)
                .Take(5)
                .ToListAsync();

            ViewBag.RecentApplications = recentApplications;

            return View();
        }
    }
}
