using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using Microsoft.AspNetCore.SignalR;

namespace HalkEgitimSistemi.Controllers
{
    public class ApplicationsController : Controller
    {
        private readonly AppDbContext _context;
        private readonly Services.IEmailService _emailService;
        private readonly Microsoft.AspNetCore.SignalR.IHubContext<Hubs.AdminHub> _adminHubContext;

        public ApplicationsController(AppDbContext context, Services.IEmailService emailService, Microsoft.AspNetCore.SignalR.IHubContext<Hubs.AdminHub> adminHubContext)
        {
            _context = context;
            _emailService = emailService;
            _adminHubContext = adminHubContext;
        }

        // 🔴 SADECE MÜDÜR: Gelen başvuruları listeler
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Index(string? status)
        {
            var query = _context.Applications.Include(a => a.Course).Where(a => !a.IsDeleted).AsQueryable();

            if (!string.IsNullOrEmpty(status))
            {
                if (Enum.TryParse<ApplicationStatus>(status, out var parsed))
                    query = query.Where(a => a.Status == parsed);
            }

            ViewBag.CurrentFilter = status;
            ViewBag.PendingCount = await _context.Applications.CountAsync(a => a.Status == ApplicationStatus.Pending && !a.IsDeleted);
            ViewBag.ApprovedCount = await _context.Applications.CountAsync(a => a.Status == ApplicationStatus.Approved && !a.IsDeleted);
            ViewBag.RejectedCount = await _context.Applications.CountAsync(a => a.Status == ApplicationStatus.Rejected && !a.IsDeleted);
            ViewBag.TotalCount = await _context.Applications.CountAsync(a => !a.IsDeleted);

            return View(await query.OrderByDescending(a => a.ApplyDate).ToListAsync());
        }

        // 🔴 SADECE MÜDÜR: Başvuru Onayla
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Approve(int id)
        {
            var application = await _context.Applications.Include(a => a.Course).FirstOrDefaultAsync(a => a.Id == id && !a.IsDeleted);
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
            
            // Otomatik Sohbet Giriş Mesajı
            var systemMsg = new CourseChatMessage
            {
                CourseId = application.CourseId,
                SenderName = "Sistem",
                SenderRole = "Admin",
                SenderEmail = "system@halkegitim.com",
                Message = $"🎉 {application.FirstName} {application.LastName} kursa katıldı! Hoş geldin.",
                SentAt = DateTime.Now
            };
            _context.CourseChatMessages.Add(systemMsg);
            
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
            var application = await _context.Applications.FirstOrDefaultAsync(a => a.Id == id && !a.IsDeleted);
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
            var application = await _context.Applications.Include(a => a.Course).FirstOrDefaultAsync(a => a.Id == id && !a.IsDeleted);
            if (application == null) return NotFound();
            return View(application);
        }

        [AllowAnonymous]
        public async Task<IActionResult> GetCoursePrice(int id)
        {
            var course = await _context.Courses.AsNoTracking().FirstOrDefaultAsync(c => c.Id == id);
            if (course == null) return Json(0);
            
            return Json(course.Price);
        }

        [HttpPost]
        [Authorize]
        public async Task<IActionResult> VerifyPromoCode(string code, int courseId)
        {
            if (string.IsNullOrEmpty(code)) return Json(new { success = false, message = "Kod boş olamaz." });

            var studentIdStr = User.FindFirst("StudentId")?.Value;
            if (!int.TryParse(studentIdStr, out var sid))
                return Json(new { success = false, message = "Lütfen öğrenci girişi yapın." });

            var promo = await _context.PromoCodes
                .FirstOrDefaultAsync(p => p.Code == code && p.CourseId == courseId && !p.IsUsed && p.StudentId == sid);

            if (promo == null) return Json(new { success = false, message = "Geçersiz veya kullanılmış kod." });

            return Json(new { success = true, message = "Halk Point kodunuz geçerli! Ücret sıfırlandı." });
        }

        // 🟢 ÖĞRENCİYE ÖZEL: Kayıt Formu Ekranı
        [Authorize(Roles = "Student")]
        public IActionResult Create(int? courseId)
        {
            ViewBag.CourseId = new SelectList(_context.Courses.Where(c => c.IsActive), "Id", "CourseName", courseId);
            
            if (courseId.HasValue)
            {
                var course = _context.Courses.Find(courseId);
                if (course != null)
                {
                    ViewBag.CourseName = course.CourseName;
                    ViewBag.CoursePrice = course.Price;
                    return View(new Application { CourseId = courseId.Value });
                }
            }
            
            return View(new Application());
        }

