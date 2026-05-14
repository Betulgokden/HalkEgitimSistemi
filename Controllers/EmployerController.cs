using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace HalkEgitimSistemi.Controllers
{
    public class EmployerController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public EmployerController(AppDbContext context, IWebHostEnvironment webHostEnvironment)
        {
            _context = context;
            _webHostEnvironment = webHostEnvironment;
        }

        // 🟢 İŞVEREN KAYIT
        [HttpGet]
        public IActionResult Register() => View();

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(Employer employer, IFormFile taxPlate)
        {
            if (taxPlate == null || taxPlate.Length == 0)
            {
                ModelState.AddModelError("TaxPlatePath", "Resmi doğrulama için Vergi Levhası yüklemek zorunludur.");
                return View(employer);
            }

            // 🛑 SECURITY: File Type Validation
            var ext = Path.GetExtension(taxPlate.FileName).ToLower();
            if (ext != ".pdf" && ext != ".jpg" && ext != ".jpeg" && ext != ".png")
            {
                ModelState.AddModelError("TaxPlatePath", "Sadece PDF veya Resim formatında belge yüklenebilir.");
                return View(employer);
            }

            // Save File
            var uploads = Path.Combine(_webHostEnvironment.WebRootPath, "uploads", "employers");
            Directory.CreateDirectory(uploads);
            var fileName = Guid.NewGuid().ToString() + ext;
            var filePath = Path.Combine(uploads, fileName);
            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await taxPlate.CopyToAsync(stream);
            }

            employer.TaxPlatePath = "/uploads/employers/" + fileName;
            employer.IsApproved = false; // Admin must approve
            
            _context.Employers.Add(employer);
            await _context.SaveChangesAsync();

            TempData["Success"] = "Kaydınız alındı. Belgeleriniz incelendikten sonra (ortalama 24 saat) hesabınız aktif edilecektir.";
            return RedirectToAction("Login", "Account");
        }

        // 🟢 İŞVEREN DASHBOARD & TALENT POOL
        [Authorize(Roles = "Employer,Admin")]
        public async Task<IActionResult> Dashboard(string? search, string? category, bool readyToWork = false)
        {
            var userEmail = User.Identity!.Name;
            
            // Security: Enforce Approval Check for Employers
            if (User.IsInRole("Employer"))
            {
                var currentEmployer = await _context.Employers.AsNoTracking().FirstOrDefaultAsync(e => e.Email == userEmail);
                if (currentEmployer == null || !currentEmployer.IsApproved)
                {
                    TempData["Error"] = "Hesabınız henüz onaylanmamış. Panel erişimi için belgelerinizin kontrol edilmesini bekleyin.";
                    return RedirectToAction("Index", "Home");
                }
            }

            // Parallel Data Fetch for "Jet Speed"
            var categoriesTask = _context.Categories.AsNoTracking().Select(c => c.CategoryName).ToListAsync();
            var spotlightTask = _context.Students.AsNoTracking()
                .Where(s => s.IsSpotlight && !s.IsDeleted)
                .OrderByDescending(s => s.Points)
                .FirstOrDefaultAsync();

            var neighborhoodStatsTask = _context.Students.AsNoTracking()
                .Where(s => !s.IsDeleted && s.NeighborhoodId != null)
                .GroupBy(s => s.NeighborhoodId)
                .Select(g => new { NeighborhoodId = g.Key, Count = g.Count() })
                .ToListAsync();

            // Main Talent Query
            var query = _context.Applications
                .AsNoTracking()
                .Include(a => a.Course)
                .Include(a => a.Student)
                .Where(a => a.IsCompleted && !a.IsDeleted);

            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(a => a.FirstName.Contains(search) || a.LastName.Contains(search) || a.Course!.CourseName.Contains(search) || a.Student!.Skills!.Contains(search));
            }

            if (!string.IsNullOrEmpty(category))
            {
                query = query.Where(a => a.Course!.Category!.CategoryName == category);
            }

            if (readyToWork)
            {
                query = query.Where(a => a.Student != null && a.Student.IsAvailableForWork);
            }

            var students = await query
                .Select(a => new {
                    Id = a.Id,
                    Name = a.FirstName + " " + a.LastName,
                    Category = a.Course != null && a.Course.Category != null ? a.Course.Category.CategoryName : "Genel",
                    CourseName = a.Course != null ? a.Course.CourseName : "Kurs",
                    CertCode = a.CertificateCode,
                    Grade = a.ExamGrade,
                    Email = a.Email,
                    PhoneNumber = a.PhoneNumber,
                    Points = a.Student != null ? a.Student.Points : 0,
                    IsAvailable = a.Student != null ? a.Student.IsAvailableForWork : false
                })
                .ToListAsync();

            await Task.WhenAll(categoriesTask, spotlightTask, neighborhoodStatsTask);

            ViewBag.Categories = categoriesTask.Result;
            ViewBag.Spotlight = spotlightTask.Result;
            ViewBag.NeighborhoodStats = neighborhoodStatsTask.Result;
            ViewBag.ReadyToWork = readyToWork;

            // Halk Point Altın Üyeler (10.000+ HP)
            ViewBag.FeaturedStudents = await _context.Students
                .AsNoTracking()
                .Where(s => s.Points >= 10000 && !s.IsDeleted)
                .OrderByDescending(s => s.Points)
                .ToListAsync();

            return View(students);
        }

        // 🔴 ADMIN: İşveren Onay Listesi
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> ManageEmployers()
        {
            var employers = await _context.Employers.Where(e => !e.IsDeleted).ToListAsync();
            return View(employers);
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ApproveEmployer(int id)
        {
            var emp = await _context.Employers.FindAsync(id);
            if (emp != null)
            {
                emp.IsApproved = true;
                
                // 📜 AUDIT LOG
                _context.SiteLogs.Add(new SiteLog {
                    Action = "Employer Approved",
                    Details = $"Employer {emp.CompanyName} approved by Admin.",
                    User = User.Identity?.Name ?? "Admin",
                    Severity = "Info"
                });

                await _context.SaveChangesAsync();
                TempData["Success"] = "İşveren hesabı onaylandı. Artık ilan yayınlayabilirler.";
            }
            return RedirectToAction(nameof(ManageEmployers));
        }

        // 📝 İLAN YAYINLA
        [Authorize(Roles = "Employer,Admin")]
        [HttpGet]
        public async Task<IActionResult> PostJob()
        {
            ViewBag.Categories = await _context.Categories.Select(c => c.CategoryName).ToListAsync();
            return View();
        }

        [Authorize(Roles = "Employer,Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> PostJob(JobPosting job)
        {
            int employerId = 0;
            if (User.IsInRole("Admin"))
            {
                // Admin creates a generic system job or picks the first employer for demo
                var firstEmp = await _context.Employers.FirstOrDefaultAsync();
                employerId = firstEmp?.Id ?? 1;
            }
            else
            {
                employerId = int.Parse(User.FindFirst("EmployerId")?.Value ?? "0");
            }

            job.EmployerId = employerId;
            job.IsActive = true;

            // 🛑 SECURITY: Sanitize Description
            job.Description = System.Net.WebUtility.HtmlEncode(job.Description);
            
            _context.JobPostings.Add(job);
            await _context.SaveChangesAsync();

            TempData["Success"] = "İlan başarıyla yayınlandı. Uygun adaylara otomatik bildirim gönderildi.";
            return RedirectToAction(nameof(Dashboard));
        }
    }
}
