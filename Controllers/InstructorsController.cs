using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using System.IO;
using Microsoft.AspNetCore.Http;
using System;
using Microsoft.Extensions.Caching.Memory;

namespace HalkEgitimSistemi.Controllers
{
    // BÜTÜN SAYFAYI ADMİNE KİLİTLİYORUZ
    [Authorize(Roles = "Admin")]
    public class InstructorsController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;
        private readonly Microsoft.Extensions.Caching.Memory.IMemoryCache _cache;

        public InstructorsController(AppDbContext context, IWebHostEnvironment env, Microsoft.Extensions.Caching.Memory.IMemoryCache cache)
        {
            _context = context;
            _env = env;
            _cache = cache;
        }

        // 🟢 ZİYARETÇİLERE AÇIK: Eğitmen Listesi
        [AllowAnonymous]
        public async Task<IActionResult> Index()
        {
            string cacheKey = "AllInstructorsList";
            if (!_cache.TryGetValue(cacheKey, out object? instructorsObj))
            {
                var instructorsList = await _context.Instructors
                    .AsNoTracking()
                    .Include(i => i.Course)
                    .Include(i => i.Schedules)
                    .Where(i => !i.IsDeleted)
                    .ToListAsync();
                _cache.Set(cacheKey, instructorsList, TimeSpan.FromMinutes(15));
                instructorsObj = instructorsList;
            }
            var instructors = (List<Instructor>)instructorsObj!;

            var now = DateTime.Now.TimeOfDay;
            var today = DateTime.Now.DayOfWeek.ToString();
            
            ViewBag.Availability = instructors.ToDictionary(
                i => i.Id, 
                i => i.Schedules.Any(s => s.Day.Equals(today, StringComparison.OrdinalIgnoreCase) && s.StartTime <= now && s.EndTime >= now)
            );

            return View(instructors);
        }

        // 🟢 ZİYARETÇİLERE AÇIK: Eğitmen Detayları
        [AllowAnonymous]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();
            var instructor = await _context.Instructors
                .AsNoTracking()
                .Include(i => i.Course)
                    .ThenInclude(c => c!.Applications)
                .Include(i => i.Course)
                    .ThenInclude(c => c!.Comments)
                .Include(i => i.Schedules)
                .FirstOrDefaultAsync(m => m.Id == id && !m.IsDeleted);

            if (instructor == null) return NotFound();

            // Müsaitlik Durumu Kontrolü
            var now = DateTime.Now.TimeOfDay;
            var today = DateTime.Now.DayOfWeek.ToString(); // Monday, Tuesday...
            
            ViewBag.IsBusy = instructor.Schedules.Any(s => 
                s.Day.Equals(today, StringComparison.OrdinalIgnoreCase) && 
                s.StartTime <= now && 
                s.EndTime >= now);

            // İstatistikler (Kurs üzerinden)
            if (instructor.Course != null)
            {
                ViewBag.StudentCount = instructor.Course.Applications?.Count(a => a.Status == ApplicationStatus.Approved) ?? 0;
                ViewBag.AverageRating = instructor.Course.Comments?.Any() == true 
                    ? instructor.Course.Comments.Average(c => c.Rating) 
                    : 0;
                ViewBag.TotalReviews = instructor.Course.Comments?.Count ?? 0;
            }
            else
            {
                ViewBag.StudentCount = 0;
                ViewBag.AverageRating = 0;
                ViewBag.TotalReviews = 0;
            }

            return View(instructor);
        }

        // 🔵 CV İNDİRME
        [AllowAnonymous]
        public async Task<IActionResult> DownloadCv(int id)
        {
            var instructor = await _context.Instructors.FindAsync(id);
            if (instructor == null || string.IsNullOrEmpty(instructor.CvFilePath))
            {
                TempData["Error"] = "Bu eğitmen için CV dosyası bulunamadı.";
                return RedirectToAction(nameof(Index));
            }

            var filePath = Path.Combine(_env.WebRootPath, instructor.CvFilePath.TrimStart('/'));
            if (!System.IO.File.Exists(filePath))
            {
                TempData["Error"] = "Dosya sunucuda bulunamadı.";
                return RedirectToAction(nameof(Index));
            }

            var fileName = $"{instructor.FullName}_CV.pdf";
            return File(System.IO.File.ReadAllBytes(filePath), "application/pdf", fileName);
        }

        // 🔴 SADECE ADMİN 
        public IActionResult Create()
        {
            ViewData["CourseId"] = new SelectList(_context.Courses, "Id", "CourseName");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Instructor instructor, IFormFile? imageFile)
        {
            if (ModelState.IsValid)
            {
                if (imageFile != null && imageFile.Length > 0)
                {
                    var fileName = Guid.NewGuid().ToString() + Path.GetExtension(imageFile.FileName);
                    var uploadPath = Path.Combine(_env.WebRootPath, "img", "instructors");
                    if (!Directory.Exists(uploadPath))
                    {
                        Directory.CreateDirectory(uploadPath);
                    }
                    var filePath = Path.Combine(uploadPath, fileName);
                    using (var fileStream = new FileStream(filePath, FileMode.Create))
                    {
                        await imageFile.CopyToAsync(fileStream);
                    }
                    instructor.ImageUrl = "/img/instructors/" + fileName;
                }

                _context.Add(instructor);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CourseId"] = new SelectList(_context.Courses, "Id", "CourseName", instructor.CourseId);
            return View(instructor);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();
            var instructor = await _context.Instructors.FindAsync(id);
            if (instructor == null) return NotFound();
            ViewData["CourseId"] = new SelectList(_context.Courses, "Id", "CourseName", instructor.CourseId);
            return View(instructor);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, Instructor instructor, IFormFile? imageFile)
        {
            if (id != instructor.Id) return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    if (imageFile != null && imageFile.Length > 0)
                    {
                        var fileName = Guid.NewGuid().ToString() + Path.GetExtension(imageFile.FileName);
                        var uploadPath = Path.Combine(_env.WebRootPath, "img", "instructors");
                        if (!Directory.Exists(uploadPath))
                        {
                            Directory.CreateDirectory(uploadPath);
                        }
                        var filePath = Path.Combine(uploadPath, fileName);
                        using (var fileStream = new FileStream(filePath, FileMode.Create))
                        {
                            await imageFile.CopyToAsync(fileStream);
                        }
                        instructor.ImageUrl = "/img/instructors/" + fileName;
                    }
                    else
                    {
                        var existingInstructor = await _context.Instructors.AsNoTracking().FirstOrDefaultAsync(i => i.Id == id);
                        if (existingInstructor != null)
                        {
                            instructor.ImageUrl = existingInstructor.ImageUrl;
                        }
                    }

                    _context.Update(instructor);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!InstructorExists(instructor.Id)) return NotFound();
                    else throw;
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["CourseId"] = new SelectList(_context.Courses, "Id", "CourseName", instructor.CourseId);
            return View(instructor);
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();
            var instructor = await _context.Instructors.FirstOrDefaultAsync(m => m.Id == id && !m.IsDeleted);
            if (instructor == null) return NotFound();
            return View(instructor);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var instructor = await _context.Instructors.FindAsync(id);
            if (instructor != null)
            {
                instructor.IsDeleted = true;
                instructor.DeletedAt = DateTime.Now;
                instructor.DeletedBy = User.Identity?.Name ?? "Admin";
                _context.Update(instructor);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }

        private bool InstructorExists(int id)
        {
            return _context.Instructors.Any(e => e.Id == id);
        }
    }
}