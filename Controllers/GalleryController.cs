using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;
using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Http;
using System.IO;
using System;
using System.Linq;
using MetadataExtractor;
using MetadataExtractor.Formats.Exif;
using Microsoft.AspNetCore.SignalR;
using HalkEgitimSistemi.Hubs;

namespace HalkEgitimSistemi.Controllers
{
    public class GalleryController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IHubContext<GalleryHub> _hubContext;

        public GalleryController(AppDbContext context, IHubContext<GalleryHub> hubContext)
        {
            _context = context;
            _hubContext = hubContext;
        }

        [AllowAnonymous]
        public async Task<IActionResult> Index()
        {
            var itemsCount = await _context.GalleryItems.CountAsync(i => !i.IsDeleted);
            
            if (itemsCount == 0)
            {
                var seedGallery = new List<GalleryItem>
                {
                    new GalleryItem { Title = "Geleneksel İğne Oyası Yazma", Description = "El işçiliği ile yapılmış zarif iğne oyası yazma.", ImageUrl = "https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=800", Tags = "İğne Oyası", CreatedAt = DateTime.Now },
                    new GalleryItem { Title = "El Yapımı Deri Omuz Çantası", Description = "Hakiki deriden dayanıklı çanta.", ImageUrl = "https://images.unsplash.com/photo-1590874103328-eac38a683ce7?w=800", Tags = "Deri İşlemeciliği", CreatedAt = DateTime.Now.AddDays(-1) },
                    new GalleryItem { Title = "Boyama Taş Dekor Seti", Description = "Doğal taşlar üzerine akrilik boyama.", ImageUrl = "https://images.unsplash.com/photo-1525904097878-94fb15835963?w=800", Tags = "Taş Boyama", CreatedAt = DateTime.Now.AddDays(-2) },
                    new GalleryItem { Title = "Modern Seramik Vazo", Description = "Özel sırlı dekoratif vazo.", ImageUrl = "https://images.unsplash.com/photo-1578749556568-bc2c40e68b61?w=800", Tags = "Seramik", CreatedAt = DateTime.Now.AddDays(-3) },
                    new GalleryItem { Title = "El Örgüsü Bebek Seti", Description = "Organik iplerle örülmüş hırka ve patik.", ImageUrl = "https://images.unsplash.com/photo-1515488764276-beab7607c1e6?w=800", Tags = "Örgü", CreatedAt = DateTime.Now.AddDays(-4) },
                    new GalleryItem { Title = "Ahşap Yakma Portre", Description = "Pirografi tekniği ile ahşap üzerine işleme.", ImageUrl = "https://images.unsplash.com/photo-1533134486753-c833f074868f?w=800", Tags = "Ahşap Yakma", CreatedAt = DateTime.Now.AddDays(-5) }
                };
                _context.GalleryItems.AddRange(seedGallery);
                await _context.SaveChangesAsync();
            }

            var items = await _context.GalleryItems
                .Include(i => i.Likes)
                .Include(i => i.Comments)
                .Where(i => !i.IsDeleted)
                .OrderByDescending(i => i.CreatedAt)
                .ToListAsync();

            var rng = new Random();
            var cats = new[] { "İğne Oyası", "Deri İşlemeciliği", "Taş Boyama", "Seramik", "Ahşap Sanatları", "Örgü" };
            foreach(var item in items) {
                item.Price = rng.Next(250, 1500);
                if (string.IsNullOrEmpty(item.Category)) item.Category = item.Tags ?? cats[rng.Next(cats.Length)];
            }

            ViewBag.PhotoOfTheDay = items.FirstOrDefault();
            return View(items);
        }

        [AllowAnonymous]
        public async Task<IActionResult> GetItemDetails(int id)
        {
            var item = await _context.GalleryItems
                .Include(i => i.Likes)
                .Include(i => i.Comments)
                .FirstOrDefaultAsync(i => i.Id == id && !i.IsDeleted);

            if (item == null) return NotFound();

            return Json(new {
                likeCount = item.Likes.Count,
                comments = item.Comments.OrderByDescending(c => c.CreatedAt).Select(c => new {
                    c.UserEmail,
                    c.Content,
                    c.X,
                    c.Y,
                    Date = c.CreatedAt.ToString("dd.MM.yyyy HH:mm")
                })
            });
        }

