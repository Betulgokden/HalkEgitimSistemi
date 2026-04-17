using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;

namespace HalkEgitimSistemi.Controllers
{
    public class CoursesController : Controller
    {
        private readonly AppDbContext _context;

        public CoursesController(AppDbContext context)
        {
            _context = context;
        }

        // GET: Courses (Admin - Tablo Görünümü)
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Index()
        {
            var appDbContext = _context.Courses.Include(c => c.Category);
            return View(await appDbContext.ToListAsync());
        }

        // 🟢 ZİYARETÇİYE AÇIK: Kurs Vitrin Sayfası (Filtrelemeli)
        [AllowAnonymous]
        public async Task<IActionResult> Browse(int? categoryId, string? search)
        {
            var query = _context.Courses
                .Include(c => c.Category)
                .Include(c => c.Applications)
                .Where(c => c.IsActive)
                .AsQueryable();

            if (categoryId.HasValue && categoryId > 0)
                query = query.Where(c => c.CategoryId == categoryId);

            if (!string.IsNullOrEmpty(search))
                query = query.Where(c => c.CourseName.Contains(search) || c.Description.Contains(search));

            ViewBag.Categories = await _context.Categories.Include(c => c.Courses).ToListAsync();
            ViewBag.CurrentCategory = categoryId;
            ViewBag.CurrentSearch = search;
            ViewBag.TotalCourses = await _context.Courses.CountAsync(c => c.IsActive);

            return View(await query.OrderBy(c => c.CourseName).ToListAsync());
        }

        // 🟢 ZİYARETÇİYE AÇIK: Kurs Detay Sayfası
        [AllowAnonymous]
        public async Task<IActionResult> CourseDetail(int? id)
        {
            if (id == null) return NotFound();

            var course = await _context.Courses
                .Include(c => c.Category)
                .Include(c => c.Applications)
                .FirstOrDefaultAsync(m => m.Id == id);

            if (course == null) return NotFound();

            // Onaylanan başvuru sayısı
            var approvedCount = course.Applications?.Count(a => a.Status == ApplicationStatus.Approved) ?? 0;
            ViewBag.ApprovedCount = approvedCount;
            ViewBag.RemainingQuota = course.Quota - approvedCount;

            // Bu kursa atanmış eğitmen
            var instructor = await _context.Instructors.FirstOrDefaultAsync(i => i.CourseId == id);
            ViewBag.Instructor = instructor;

            return View(course);
        }

        // GET: Courses/Details/5 (Admin)
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();

            var course = await _context.Courses
                .Include(c => c.Category)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (course == null) return NotFound();

            return View(course);
        }

        // GET: Courses/Create
        [Authorize(Roles = "Admin")]
        public IActionResult Create()
        {
            ViewData["CategoryId"] = new SelectList(_context.Categories, "Id", "CategoryName");
            return View();
        }

        // POST: Courses/Create
        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,CourseName,Description,ImageUrl,CategoryId,Quota,StartDate,EndDate,IsActive,DurationHours")] Course course)
        {
            if (ModelState.IsValid)
            {
                _context.Add(course);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "Id", "CategoryName", course.CategoryId);
            return View(course);
        }

        // GET: Courses/Edit/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();
            var course = await _context.Courses.FindAsync(id);
            if (course == null) return NotFound();
            ViewData["CategoryId"] = new SelectList(_context.Categories, "Id", "CategoryName", course.CategoryId);
            return View(course);
        }

        // POST: Courses/Edit/5
        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,CourseName,Description,ImageUrl,CategoryId,Quota,StartDate,EndDate,IsActive,DurationHours")] Course course)
        {
            if (id != course.Id) return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(course);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CourseExists(course.Id)) return NotFound();
                    else throw;
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "Id", "CategoryName", course.CategoryId);
            return View(course);
        }

        // GET: Courses/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();
            var course = await _context.Courses
                .Include(c => c.Category)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (course == null) return NotFound();
            return View(course);
        }

        // POST: Courses/Delete/5
        [HttpPost, ActionName("Delete")]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var course = await _context.Courses.FindAsync(id);
            if (course != null) _context.Courses.Remove(course);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CourseExists(int id)
        {
            return _context.Courses.Any(e => e.Id == id);
        }
    }
}
