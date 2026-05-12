using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize]
    public class AcademicController : Controller
    {
        private readonly AppDbContext _context;

        public AcademicController(AppDbContext context)
        {
            _context = context;
        }

        // ──────────────────────────────────────────────────────
        // KONU ANLATIMLARI
        // ──────────────────────────────────────────────────────
        public async Task<IActionResult> Notes(int? courseId)
        {
            var query = _context.AcademicNotes.Include(n => n.Course).AsQueryable();
            
            if (courseId.HasValue)
                query = query.Where(n => n.CourseId == courseId.Value);

            var notes = await query.OrderByDescending(n => n.CreatedAt).ToListAsync();
            
            ViewBag.Courses = await _context.Courses.Where(c => !c.IsDeleted).ToListAsync();
            ViewBag.SelectedCourse = courseId;
            
            return View(notes);
        }

        [HttpPost]
        [Authorize(Roles = "Admin,Instructor")]
        public async Task<IActionResult> AddNote(AcademicNote note)
        {
            if (ModelState.IsValid)
            {
                note.CreatedAt = DateTime.Now;
                _context.AcademicNotes.Add(note);
                await _context.SaveChangesAsync();
                TempData["Success"] = "Konu anlatımı başarıyla eklendi.";
            }
            return RedirectToAction(nameof(Notes));
        }

        // ──────────────────────────────────────────────────────
        // TEST SORULARI
        // ──────────────────────────────────────────────────────
        public async Task<IActionResult> Tests(int? courseId)
        {
            var query = _context.AcademicTests
                .Include(t => t.Course)
                .Include(t => t.Questions)
                .AsQueryable();

            if (courseId.HasValue)
                query = query.Where(t => t.CourseId == courseId.Value);

            var tests = await query.OrderByDescending(t => t.CreatedAt).ToListAsync();
            
            ViewBag.Courses = await _context.Courses.Where(c => !c.IsDeleted).ToListAsync();
            ViewBag.SelectedCourse = courseId;

            return View(tests);
        }

        [HttpPost]
        [Authorize(Roles = "Admin,Instructor")]
        public async Task<IActionResult> AddTest(AcademicTest test)
        {
            if (ModelState.IsValid)
            {
                test.CreatedAt = DateTime.Now;
                _context.AcademicTests.Add(test);
                await _context.SaveChangesAsync();
                TempData["Success"] = "Yeni test oluşturuldu. Şimdi soruları ekleyebilirsiniz.";
            }
            return RedirectToAction(nameof(Tests));
        }

        public async Task<IActionResult> TakeTest(int id)
        {
            var test = await _context.AcademicTests
                .Include(t => t.Course)
                .Include(t => t.Questions)
                .FirstOrDefaultAsync(t => t.Id == id);

            if (test == null) return NotFound();

            return View(test);
        }
    }
}
