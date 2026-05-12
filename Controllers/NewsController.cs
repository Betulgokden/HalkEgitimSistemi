using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Processing;
using SixLabors.ImageSharp.Drawing.Processing;
using SixLabors.Fonts;
using System.Net.Http;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System.IO;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize(Roles = "Admin,Instructor")]
    public class NewsController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;
        private readonly IHttpClientFactory _httpClientFactory;

        public NewsController(AppDbContext context, IWebHostEnvironment env, IHttpClientFactory httpClientFactory)
        {
            _context = context;
            _env = env;
            _httpClientFactory = httpClientFactory;
        }

        // GET: News
        [AllowAnonymous]
        public async Task<IActionResult> Index()
        {
            // 24 saatlik hikayeleri çek (Süresi dolmayanlar)
            ViewBag.Stories = await _context.NewsStories
                .Where(s => s.CreatedAt.AddHours(24) >= DateTime.Now)
                .OrderByDescending(s => s.CreatedAt)
                .ToListAsync();

            var news = await _context.News
                .Include(n => n.Comments)
                .Include(n => n.Likes)
                .Where(n => !n.IsDeleted)
                .OrderByDescending(n => n.PublishDate)
                .ToListAsync();

            return View(news);
        }

        // GET: News/Details/5
        [AllowAnonymous]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();

            var news = await _context.News
                .Include(n => n.Comments)
                .Include(n => n.Likes)
                .FirstOrDefaultAsync(m => m.Id == id && !m.IsDeleted);
            
            if (news == null) return NotFound();

            news.ViewCount++;
            await _context.SaveChangesAsync();

            return View(news);
        }

        // POST: News/ToggleLike (AJAX)
        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> ToggleLike(int newsId, string email)
        {
            if (string.IsNullOrEmpty(email)) return BadRequest();

            var existingLike = await _context.NewsLikes
                .FirstOrDefaultAsync(l => l.NewsId == newsId && l.UserEmail == email);

            if (existingLike != null)
            {
                _context.NewsLikes.Remove(existingLike);
                await _context.SaveChangesAsync();
                return Json(new { success = true, liked = false });
            }
            else
            {
                _context.NewsLikes.Add(new NewsLike { NewsId = newsId, UserEmail = email });
                await _context.SaveChangesAsync();
                return Json(new { success = true, liked = true });
            }
        }

        // POST: News/AddComment (AJAX)
        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> AddComment(int newsId, string email, string content)
        {
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(content)) return BadRequest();

            var comment = new NewsComment
            {
                NewsId = newsId,
                UserEmail = email,
                Content = content,
                CreatedAt = DateTime.Now
            };

            _context.NewsComments.Add(comment);
            await _context.SaveChangesAsync();

            return Json(new { success = true, user = email, date = comment.CreatedAt.ToString("dd.MM.yyyy HH:mm"), content = content });
        }

        // GET: News/Create
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(News news, IFormFile? imageFile, bool generateImage = false)
        {
            if (ModelState.IsValid)
            {
                // Görsel yönetimi
                if (imageFile != null && imageFile.Length > 0)
                {
                    news.ImageUrl = await SaveImage(imageFile);
                }
                else if (generateImage)
                {
                    news.ImageUrl = await GenerateAutoThumbnail(news.Title);
                }

                if (User.IsInRole("Instructor"))
                {
                    var courseIdClaim = User.FindFirst("CourseId")?.Value;
                    if (int.TryParse(courseIdClaim, out int cid)) news.CourseId = cid;
                }

                _context.Add(news);
                await _context.SaveChangesAsync();

                // Telegram Bildirimi (API Tüketimi Şovu)
                await SendTelegramNotification(news);

                return RedirectToAction(nameof(Index));
            }
            return View(news);
        }

        private async Task<string> SaveImage(IFormFile file)
        {
            var uploadsFolder = Path.Combine(_env.WebRootPath, "images/news");
            if (!Directory.Exists(uploadsFolder)) Directory.CreateDirectory(uploadsFolder);
            var fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
            var filePath = Path.Combine(uploadsFolder, fileName);
            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }
            return "/images/news/" + fileName;
        }

        private async Task<string> GenerateAutoThumbnail(string title)
        {
            var fileName = "auto_" + Guid.NewGuid().ToString() + ".jpg";
            var filePath = Path.Combine(_env.WebRootPath, "images/news", fileName);
            
            // ImageSharp ile görsel oluşturma
            using (var image = new Image<SixLabors.ImageSharp.PixelFormats.Rgba32>(800, 450))
            {
                image.Mutate(x => {
                    x.Fill(SixLabors.ImageSharp.Color.ParseHex("#1e1e2f")); // Koyu tema arka plan
                    
                    try {
                        var font = SystemFonts.CreateFont("Arial", 40, FontStyle.Bold);
                        x.DrawText(title, font, SixLabors.ImageSharp.Color.White, new PointF(50, 200));
                        x.DrawText("Halk Eğitim Merkezi - " + DateTime.Now.ToShortDateString(), 
                                   SystemFonts.CreateFont("Arial", 20), SixLabors.ImageSharp.Color.Gray, new PointF(50, 400));
                    } catch {
                        // Font hatası durumunda sadece renk dolgusu kalsın
                    }
                });
                
                await image.SaveAsJpegAsync(filePath);
            }
            return "/images/news/" + fileName;
        }

        private async Task SendTelegramNotification(News news)
        {
            try
            {
                var botToken = "YOUR_BOT_TOKEN"; // Demo
                var chatId = "@HalkEgitimHaberleri"; // Demo
                var message = $"📣 *YENİ HABER:* {news.Title}\n\n{news.Content.Substring(0, Math.Min(100, news.Content.Length))}...\n\n🔗 [Devamını Oku](https://halkegitim.gov.tr/News/Details/{news.Id})";
                
                var client = _httpClientFactory.CreateClient();
                var url = $"https://api.telegram.org/bot{botToken}/sendMessage?chat_id={chatId}&text={Uri.EscapeDataString(message)}&parse_mode=Markdown";
                await client.GetAsync(url);
            }
            catch { /* Telegram servisi hatası siteyi bozmasın */ }
        }

        // GET: News/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();
            var news = await _context.News.FindAsync(id);
            if (news == null) return NotFound();
            if (!CanManageNews(news)) return Forbid();
            return View(news);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, News news, IFormFile? imageFile)
        {
            if (id != news.Id) return NotFound();

            if (ModelState.IsValid)
            {
                var existing = await _context.News.AsNoTracking().FirstOrDefaultAsync(n => n.Id == id);
                if (existing == null) return NotFound();
                if (!CanManageNews(existing)) return Forbid();

                news.CourseId = existing.CourseId;
                if (imageFile != null) news.ImageUrl = await SaveImage(imageFile);
                else news.ImageUrl = existing.ImageUrl;

                _context.Update(news);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(news);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var news = await _context.News.FindAsync(id);
            if (news != null)
            {
                if (!CanManageNews(news)) return Forbid();
                news.IsDeleted = true;
                news.DeletedAt = DateTime.Now;
                news.DeletedBy = User.Identity?.Name ?? "Admin";
                _context.Update(news);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }

        private bool CanManageNews(News news)
        {
            if (User.IsInRole("Admin")) return true;
            var cid = User.FindFirst("CourseId")?.Value;
            return news.CourseId.ToString() == cid;
        }

        private bool NewsExists(int id) => _context.News.Any(e => e.Id == id);
    }
}
