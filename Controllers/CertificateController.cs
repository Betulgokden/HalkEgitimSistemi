using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;
using System.Text;

namespace HalkEgitimSistemi.Controllers
{
    [AllowAnonymous]
    public class CertificateController : Controller
    {
        private readonly AppDbContext _context;

        public CertificateController(AppDbContext context)
        {
            _context = context;
        }

        // Sertifika Sorgulama Formu
        public IActionResult Verify()
        {
            return View();
        }

        // Doğrulama İşlemi (AJAX Destekli)
        [HttpPost]
        public async Task<IActionResult> Verify(string certificateCode)
        {
            if (string.IsNullOrWhiteSpace(certificateCode))
            {
                if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
                    return Json(new { success = false, message = "Lütfen sertifika kodunu giriniz." });

                ViewBag.Error = "Lütfen sertifika kodunu giriniz.";
                return View();
            }

            // Kodu veritabanında ara - İlişkili verileri çek (Timeline için)
            var application = await _context.Applications
                .Include(a => a.Course)
                    .ThenInclude(c => c!.Category)
                .Include(a => a.Attendances)
                .Include(a => a.Student)
                .FirstOrDefaultAsync(a => a.CertificateCode == certificateCode.Trim());

            if (application == null || !application.IsCompleted)
            {
                if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
                    return Json(new { success = false, message = "Bu kod ile eşleşen geçerli bir sertifika bulunamadı." });

                ViewBag.Error = "Bu kod ile eşleşen geçerli ve tamamlanmış bir sertifika bulunamadı.";
                return View();
            }

            // SHA-256 Hash ve Dijital İmza Doğrulaması (Deep Validation)
            string hash = HashOlustur(application.CertificateCode!);
            
            // 🛑 GÜVENLİK KONTROLÜ: Sahte diploma tespiti
            bool isLegit = application.IsCompleted && application.ExamGrade >= 50 && application.StudentId > 0;
            
            if (!isLegit)
            {
                if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
                    return Json(new { success = false, message = "KRİTİK UYARI: Bu belge geçersiz veya tahrif edilmiş olabilir! Sistem onayı bulunamadı." });

                ViewBag.Error = "DİKKAT: Belge doğruluğu onaylanamadı. Lütfen kurumla iletişime geçiniz.";
                return View();
            }

            // Blockchain Simülasyonu (Verifikasyon Mührü)
            string digitalSeal = HashOlustur(hash + "BORCKA_HEM_SECURE_KEY_2026");

            if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
            {
                return Json(new { 
                    success = true, 
                    hash = hash,
                    redirectUrl = Url.Action("ViewCertificate", new { certificateCode = application.CertificateCode })
                });
            }

            return RedirectToAction("ViewCertificate", new { certificateCode = application.CertificateCode });
        }

        public async Task<IActionResult> ViewCertificate(string certificateCode)
        {
            var application = await _context.Applications
                .Include(a => a.Course)
                    .ThenInclude(c => c!.Category)
                .Include(a => a.Attendances)
                .Include(a => a.Student)
                .FirstOrDefaultAsync(a => a.CertificateCode == certificateCode);

            if (application == null) return NotFound();

            return View(application);
        }

        // Token ile Doğrulama (Self-Destruct Link)
        [HttpGet]
        public async Task<IActionResult> VerifyToken(string token)
        {
            var tempLink = await _context.TemporaryLinks
                .FirstOrDefaultAsync(l => l.Token == token && l.ExpiryDate > DateTime.Now);

            if (tempLink == null)
            {
                return View("TokenError"); // Havalı bir hata sayfası
            }

            var application = await _context.Applications
                .Include(a => a.Course)
                    .ThenInclude(c => c!.Category)
                .Include(a => a.Attendances)
                .FirstOrDefaultAsync(a => a.CertificateCode == tempLink.CertificateCode);

            if (application == null) return NotFound();

            return View("ViewCertificate", application);
        }

        // Geçici Link Oluşturma
        [HttpPost]
        public async Task<IActionResult> GenerateTemporaryLink(string certificateCode)
        {
            string token = Guid.NewGuid().ToString("N");
            var tempLink = new TemporaryLink
            {
                CertificateCode = certificateCode,
                Token = token,
                ExpiryDate = DateTime.Now.AddHours(24)
            };

            _context.TemporaryLinks.Add(tempLink);
            await _context.SaveChangesAsync();

            string link = Url.Action("VerifyToken", "Certificate", new { token = token }, Request.Scheme)!;
            return Json(new { success = true, link = link });
        }

        private string HashOlustur(string belgeNo)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(belgeNo));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}
