using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize(Roles = "Student")]
    public class StudentController : Controller
    {
        private readonly AppDbContext _context;

        public StudentController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Dashboard()
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            var student = await _context.Students
                .Include(s => s.Applications)
                    .ThenInclude(a => a.Course)
                .FirstOrDefaultAsync(s => s.Id == studentId);

            if (student == null) return NotFound();

            ViewBag.ApprovedCount = student.Applications.Count(a => a.Status == ApplicationStatus.Approved);
            ViewBag.PendingCount = student.Applications.Count(a => a.Status == ApplicationStatus.Pending);
            ViewBag.CompletedCount = student.Applications.Count(a => a.IsCompleted);

            return View(student);
        }

        [HttpGet]
        public async Task<IActionResult> Profile()
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            var student = await _context.Students.FindAsync(studentId);
            return View(student);
        }

        [HttpPost]
        public async Task<IActionResult> Profile(Student model, IFormFile? profilePic)
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            var student = await _context.Students.FindAsync(studentId);
            
            if (student == null) return NotFound();

            student.FirstName = model.FirstName;
            student.LastName = model.LastName;
            student.PhoneNumber = model.PhoneNumber;
            student.TcNo = model.TcNo;
            student.BirthDate = model.BirthDate;
            student.BirthPlace = model.BirthPlace;
            student.Summary = model.Summary;
            student.Skills = model.Skills;
            student.LinkedInUrl = model.LinkedInUrl;
            student.GithubUrl = model.GithubUrl;
            student.PortfolioUrl = model.PortfolioUrl;

            if (profilePic != null)
            {
                var fileName = Guid.NewGuid().ToString() + Path.GetExtension(profilePic.FileName);
                var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/profiles", fileName);
                
                Directory.CreateDirectory(Path.GetDirectoryName(path)!);
                using (var stream = new FileStream(path, FileMode.Create))
                {
                    await profilePic.CopyToAsync(stream);
                }
                student.ProfilePicture = "/uploads/profiles/" + fileName;
            }

            await _context.SaveChangesAsync();
            TempData["Success"] = "Profiliniz güncellendi.";
            return RedirectToAction("Profile");
        }

        public async Task<IActionResult> MyCV()
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            var student = await _context.Students
                .Include(s => s.Applications)
                    .ThenInclude(a => a.Course)
                .FirstOrDefaultAsync(s => s.Id == studentId);

            return View(student);
        }

        public async Task<IActionResult> Certificate(int id)
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            var application = await _context.Applications
                .Include(a => a.Course)
                .Include(a => a.Student)
                .FirstOrDefaultAsync(a => a.Id == id && a.StudentId == studentId && a.IsCompleted);

            if (application == null) return NotFound();

            return View(application);
        }
        public async Task<IActionResult> Messages()
        {
            var username = User.Identity?.Name;
            if (string.IsNullOrEmpty(username)) return Forbid();

            var messages = await _context.Messages
                .Include(m => m.ReceiverInstructor)
                .Where(m => m.SenderUsername == username || m.ReceiverUsername == username)
                .OrderByDescending(m => m.Date)
                .ToListAsync();

            return View(messages);
        }

        // ===== AKTİF KURSLARIM =====
        public async Task<IActionResult> MyCourses()
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            var applications = await _context.Applications
                .Include(a => a.Course)
                    .ThenInclude(c => c.Category)
                .Include(a => a.Attendances)
                .Where(a => a.StudentId == studentId && !a.IsDeleted)
                .OrderByDescending(a => a.ApplyDate)
                .ToListAsync();

            return View(applications);
        }

        // ===== YOKLAMA DURUMUM =====
        public async Task<IActionResult> MyAttendance()
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            var apps = await _context.Applications
                .Include(a => a.Course)
                .Include(a => a.Attendances)
                .Where(a => a.StudentId == studentId && a.Status == ApplicationStatus.Approved && !a.IsDeleted)
                .ToListAsync();

            return View(apps);
        }

        // ===== E-SERTİFİKALARIM =====
        public async Task<IActionResult> MyCertificates()
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            var completed = await _context.Applications
                .Include(a => a.Course)
                .Include(a => a.Student)
                .Where(a => a.StudentId == studentId && a.IsCompleted && !a.IsDeleted)
                .ToListAsync();

            return View(completed);
        }

        // ===== ÖDEVLER VE SINAVLAR =====
        public async Task<IActionResult> MyAssignments()
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            var apps = await _context.Applications
                .Include(a => a.Course)
                .Where(a => a.StudentId == studentId && a.Status == ApplicationStatus.Approved && !a.IsDeleted)
                .ToListAsync();

            ViewBag.Apps = apps;
            return View();
        }

        // ===== ESER YÜKLE (SANAL SERGİ) =====
        [HttpGet]
        public async Task<IActionResult> UploadArtwork()
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            ViewBag.Courses = await _context.Applications
                .Include(a => a.Course)
                .Where(a => a.StudentId == studentId && a.Status == ApplicationStatus.Approved)
                .Select(a => a.Course)
                .ToListAsync();
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> UploadArtwork(ExhibitionItem item, IFormFile? mediaFile)
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            var student = await _context.Students.FindAsync(studentId);
            
            if (mediaFile != null)
            {
                var extension = Path.GetExtension(mediaFile.FileName).ToLower();
                var fileName = Guid.NewGuid().ToString() + extension;
                var folder = (extension == ".mp4" || extension == ".mov") ? "videos" : "images";
                var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/exhibition", folder, fileName);
                
                Directory.CreateDirectory(Path.GetDirectoryName(path)!);
                using (var stream = new FileStream(path, FileMode.Create))
                {
                    await mediaFile.CopyToAsync(stream);
                }
                
                if (folder == "videos")
                {
                    item.VideoUrl = $"/uploads/exhibition/videos/{fileName}";
                    item.Type = ExhibitionType.Video;
                    item.ImageUrl = "https://images.unsplash.com/photo-1492724441997-5dc865305da7?w=800";
                }
                else
                {
                    item.ImageUrl = $"/uploads/exhibition/images/{fileName}";
                    item.Type = ExhibitionType.Painting;
                }
            }

            item.StudentId = studentId;
            item.ArtistName = (student?.FirstName ?? "") + " " + (student?.LastName ?? "");
            item.CreatedAt = DateTime.Now;

            _context.ExhibitionItems.Add(item);
            await _context.SaveChangesAsync();
            
            TempData["Success"] = "Eseriniz başarıyla yüklendi.";
            return RedirectToAction("Dashboard");
        }

        // ===== DERS NOTU YÜKLE (SANAL KÜTÜPHANE) =====
        [HttpGet]
        public async Task<IActionResult> UploadNote()
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            ViewBag.Courses = await _context.Applications
                .Include(a => a.Course)
                .Where(a => a.StudentId == studentId && a.Status == ApplicationStatus.Approved)
                .Select(a => a.Course)
                .ToListAsync();
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> UploadNote(LibraryBook note, IFormFile? pdfFile)
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            var student = await _context.Students.FindAsync(studentId);

            if (pdfFile != null)
            {
                var fileName = Guid.NewGuid().ToString() + Path.GetExtension(pdfFile.FileName);
                var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/notes", fileName);
                
                Directory.CreateDirectory(Path.GetDirectoryName(path)!);
                using (var stream = new FileStream(path, FileMode.Create))
                {
                    await pdfFile.CopyToAsync(stream);
                }
                note.PdfUrl = "/uploads/notes/" + fileName;
            }

            note.StudentId = studentId;
            note.Author = (student?.FirstName ?? "") + " " + (student?.LastName ?? "");
            note.IsCourseNote = true;
            note.Description = note.Description ?? "Öğrenci Ders Notu";
            note.Category = note.Category ?? "Diğer";
            note.CoverImageUrl = "https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400"; // Default cover

            _context.LibraryBooks.Add(note);
            await _context.SaveChangesAsync();

            TempData["Success"] = "Ders notunuz başarıyla yüklendi. Yıldızları toplamaya başlayın!";
            return RedirectToAction("Dashboard");
        }

        // ===== HALKA AÇIK PROFİL (API) =====
        [AllowAnonymous]
        [HttpGet]
        public async Task<IActionResult> GetPublicProfile(int id)
        {
            var student = await _context.Students
                .AsNoTracking()
                .FirstOrDefaultAsync(s => s.Id == id && !s.IsDeleted);

            if (student == null) return Json(new { success = false });

            return Json(new { 
                success = true, 
                fullName = student.FirstName + " " + student.LastName,
                skills = student.Skills,
                summary = student.Summary,
                profilePic = student.ProfilePicture
            });
        }

        // ===== HALKA AÇIK CV SAYFASI (E-PORTFOLYO) =====
        [AllowAnonymous]
        public async Task<IActionResult> PublicCV(int id)
        {
            // 🛑 SECURITY: Only fetch public-safe data
            var student = await _context.Students
                .Include(s => s.Applications.Where(a => a.IsCompleted))
                    .ThenInclude(a => a.Course)
                .Select(s => new Student {
                    Id = s.Id,
                    FirstName = s.FirstName,
                    LastName = s.LastName,
                    Summary = s.Summary,
                    Skills = s.Skills,
                    ProfilePicture = s.ProfilePicture,
                    LinkedInUrl = s.LinkedInUrl,
                    GithubUrl = s.GithubUrl,
                    PortfolioUrl = s.PortfolioUrl,
                    Applications = s.Applications
                })
                .FirstOrDefaultAsync(s => s.Id == id && !s.IsDeleted);

            if (student == null) return NotFound();

            // Set a flag for the view to hide sensitive info
            ViewBag.IsPublicView = true;
            return View("MyCV", student);
        }
        // ===== YETENEK AĞACI (GAMIFIED SKILL TREE) =====
        public async Task<IActionResult> SkillTree()
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            var student = await _context.Students
                .Include(s => s.Applications)
                    .ThenInclude(a => a.Course)
                        .ThenInclude(c => c.Category)
                .FirstOrDefaultAsync(s => s.Id == studentId);

            if (student == null) return NotFound();

            return View(student);
        }

        // ===== HALK POINT SİSTEMİ =====
        public async Task<IActionResult> HalkPoints()
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            var student = await _context.Students
                .Include(s => s.Applications)
                .FirstOrDefaultAsync(s => s.Id == studentId);

            if (student == null) return NotFound();

            // 1. Liderlik Tablosu (Haftalık/Genel en aktifler)
            ViewBag.Leaderboard = await _context.Students
                .OrderByDescending(s => s.Points)
                .Take(5)
                .Select(s => new { s.FirstName, s.LastName, s.Points })
                .ToListAsync();

            // 2. Kullanıcının Sıralaması
            var allStudents = await _context.Students.OrderByDescending(s => s.Points).ToListAsync();
            ViewBag.UserRank = allStudents.FindIndex(s => s.Id == studentId) + 1;
            ViewBag.TotalStudents = allStudents.Count;

            // 3. Son Aktiviteler
            ViewBag.RecentActivities = await _context.HalkPointActivities
                .Where(a => a.UserId == studentId)
                .OrderByDescending(a => a.Date)
                .Take(10)
                .ToListAsync();

            return View(student);
        }
    }
}
