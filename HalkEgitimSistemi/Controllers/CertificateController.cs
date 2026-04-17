using HalkEgitimSistemi.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

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

        // Doğrulama İşlemi
        [HttpPost]
        public async Task<IActionResult> Verify(string certificateCode)
        {
            if (string.IsNullOrWhiteSpace(certificateCode))
            {
                ViewBag.Error = "Lütfen sertifika kodunu giriniz.";
                return View();
            }

            // Kodu veritabanında ara
            var application = await _context.Applications
                .Include(a => a.Course)
                .ThenInclude(c => c!.Category)
                .FirstOrDefaultAsync(a => a.CertificateCode == certificateCode.Trim());

            if (application == null || !application.IsCompleted)
            {
                ViewBag.Error = "Bu kod ile eşleşen geçerli ve tamamlanmış bir sertifika bulunamadı.";
                return View();
            }

            // Sertifika bulunduysa sonucu View'e model olarak gönder
            return View("ViewCertificate", application);
        }
    }
}