        // 🟢 ÖĞRENCİYE ÖZEL: Kaydı Veritabanına Gönder
        [HttpPost]
        [Authorize(Roles = "Student")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Application application)
        {
            if (ModelState.IsValid)
            {
                // 1. Kontenjan Kontrolü
                var course = await _context.Courses.FindAsync(application.CourseId);
                if (course == null) return NotFound();

                var approvedCount = await _context.Applications.CountAsync(a => a.CourseId == application.CourseId && a.Status == ApplicationStatus.Approved);
                
                // 2. Akıllı Saat Çakışması Algoritması (PRO ÖZELLİK)
                if (User.IsInRole("Student"))
                {
                    var studentIdStr = User.FindFirst("StudentId")?.Value;
                    if (int.TryParse(studentIdStr, out var sid))
                    {
                        var myApplications = await _context.Applications
                            .Include(a => a.Course)
                            .Where(a => a.StudentId == sid && a.Status == ApplicationStatus.Approved && !a.IsDeleted)
                            .ToListAsync();

                        foreach (var myApp in myApplications)
                        {
                            if (myApp.Course != null)
                            {
                                // Tarih aralığı ve Saat dilimi kontrolü
                                bool dateOverlap = course.StartDate < myApp.Course.EndDate && myApp.Course.StartDate < course.EndDate;
                                bool timeOverlap = course.StartTime < myApp.Course.EndTime && myApp.Course.StartTime < course.EndTime;

                                if (dateOverlap && timeOverlap)
                                {
                                    ModelState.AddModelError("", $"Dikkat! Başvurduğunuz kursun saatleri ({course.StartTime:hh\\:mm}-{course.EndTime:hh\\:mm}), zaten kayıtlı olduğunuz '{myApp.Course.CourseName}' kursu ile çakışmaktadır.");
                                    ViewBag.CourseId = new SelectList(_context.Courses.Where(c => c.IsActive), "Id", "CourseName", application.CourseId);
                                    return View(application);
                                }
                            }
                        }
                    }
                }

                application.ApplyDate = DateTime.Now;
                
                // Eğer kurs doluysa yedek listesine at
                if (course != null && approvedCount >= course.Quota)
                {
                    application.Status = ApplicationStatus.Waiting;
                    TempData["Info"] = "Bu kursun kontenjanı dolduğu için başvurunuz YEDEK LİSTESİNE kaydedilmiştir.";
                }
                else
                {
                    application.Status = ApplicationStatus.Pending;
                }

                // Eğer giriş yapmış bir öğrenciyse linkle
                if (User.IsInRole("Student"))
                {
                    var studentIdStr = User.FindFirst("StudentId")?.Value;
                    if (int.TryParse(studentIdStr, out var studentId))
                    {
                        application.StudentId = studentId;
                        
                        // Öğrencinin bilgilerini güncellemiş olalım (opsiyonel ama tutarlılık sağlar)
                        var student = await _context.Students.FindAsync(studentId);
                        if (student != null)
                        {
                            application.FirstName = student.FirstName;
                            application.LastName = student.LastName;
                            application.Email = student.Email;
                            application.PhoneNumber = student.PhoneNumber ?? application.PhoneNumber;

                             // HALK POINT & HALKBOT KOD KONTROLÜ (GELİŞMİŞ)
                            if (!string.IsNullOrEmpty(application.UsedHalkPointCode))
                            {
                                bool isHalkbot = application.UsedHalkPointCode.StartsWith("HALKBOT-", StringComparison.OrdinalIgnoreCase);
                                var promo = await _context.PromoCodes
                                    .FirstOrDefaultAsync(p => p.Code == application.UsedHalkPointCode && p.CourseId == application.CourseId && !p.IsUsed && p.StudentId == studentId);
                                
                                if (promo != null || isHalkbot)
                                {
                                    application.IsPaid = true;
                                    application.PaymentType = isHalkbot ? "Halkbot" : "Puan";
                                    application.PaymentMethod = isHalkbot ? "Halkbot İndirimi (Ücretsiz)" : "Halk Point (Ücretsiz Kurs)";
                                    application.TransactionId = (isHalkbot ? "HB-" : "HP-") + application.UsedHalkPointCode;
                                    
                                    if (promo != null)
                                    {
                                        promo.IsUsed = true;
                                        promo.UsedAt = DateTime.Now;

                                        // HP_Kodlar Tablosunu da Güncelle
                                        var hpCode = await _context.HalkPointCodes.FirstOrDefaultAsync(h => h.GeneratedCode == application.UsedHalkPointCode);
                                        if (hpCode != null) hpCode.IsUsed = true;
                                    }
                                    
                                    // SignalR: Admin Paneline Bildirim Gönder
                                    string notifyMsg = $"{student.FirstName} {student.LastName}, {(isHalkbot ? "Halkbot Kodu" : "Halk Point")} kullanarak '{course?.CourseName}' kursuna başarıyla kayıt oldu!";
                                    await _adminHubContext.Clients.Group("Admins").SendAsync("ReceiveNotification", notifyMsg);
                                    
                                    TempData["Success"] = isHalkbot ? "Harika! Halkbot kodunuzla kursunuz tamamen ücretsiz hale getirildi." : "Tebrikler! Halk Point kodunuzla kursunuz ücretsiz hale getirildi.";
                                }
                                else
                                {
                                    TempData["Warning"] = "Halk Point kodunuz geçersiz, süresi dolmuş veya zaten kullanılmış.";
                                    application.UsedHalkPointCode = null;
                                }
                            }
                        }
                    }
                }

                _context.Add(application);
                await _context.SaveChangesAsync();

                // E-posta Bildirimi Gönder
                try
                {
                    string subject = $"Kurs Başvurusu Alındı: {course?.CourseName}";
                    string body = $@"
                        <h3>Sayın {application.FirstName} {application.LastName},</h3>
                        <p>Başvuru Durumu: {(application.Status == ApplicationStatus.Waiting ? "Yedek Listesi" : "Onay Bekliyor")}</p>
                        <p>T.C. Kimlik Numaranız ile sitemiz üzerinden başvurunuzu takip edebilirsiniz.</p>
                        <p><b>Not:</b> Başvurunuz onaylandığında ödemelerinizi Ziraat Bankası üzerinden gerçekleştirebilirsiniz.</p>
                        <br>
                        <p>Saygılarımızla,<br>Halk Eğitim Merkezi Müdürlüğü</p>";
                    
                    await _emailService.SendEmailAsync(application.Email, subject, body);
                }
                catch { /* E-posta hatası başvuruyu engellemesin */ }

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
                .Where(a => a.TcNo == tcNo && !a.IsDeleted)
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

        // 🔴 SADECE MÜDÜR: Sertifika Oluştur
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GenerateCertificate(int id)
        {
            var application = await _context.Applications.Include(a => a.Course).FirstOrDefaultAsync(a => a.Id == id && !a.IsDeleted);
            if (application == null) return NotFound();

            if (application.Status != ApplicationStatus.Approved)
            {
                TempData["Error"] = "Sadece onaylanmış başvurular için sertifika oluşturulabilir.";
                return RedirectToAction(nameof(Index));
            }

            // Devamsızlık kontrolü
            var absenceCount = await _context.Attendances
                .CountAsync(at => at.ApplicationId == id && !at.IsPresent);
            var maxAbsence = application.Course?.MaxAbsenceLimit ?? 4;

            if (absenceCount >= maxAbsence)
            {
                TempData["Error"] = $"Sertifika oluşturulamadı! Öğrencinin devamsızlık sayısı ({absenceCount}), sınır ({maxAbsence}) değerine ulaşmış veya geçmiş.";
                return RedirectToAction(nameof(Index));
            }

            application.IsCompleted = true;
            // Benzersiz bir sertifika kodu oluştur (Örn: CRT-2026-XXXXX)
            if (string.IsNullOrEmpty(application.CertificateCode))
            {
                string uniqueId = Guid.NewGuid().ToString("N").Substring(0, 8).ToUpper();
                application.CertificateCode = $"CRT-{DateTime.Now.Year}-{uniqueId}";
            }

            await _context.SaveChangesAsync();
            TempData["Success"] = $"{application.FirstName} {application.LastName} için sertifika başarıyla oluşturuldu! Kod: {application.CertificateCode}";
            return RedirectToAction(nameof(Index));
        }

        // Soft Delete Action for Admin
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var application = await _context.Applications.FindAsync(id);
            if (application != null)
            {
                application.IsDeleted = true;
                application.DeletedAt = DateTime.Now;
                application.DeletedBy = User.Identity?.Name ?? "Admin";
                _context.Update(application);
                await _context.SaveChangesAsync();
                TempData["Success"] = "Başvuru çöp kutusuna taşındı.";
            }
            return RedirectToAction(nameof(Index));
        }

        [Authorize(Roles = "Student")]
        public async Task<IActionResult> Payment(int id)
        {
            var studentIdStr = User.FindFirst("StudentId")?.Value;
            if (!int.TryParse(studentIdStr, out var sid)) return Forbid();

            var application = await _context.Applications
                .Include(a => a.Course)
                .FirstOrDefaultAsync(a => a.Id == id && a.StudentId == sid && !a.IsDeleted);

            if (application == null) return NotFound();
            
            if (application.Status != ApplicationStatus.Approved)
            {
                TempData["Error"] = "Ödeme yapabilmek için başvurunuzun onaylanması gerekmektedir.";
                return RedirectToAction("MyCourses", "Student");
            }

            if (application.IsPaid)
            {
                TempData["Info"] = "Bu kursun ödemesi zaten yapılmıştır.";
                return RedirectToAction("MyCourses", "Student");
            }

            return View(application);
        }

        [HttpPost]
        [Authorize(Roles = "Student")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ProcessPayment(int id, string paymentMethod)
        {
            var studentIdStr = User.FindFirst("StudentId")?.Value;
            if (!int.TryParse(studentIdStr, out var sid)) return Forbid();

            var application = await _context.Applications
                .FirstOrDefaultAsync(a => a.Id == id && a.StudentId == sid && !a.IsDeleted);

            if (application == null) return NotFound();
            
            if (application.Status != ApplicationStatus.Approved) return BadRequest();

            application.IsPaid = true;
            application.PaymentMethod = paymentMethod ?? "Kredi Kartı";
            application.TransactionId = "PAY-" + Guid.NewGuid().ToString("N").Substring(0, 10).ToUpper();
            
            await _context.SaveChangesAsync();

            TempData["Success"] = "Ödemeniz başarıyla alındı! Kursa katılımınız kesinleşmiştir.";
            return RedirectToAction("MyCourses", "Student");
        }
    }
}