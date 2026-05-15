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

            if (!jobs.Any())
            {
                jobs = new List<JobPosting>
                {
                    new JobPosting { Id = -1, Title = "Mobilya Tasarım Ustası", CompanyName = "Artvin Ahşap Dünyası", Location = "Artvin Merkez", SalaryRange = "35.000₺ - 45.000₺", RequiredCategory = "ZANAAT", Description = "Artvin merkezdeki atölyemizde çalışacak deneyimli mobilya ustaları aranıyor.", CreatedAt = DateTime.Now.AddDays(-2), JobType = "Tam Zamanlı", ExaminationText = "• Ahşap türlerini ve işleme tekniklerini bilmeli\n• CNC kesim makinelerini kullanabilmeli\n• Tasarım programlarına (AutoCAD vb.) hakim olmalı\n• İş güvenliği kurallarına uymalı" },
                    new JobPosting { Id = -2, Title = "Full Stack Web Geliştirici", CompanyName = "Borçka Yazılım", Location = "Borçka", SalaryRange = "45.000₺ - 65.000₺", RequiredCategory = "YAZILIM", Description = "Borçka dijital kampüs projemizde yer alacak yazılımcılar arıyoruz.", CreatedAt = DateTime.Now.AddDays(-1), JobType = "Uzaktan / Hibrit", ExaminationText = "• .NET Core ve EF Core konusunda deneyimli\n• Modern JavaScript frameworklerinden (React/Vue) en az birini bilmeli\n• API tasarımı ve SQL veritabanı yönetimine hakim\n• Git versiyon kontrol sistemini aktif kullanabilen" },
                    new JobPosting { Id = -3, Title = "Balistik ve Arıcılık Teknikeri", CompanyName = "Arhavi Doğal Üretim", Location = "Arhavi", SalaryRange = "28.000₺ - 38.000₺", RequiredCategory = "TARIM", Description = "Modern arıcılık teknikleri konusunda uzman kursiyerlerimiz için iş fırsatı.", CreatedAt = DateTime.Now.AddDays(-3), JobType = "Tam Zamanlı", ExaminationText = "• Arı hastalıkları ve tedavi yöntemlerini bilmeli\n• Ana arı üretimi konusunda bilgi sahibi\n• Bal sağım ve paketleme standartlarına hakim\n• Arazi şartlarında çalışmaya uygun" },
                    new JobPosting { Id = -4, Title = "Turizm ve Doğa Rehberi", CompanyName = "Şavşat Turizm", Location = "Şavşat", SalaryRange = "30.000₺ - 42.000₺", RequiredCategory = "TURİZM", Description = "Şavşat Karagöl çevresinde yabancı turistlere rehberlik edecek çalışma arkadaşları.", CreatedAt = DateTime.Now.AddDays(-5), JobType = "Proje Bazlı", ExaminationText = "• En az bir yabancı dili (İngilizce/Rusça) akıcı konuşmalı\n• Bölge coğrafyası ve tarihi hakkında bilgi sahibi\n• İlk yardım sertifikasına sahip olmalı\n• İletişim becerileri yüksek ve çözüm odaklı" },
                    new JobPosting { Id = -5, Title = "Ön Muhasebe Elemanı", CompanyName = "Hopa Lojistik", Location = "Hopa", SalaryRange = "22.000₺ - 28.000₺", RequiredCategory = "FİNANS", Description = "Hopa liman bölgesindeki ofisimizde görevlendirilmek üzere muhasebe bilgisi olan eleman aranıyor.", CreatedAt = DateTime.Now.AddDays(-4), JobType = "Tam Zamanlı", ExaminationText = "• Temel muhasebe prensiplerine hakim\n• Luca veya Zirve programlarını kullanabilen\n• E-fatura ve e-arşiv süreçlerini bilen\n• Ofis araç gereçlerini ve MS Office programlarını etkin kullanan" }
                };
            }
            return View(jobs);
        }

        // 2. Detaylar
        public async Task<IActionResult> Details(int id)
        {
            if (id < 0)
            {
                var dummyJobs = new List<JobPosting>
                {
                    new JobPosting { Id = -1, Title = "Mobilya Tasarım Ustası", CompanyName = "Artvin Ahşap Dünyası", Location = "Artvin Merkez", SalaryRange = "35.000₺ - 45.000₺", RequiredCategory = "ZANAAT", Description = "Artvin merkezdeki atölyemizde çalışacak deneyimli mobilya ustaları aranıyor.", CreatedAt = DateTime.Now.AddDays(-2), JobType = "Tam Zamanlı", ExaminationText = "• Ahşap türlerini ve işleme tekniklerini bilmeli\n• CNC kesim makinelerini kullanabilmeli\n• Tasarım programlarına (AutoCAD vb.) hakim olmalı\n• İş güvenliği kurallarına uymalı" },
                    new JobPosting { Id = -2, Title = "Full Stack Web Geliştirici", CompanyName = "Borçka Yazılım", Location = "Borçka", SalaryRange = "45.000₺ - 65.000₺", RequiredCategory = "YAZILIM", Description = "Borçka dijital kampüs projemizde yer alacak yazılımcılar arıyoruz.", CreatedAt = DateTime.Now.AddDays(-1), JobType = "Uzaktan / Hibrit", ExaminationText = "• .NET Core ve EF Core konusunda deneyimli\n• Modern JavaScript frameworklerinden (React/Vue) en az birini bilmeli\n• API tasarımı ve SQL veritabanı yönetimine hakim\n• Git versiyon kontrol sistemini aktif kullanabilen" },
                    new JobPosting { Id = -3, Title = "Balistik ve Arıcılık Teknikeri", CompanyName = "Arhavi Doğal Üretim", Location = "Arhavi", SalaryRange = "28.000₺ - 38.000₺", RequiredCategory = "TARIM", Description = "Modern arıcılık teknikleri konusunda uzman kursiyerlerimiz için iş fırsatı.", CreatedAt = DateTime.Now.AddDays(-3), JobType = "Tam Zamanlı", ExaminationText = "• Arı hastalıkları ve tedavi yöntemlerini bilmeli\n• Ana arı üretimi konusunda bilgi sahibi\n• Bal sağım ve paketleme standartlarına hakim\n• Arazi şartlarında çalışmaya uygun" },
                    new JobPosting { Id = -4, Title = "Turizm ve Doğa Rehberi", CompanyName = "Şavşat Turizm", Location = "Şavşat", SalaryRange = "30.000₺ - 42.000₺", RequiredCategory = "TURİZM", Description = "Şavşat Karagöl çevresinde yabancı turistlere rehberlik edecek çalışma arkadaşları.", CreatedAt = DateTime.Now.AddDays(-5), JobType = "Proje Bazlı", ExaminationText = "• En az bir yabancı dili (İngilizce/Rusça) akıcı konuşmalı\n• Bölge coğrafyası ve tarihi hakkında bilgi sahibi\n• İlk yardım sertifikasına sahip olmalı\n• İletişim becerileri yüksek ve çözüm odaklı" },
                    new JobPosting { Id = -5, Title = "Ön Muhasebe Elemanı", CompanyName = "Hopa Lojistik", Location = "Hopa", SalaryRange = "22.000₺ - 28.000₺", RequiredCategory = "FİNANS", Description = "Hopa liman bölgesindeki ofisimizde görevlendirilmek üzere muhasebe bilgisi olan eleman aranıyor.", CreatedAt = DateTime.Now.AddDays(-4), JobType = "Tam Zamanlı", ExaminationText = "• Temel muhasebe prensiplerine hakim\n• Luca veya Zirve programlarını kullanabilen\n• E-fatura ve e-arşiv süreçlerini bilen\n• Ofis araç gereçlerini ve MS Office programlarını etkin kullanan" }
                };
                var dummyJob = dummyJobs.FirstOrDefault(j => j.Id == id);
                if (dummyJob == null) return NotFound();
                return View(dummyJob);
            }

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
                var empIdClaim = User.FindFirstValue("EmployerId");

                if (int.TryParse(empIdClaim, out int parsedId))
                {
                    job.EmployerId = parsedId;
                }
                else
                {
                    // Admin için sistemdeki ilk işvereni bul veya 0 bırak
                    var firstEmp = await _context.Employers.FirstOrDefaultAsync();
                    job.EmployerId = firstEmp?.Id ?? 1; 
                }

                job.CreatedAt = DateTime.Now;
                job.IsActive = true;
                job.IsDeleted = false;

                try 
                {
                    _context.Add(job);
                    await _context.SaveChangesAsync();
                    TempData["Success"] = "İş ilanınız başarıyla yayınlandı!";
                    return RedirectToAction(nameof(Index));
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Veritabanına kaydedilirken bir hata oluştu: " + ex.Message);
                }
            }
            return View(job);
        }

        // 3.5 İlan Düzenleme
        [Authorize]
        public async Task<IActionResult> Edit(int id)
        {
            var job = await _context.JobPostings.FindAsync(id);
            if (job == null) return NotFound();

            var role = User.FindFirstValue(ClaimTypes.Role);
            var empIdClaim = User.FindFirstValue("EmployerId");
            int.TryParse(empIdClaim, out int empId);

            if (role != "Admin" && job.EmployerId != empId) return Forbid();

            return View(job);
        }

        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, JobPosting job)
        {
            if (id != job.Id) return NotFound();

            var existingJob = await _context.JobPostings.AsNoTracking().FirstOrDefaultAsync(j => j.Id == id);
            if (existingJob == null) return NotFound();

            var role = User.FindFirstValue(ClaimTypes.Role);
            var empIdClaim = User.FindFirstValue("EmployerId");
            int.TryParse(empIdClaim, out int empId);

            if (role != "Admin" && existingJob.EmployerId != empId) return Forbid();

            if (ModelState.IsValid)
            {
                try
                {
                    job.EmployerId = existingJob.EmployerId;
                    job.CreatedAt = existingJob.CreatedAt;
                    job.IsDeleted = existingJob.IsDeleted;

                    _context.Update(job);
                    await _context.SaveChangesAsync();
                    TempData["Success"] = "İş ilanı başarıyla güncellendi!";
                    return RedirectToAction(nameof(Manage));
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!JobPostingExists(job.Id)) return NotFound();
                    else throw;
                }
            }
            return View(job);
        }

        private bool JobPostingExists(int id)
        {
            return _context.JobPostings.Any(e => e.Id == id);
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