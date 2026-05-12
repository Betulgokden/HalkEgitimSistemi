using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize]
    public class CourseChatController : Controller
    {
        private readonly AppDbContext _context;

        public CourseChatController(AppDbContext context)
        {
            _context = context;
        }

        // Kurs chat sayfası — öğrenci veya öğretmen erişebilir
        public async Task<IActionResult> Index(int? courseId)
        {
            var userEmail = User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Email)?.Value;

            // Eğer courseId null veya 0 ise ve kullanıcı eğitmense, kendi kursuna yönlendir
            if (courseId == null || courseId == 0)
            {
                if (User.IsInRole("Instructor"))
                {
                    var instructorIdClaim = User.FindFirstValue("InstructorId");
                    if (int.TryParse(instructorIdClaim, out int instructorId))
                    {
                        var instructor = await _context.Instructors.AsNoTracking().FirstOrDefaultAsync(i => i.Id == instructorId);
                        if (instructor?.CourseId != null)
                        {
                            return RedirectToAction(nameof(Index), new { courseId = instructor.CourseId });
                        }
                    }
                }
                return NotFound("Kurs ID bulunamadı.");
            }

            var course = await _context.Courses
                .Include(c => c.Instructor)
                .Include(c => c.Applications)
                    .ThenInclude(a => a.Student)
                .FirstOrDefaultAsync(c => c.Id == courseId && !c.IsDeleted);

            if (course == null) return NotFound("Kurs bulunamadı.");

            // --- ERİŞİM KONTROLÜ ---
            bool hasAccess = false;
            if (User.IsInRole("Admin"))
            {
                hasAccess = true;
            }
            else if (User.IsInRole("Instructor"))
            {
                var instIdClaim = User.Claims.FirstOrDefault(c => c.Type == "InstructorId")?.Value;
                var courseIdClaim = User.Claims.FirstOrDefault(c => c.Type == "CourseId")?.Value;

                if (int.TryParse(instIdClaim, out int instId))
                {
                    // IsApproved kontrolü kaldırıldı, aktif eğitmen olması yeterli
                    var instructor = await _context.Instructors.AsNoTracking().FirstOrDefaultAsync(i => i.Id == instId && !i.IsDeleted);
                    if (instructor != null && (instructor.CourseId == courseId || courseIdClaim == courseId.ToString()))
                    {
                        hasAccess = true;
                    }
                }
            }
            else // Öğrenci / Kursiyer
            {
                // Kullanıcının bu kursa onaylanmış başvurusu var mı?
                hasAccess = await _context.Applications.AnyAsync(a => 
                    a.CourseId == courseId && 
                    (a.Email == userEmail || a.Email.ToLower() == User.Identity!.Name!.ToLower()) && 
                    a.Status == ApplicationStatus.Approved && 
                    !a.IsDeleted);
            }

            if (!hasAccess)
            {
                TempData["Error"] = "Bu sohbet odasına erişim yetkiniz bulunmamaktadır. Sadece ilgili kursun eğitmeni ve onaylı kursiyerleri katılabilir.";
                return RedirectToAction("Dashboard", User.IsInRole("Instructor") ? "Teacher" : "Student");
            }

            // Son 50 mesajı getir
            var messages = await _context.CourseChatMessages
                .Where(m => m.CourseId == courseId)
                .OrderByDescending(m => m.SentAt)
                .Take(50)
                .ToListAsync();

            messages = messages.OrderBy(m => m.SentAt).ToList();

            // Katılımcı bilgileri (Sadece Onaylı Öğrenciler)
            var students = await _context.Applications
                .AsNoTracking()
                .Where(a => a.CourseId == courseId && a.Status == ApplicationStatus.Approved && !a.IsDeleted)
                .Select(a => new { FullName = a.FirstName + " " + a.LastName })
                .ToListAsync();

            var instructorOfCourse = await _context.Instructors.FirstOrDefaultAsync(i => i.CourseId == courseId);

            ViewBag.CourseId = courseId;
            ViewBag.CourseName = course.CourseName;
            ViewBag.CourseImage = course.ImageUrl;
            ViewBag.WeeklySyllabus = course.WeeklySyllabus;
            ViewBag.InstructorName = instructorOfCourse?.FullName ?? "Atanmamış";
            ViewBag.InstructorId = instructorOfCourse?.Id;
            ViewBag.StudentCount = students.Count;
            ViewBag.Students = students;
            ViewBag.SenderName = User.Claims.FirstOrDefault(c => c.Type == "FullName")?.Value 
                                ?? User.Identity?.Name 
                                ?? "Kullanıcı";

            return View(messages);
        }
        [HttpPost]
        public async Task<IActionResult> UploadChatFile(IFormFile file)
        {
            if (file == null || file.Length == 0) return BadRequest("Dosya bulunamadı.");
            
            var allowedExtensions = new[] { 
                ".jpg", ".jpeg", ".png", ".gif", 
                ".mp4", ".webm", 
                ".pdf", ".docx", ".txt", ".xlsx" 
            };
            var extension = Path.GetExtension(file.FileName).ToLower();
            if (!allowedExtensions.Contains(extension)) return BadRequest("Bu dosya formatına izin verilmiyor.");

            // Dosya boyutu sınırı (örneğin 20MB)
            if (file.Length > 20 * 1024 * 1024) return BadRequest("Dosya boyutu 20MB'ı geçemez.");

            var fileName = Guid.NewGuid().ToString() + extension;
            var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "chat", fileName);
            
            var directory = Path.GetDirectoryName(path);
            if (!Directory.Exists(directory)) Directory.CreateDirectory(directory);

            using (var stream = new FileStream(path, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            return Ok(new { url = "/uploads/chat/" + fileName, type = extension, originalName = file.FileName });
        }
    }
}
