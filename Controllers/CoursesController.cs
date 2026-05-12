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
        private readonly Services.IAuditService _auditService;

        public CoursesController(AppDbContext context, Services.IAuditService auditService)
        {
            _context = context;
            _auditService = auditService;
        }

        // GET: Courses (Admin - Tablo Görünümü)
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Index()
        {
            var appDbContext = _context.Courses.AsNoTracking().Include(c => c.Category).Where(c => !c.IsDeleted);
            return View(await appDbContext.ToListAsync());
        }

        // 🟢 ZİYARETÇİYE AÇIK: Kurs Vitrin Sayfası (Filtrelemeli)
        [AllowAnonymous]
        public async Task<IActionResult> Browse(int? categoryId, string? search)
        {
            var query = _context.Courses
                .AsNoTracking()
                .AsSplitQuery()
                .Include(c => c.Category)
                .Include(c => c.Comments) 
                .Where(c => c.IsActive && !c.IsDeleted)
                .AsQueryable();

            if (categoryId.HasValue && categoryId > 0)
                query = query.Where(c => c.CategoryId == categoryId);

            if (!string.IsNullOrEmpty(search))
                query = query.Where(c => c.CourseName.Contains(search) || c.Description.Contains(search));

            ViewBag.Categories = await _context.Categories
                .AsNoTracking()
                .Include(c => c.Courses)
                .ToListAsync();
            ViewBag.CurrentCategory = categoryId;
            ViewBag.CurrentSearch = search;
            ViewBag.TotalCourses = await _context.Courses.AsNoTracking().CountAsync(c => c.IsActive && !c.IsDeleted);

            var dbCourses = await query.OrderBy(c => c.CourseName).ToListAsync();

            // Mock Courses to "multiply" the catalog
            var mockCourses = new List<Course>
            {
                new Course { Id = 1001, CourseName = "Dijital Pazarlama ve SEO", CategoryId = categoryId ?? 1, Description = "İşinizi dijital dünyada büyütmenin yollarını öğrenin. Google Ads, Meta Ads ve SEO teknikleri.", ImageUrl = "https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(15), DurationHours = 40, Quota = 30 },
                new Course { Id = 1002, CourseName = "Python ile Veri Analizi", CategoryId = categoryId ?? 1, Description = "Pandas, Numpy ve Matplotlib kütüphaneleri ile veriden anlamlı sonuçlar çıkarın.", ImageUrl = "https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(20), DurationHours = 60, Quota = 25 },
                new Course { Id = 1003, CourseName = "Yaratıcı Yazarlık Atölyesi", CategoryId = categoryId ?? 2, Description = "Kendi hikayenizi yazmaya başlayın. Karakter gelişimi ve kurgu teknikleri.", ImageUrl = "https://images.unsplash.com/photo-1455390582262-044cdead277a?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(10), DurationHours = 24, Quota = 15 },
                new Course { Id = 1004, CourseName = "Temel Fotoğrafçılık", CategoryId = categoryId ?? 2, Description = "Işık, kompozisyon ve teknik ayarlar. Makinenizi tanıyın ve harika kareler yakalayın.", ImageUrl = "https://images.unsplash.com/photo-1452784444945-3f422708fe5e?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(25), DurationHours = 32, Quota = 20 },
                new Course { Id = 1005, CourseName = "Unity ile Oyun Geliştirme", CategoryId = categoryId ?? 1, Description = "2D ve 3D oyunlar yapmayı öğrenin. C# programlama ve Unity arayüzü.", ImageUrl = "https://images.unsplash.com/photo-1552824236-41102881ad24?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(30), DurationHours = 80, Quota = 20 },
                new Course { Id = 1006, CourseName = "Mobil Uygulama (Flutter)", CategoryId = categoryId ?? 1, Description = "Tek kod tabanı ile hem iOS hem Android uygulamaları geliştirin.", ImageUrl = "https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(12), DurationHours = 72, Quota = 25 },
                new Course { Id = 1007, CourseName = "Piyano Eğitimi (Başlangıç)", CategoryId = categoryId ?? 2, Description = "Nota okuma ve temel piyano teknikleri. Müziğin büyülü dünyasına adım atın.", ImageUrl = "https://images.unsplash.com/photo-1520529611442-eaf5f228497b?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(5), DurationHours = 48, Quota = 10 },
                new Course { Id = 1008, CourseName = "Aşçılık ve Pastacılık", CategoryId = categoryId ?? 3, Description = "Dünya mutfağından seçmeler ve lezzetli tatlı yapımı teknikleri.", ImageUrl = "https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=600", IsActive = true, StartDate = DateTime.Now.AddDays(18), DurationHours = 120, Quota = 15 }
            };

            // Eğer arama yapılıyorsa mock verileri de filtreleyelim
            if (!string.IsNullOrEmpty(search))
            {
                mockCourses = mockCourses.Where(c => c.CourseName.Contains(search, StringComparison.OrdinalIgnoreCase) || c.Description.Contains(search, StringComparison.OrdinalIgnoreCase)).ToList();
            }

            dbCourses.AddRange(mockCourses);
            return View(dbCourses);
        }

        // 🟢 ZİYARETÇİYE AÇIK: Kurs Detay Sayfası
        [AllowAnonymous]
        public async Task<IActionResult> CourseDetail(int? id)
        {
            if (id == null) return NotFound();

            var course = await _context.Courses
                .AsNoTracking()
                .Include(c => c.Category)
                .Include(c => c.Applications)
                .Include(c => c.Resources)
                .Include(c => c.Comments) // Yeni yorumlar dahil edildi
                .FirstOrDefaultAsync(m => m.Id == id && !m.IsDeleted);

            if (course == null) return NotFound();

            // Onaylanan başvuru sayısı
            var approvedCount = course.Applications?.Count(a => a.Status == ApplicationStatus.Approved) ?? 0;
            ViewBag.ApprovedCount = approvedCount;
            ViewBag.RemainingQuota = course.Quota - approvedCount;

            // Bu kursa atanmış eğitmen
            var instructor = await _context.Instructors.FirstOrDefaultAsync(i => i.CourseId == id);
            ViewBag.Instructor = instructor;

            // Ortalama Puan Hesaplama (Yeni Comments üzerinden)
            ViewBag.AverageRating = course.Comments?.Any() == true ? course.Comments.Average(r => r.Rating) : 0;
            ViewBag.CommentCount = course.Comments?.Count ?? 0;

            // Bu kursa ait başarı hikayeleri (İlişkisel Veritabanı Şovu)
            ViewBag.SuccessStories = await _context.SuccessStories
                .Where(s => s.CourseId == id && s.IsActive)
                .OrderByDescending(s => s.Id)
                .ToListAsync();

            return View(course);
        }

        // GET: Courses/Details/5 (Admin)
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();

            var course = await _context.Courses
                .Include(c => c.Category)
                .FirstOrDefaultAsync(m => m.Id == id && !m.IsDeleted);
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
        public async Task<IActionResult> Create([Bind("Id,CourseName,Description,ImageUrl,CategoryId,Quota,StartDate,EndDate,IsActive,DurationHours,MaxAbsenceLimit,LearningOutcomes,Curriculum,Requirements,WhoIsItFor,ExamDate")] Course course)
        {
            if (ModelState.IsValid)
            {
                _context.Add(course);
                await _context.SaveChangesAsync();
                await _auditService.LogActionAsync("Kurs Oluşturuldu", $"{course.CourseName} kursu sisteme eklendi.", "Courses");
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
        public async Task<IActionResult> Edit(int id, [Bind("Id,CourseName,Description,ImageUrl,CategoryId,Quota,StartDate,EndDate,IsActive,DurationHours,MaxAbsenceLimit,LearningOutcomes,Curriculum,Requirements,WhoIsItFor,ExamDate")] Course course)
        {
            if (id != course.Id) return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(course);
                    await _context.SaveChangesAsync();
                    await _auditService.LogActionAsync("Kurs Düzenlendi", $"{course.CourseName} kursu bilgileri güncellendi.", "Courses");
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
                .FirstOrDefaultAsync(m => m.Id == id && !m.IsDeleted);
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
            if (course != null)
            {
                course.IsDeleted = true;
                course.DeletedAt = DateTime.Now;
                course.DeletedBy = User.Identity?.Name ?? "Admin";
                _context.Update(course);
                await _context.SaveChangesAsync();
                await _auditService.LogActionAsync("Kurs Silindi", $"{course.CourseName} kursu çöp kutusuna taşındı.", "Courses");
            }
            return RedirectToAction(nameof(Index));
        }

        // GET: Courses/ManageResources/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> ManageResources(int id)
        {
            var course = await _context.Courses
                .Include(c => c.Resources)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (course == null) return NotFound();
            return View(course);
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UploadResource(int courseId, string title, IFormFile file)
        {
            if (file != null && file.Length > 0)
            {
                var fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/resources", fileName);

                var dir = Path.GetDirectoryName(filePath);
                if (!Directory.Exists(dir)) Directory.CreateDirectory(dir!);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }

                var resource = new CourseResource
                {
                    CourseId = courseId,
                    Title = title,
                    FilePath = "/uploads/resources/" + fileName,
                    FileType = Path.GetExtension(file.FileName).ToUpper().Replace(".", ""),
                    UploadDate = DateTime.Now
                };

                _context.CourseResources.Add(resource);
                await _context.SaveChangesAsync();
                await _auditService.LogActionAsync("Kaynak Yüklendi", $"{title} isimli dosya kursa eklendi.", "Courses");
            }

            return RedirectToAction(nameof(ManageResources), new { id = courseId });
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DeleteResource(int id)
        {
            var resource = await _context.CourseResources.FindAsync(id);
            if (resource != null)
            {
                var courseId = resource.CourseId;
                _context.CourseResources.Remove(resource);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(ManageResources), new { id = courseId });
            }
            return NotFound();
        }

        private bool CourseExists(int id)
        {
            return _context.Courses.Any(e => e.Id == id);
        }
    }
}
