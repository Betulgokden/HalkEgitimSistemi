using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize]
    public class RecycleBinController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;

        public RecycleBinController(AppDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        public async Task<IActionResult> Index()
        {
            var isAdmin = User.IsInRole("Admin");
            var username = User.Identity?.Name;
            var instructorCourseId = 0;

            if (User.IsInRole("Instructor"))
            {
                var courseIdClaim = User.FindFirstValue("CourseId");
                int.TryParse(courseIdClaim, out instructorCourseId);
            }

            var items = new List<RecycleBinItem>();

            // 1. Courses (Only Admin)
            if (isAdmin)
            {
                var deletedCourses = await _context.Courses
                    .Where(c => c.IsDeleted)
                    .Select(c => new RecycleBinItem {
                        Id = c.Id,
                        Title = c.CourseName,
                        Type = "Course",
                        DeletedAt = c.DeletedAt,
                        DeletedBy = c.DeletedBy,
                        Details = c.Description
                    }).ToListAsync();
                items.AddRange(deletedCourses);

                // 2. Instructors (Only Admin)
                var deletedInstructors = await _context.Instructors
                    .Where(i => i.IsDeleted)
                    .Select(i => new RecycleBinItem {
                        Id = i.Id,
                        Title = i.FullName,
                        Type = "Instructor",
                        DeletedAt = i.DeletedAt,
                        DeletedBy = i.DeletedBy,
                        Details = i.Title
                    }).ToListAsync();
                items.AddRange(deletedInstructors);

                // 3. Categories (Only Admin)
                var deletedCategories = await _context.Categories
                    .Where(c => c.IsDeleted)
                    .Select(c => new RecycleBinItem {
                        Id = c.Id,
                        Title = c.CategoryName,
                        Type = "Category",
                        DeletedAt = c.DeletedAt,
                        DeletedBy = c.DeletedBy,
                        Details = c.Description ?? ""
                    }).ToListAsync();
                items.AddRange(deletedCategories);
            }

            // 4. News (Admin or Instructor's own)
            var newsQuery = _context.News.Where(n => n.IsDeleted);
            if (!isAdmin) newsQuery = newsQuery.Where(n => n.DeletedBy == username);
            
            var deletedNews = await newsQuery
                .Select(n => new RecycleBinItem {
                    Id = n.Id,
                    Title = n.Title,
                    Type = "News",
                    DeletedAt = n.DeletedAt,
                    DeletedBy = n.DeletedBy,
                    Details = n.Content.Length > 50 ? n.Content.Substring(0, 50) + "..." : n.Content
                }).ToListAsync();
            items.AddRange(deletedNews);

            // 5. Applications (Admin or Instructor's course students)
            var appQuery = _context.Applications.Where(a => a.IsDeleted);
            if (!isAdmin) appQuery = appQuery.Where(a => a.CourseId == instructorCourseId && a.DeletedBy == username);

            var deletedApps = await appQuery
                .Select(a => new RecycleBinItem {
                    Id = a.Id,
                    Title = a.FirstName + " " + a.LastName,
                    Type = "Application",
                    DeletedAt = a.DeletedAt,
                    DeletedBy = a.DeletedBy,
                    Details = "T.C: " + a.TcNo
                }).ToListAsync();
            items.AddRange(deletedApps);

            // 6. Gallery Items (Admin or Instructor's own)
            var galleryQuery = _context.GalleryItems.Where(g => g.IsDeleted);
            if (!isAdmin) galleryQuery = galleryQuery.Where(g => g.DeletedBy == username);

            var deletedGallery = await galleryQuery
                .Select(g => new RecycleBinItem {
                    Id = g.Id,
                    Title = g.Title,
                    Type = "Gallery",
                    DeletedAt = g.DeletedAt,
                    DeletedBy = g.DeletedBy,
                    Details = "Görsel"
                }).ToListAsync();
            items.AddRange(deletedGallery);

            return View(items.OrderByDescending(i => i.DeletedAt).ToList());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Restore(int id, string type)
        {
            switch (type)
            {
                case "Course":
                    if (!User.IsInRole("Admin")) return Forbid();
                    var course = await _context.Courses.FindAsync(id);
                    if (course != null) { course.IsDeleted = false; _context.Update(course); }
                    break;
                case "Instructor":
                    if (!User.IsInRole("Admin")) return Forbid();
                    var instructor = await _context.Instructors.FindAsync(id);
                    if (instructor != null) { instructor.IsDeleted = false; _context.Update(instructor); }
                    break;
                case "Category":
                    if (!User.IsInRole("Admin")) return Forbid();
                    var category = await _context.Categories.FindAsync(id);
                    if (category != null) { category.IsDeleted = false; _context.Update(category); }
                    break;
                case "News":
                    var news = await _context.News.FindAsync(id);
                    if (news != null) 
                    {
                        if (!User.IsInRole("Admin") && news.DeletedBy != User.Identity?.Name) return Forbid();
                        news.IsDeleted = false; 
                        _context.Update(news); 
                    }
                    break;
                case "Application":
                    var app = await _context.Applications.FindAsync(id);
                    if (app != null) 
                    {
                        if (!User.IsInRole("Admin"))
                        {
                            var courseIdClaim = User.FindFirstValue("CourseId");
                            if (app.CourseId.ToString() != courseIdClaim || app.DeletedBy != User.Identity?.Name) return Forbid();
                        }
                        app.IsDeleted = false; 
                        _context.Update(app); 
                    }
                    break;
                case "Gallery":
                    var gallery = await _context.GalleryItems.FindAsync(id);
                    if (gallery != null)
                    {
                        if (!User.IsInRole("Admin") && gallery.DeletedBy != User.Identity?.Name) return Forbid();
                        gallery.IsDeleted = false;
                        _context.Update(gallery);
                    }
                    break;
            }

            await _context.SaveChangesAsync();
            TempData["Success"] = "Kayıt başarıyla geri yüklendi.";
            return RedirectToAction(nameof(Index));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> PermanentDelete(int id, string type)
        {
            switch (type)
            {
                case "Course":
                    if (!User.IsInRole("Admin")) return Forbid();
                    var course = await _context.Courses.FindAsync(id);
                    if (course != null) _context.Courses.Remove(course);
                    break;
                case "Instructor":
                    if (!User.IsInRole("Admin")) return Forbid();
                    var instructor = await _context.Instructors.FindAsync(id);
                    if (instructor != null) _context.Instructors.Remove(instructor);
                    break;
                case "Category":
                    if (!User.IsInRole("Admin")) return Forbid();
                    var category = await _context.Categories.FindAsync(id);
                    if (category != null) _context.Categories.Remove(category);
                    break;
                case "News":
                    var news = await _context.News.FindAsync(id);
                    if (news != null) 
                    {
                        if (!User.IsInRole("Admin") && news.DeletedBy != User.Identity?.Name) return Forbid();
                        _context.News.Remove(news); 
                    }
                    break;
                case "Application":
                    var app = await _context.Applications.FindAsync(id);
                    if (app != null) 
                    {
                        if (!User.IsInRole("Admin"))
                        {
                            var courseIdClaim = User.FindFirstValue("CourseId");
                            if (app.CourseId.ToString() != courseIdClaim || app.DeletedBy != User.Identity?.Name) return Forbid();
                        }
                        _context.Applications.Remove(app); 
                    }
                    break;
                case "Gallery":
                    var gallery = await _context.GalleryItems.FindAsync(id);
                    if (gallery != null)
                    {
                        if (!User.IsInRole("Admin") && gallery.DeletedBy != User.Identity?.Name) return Forbid();
                        
                        // Delete physical file
                        if (!string.IsNullOrEmpty(gallery.ImageUrl) && !gallery.ImageUrl.StartsWith("http"))
                        {
                            var oldPath = Path.Combine(_env.WebRootPath, gallery.ImageUrl.TrimStart('/'));
                            if (System.IO.File.Exists(oldPath)) System.IO.File.Delete(oldPath);
                        }
                        
                        _context.GalleryItems.Remove(gallery);
                    }
                    break;
            }

            await _context.SaveChangesAsync();
            TempData["Success"] = "Kayıt kalıcı olarak silindi.";
            return RedirectToAction(nameof(Index));
        }
    }
}
