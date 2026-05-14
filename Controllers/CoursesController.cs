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
using Microsoft.Extensions.Caching.Memory;
using System.Security.Claims;

namespace HalkEgitimSistemi.Controllers
{
    public class CoursesController : Controller
    {
        private readonly AppDbContext _context;
        private readonly Services.IAuditService _auditService;
        private readonly IMemoryCache _cache;

        public CoursesController(AppDbContext context, Services.IAuditService auditService, IMemoryCache cache)
        {
            _context = context;
            _auditService = auditService;
            _cache = cache;
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

            string cacheKey = $"Browse_Cat{categoryId}_Search{search}";
            if (!_cache.TryGetValue(cacheKey, out object? dbCoursesObj))
            {
                var dbCoursesList = await query.OrderBy(c => c.CourseName).ToListAsync();
                _cache.Set(cacheKey, dbCoursesList, TimeSpan.FromMinutes(10));
                dbCoursesObj = dbCoursesList;
            }
            var dbCourses = (List<Course>)dbCoursesObj!;

            string catCacheKey = "AllCategories";
            if (!_cache.TryGetValue(catCacheKey, out object? categoriesObj))
            {
                var categoriesList = await _context.Categories
                    .AsNoTracking()
                    .Include(c => c.Courses)
                    .ToListAsync();
                _cache.Set(catCacheKey, categoriesList, TimeSpan.FromMinutes(30));
                categoriesObj = categoriesList;
            }
            var categories = (List<Category>)categoriesObj!;

            ViewBag.Categories = categories;
            ViewBag.CurrentCategory = categoryId;
            ViewBag.CurrentSearch = search;
            ViewBag.TotalCourses = await _context.Courses.AsNoTracking().CountAsync(c => c.IsActive && !c.IsDeleted);

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
        public async Task<IActionResult> Create([Bind("Id,CourseName,Description,ImageUrl,CategoryId,Quota,StartDate,EndDate,IsActive,DurationHours,MaxAbsenceLimit,LearningOutcomes,Curriculum,Requirements,WhoIsItFor,ExamDate")] Course course, IFormFile? courseImage)
        {
            if (ModelState.IsValid)
            {
                if (courseImage != null && courseImage.Length > 0)
                {
                    var fileName = Guid.NewGuid().ToString() + Path.GetExtension(courseImage.FileName);
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/courses", fileName);

                    var dir = Path.GetDirectoryName(filePath);
                    if (!Directory.Exists(dir)) Directory.CreateDirectory(dir!);

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await courseImage.CopyToAsync(stream);
                    }
                    course.ImageUrl = "/uploads/courses/" + fileName;
                }

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
        public async Task<IActionResult> Edit(int id, [Bind("Id,CourseName,Description,ImageUrl,CategoryId,Quota,StartDate,EndDate,IsActive,DurationHours,MaxAbsenceLimit,LearningOutcomes,Curriculum,Requirements,WhoIsItFor,ExamDate")] Course course, IFormFile? courseImage)
        {
            if (id != course.Id) return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    if (courseImage != null && courseImage.Length > 0)
                    {
                        var fileName = Guid.NewGuid().ToString() + Path.GetExtension(courseImage.FileName);
                        var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/courses", fileName);

                        var dir = Path.GetDirectoryName(filePath);
                        if (!Directory.Exists(dir)) Directory.CreateDirectory(dir!);

                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            await courseImage.CopyToAsync(stream);
                        }
                        course.ImageUrl = "/uploads/courses/" + fileName;
                    }

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

        [Authorize]
        [HttpPost]
        public async Task<IActionResult> UnlockWithPoints(int id)
        {
            var userEmail = User.FindFirst(ClaimTypes.Email)?.Value;
            var student = await _context.Students.FirstOrDefaultAsync(s => s.Email == userEmail);
            var course = await _context.Courses.FindAsync(id);

            if (student == null || course == null) return Json(new { success = false, message = "Kayıt bulunamadı." });

            int pointCost = 500; // Kullanıcının istediği maliyet

            if (student.Points < pointCost)
                return Json(new { success = false, message = $"Yetersiz puan. Gerekli: {pointCost}, Mevcut: {student.Points}" });

            // Benzersiz Kod Üretimi: HP-A24B-99
            string randomPart = Guid.NewGuid().ToString().Substring(0, 4).ToUpper();
            string code = $"HP-{randomPart}-{new Random().Next(10, 99)}";

            // HP_Kodlar Tablosuna Kayıt
            var hpCode = new HalkPointCode
            {
                UserId = student.Id,
                CourseId = id,
                GeneratedCode = code,
                IsUsed = false
            };

            // PromoCode tablosuna da uyumluluk için ekleyelim
            var promoCode = new PromoCode
            {
                Code = code,
                CourseId = id,
                StudentId = student.Id,
                PointCost = pointCost
            };

            student.Points -= pointCost;
            _context.HalkPointCodes.Add(hpCode);
            _context.PromoCodes.Add(promoCode);
            await _context.SaveChangesAsync();

            return Json(new { success = true, code = code, message = "Başarı Kilidi Açıldı! Kodunuzu ödeme ekranında kullanabilirsiniz." });
        }

        private bool CourseExists(int id)
        {
            return _context.Courses.Any(e => e.Id == id);
        }
    }
}
