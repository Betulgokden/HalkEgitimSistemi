using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HalkEgitimSistemi.Controllers
{
    public class ApplicationsController : Controller
    {
        private readonly AppDbContext _context;

        public ApplicationsController(AppDbContext context)
        {
            _context = context;
        }

        // 🔴 SADECE MÜDÜR: Gelen başvuruları listeler (Güvenlikli)
        [Authorize]
        public async Task<IActionResult> Index()
        {
            var applications = await _context.Applications.Include(a => a.Course).ToListAsync();
            return View(applications);
        }

        // 🟢 ZİYARETÇİYE AÇIK: Kayıt Formu Ekranı
        [AllowAnonymous]
        public IActionResult Create(int courseId)
        {
            var course = _context.Courses.Find(courseId);
            if (course == null) return RedirectToAction("Index", "Courses");

            ViewBag.CourseName = course.CourseName;
            var model = new Application { CourseId = courseId };
            return View(model);
        }

        // 🟢 ZİYARETÇİYE AÇIK: Kaydı Veritabanına Gönder
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Application application)
        {
            if (ModelState.IsValid)
            {
                _context.Add(application);
                await _context.SaveChangesAsync();
                return RedirectToAction("Success");
            }
            return View(application);
        }

        [AllowAnonymous]
        public IActionResult Success() => View();
    }
}