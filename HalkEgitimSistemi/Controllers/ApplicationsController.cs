using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace HalkEgitimSistemi.Controllers
{
    public class ApplicationsController : Controller
    {
        private readonly AppDbContext _context;

        public ApplicationsController(AppDbContext context)
        {
            _context = context;
        }

        // 🔴 SADECE MÜDÜR: Gelen başvuruları listeler
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Index(string? status)
        {
            var query = _context.Applications.Include(a => a.Course).AsQueryable();

            if (!string.IsNullOrEmpty(status))
            {
                if (Enum.TryParse<ApplicationStatus>(status, out var parsed))
                    query = query.Where(a => a.Status == parsed);
            }

            ViewBag.CurrentFilter = status;
            ViewBag.PendingCount = await _context.Applications.CountAsync(a => a.Status == ApplicationStatus.Pending);
            ViewBag.ApprovedCount = await _context.Applications.CountAsync(a => a.Status == ApplicationStatus.Approved);
            ViewBag.RejectedCount = await _context.Applications.CountAsync(a => a.Status == ApplicationStatus.Rejected);
            ViewBag.TotalCount = await _context.Applications.CountAsync();

            return View(await query.OrderByDescending(a => a.ApplyDate).ToListAsync());
        }

        // 🔴 SADECE MÜDÜR: Başvuru Onayla
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Approve(int id)
        {
            var application = await _context.Applications.Include(a => a.Course).FirstOrDefaultAsync(a => a.Id == id);
            if (application == null) return NotFound();

            // Kontenjan kontrolü
            if (application.Course != null)
            {
                var approvedCount = await _context.Applications
                    .CountAsync(a => a.CourseId == application.CourseId && a.Status == ApplicationStatus.Approved);
                
                if (approvedCount >= application.Course.Quota)
                {
                    TempData["Error"] = "Bu kursun kontenjanı dolmuştur!";
                    return RedirectToAction(nameof(Index));
                }
            }

            application.Status = ApplicationStatus.Approved;
            await _context.SaveChangesAsync();
            TempData["Success"] = $"{application.FirstName} {application.LastName} başvurusu onaylandı!";
            return RedirectToAction(nameof(Index));
        }

        // 🔴 SADECE MÜDÜR: Başvuru Reddet
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Reject(int id, string? adminNote)
        {
            var application = await _context.Applications.FindAsync(id);
            if (application == null) return NotFound();

            application.Status = ApplicationStatus.Rejected;
            application.AdminNote = adminNote ?? "Başvurunuz değerlendirildi, uygun bulunmadı.";
            await _context.SaveChangesAsync();
            TempData["Success"] = $"{application.FirstName} {application.LastName} başvurusu reddedildi.";
            return RedirectToAction(nameof(Index));
        }

        // 🟢 ZİYARETÇİYE AÇIK: Başvuru Detay
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();
            var application = await _context.Applications.Include(a => a.Course).FirstOrDefaultAsync(a => a.Id == id);
            if (application == null) return NotFound();
            return View(application);
        }

        // 🟢 ZİYARETÇİYE AÇIK: Kayıt Formu Ekranı
        [AllowAnonymous]
        public IActionResult Create(int? courseId)
        {
            ViewBag.CourseId = new SelectList(_context.Courses.Where(c => c.IsActive), "Id", "CourseName", courseId);
            
            if (courseId.HasValue)
            {
                var course = _context.Courses.Find(courseId);
                if (course != null)
                {
                    ViewBag.CourseName = course.CourseName;
                    return View(new Application { CourseId = courseId.Value });
                }
            }
            
            return View(new Application());
        }

        // 🟢 ZİYARETÇİYE AÇIK: Kaydı Veritabanına Gönder
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Application application)
        {
            if (ModelState.IsValid)
            {
                application.ApplyDate = DateTime.Now;
                application.Status = ApplicationStatus.Pending;
                _context.Add(application);
                await _context.SaveChangesAsync();
                return RedirectToAction("Success");
            }
            ViewBag.CourseId = new SelectList(_context.Courses.Where(c => c.IsActive), "Id", "CourseName", application.CourseId);
            return View(application);
        }

        // 🟢 Başvuru Takip (TC ile sorgulama)
        [AllowAnonymous]
        public IActionResult Track()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Track(string tcNo)
        {
            if (string.IsNullOrEmpty(tcNo))
            {
                ViewBag.Error = "Lütfen T.C. Kimlik Numaranızı girin.";
                return View();
            }

            var applications = await _context.Applications
                .Include(a => a.Course)
                .Where(a => a.TcNo == tcNo)
                .OrderByDescending(a => a.ApplyDate)
                .ToListAsync();

            if (!applications.Any())
            {
                ViewBag.Error = "Bu T.C. Kimlik Numarası ile yapılmış başvuru bulunamadı.";
                return View();
            }

            ViewBag.TcNo = tcNo;
            return View("TrackResult", applications);
        }

        [AllowAnonymous]
        public IActionResult Success() => View("~/Views/Success.cshtml");
    }
}