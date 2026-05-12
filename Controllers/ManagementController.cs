using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Net;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ManagementController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public ManagementController(AppDbContext context, IWebHostEnvironment webHostEnvironment)
        {
            _context = context;
            _webHostEnvironment = webHostEnvironment;
        }

        // ⚙️ GENEL AYARLAR (White-Labeling)
        [HttpGet]
        public async Task<IActionResult> Settings()
        {
            var settings = await _context.SiteSettings.ToListAsync();
            
            // Ensure basic settings exist
            if (!settings.Any(s => s.Key == "InstitutionName"))
            {
                _context.SiteSettings.AddRange(new List<SiteSettings> {
                    new SiteSettings { Key = "InstitutionName", Value = "Borçka", Group = "Branding" },
                    new SiteSettings { Key = "City", Value = "Artvin", Group = "Location" },
                    new SiteSettings { Key = "District", Value = "Borçka", Group = "Location" },
                    new SiteSettings { Key = "Slogan", Value = "Geleceği Sen İnşa Et", Group = "Branding" }
                });
                await _context.SaveChangesAsync();
                settings = await _context.SiteSettings.ToListAsync();
            }

            return View(settings);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SaveSettings(Dictionary<string, string> settings)
        {
            var user = User.Identity?.Name ?? "Admin";
            var ip = HttpContext.Connection.RemoteIpAddress?.ToString() ?? "0.0.0.0";

            foreach (var item in settings)
            {
                var setting = await _context.SiteSettings.FirstOrDefaultAsync(s => s.Key == item.Key);
                if (setting != null)
                {
                    // 🛑 SECURITY: XSS Protection
                    string safeValue = WebUtility.HtmlEncode(item.Value);
                    
                    if (setting.Value != safeValue)
                    {
                        setting.Value = safeValue;
                        setting.LastUpdated = DateTime.Now;
                        setting.UpdatedBy = user;
                    }
                }
            }

            // 📜 AUDIT LOG
            _context.SiteLogs.Add(new SiteLog {
                Action = "Site Settings Updated",
                Details = $"User changed branding/location settings from IP: {ip}",
                User = user,
                IpAddress = ip,
                Severity = "Warning"
            });

            await _context.SaveChangesAsync();
            TempData["Success"] = "Sistem ayarları başarıyla güncellendi. Değişiklikler tüm sayfalara yansıtıldı.";
            return RedirectToAction(nameof(Settings));
        }

        // 📜 DENETİM KAYITLARI (Audit Logs)
        public async Task<IActionResult> Logs()
        {
            var logs = await _context.SiteLogs.OrderByDescending(l => l.Timestamp).Take(100).ToListAsync();
            return View(logs);
        }
    }
}
