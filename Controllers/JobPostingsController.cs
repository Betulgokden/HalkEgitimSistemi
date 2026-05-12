using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;

namespace HalkEgitimSistemi.Controllers
{
    public class JobPostingsController : Controller
    {
        private readonly AppDbContext _context;

        public JobPostingsController(AppDbContext context)
        {
            _context = context;
        }

        // 1. Herkes Görebilir (İş İlanları Panosu)
        public async Task<IActionResult> Index()
        {
            var jobs = await _context.JobPostings
                .Where(j => j.IsActive && (j.Deadline == null || j.Deadline >= DateTime.Now))
                .OrderByDescending(j => j.CreatedAt)
                .ToListAsync();
            return View(jobs);
        }

        // 2. Detaylar
        public async Task<IActionResult> Details(int id)
        {
            var job = await _context.JobPostings.FindAsync(id);
            if (job == null) return NotFound();
            return View(job);
        }

        // 3. İlan Ekleme (Admin veya İş Veren)
        [Authorize]
        public IActionResult Create()
        {
            if (!User.IsInRole("Admin") && !User.IsInRole("Employer"))
            {
                return Forbid();
            }
            return View();
        }

        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(JobPosting job)
        {
            if (!User.IsInRole("Admin") && !User.IsInRole("Employer")) return Forbid();

            if (ModelState.IsValid)
            {
                // ÇÖZÜM 1: String olan claim değerini int'e çeviriyoruz (Satır 59 hatası çözümü)
                var empIdClaim = User.FindFirstValue("EmployerId");

                // Eğer adminse 0 veya özel bir ID atayabilirsin, iş verense int'e parse et
                if (int.TryParse(empIdClaim, out int parsedId))
                {
                    job.EmployerId = parsedId;
                }
                else
                {
                    job.EmployerId = 0; // Veya Admin için varsayılan bir ID
                }

                job.CreatedAt = DateTime.Now;

                _context.Add(job);
                await _context.SaveChangesAsync();
                TempData["Success"] = "İş ilanınız başarıyla yayınlandı!";
                return RedirectToAction(nameof(Index));
            }
            return View(job);
        }

        // 4. İlan Yönetimi (Sadece kendi ilanları veya Admin)
        [Authorize]
        public async Task<IActionResult> Manage()
        {
            var role = User.FindFirstValue(ClaimTypes.Role);
            var empIdClaim = User.FindFirstValue("EmployerId");
            int.TryParse(empIdClaim, out int empId); // String'i int'e çeviriyoruz

            IQueryable<JobPosting> query = _context.JobPostings;

            if (role != "Admin")
            {
                if (empId == 0) return Forbid(); // Geçersiz ID kontrolü
                // ÇÖZÜM 2: int ile int kıyaslanıyor (Satır 82 hatası çözümü)
                query = query.Where(j => j.EmployerId == empId);
            }

            var jobs = await query.OrderByDescending(j => j.CreatedAt).ToListAsync();
            return View(jobs);
        }

        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var job = await _context.JobPostings.FindAsync(id);
            if (job == null) return NotFound();

            var role = User.FindFirstValue(ClaimTypes.Role);
            var empIdClaim = User.FindFirstValue("EmployerId");
            int.TryParse(empIdClaim, out int empId);

            // ÇÖZÜM 3: int != int kıyaslaması (Satır 100 hatası çözümü)
            if (role != "Admin" && job.EmployerId != empId)
            {
                return Forbid();
            }

            _context.JobPostings.Remove(job);
            await _context.SaveChangesAsync();
            TempData["Success"] = "İş ilanı silindi.";
            return RedirectToAction(nameof(Manage));
        }

        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ToggleActive(int id)
        {
            var job = await _context.JobPostings.FindAsync(id);
            if (job == null) return NotFound();

            var role = User.FindFirstValue(ClaimTypes.Role);
            var empIdClaim = User.FindFirstValue("EmployerId");
            int.TryParse(empIdClaim, out int empId);

            // ÇÖZÜM 4: int != int kıyaslaması (Satır 122 hatası çözümü)
            if (role != "Admin" && job.EmployerId != empId) return Forbid();

            job.IsActive = !job.IsActive;
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Manage));
        }
    }
}