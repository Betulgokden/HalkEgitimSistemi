using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
using System.IO;
using System.Collections.Generic;
using System.Linq;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IMemoryCache _cache;

        public AdminController(AppDbContext context, IMemoryCache cache)
        {
            _context = context;
            _cache = cache;
        }

        // Admin Dashboard - İstatistikler
        public async Task<IActionResult> Dashboard()
        {
            const string cacheKey = "AdminDashboardStatsV3_Turbo";

            if (!_cache.TryGetValue(cacheKey, out Dictionary<string, object>? stats))
            {
                stats = new Dictionary<string, object>();

                // ⚡ SEQUENTIAL QUERIES (DbContext is not thread-safe)
                var appStatusCounts = await _context.Applications.AsNoTracking().Where(a => !a.IsDeleted).GroupBy(a => a.Status).Select(g => new { Status = g.Key, Count = g.Count() }).ToListAsync();
                var courseStatusCounts = await _context.Courses.AsNoTracking().Where(c => !c.IsDeleted).GroupBy(c => c.IsActive).Select(g => new { IsActive = g.Key, Count = g.Count() }).ToListAsync();
                var studentCount = await _context.Students.AsNoTracking().CountAsync(s => !s.IsDeleted);
                var instructorCount = await _context.Instructors.AsNoTracking().CountAsync(i => !i.IsDeleted);
                var categoryCount = await _context.Categories.AsNoTracking().CountAsync(c => !c.IsDeleted);
                var logEntries = await _context.LogEntries.AsNoTracking().OrderByDescending(l => l.Timestamp).Take(8).ToListAsync();
                var pendingInstructorCount = await _context.MasterTrainerApplications.AsNoTracking().CountAsync(a => a.Status == TrainerApplicationStatus.Pending);
                var activeLiveCount = await _context.Courses.AsNoTracking().CountAsync(c => c.IsLive && !string.IsNullOrEmpty(c.LiveRoomId) && !c.IsDeleted);

                stats["PendingCount"] = appStatusCounts.FirstOrDefault(s => s.Status == ApplicationStatus.Pending)?.Count ?? 0;
                stats["ApprovedCount"] = appStatusCounts.FirstOrDefault(s => s.Status == ApplicationStatus.Approved)?.Count ?? 0;
                stats["RejectedCount"] = appStatusCounts.FirstOrDefault(s => s.Status == ApplicationStatus.Rejected)?.Count ?? 0;
                stats["WaitingCount"] = appStatusCounts.FirstOrDefault(s => s.Status == ApplicationStatus.Waiting)?.Count ?? 0;
                stats["TotalApplications"] = appStatusCounts.Sum(s => s.Count);

                stats["ActiveCourses"] = courseStatusCounts.FirstOrDefault(c => c.IsActive)?.Count ?? 0;
                stats["InactiveCourses"] = courseStatusCounts.FirstOrDefault(c => !c.IsActive)?.Count ?? 0;
                stats["TotalCourses"] = courseStatusCounts.Sum(c => c.Count);

                stats["TotalStudents"] = studentCount;
                stats["TotalInstructors"] = instructorCount;
                stats["TotalCategories"] = categoryCount;
                stats["RecentLogs"] = logEntries;
                stats["PendingInstructorAppCount"] = pendingInstructorCount;
                stats["ActiveLiveCount"] = activeLiveCount;

                // Detail queries (Optimized to avoid N+1 issues)
                stats["CourseStats"] = await _context.Courses.AsNoTracking().Where(c => !c.IsDeleted).OrderByDescending(c => c.Applications!.Count).Take(6).Select(c => new { CourseName = c.CourseName, Quota = c.Quota, ApprovedCount = c.Applications!.Count(a => a.Status == ApplicationStatus.Approved && !a.IsDeleted) }).ToListAsync();
                stats["CategoryStats"] = await _context.Categories.AsNoTracking().Where(c => !c.IsDeleted).Select(c => new { CategoryName = c.CategoryName, CourseCount = c.Courses!.Count(x => !x.IsDeleted) }).ToListAsync();
                stats["RecentApplications"] = await _context.Applications.AsNoTracking().Include(a => a.Course).Where(a => !a.IsDeleted).OrderByDescending(a => a.ApplyDate).Take(5).ToListAsync();
                stats["TrendData"] = await _context.Applications.AsNoTracking().Where(a => !a.IsDeleted && a.ApplyDate >= DateTime.Now.AddDays(-7)).GroupBy(a => a.ApplyDate.Date).Select(g => new { Date = g.Key, Count = g.Count() }).OrderBy(x => x.Date).ToListAsync();

                _cache.Set(cacheKey, stats, TimeSpan.FromMinutes(10)); // Increased cache time for better performance
            }

            ViewBag.PendingCount = stats?["PendingCount"];
            ViewBag.ApprovedCount = stats?["ApprovedCount"];
            ViewBag.TotalApplications = stats?["TotalApplications"];
            ViewBag.ActiveCourses = stats?["ActiveCourses"];
            ViewBag.TotalCourses = stats?["TotalCourses"];
            ViewBag.TotalStudents = stats?["TotalStudents"];
            ViewBag.TotalInstructors = stats?["TotalInstructors"];
            ViewBag.TotalCategories = stats?["TotalCategories"];
            ViewBag.InactiveCourses = stats?["InactiveCourses"];
            ViewBag.WaitingCount = stats?["WaitingCount"];
            ViewBag.RejectedCount = stats?["RejectedCount"];
            ViewBag.CourseStats = stats?["CourseStats"];
            ViewBag.CategoryStats = stats?["CategoryStats"];
            ViewBag.RecentApplications = stats?["RecentApplications"];
            ViewBag.TrendData = stats?["TrendData"];
            ViewBag.RecentLogs = stats?["RecentLogs"];
            ViewBag.PendingInstructorAppCount = stats?["PendingInstructorAppCount"];
            ViewBag.ActiveLiveCount = stats?["ActiveLiveCount"];

            // 🚨 SECURITY MONITORING: Critical Alert Check (with safety)
            try 
            {
                ViewBag.CriticalAlerts = await _context.SiteLogs
                    .AsNoTracking()
                    .Where(l => l.Severity == "Critical" || l.Severity == "Error")
                    .OrderByDescending(l => l.Timestamp)
                    .Take(5)
                    .ToListAsync();
            }
            catch 
            {
                // Fallback: If SiteLogs table doesn't exist, show empty list instead of crashing
                ViewBag.CriticalAlerts = new List<SiteLog>();
            }

            return View();
        }

        // GET: Admin/GlobalSettings
        public async Task<IActionResult> GlobalSettings()
        {
            var settings = await _context.SiteSettings.AsNoTracking().ToListAsync();
            return View(settings);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SaveGlobalSettings(Dictionary<string, string> settings)
        {
            if (settings == null) return RedirectToAction(nameof(GlobalSettings));

            foreach (var item in settings)
            {
                var existing = await _context.SiteSettings.FirstOrDefaultAsync(s => s.Key == item.Key);
                if (existing != null)
                {
                    existing.Value = item.Value;
                    existing.LastUpdated = DateTime.Now;
                    existing.UpdatedBy = User.Identity?.Name ?? "Admin";
                    _context.Update(existing);
                }
                else
                {
                    _context.SiteSettings.Add(new SiteSettings
                    {
                        Key = item.Key,
                        Value = item.Value,
                        LastUpdated = DateTime.Now,
                        UpdatedBy = User.Identity?.Name ?? "Admin"
                    });
                }
            }

            await _context.SaveChangesAsync();
            
            // Clear cache if you use any for settings
            _cache.Remove("AdminDashboardStatsV2"); 
            
            TempData["Success"] = "Tüm ayarlar başarıyla güncellendi.";
            return RedirectToAction(nameof(GlobalSettings));
        }

        // GET: Admin/MyProfile
        [HttpGet]
        public async Task<IActionResult> MyProfile()
        {
            var adminUser = await _context.AdminUsers.FirstOrDefaultAsync();
            if (adminUser == null)
            {
                return NotFound();
            }
            return View(adminUser);
        }

        // POST: Admin/MyProfile
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> MyProfile([Bind("Id,Username,Password,FullName")] AdminUser adminUser)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(adminUser);
                    await _context.SaveChangesAsync();
                    
                    TempData["SuccessMessage"] = "Profil bilgileriniz başarıyla güncellendi.";
                    return RedirectToAction(nameof(MyProfile));
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AdminUserExists(adminUser.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
            }
            return View(adminUser);
        }

        public async Task<IActionResult> EmailLogs()
        {
            var logs = await _context.EmailLogs
                .OrderByDescending(l => l.SentDate)
                .Take(100)
                .ToListAsync();
            return View(logs);
        }

        // ──────────────────────────────────────────────────────
        // PANEL BAŞVURULARI (Eğitmen & Kursiyer)
        // ──────────────────────────────────────────────────────
        public async Task<IActionResult> InstructorApplications(TrainerApplicationStatus? status)
        {
            // 1. Eğitmen Başvuruları (Form dolduranlar)
            var instructorQuery = _context.MasterTrainerApplications.AsQueryable();
            if (status.HasValue) instructorQuery = instructorQuery.Where(a => a.Status == status.Value);

            var instructorApps = await instructorQuery
                .OrderBy(a => a.FullName) // Alfabetik Sıra
                .ToListAsync();

            // 1.1 Mevcut Eğitmenlerden Onay Bekleyenler (Sisteme kayıtlı ama yetkisiz)
            if (!status.HasValue || status == TrainerApplicationStatus.Pending)
            {
                var existingUnapproved = await _context.Instructors
                    .Where(i => (!i.IsApproved || i.FullName.Contains("Ahmet Yılmaz")) && !i.IsDeleted)
                    .Select(i => new MasterTrainerApplication {
                        Id = i.Id + 1000000,
                        FullName = i.FullName,
                        // Ahmet Yılmaz için özel ünvan, diğerleri için kendi ünvanı
                        Specialty = i.FullName.Contains("Ahmet Yılmaz") ? "Yapay Zeka Destekli Python Kurs Eğitmeni" : i.Title + " (Sistem Kaydı)",
                        Status = TrainerApplicationStatus.Pending,
                        ApplyDate = DateTime.Now,
                        Email = i.Username ?? "",
                        PhotoPath = i.ImageUrl
                    })
                    .ToListAsync();
                
                instructorApps.AddRange(existingUnapproved);
                instructorApps = instructorApps.OrderBy(a => a.FullName).ToList(); // Tekrar Alfabetik
            }

            // 2. Kursiyer Paneli Talepleri (Onay bekleyen öğrenciler)
            var studentRequests = await _context.Students
                .Where(s => !s.IsApproved && !s.IsDeleted)
                .OrderBy(s => s.FirstName).ThenBy(s => s.LastName) // Alfabetik Sıra (Doğru Alanlarla)
                .ToListAsync();

            ViewBag.StatusFilter = status;
            ViewBag.StudentRequests = studentRequests;
            ViewBag.PendingInstructorCount = (await _context.MasterTrainerApplications.CountAsync(a => a.Status == TrainerApplicationStatus.Pending)) 
                                            + (await _context.Instructors.CountAsync(i => !i.IsApproved && !i.IsDeleted));
            ViewBag.PendingStudentCount = studentRequests.Count;

            return View(instructorApps);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ApproveStudentRequest(int id)
        {
            var student = await _context.Students.FindAsync(id);
            if (student == null) return NotFound();
            
            student.IsApproved = true;
            await _context.SaveChangesAsync();
            
            TempData["Success"] = $"{student.FirstName} {student.LastName} panel erişimi onaylandı.";
            return RedirectToAction(nameof(InstructorApplications));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> RejectStudentRequest(int id)
        {
            var student = await _context.Students.FindAsync(id);
            if (student == null) return NotFound();
            
            // Rejection might mean deletion or just staying unapproved
            // We'll mark as deleted to remove from list
            student.IsDeleted = true;
            await _context.SaveChangesAsync();
            
            TempData["Warning"] = $"{student.FirstName} {student.LastName} panel erişimi reddedildi.";
            return RedirectToAction(nameof(InstructorApplications));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ApproveInstructorApp(int id)
        {
            if (id >= 1000000) // Mevcut Eğitmen Onayı
            {
                var instructor = await _context.Instructors.FindAsync(id - 1000000);
                if (instructor == null) return NotFound();
                instructor.IsApproved = true;
                await _context.SaveChangesAsync();
                TempData["Success"] = $"{instructor.FullName} panel erişimi onaylandı.";
            }
            else // Yeni Başvuru Onayı
            {
                var app = await _context.MasterTrainerApplications.FindAsync(id);
                if (app == null) return NotFound();
                app.Status = TrainerApplicationStatus.Approved;
                await _context.SaveChangesAsync();
                TempData["Success"] = $"{app.FullName} başvurusu onaylandı.";
            }
            return RedirectToAction(nameof(InstructorApplications));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> RejectInstructorApp(int id)
        {
            if (id >= 1000000) // Mevcut Eğitmen Reddi
            {
                var instructor = await _context.Instructors.FindAsync(id - 1000000);
                if (instructor == null) return NotFound();
                instructor.IsDeleted = true; // Silinmiş sayalım
                instructor.IsApproved = false;
                await _context.SaveChangesAsync();
                TempData["Warning"] = $"{instructor.FullName} erişim talebi reddedildi.";
            }
            else // Yeni Başvuru Reddi
            {
                var app = await _context.MasterTrainerApplications.FindAsync(id);
                if (app == null) return NotFound();
                app.Status = TrainerApplicationStatus.Rejected;
                await _context.SaveChangesAsync();
                TempData["Warning"] = $"{app.FullName} başvurusu reddedildi.";
            }
            return RedirectToAction(nameof(InstructorApplications));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ResetInstructorApp(int id)
        {
            if (id >= 1000000) // Mevcut Eğitmen Beklemeye Al
            {
                var instructor = await _context.Instructors.FindAsync(id - 1000000);
                if (instructor == null) return NotFound();
                instructor.IsApproved = false;
                instructor.IsDeleted = false;
                await _context.SaveChangesAsync();
                TempData["Info"] = $"{instructor.FullName} talebi tekrar beklemeye alındı.";
            }
            else // Yeni Başvuru Beklemeye Al
            {
                var app = await _context.MasterTrainerApplications.FindAsync(id);
                if (app == null) return NotFound();
                app.Status = TrainerApplicationStatus.Pending;
                await _context.SaveChangesAsync();
                TempData["Info"] = $"{app.FullName} başvurusu tekrar beklemeye alındı.";
            }
            return RedirectToAction(nameof(InstructorApplications));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ResetStudentRequest(int id)
        {
            var student = await _context.Students.FindAsync(id);
            if (student == null) return NotFound();

            student.IsApproved = false;
            student.IsDeleted = false;
            await _context.SaveChangesAsync();

            TempData["Info"] = $"{student.FirstName} {student.LastName} talebi tekrar beklemeye alındı.";
            return RedirectToAction(nameof(InstructorApplications));
        }

        // ──────────────────────────────────────────────────────
        // DETAY GETİRME (AJAX İÇİN)
        // ──────────────────────────────────────────────────────
        [HttpGet]
        public async Task<IActionResult> GetInstructorAppDetails(int id)
        {
            string html = "";
            if (id >= 1000000) // Mevcut Eğitmen
            {
                var instructor = await _context.Instructors.FindAsync(id - 1000000);
                if (instructor == null) return Content("<p class='text-danger'>Eğitmen bulunamadı.</p>");
                
                var age = instructor.BirthYear.HasValue ? (DateTime.Now.Year - instructor.BirthYear.Value).ToString() : "Belirtilmemiş";
                html = $@"
                    <div class='row g-4'>
                        <div class='col-md-4 text-center'>
                            <img src='{(string.IsNullOrEmpty(instructor.ImageUrl) ? "/img/default-avatar.png" : instructor.ImageUrl)}' class='img-fluid rounded border border-gold shadow mb-3' style='max-height: 200px;'>
                            <h4 class='gold-text mb-0'>{instructor.FullName}</h4>
                            <p class='text-white-50'>{instructor.Title} (Sistem Kaydı)</p>
                        </div>
                        <div class='col-md-8'>
                            <div class='glass-card-static p-3 mb-3'>
                                <h6 class='gold-text border-bottom pb-2'><i class='bi bi-info-circle me-2'></i>Kişisel Bilgiler</h6>
                                <div class='row mt-2'>
                                    <div class='col-6'><strong>Doğum Yılı:</strong> {age}</div>
                                    <div class='col-6'><strong>TC No:</strong> *** (Gizli)</div>
                                    <div class='col-6 mt-2'><strong>Kullanıcı Adı:</strong> {instructor.Username}</div>
                                </div>
                            </div>
                            <div class='glass-card-static p-3'>
                                <h6 class='gold-text border-bottom pb-2'><i class='bi bi-geo-alt me-2'></i>Adres Bilgisi</h6>
                                <p class='mb-0 text-white-80'>{instructor.Address ?? "Adres bilgisi verilmemiş."}</p>
                            </div>
                        </div>
                    </div>";
            }
            else // Yeni Başvuru
            {
                var app = await _context.MasterTrainerApplications.FindAsync(id);
                if (app == null) return Content("<p class='text-danger'>Başvuru bulunamadı.</p>");

                var age = DateTime.Now.Year - app.BirthYear;
                html = $@"
                    <div class='row g-4'>
                        <div class='col-md-4 text-center'>
                            <img src='{(string.IsNullOrEmpty(app.PhotoPath) ? "/img/default-avatar.png" : app.PhotoPath)}' class='img-fluid rounded border border-gold shadow mb-3' style='max-height: 200px;'>
                            <h4 class='gold-text mb-0'>{app.FullName}</h4>
                            <p class='text-white-50'>{app.Specialty}</p>
                        </div>
                        <div class='col-md-8'>
                            <div class='glass-card-static p-3 mb-3'>
                                <h6 class='gold-text border-bottom pb-2'><i class='bi bi-info-circle me-2'></i>Kişisel Bilgiler</h6>
                                <div class='row mt-2'>
                                    <div class='col-6'><strong>Yaş:</strong> {age} ({app.BirthYear})</div>
                                    <div class='col-6'><strong>TC No:</strong> {app.TcNo}</div>
                                    <div class='col-6 mt-2'><strong>E-posta:</strong> {app.Email}</div>
                                    <div class='col-6 mt-2'><strong>Telefon:</strong> {app.Phone}</div>
                                    <div class='col-12 mt-2'><strong>Mezuniyet:</strong> {app.GraduationStatus ?? "Belirtilmemiş"}</div>
                                </div>
                            </div>
                            <div class='glass-card-static p-3 mb-3'>
                                <h6 class='gold-text border-bottom pb-2'><i class='bi bi-geo-alt me-2'></i>Adres Bilgisi</h6>
                                <p class='mb-0 text-white-80'>{app.Address ?? "Adres bilgisi verilmemiş."}</p>
                            </div>
                            <div class='glass-card-static p-3'>
                                <h6 class='gold-text border-bottom pb-2'><i class='bi bi-file-earmark-check me-2'></i>Resmi Belgeler</h6>
                                <div class='mt-2 d-flex flex-wrap gap-2'>
                                     <a href='{app.CvPath}' target='_blank' class='btn btn-xs btn-outline-gold'><i class='bi bi-file-pdf me-1'></i>Özgeçmiş (CV)</a>
                                     <a href='{app.DiplomaPath}' target='_blank' class='btn btn-xs btn-outline-gold'><i class='bi bi-mortarboard me-1'></i>Diploma/Sertifika</a>
                                     <a href='{app.CriminalRecordPath}' target='_blank' class='btn btn-xs btn-outline-danger'><i class='bi bi-shield-lock me-1'></i>Adli Sicil Kaydı</a>
                                </div>
                            </div>
                        </div>
                    </div>";
            }
            return Content(html, "text/html");
        }

        [HttpGet]
        public async Task<IActionResult> GetStudentRequestDetails(int id)
        {
            var student = await _context.Students.FindAsync(id);
            if (student == null) return Content("<p class='text-danger'>Kayıt bulunamadı.</p>");

            var age = student.BirthDate.HasValue ? (DateTime.Now.Year - student.BirthDate.Value.Year).ToString() : "Bilinmiyor";
            var html = $@"
                <div class='row g-4'>
                    <div class='col-md-4 text-center'>
                        <img src='{(string.IsNullOrEmpty(student.ProfilePicture) ? "/img/default-avatar.png" : student.ProfilePicture)}' class='img-fluid rounded-circle border border-gold shadow mb-3' style='width: 150px; height: 150px; object-fit: cover;'>
                        <h4 class='gold-text mb-0'>{student.FirstName} {student.LastName}</h4>
                        <p class='text-white-50'>Kursiyer Adayı</p>
                    </div>
                    <div class='col-md-8'>
                        <div class='glass-card-static p-3 mb-3'>
                            <h6 class='gold-text border-bottom pb-2'><i class='bi bi-info-circle me-2'></i>Kişisel Bilgiler</h6>
                            <div class='row mt-2'>
                                <div class='col-6'><strong>Yaş:</strong> {age}</div>
                                <div class='col-6'><strong>TC No:</strong> {student.TcNo ?? "Belirtilmemiş"}</div>
                                <div class='col-6 mt-2'><strong>E-posta:</strong> {student.Email}</div>
                                <div class='col-6 mt-2'><strong>Telefon:</strong> {student.PhoneNumber ?? "Belirtilmemiş"}</div>
                            </div>
                        </div>
                        <div class='glass-card-static p-3'>
                            <h6 class='gold-text border-bottom pb-2'><i class='bi bi-geo-alt me-2'></i>Adres Bilgisi</h6>
                            <p class='mb-0 text-white-80'>{student.Address ?? "Adres bilgisi verilmemiş."}</p>
                        </div>
                    </div>
                </div>";
            return Content(html, "text/html");
        }

        // ──────────────────────────────────────────────────────
        // MESAJ TAKİBİ (Öğrenci ↔ Öğretmen)
        // ──────────────────────────────────────────────────────
        public async Task<IActionResult> MessageLog(string? search)
        {
            var query = _context.Messages
                .Include(m => m.ReceiverInstructor)
                .AsQueryable();

            if (!string.IsNullOrWhiteSpace(search))
                query = query.Where(m =>
                    m.SenderUsername.Contains(search) ||
                    m.Content.Contains(search) ||
                    (m.ReceiverInstructor != null && m.ReceiverInstructor.FullName.Contains(search)));

            var messages = await query
                .OrderByDescending(m => m.Date)
                .Take(200)
                .ToListAsync();

            ViewBag.Search = search;
            return View(messages);
        }

        // Öğretmen grup chat - Gerçek Zamanlı (Öğretmen Odası)
        public async Task<IActionResult> TeacherRoom()
        {
            var messages = await _context.TeacherChatMessages
                .Include(m => m.Instructor)
                .OrderByDescending(m => m.SentAt)
                .Take(50)
                .Reverse()
                .ToListAsync();
            return View(messages);
        }

        // Öğretmenler arası özel mesaj takibi (Yönetici yetkisiyle)
        public async Task<IActionResult> TeacherPrivateMessages()
        {
            var privateMessages = await _context.Messages
                .Include(m => m.ReceiverInstructor)
                .Where(m => m.Subject.Contains("Özel Mesaj (Öğretmenler Odası)"))
                .OrderByDescending(m => m.Date)
                .ToListAsync();

            return View(privateMessages);
        }

        // Öğretmen grup chat logları (Yedek/Arşiv)
        public async Task<IActionResult> TeacherChatLog()
        {
            var messages = await _context.TeacherChatMessages
                .Include(m => m.Instructor)
                .OrderByDescending(m => m.SentAt)
                .Take(200)
                .ToListAsync();
            return View(messages);
        }

        // Kursiyer Chat - Gerçek Zamanlı İzleme ve Katılım
        public async Task<IActionResult> StudentChat(int? courseId)
        {
            var courses = await _context.Courses
                .Where(c => !c.IsDeleted && c.IsActive)
                .Select(c => new { c.Id, c.CourseName })
                .ToListAsync();

            ViewBag.Courses = courses;
            ViewBag.SelectedCourseId = courseId;

            List<CourseChatMessage> messages = new List<CourseChatMessage>();
            if (courseId.HasValue)
            {
                messages = await _context.CourseChatMessages
                    .Where(m => m.CourseId == courseId.Value)
                    .OrderByDescending(m => m.SentAt)
                    .Take(50)
                    .Reverse()
                    .ToListAsync();
            }

            return View(messages);
        }

        // Kurs chat logları (Arşiv)
        public async Task<IActionResult> CourseChatLog(int? courseId)
        {
            var query = _context.CourseChatMessages
                .Include(m => m.Course)
                .AsQueryable();

            if (courseId.HasValue)
                query = query.Where(m => m.CourseId == courseId.Value);

            var messages = await query
                .OrderByDescending(m => m.SentAt)
                .Take(200)
                .ToListAsync();

            var courses = await _context.Courses
                .Where(c => !c.IsDeleted)
                .Select(c => new { c.Id, c.CourseName })
                .ToListAsync();

            ViewBag.Courses = courses;
            ViewBag.SelectedCourse = courseId;
            return View(messages);
        }

        // Canlı Ders İzleme Paneli
        public async Task<IActionResult> LiveLessons()
        {
            var activeLiveCourses = await _context.Courses
                .Include(c => c.Instructor)
                .Include(c => c.Applications)
                .Where(c => c.IsLive && !string.IsNullOrEmpty(c.LiveRoomId) && !c.IsDeleted)
                .ToListAsync();

            return View(activeLiveCourses);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EndLiveLesson(int id)
        {
            var course = await _context.Courses.FindAsync(id);
            if (course != null)
            {
                course.IsLive = false;
                course.LiveRoomId = null;
                await _context.SaveChangesAsync();
                TempData["Success"] = "Canlı ders başarıyla sonlandırıldı.";
            }
            return RedirectToAction(nameof(LiveLessons));
        }

        // ──────────────────────────────────────────────────────
        // KÜFÜR CEZALARI
        // ──────────────────────────────────────────────────────
        public async Task<IActionResult> ProfanityBans()
        {
            var bans = await _context.ProfanityBans
                .OrderByDescending(b => b.UpdatedAt)
                .ToListAsync();
            return View(bans);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> LiftBan(int id)
        {
            var ban = await _context.ProfanityBans.FindAsync(id);
            if (ban == null) return NotFound();
            ban.BanUntil = null;
            ban.IsPermanent = false;
            ban.AdminNote = "Yönetici tarafından kaldırıldı: " + DateTime.Now.ToString("dd.MM.yyyy HH:mm");
            ban.UpdatedAt = DateTime.Now;
            await _context.SaveChangesAsync();
            TempData["Success"] = $"{ban.UserEmail} kullanıcısının banı kaldırıldı.";
            return RedirectToAction(nameof(ProfanityBans));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> MakePermanentBan(int id)
        {
            var ban = await _context.ProfanityBans.FindAsync(id);
            if (ban == null) return NotFound();
            ban.IsPermanent = true;
            ban.BanUntil = null;
            ban.UpdatedAt = DateTime.Now;
            await _context.SaveChangesAsync();
            TempData["Warning"] = $"{ban.UserEmail} kullanıcısına kalıcı ban uygulandı.";
            return RedirectToAction(nameof(ProfanityBans));
        }

        // ──────────────────────────────────────────────────────
        // YASAKLI KELİME YÖNETİMİ
        // ──────────────────────────────────────────────────────
        public async Task<IActionResult> ForbiddenWords()
        {
            var words = await _context.ForbiddenWords
                .OrderBy(w => w.Word)
                .ToListAsync();
            return View(words);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddForbiddenWord(string word)
        {
            if (string.IsNullOrWhiteSpace(word)) return BadRequest();

            var exists = await _context.ForbiddenWords.AnyAsync(w => w.Word == word);
            if (!exists)
            {
                var newWord = new ForbiddenWord
                {
                    Word = word.Trim(),
                    CreatedAt = DateTime.Now,
                    CreatedBy = User.Identity?.Name ?? "Admin"
                };
                _context.ForbiddenWords.Add(newWord);
                await _context.SaveChangesAsync();
                TempData["Success"] = "Kelime listeye eklendi.";
            }
            return RedirectToAction(nameof(ForbiddenWords));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteForbiddenWord(int id)
        {
            var word = await _context.ForbiddenWords.FindAsync(id);
            if (word != null)
            {
                _context.ForbiddenWords.Remove(word);
                await _context.SaveChangesAsync();
                TempData["Info"] = "Kelime listeden silindi.";
            }
            return RedirectToAction(nameof(ForbiddenWords));
        }

        // ──────────────────────────────────────────────────────
        // ŞİKAYETLER
        // ──────────────────────────────────────────────────────
        public async Task<IActionResult> Complaints(ComplaintStatus? status)
        {
            var query = _context.Complaints.AsQueryable();
            if (status.HasValue) query = query.Where(c => c.Status == status.Value);

            var list = await query
                .OrderByDescending(c => c.CreatedAt)
                .ToListAsync();

            ViewBag.StatusFilter = status;
            ViewBag.PendingCount = await _context.Complaints
                .CountAsync(c => c.Status == ComplaintStatus.Pending);

            return View(list);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ReviewComplaint(int id, ComplaintStatus status, string? adminNote)
        {
            var complaint = await _context.Complaints.FindAsync(id);
            if (complaint == null) return NotFound();
            complaint.Status = status;
            complaint.AdminNote = adminNote;
            complaint.ReviewedAt = DateTime.Now;
            await _context.SaveChangesAsync();
            TempData["Success"] = "Şikayet güncellendi.";
            return RedirectToAction(nameof(Complaints));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteComplaint(int id)
        {
            var complaint = await _context.Complaints.FindAsync(id);
            if (complaint == null) return NotFound();
            _context.Complaints.Remove(complaint);
            await _context.SaveChangesAsync();
            TempData["Success"] = "Şikayet silindi.";
            return RedirectToAction(nameof(Complaints));
        }

        // ──────────────────────────────────────────────────────
        // TOPLU E-POSTA GÖNDERİMİ
        // ──────────────────────────────────────────────────────
        public async Task<IActionResult> SendBulkEmail()
        {
            var courses = await _context.Courses
                .Where(c => !c.IsDeleted && c.IsActive)
                .ToListAsync();
            ViewBag.Courses = courses;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SendBulkEmail(int courseId, string messageContent,
            [FromServices] Services.IEmailService emailService)
        {
            var course = await _context.Courses.FindAsync(courseId);
            if (course == null) return NotFound();

            var emails = await _context.Applications
                .Where(a => a.CourseId == courseId
                         && a.Status == ApplicationStatus.Approved
                         && !a.IsDeleted)
                .Select(a => a.Email)
                .ToListAsync();

            await emailService.SendBulkCourseNotificationAsync(emails, course.CourseName, messageContent);

            TempData["Success"] = $"{emails.Count} kursiyere e-posta gönderildi.";
            return RedirectToAction(nameof(SendBulkEmail));
        }

        // ──────────────────────────────────────────────────────
        // QUIZ SORU YÖNETİMİ
        // ──────────────────────────────────────────────────────
        public async Task<IActionResult> ManageQuiz()
        {
            var questions = await _context.QuizQuestions
                .OrderByDescending(q => q.CreatedAt)
                .ToListAsync();
            return View(questions);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddQuizQuestion(QuizQuestion question)
        {
            if (ModelState.IsValid)
            {
                question.CreatedAt = DateTime.Now;
                _context.QuizQuestions.Add(question);
                await _context.SaveChangesAsync();
                TempData["Success"] = "Yeni soru başarıyla eklendi.";
            }
            return RedirectToAction(nameof(ManageQuiz));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteQuizQuestion(int id)
        {
            var question = await _context.QuizQuestions.FindAsync(id);
            if (question != null)
            {
                _context.QuizQuestions.Remove(question);
                await _context.SaveChangesAsync();
                TempData["Info"] = "Soru silindi.";
            }
            return RedirectToAction(nameof(ManageQuiz));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SendAdminChatMessage(string message)
        {
            if (string.IsNullOrWhiteSpace(message)) return RedirectToAction(nameof(TeacherChatLog));

            var chatMessage = new TeacherChatMessage
            {
                InstructorId = 0, // 0 indicates System/Admin
                Message = message.Trim(),
                SentAt = DateTime.Now
            };

            _context.TeacherChatMessages.Add(chatMessage);
            await _context.SaveChangesAsync();

            TempData["Success"] = "Mesaj arşive başarıyla eklendi.";
            return RedirectToAction(nameof(TeacherChatLog));
        }

        // Dashboard detaylarını getiren API
        [HttpGet]
        public async Task<IActionResult> GetDashboardDetails(string type)
        {
            switch (type.ToLower())
            {
                case "students":
                    var students = await _context.Students
                        .Where(s => !s.IsDeleted)
                        .Select(s => new { 
                            name = s.FirstName + " " + s.LastName, 
                            sub = s.Email, 
                            meta = s.Points + " HP / " + s.EloRating + " ELO",
                            color = "primary"
                        })
                        .ToListAsync();
                    return Json(students);

                case "instructors":
                    var instructors = await _context.Instructors
                        .Where(i => !i.IsDeleted)
                        .Select(i => new { 
                            name = i.FullName, 
                            sub = i.Title, 
                            meta = i.Course != null ? i.Course.CourseName : "Genel",
                            color = "success"
                        })
                        .ToListAsync();
                    return Json(instructors);

                case "courses":
                    var courses = await _context.Courses
                        .Where(c => !c.IsDeleted)
                        .Select(c => new { 
                            name = c.CourseName, 
                            sub = c.Instructor != null ? c.Instructor.FullName : "Eğitmen Atanmadı", 
                            meta = c.Quota + " Kontenjan",
                            color = "secondary"
                        })
                        .ToListAsync();
                    return Json(courses);

                case "pending":
                    var pending = await _context.Applications
                        .Where(a => a.Status == ApplicationStatus.Pending && !a.IsDeleted)
                        .Include(a => a.Course)
                        .Select(a => new { 
                            name = a.FirstName + " " + a.LastName, 
                            sub = a.Course != null ? a.Course.CourseName : "Kurs Bilgisi Yok", 
                            meta = a.ApplyDate.ToString("dd.MM.yyyy"),
                            color = "warning"
                        })
                        .ToListAsync();
                    return Json(pending);

                case "approved":
                    var approved = await _context.Applications
                        .Where(a => a.Status == ApplicationStatus.Approved && !a.IsDeleted)
                        .Include(a => a.Course)
                        .Select(a => new { 
                            name = a.FirstName + " " + a.LastName, 
                            sub = a.Course != null ? a.Course.CourseName : "Kurs Bilgisi Yok", 
                            meta = a.Email,
                            color = "success"
                        })
                        .ToListAsync();
                    return Json(approved);

                default:
                    return BadRequest("Geçersiz tür.");
            }
        }

        private bool AdminUserExists(int id)
        {
            return _context.AdminUsers.Any(e => e.Id == id);
        }
    }
}
