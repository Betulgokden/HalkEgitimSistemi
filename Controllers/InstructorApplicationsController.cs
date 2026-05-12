using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HalkEgitimSistemi.Controllers
{
    public class InstructorApplicationsController : Controller
    {
        private readonly AppDbContext _context;
        private readonly Services.MernisService _mernisService;
        private readonly IWebHostEnvironment _env;

        public InstructorApplicationsController(AppDbContext context, Services.MernisService mernisService, IWebHostEnvironment env)
        {
            _context = context;
            _mernisService = mernisService;
            _env = env;
        }

        // AJAX: Kategoriye Göre Kursları Getir
        [HttpGet]
        public async Task<JsonResult> GetCoursesByCategory(int categoryId)
        {
            var courses = await _context.Courses
                .Where(c => c.CategoryId == categoryId && !c.IsDeleted)
                .Select(c => new { id = c.Id, name = c.CourseName })
                .ToListAsync();
            return Json(courses);
        }

        // Kullanıcı Tarafı: Başvuru Formu
        [HttpGet]
        public async Task<IActionResult> Apply()
        {
            ViewBag.Categories = await _context.Categories.AsNoTracking().Where(c => !c.IsDeleted).ToListAsync();
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Apply(MasterTrainerApplication application, IFormFile cvFile, IFormFile criminalRecordFile, IFormFile diplomaFile, IFormFile photoFile)
        {
            // 1. MERNİS DOĞRULAMA (Arka Plan Şovu)
            var isValidUser = await _mernisService.ValidateIdentity(
                application.TcNo, 
                application.FullName.Split(' ')[0], 
                application.FullName.Contains(' ') ? application.FullName.Substring(application.FullName.IndexOf(' ') + 1) : "", 
                application.BirthYear
            );

            if (!isValidUser)
            {
                ViewBag.Error = "Girdiğiniz T.C. Kimlik bilgileri Nüfus ve Vatandaşlık İşleri (NVI) sisteminden doğrulanamadı.";
                ViewBag.Categories = await _context.Categories.Where(c => !c.IsDeleted).ToListAsync();
                return View(application);
            }

            // 2. DOSYA KONTROLLERİ & YÜKLEME
            try 
            {
                application.CvPath = await SaveApplicationFile(cvFile, "cv");
                application.CriminalRecordPath = await SaveApplicationFile(criminalRecordFile, "criminal_records");
                application.DiplomaPath = await SaveApplicationFile(diplomaFile, "diplomas");
                application.PhotoPath = await SaveApplicationFile(photoFile, "photos");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                ViewBag.Categories = await _context.Categories.Where(c => !c.IsDeleted).ToListAsync();
                return View(application);
            }

            application.Status = TrainerApplicationStatus.Pending;
            application.ApplyDate = DateTime.Now;

            _context.MasterTrainerApplications.Add(application);
            await _context.SaveChangesAsync();

            TempData["Success"] = "Başvurunuz başarıyla alındı ve MERNİS üzerinden kimliğiniz doğrulandı. Teşekkür ederiz!";
            return RedirectToAction("Index", "Home");
        }

        private async Task<string> SaveApplicationFile(IFormFile file, string folder)
        {
            if (file == null || file.Length == 0) return null;

            // 5MB Limit
            if (file.Length > 5 * 1024 * 1024)
                throw new Exception($"Dosya boyutu 5MB'ı geçemez: {file.FileName}");

            var extension = Path.GetExtension(file.FileName).ToLower();
            var allowedExtensions = folder == "photos" ? new[] { ".jpg", ".jpeg", ".png" } : new[] { ".pdf" };
            
            if (!allowedExtensions.Contains(extension))
                throw new Exception($"Geçersiz dosya uzantısı: {file.FileName}. Beklenen: {string.Join(", ", allowedExtensions)}");

            var fileName = Guid.NewGuid().ToString() + extension;
            var uploadPath = Path.Combine(_env.WebRootPath, "uploads", "applications", folder);
            
            if (!Directory.Exists(uploadPath)) Directory.CreateDirectory(uploadPath);
            
            var filePath = Path.Combine(uploadPath, fileName);
            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            return $"/uploads/applications/{folder}/{fileName}";
        }

        // Admin Tarafı: Başvuruları Listele
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Index()
        {
            var applications = await _context.MasterTrainerApplications
                .OrderByDescending(a => a.ApplyDate)
                .ToListAsync();
            return View(applications);
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        public async Task<IActionResult> UpdateStatus(int id, TrainerApplicationStatus status)
        {
            var app = await _context.MasterTrainerApplications.FindAsync(id);
            if (app != null)
            {
                app.Status = status;

                // Onaylandıysa otomatik eğitmen hesabı oluştur
                if (status == TrainerApplicationStatus.Approved)
                {
                    var exists = await _context.Instructors.AnyAsync(i => i.Username == app.Email || (i.FullName == app.FullName && i.CourseId == app.CourseId));
                    if (!exists)
                    {
                        var instructor = new Instructor
                        {
                            FullName = app.FullName,
                            Username = app.Email,
                            Password = app.TcNo, // Başlangıç şifresi TC No
                            CourseId = app.CourseId,
                            IsApproved = true,
                            Title = app.Specialty ?? "Usta Öğretici",
                            CvFilePath = app.CvPath
                        };
                        _context.Instructors.Add(instructor);
                    }
                }

                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }
    }
}
