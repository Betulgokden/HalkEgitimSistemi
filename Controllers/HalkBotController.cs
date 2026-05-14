using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using System.Security.Claims;
using System.Text.Json;

namespace HalkEgitimSistemi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class HalkBotController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IMemoryCache _cache;

        public HalkBotController(AppDbContext context, IMemoryCache cache)
        {
            _context = context;
            _cache = cache;
        }

        /// <summary>
        /// HalkBot Mastery: Her şeye hakim, JSON dönen ve sesli yanıt destekleyen akıllı asistan.
        /// </summary>
        [HttpPost("chat")]
        public async Task<IActionResult> Chat([FromBody] BotRequest request)
        {
            if (string.IsNullOrWhiteSpace(request.Message))
                return BadRequest(new { error = "Mesaj boş olamaz." });

            // Kullanıcı Rolü ve Kimliği (Yetkilendirme Kontrolü İçin)
            var userEmail = User.FindFirstValue(ClaimTypes.Email) ?? "Guest";
            var userRole = User.FindFirstValue(ClaimTypes.Role) ?? "Guest";
            var userName = User.FindFirstValue(ClaimTypes.Name) ?? "Ziyaretçi";

            string message = request.Message.ToLower();
            
            // Bot Yanıt Yapısı (Frontend Tarafında Kolay İşleme İçin)
            var botResponse = new BotJsonResponse
            {
                Status = "Success",
                Timestamp = DateTime.Now,
                UserRole = userRole,
                VoiceEnabled = true
            };

            // SQL Bağlamı (Context) - Botun Hangi Tabloya Bakacağını Bilmesi İçin
            // Not: Gerçek bir LLM entegrasyonunda bu meta veri prompt içine gömülür.
            var sqlContext = new
            {
                Tables = new[] { "Courses", "Instructors", "Students", "HalkPointActivities", "Applications", "Certificates", "Neighborhoods" },
                Database = "HalkEgitimSistemiDB"
            };

            try
            {
                // 1. Yetkilendirme Duyarlı Sorgular (Örn: "Puanlarım kaç?")
                if (message.Contains("puan") || message.Contains("halkpoint") || message.Contains("bakiyem"))
                {
                    if (userRole == "Guest")
                    {
                        botResponse.Text = "Puanlarınızı görebilmek için giriş yapmalısınız.";
                        botResponse.Action = "RedirectToLogin";
                    }
                    else
                    {
                        var student = await _context.Students.FirstOrDefaultAsync(s => s.Email == userEmail);
                        if (student != null)
                        {
                            var totalPoints = await _context.HalkPointActivities
                                .Where(a => a.UserId == student.Id)
                                .SumAsync(a => a.PointAmount);

                            botResponse.Text = $"Merhaba {userName}, şu an toplam <b>{totalPoints} HalkPoint</b> bakiyeniz bulunmaktadır. Bu puanlarla ücretsiz kurs alabilir veya Karagöl projesine bağış yapabilirsiniz.";
                            botResponse.Data = new { Points = totalPoints, HistoryUrl = "/Student/HalkPoint" };
                            botResponse.VoiceText = $"{userName}, {totalPoints} Halk point bakiyeniz var.";
                        }
                    }
                }
                // 2. Gizlilik Kontrolü (Başka öğrencinin verisi?)
                else if (message.Contains("notu") || message.Contains("sınav sonucu"))
                {
                    botResponse.Text = "Gizlilik politikası gereği sadece kendi sınav sonuçlarınızı görebilirsiniz. Lütfen Kursiyer Paneli -> Notlarım sekmesini ziyaret edin.";
                    botResponse.Action = "OpenStudentPanel";
                }
                // 3. Admin Özel Sorgular (Örn: "Kaç başvuru var?")
                else if (message.Contains("başvuru") && userRole == "Admin")
                {
                    var pendingApps = await _context.Applications.CountAsync(a => a.Status == ApplicationStatus.Pending);
                    botResponse.Text = $"Yönetici Paneli Bilgisi: Şu an onay bekleyen <b>{pendingApps}</b> yeni kurs başvurusu bulunmaktadır.";
                    botResponse.Data = new { PendingCount = pendingApps };
                    botResponse.Action = "OpenAdminApplications";
                }
                // 4. Genel Bilgi (Kurslar, Eğitmenler vb.)
                else if (message.Contains("kurs") || message.Contains("eğitim"))
                {
                    string cacheKey = "BotTopCourses";
                    if (!_cache.TryGetValue(cacheKey, out object? topCoursesObj))
                    {
                        var topCoursesList = await _context.Courses
                            .Where(c => c.IsActive && !c.IsDeleted)
                            .OrderByDescending(c => c.Id)
                            .Take(3)
                            .Select(c => new { c.CourseName, c.Price })
                            .ToListAsync();
                        _cache.Set(cacheKey, topCoursesList, TimeSpan.FromMinutes(20));
                        topCoursesObj = topCoursesList;
                    }

                    botResponse.Text = "Sistemimizdeki en popüler eğitimler şunlardır: <br>" + string.Join("<br>", ((IEnumerable<dynamic>)topCoursesObj!).Select(c => $"• {c.CourseName}"));
                    botResponse.Data = topCoursesObj;
                    botResponse.VoiceText = "Şu an en popüler kurslarımız listeleniyor.";
                }
                // Varsayılan Yanıt (Her şeye hakim vizyon)
                else
                {
                    botResponse.Text = "HalkBot Pro olarak tüm sisteme hakimim. Kurslar, eğitmenler, ısı haritası, puanlarınız ve kariyer fırsatları hakkında bana soru sorabilirsiniz.";
                    botResponse.VoiceText = "Nasıl yardımcı olabilirim?";
                }
            }
            catch (Exception ex)
            {
                botResponse.Status = "Error";
                botResponse.Text = "İşlem sırasında bir hata oluştu.";
                botResponse.Data = new { Error = ex.Message };
            }

            return Ok(botResponse);
        }
    }

    public class BotRequest
    {
        public string Message { get; set; } = string.Empty;
    }

    public class BotJsonResponse
    {
        public string Status { get; set; } = "Success";
        public DateTime Timestamp { get; set; }
        public string Text { get; set; } = string.Empty;
        public string VoiceText { get; set; } = string.Empty; // Sesli yanıt için
        public object? Data { get; set; } // C# tarafında işlenecek veri
        public string Action { get; set; } = "None"; // UI'da tetiklenecek eylem
        public string UserRole { get; set; } = "Guest";
        public bool VoiceEnabled { get; set; } = true;
    }
}