        [AllowAnonymous]
        public async Task<IActionResult> GetItems(int skip = 0, int take = 12, string search = "")
        {
            var query = _context.GalleryItems
                .Include(i => i.Likes)
                .Include(i => i.Comments)
                .Where(i => !i.IsDeleted);

            if (!string.IsNullOrEmpty(search))
            {
                query = query.Where(i => i.Title.Contains(search) || i.Tags.Contains(search));
            }

            var items = await query
                .OrderByDescending(i => i.CreatedAt)
                .Skip(skip)
                .Take(take)
                .Select(i => new {
                    i.Id,
                    i.Title,
                    i.ImageUrl,
                    i.Description,
                    LikeCount = i.Likes.Count,
                    CommentCount = i.Comments.Count,
                    i.Tags
                })
                .ToListAsync();

            return Json(items);
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddComment(int itemId, string content, decimal? x, decimal? y)
        {
            if (string.IsNullOrWhiteSpace(content)) return Json(new { success = false, message = "Mesaj boş olamaz." });
            
            var email = User.Identity?.Name ?? "ziyaretci@halkegitim.gov.tr";
            
            // Küfür Filtresi (Basit Örnek)
            string[] badWords = { "küfür1", "argo2", "kötükelime" };
            bool needsApproval = badWords.Any(w => content.ToLower().Contains(w));

            var comment = new GalleryComment
            {
                GalleryItemId = itemId,
                Content = System.Net.WebUtility.HtmlEncode(content), // 🛑 SECURITY: XSS Protection
                UserEmail = email,
                X = x,
                Y = y,
                IsInstructorResponse = User.IsInRole("Instructor"),
                IsApproved = !needsApproval
            };

            _context.GalleryComments.Add(comment);
            await _context.SaveChangesAsync();

            if (!needsApproval)
            {
                // SignalR ile anlık bildirim
                await _hubContext.Clients.All.SendAsync("ReceiveComment", itemId, email, comment.Content, x, y);
            }

            return Json(new { success = true, needsApproval, commentId = comment.Id });
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ToggleLike(int itemId)
        {
            var email = User.Identity?.Name ?? "anonim_" + Guid.NewGuid().ToString().Substring(0, 8);
            var existing = await _context.GalleryLikes.FirstOrDefaultAsync(l => l.GalleryItemId == itemId && l.UserEmail == email);

            if (existing != null)
            {
                _context.GalleryLikes.Remove(existing);
            }
            else
            {
                _context.GalleryLikes.Add(new GalleryLike { GalleryItemId = itemId, UserEmail = email });
                
                // SignalR "Beğeni Şelalesi" HUB Tetikleme
                await _hubContext.Clients.All.SendAsync("ReceiveLike", itemId);
            }

            await _context.SaveChangesAsync();
            var count = await _context.GalleryLikes.CountAsync(l => l.GalleryItemId == itemId);
            return Json(new { success = true, likeCount = count });
        }

        [HttpPost]
        [Authorize(Roles = "Admin,Instructor")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(string Title, string Description, IFormFile imageFile)
        {
            if (imageFile != null && imageFile.Length > 0)
            {
                // 🛑 SECURITY: File Extension Validation
                var allowedExtensions = new[] { ".jpg", ".jpeg", ".png", ".gif", ".webp" };
                var extension = Path.GetExtension(imageFile.FileName).ToLower();
                if (!allowedExtensions.Contains(extension))
                {
                    TempData["Error"] = "Sadece resim dosyaları yüklenebilir.";
                    return RedirectToAction(nameof(Index));
                }

                var uploadsFolder = Path.Combine(System.IO.Directory.GetCurrentDirectory(), "wwwroot", "img", "gallery");
                if (!System.IO.Directory.Exists(uploadsFolder)) System.IO.Directory.CreateDirectory(uploadsFolder);

                var uniqueFileName = Guid.NewGuid().ToString() + extension;
                var filePath = Path.Combine(uploadsFolder, uniqueFileName);

                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await imageFile.CopyToAsync(fileStream);
                }

                // 1. EXIF Meta Veri Okuma (Sanitized)
                string exifJson = "{}";
                try {
                    var directories = ImageMetadataReader.ReadMetadata(filePath);
                    var subIfdDirectory = directories.OfType<ExifSubIfdDirectory>().FirstOrDefault();
                    if (subIfdDirectory != null) {
                        var camera = directories.OfType<ExifIfd0Directory>().FirstOrDefault()?.GetString(ExifIfd0Directory.TagMake);
                        var model = directories.OfType<ExifIfd0Directory>().FirstOrDefault()?.GetString(ExifIfd0Directory.TagModel);
                        var fstop = subIfdDirectory.GetDescription(ExifSubIfdDirectory.TagFNumber);
                        var iso = subIfdDirectory.GetDescription(0x8827);
                        // Encode outputs for security
                        exifJson = $"{{\"Kamera\":\"{System.Net.WebUtility.HtmlEncode(camera ?? "")} {System.Net.WebUtility.HtmlEncode(model ?? "")}\", \"Diyafram\":\"{System.Net.WebUtility.HtmlEncode(fstop ?? "")}\", \"ISO\":\"{System.Net.WebUtility.HtmlEncode(iso ?? "")}\"}}";
                    }
                } catch { }

                int? courseId = null;
                if (User.IsInRole("Instructor"))
                {
                    var courseIdClaim = User.FindFirst("CourseId")?.Value;
                    if (int.TryParse(courseIdClaim, out int cid)) courseId = cid;
                }

                var item = new GalleryItem
                {
                    Title = System.Net.WebUtility.HtmlEncode(Title ?? ""),
                    Description = System.Net.WebUtility.HtmlEncode(Description ?? ""),
                    ImageUrl = "/img/gallery/" + uniqueFileName,
                    CourseId = courseId,
                    ExifInfo = exifJson,
                    CreatedAt = DateTime.Now
                };

                _context.GalleryItems.Add(item);
                await _context.SaveChangesAsync();
                TempData["Success"] = "Görsel başarıyla eklendi.";
            }

            return RedirectToAction(nameof(Index));
        }

        private bool CanManageItem(GalleryItem item)
        {
            if (User.IsInRole("Admin")) return true;
            var cid = User.FindFirst("CourseId")?.Value;
            return item.CourseId.ToString() == cid;
        }

        [Authorize(Roles = "Admin,Instructor")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();
            var item = await _context.GalleryItems.FirstOrDefaultAsync(i => i.Id == id && !i.IsDeleted);
            if (item == null) return NotFound();
            if (!CanManageItem(item)) return Forbid();
            return View(item);
        }

        [HttpPost]
        [Authorize(Roles = "Admin,Instructor")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, string Title, string Description, IFormFile? imageFile)
        {
            var item = await _context.GalleryItems.FirstOrDefaultAsync(i => i.Id == id && !i.IsDeleted);
            if (item == null) return NotFound();
            if (!CanManageItem(item)) return Forbid();

            item.Title = Title ?? "";
            item.Description = Description ?? "";

            if (imageFile != null && imageFile.Length > 0)
            {
                var uniqueFileName = Guid.NewGuid().ToString() + "_" + imageFile.FileName;
                var filePath = Path.Combine(System.IO.Directory.GetCurrentDirectory(), "wwwroot", "img", "gallery", uniqueFileName);
                using (var stream = new FileStream(filePath, FileMode.Create)) await imageFile.CopyToAsync(stream);
                item.ImageUrl = "/img/gallery/" + uniqueFileName;
            }

            _context.Update(item);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        [HttpPost, ActionName("Delete")]
        [Authorize(Roles = "Admin,Instructor")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var item = await _context.GalleryItems.FindAsync(id);
            if (item != null && CanManageItem(item))
            {
                item.IsDeleted = true;
                item.DeletedAt = DateTime.Now;
                _context.Update(item);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> IncrementView(int id)
        {
            var item = await _context.GalleryItems.FindAsync(id);
            if (item != null)
            {
                item.ViewCount++;
                await _context.SaveChangesAsync();
            }
            return Ok();
        }
    }
}
