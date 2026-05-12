using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;
using System.Text;

namespace HalkEgitimSistemi.Controllers
{
    public class CertificatesController : Controller
    {
        private readonly AppDbContext _context;

        public CertificatesController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Inquiry()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Inquiry(string searchTerm)
        {
            if (string.IsNullOrWhiteSpace(searchTerm))
            {
                if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
                    return Json(new { success = false, message = "Lütfen T.C. Kimlik No veya Sertifika No giriniz." });

                ViewBag.Error = "Lütfen T.C. Kimlik No veya Sertifika No giriniz.";
                return View();
            }

            // Önce Applications tablosunda ara
            var application = await _context.Applications
                .Include(a => a.Course)
                    .ThenInclude(c => c!.Category)
                .Include(a => a.Attendances)
                .FirstOrDefaultAsync(a => (a.TcNo == searchTerm.Trim() || a.CertificateCode == searchTerm.Trim()) && a.IsCompleted);

            if (application != null)
            {
                string hash = HashOlustur(application.CertificateCode!);
                if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
                {
                    // Sertifika kartı için gerekli verileri döndür
                    return Json(new { 
                        success = true, 
                        hash = hash, 
                        type = "application",
                        data = new {
                            fullName = $"{application.FirstName} {application.LastName}",
                            tcNo = application.TcNo,
                            courseName = application.Course?.CourseName,
                            duration = application.Course?.DurationHours,
                            certCode = application.CertificateCode,
                            applyDate = application.ApplyDate.ToString("dd MMMM yyyy"),
                            issueYear = application.ApplyDate.Year,
                            issueMonth = application.ApplyDate.Month,
                            examGrade = application.ExamGrade,
                            attendanceCount = application.Attendances?.Count ?? 0,
                            presentCount = application.Attendances?.Count(a => a.IsPresent) ?? 0,
                            qrUrl = Url.Action("Inquiry", "Certificates", new { searchTerm = application.CertificateCode }, Request.Scheme),
                            linkedinUrl = $"https://www.linkedin.com/profile/add?startTask=CERTIFICATION_NAME&name={Uri.EscapeDataString(application.Course?.CourseName ?? "")}&organizationName=Halk%20E%C4%9Fitim%20Merkezi&issueYear={application.ApplyDate.Year}&issueMonth={application.ApplyDate.Month}&certUrl={Uri.EscapeDataString(Url.Action("Inquiry", "Certificates", new { searchTerm = application.CertificateCode }, Request.Scheme) ?? "")}"
                        }
                    });
                }
                return View(application);
            }

            // Bulunamazsa Certificates tablosunda ara
            var certificate = await _context.Certificates
                .FirstOrDefaultAsync(c => c.TcNo == searchTerm.Trim() || c.CertificateNo == searchTerm.Trim());

            if (certificate != null)
            {
                string hash = HashOlustur(certificate.CertificateNo);
                if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
                {
                    return Json(new { 
                        success = true, 
                        hash = hash, 
                        type = "certificate",
                        data = new {
                            fullName = certificate.FullName,
                            tcNo = certificate.TcNo,
                            courseName = certificate.CourseName,
                            certCode = certificate.CertificateNo,
                            issueDate = certificate.IssueDate.ToString("dd MMMM yyyy"),
                            issueYear = certificate.IssueDate.Year,
                            issueMonth = certificate.IssueDate.Month,
                            qrUrl = Url.Action("Inquiry", "Certificates", new { searchTerm = certificate.CertificateNo }, Request.Scheme),
                            linkedinUrl = $"https://www.linkedin.com/profile/add?startTask=CERTIFICATION_NAME&name={Uri.EscapeDataString(certificate.CourseName)}&organizationName=Halk%20E%C4%9Fitim%20Merkezi&issueYear={certificate.IssueDate.Year}&issueMonth={certificate.IssueDate.Month}&certUrl={Uri.EscapeDataString(Url.Action("Inquiry", "Certificates", new { searchTerm = certificate.CertificateNo }, Request.Scheme) ?? "")}"
                        }
                    });
                }
                return View(certificate);
            }

            if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
                return Json(new { success = false, message = "Böyle bir belge bulunamadı." });

            ViewBag.Error = "Böyle bir belge bulunamadı.";
            return View();
        }

        public async Task<IActionResult> Details(int id, string type)
        {
            if (type == "application")
            {
                var app = await _context.Applications
                    .Include(a => a.Course)
                        .ThenInclude(c => c!.Category)
                    .Include(a => a.Attendances)
                    .FirstOrDefaultAsync(a => a.Id == id);
                return View("ViewApplication", app);
            }
            else
            {
                var cert = await _context.Certificates.FindAsync(id);
                return View("ViewCertificate", cert);
            }
        }

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

            string link = Url.Action("VerifyToken", "Certificates", new { token = token }, Request.Scheme)!;
            return Json(new { success = true, link = link });
        }

        [HttpGet]
        public async Task<IActionResult> VerifyToken(string token)
        {
            var tempLink = await _context.TemporaryLinks
                .FirstOrDefaultAsync(l => l.Token == token && l.ExpiryDate > DateTime.Now);

            if (tempLink == null) return View("TokenError");

            var application = await _context.Applications
                .Include(a => a.Course)
                .Include(a => a.Attendances)
                .FirstOrDefaultAsync(a => a.CertificateCode == tempLink.CertificateCode);

            if (application != null) return View("ViewApplication", application);

            var certificate = await _context.Certificates
                .FirstOrDefaultAsync(c => c.CertificateNo == tempLink.CertificateCode);

            return View("ViewCertificate", certificate);
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
