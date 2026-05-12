using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HalkEgitimSistemi.Controllers
{
    public class LibraryController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;

        // Simple Rate Limiting Store: IP -> LastUploadTime
        private static readonly System.Collections.Concurrent.ConcurrentDictionary<string, DateTime> _lastUploads = new();

        public LibraryController(AppDbContext context, IWebHostEnvironment webHostEnvironment)
        {
            _context = context;
            _webHostEnvironment = webHostEnvironment;
        }

        // GET: Library/Create
        [Authorize(Roles = "Admin,Instructor")]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [Authorize(Roles = "Admin,Instructor,Student")] // Allow students too for "Bilgi Kilidi"
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(LibraryBook book, IFormFile? pdfFile, IFormFile? coverImage)
        {
            // 🛑 SECURITY: Rate Limiting (1 upload per 60 seconds)
            string ip = HttpContext.Connection.RemoteIpAddress?.ToString() ?? "unknown";
            if (_lastUploads.TryGetValue(ip, out var lastTime) && (DateTime.Now - lastTime).TotalSeconds < 60)
            {
                ModelState.AddModelError("", "Çok hızlı not yüklüyorsunuz! Lütfen 1 dakika bekleyin.");
                return View(book);
            }

            // 🛑 SECURITY: Allowed File Extensions & MIME Types
            var allowedExtensions = new[] { ".pdf", ".jpg", ".jpeg", ".png" };
            var allowedMimeTypes = new[] { "application/pdf", "image/jpeg", "image/png" };

            if (pdfFile != null)
            {
                var ext = Path.GetExtension(pdfFile.FileName).ToLower();
                if (!allowedExtensions.Contains(ext) || !allowedMimeTypes.Contains(pdfFile.ContentType))
                {
                    ModelState.AddModelError("", "Sadece .pdf ve resim dosyalarına izin verilir! Zararlı dosya tipleri (.exe, .bat, .js vb.) kesinlikle yasaktır.");
                    return View(book);
                }

                string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "uploads", "books", "pdfs");
                if (!Directory.Exists(uploadsFolder)) Directory.CreateDirectory(uploadsFolder);
                string uniqueFileName = Guid.NewGuid().ToString() + "_" + pdfFile.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await pdfFile.CopyToAsync(fileStream);
                }
                book.PdfUrl = "/uploads/books/pdfs/" + uniqueFileName;
            }

            if (coverImage != null)
            {
                string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "uploads", "books", "covers");
                if (!Directory.Exists(uploadsFolder)) Directory.CreateDirectory(uploadsFolder);
                string uniqueFileName = Guid.NewGuid().ToString() + "_" + coverImage.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await coverImage.CopyToAsync(fileStream);
                }
                book.CoverImageUrl = "/uploads/books/covers/" + uniqueFileName;
            }
            else if (string.IsNullOrEmpty(book.CoverImageUrl))
            {
                book.CoverImageUrl = "https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&q=80&w=400";
            }

            _context.LibraryBooks.Add(book);
            await _context.SaveChangesAsync();

            // Update rate limit time
            _lastUploads[ip] = DateTime.Now;

            return RedirectToAction(nameof(Virtual));
        }

        // GET: Library/Manage
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Manage()
        {
            var books = await _context.LibraryBooks.ToListAsync();
            return View("~/Views/Admin/ManageLibrary.cshtml", books);
        }

        // POST: Library/UpdateBookPdf
        [HttpPost]
        [Authorize(Roles = "Admin,Instructor")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UpdateBookPdf(int id, IFormFile pdfFile)
        {
            var book = await _context.LibraryBooks.FindAsync(id);
            if (book == null) return NotFound();

            if (pdfFile != null)
            {
                string uploadsFolder = Path.Combine(_webHostEnvironment.WebRootPath, "uploads", "books", "pdfs");
                if (!Directory.Exists(uploadsFolder)) Directory.CreateDirectory(uploadsFolder);
                string uniqueFileName = Guid.NewGuid().ToString() + "_" + pdfFile.FileName;
                string filePath = Path.Combine(uploadsFolder, uniqueFileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await pdfFile.CopyToAsync(fileStream);
                }
                book.PdfUrl = "/uploads/books/pdfs/" + uniqueFileName;
                _context.Update(book);
                await _context.SaveChangesAsync();
                TempData["Success"] = "Kitap PDF'i başarıyla güncellendi.";
            }

            return RedirectToAction(nameof(Manage));
        }

        // GET: Library
        public IActionResult Index() => RedirectToAction(nameof(Virtual));

        // GET: Library/Virtual
        public async Task<IActionResult> Virtual(string category = "Hepsi", int page = 1)
        {
            var dbNotes = await _context.LibraryBooks
                .Where(b => b.IsCourseNote)
                .Include(b => b.Student)
                .ToListAsync();

            // 📚 PROFESYONEL MOCK DATA (Veritabanı boşsa sunum için zenginleştir)
            if (dbNotes.Count < 10)
            {
                var mockNotes = new List<LibraryBook>();
                var students = new[] { "Ahmet Yılmaz", "Elif Demir", "Caner Kaya", "Selin Aras", "Mert Soydan", "Berna Tunç", "Hakan Yıldız", "Derya Bal", "Kemal Paşa" };
                var categories = new[] { "Yazılım", "Sanat", "Dil Eğitimi", "El Sanatları", "Müzik", "Spor ve Sağlık", "Aşçılık", "Güzellik" };
                var rng = new Random();

                int idCounter = 5000;
                foreach (var cat in categories)
                {
                    for (int i = 1; i <= 3; i++)
                    {
                        mockNotes.Add(new LibraryBook
                        {
                            Id = idCounter++,
                            Title = $"{cat} Dersi - Not {i}",
                            Author = students[rng.Next(students.Length)],
                            Category = cat,
                            IsCourseNote = true,
                            StarCount = rng.Next(5, 150),
                            PdfUrl = "/uploads/books/pdfs/sample_note.pdf",
                            CoverImageUrl = $"https://picsum.photos/seed/{idCounter}/400/600",
                            Description = $"{cat} dersi kapsamında tutulmuş detaylı çalışma notları."
                        });
                    }
                }
                dbNotes.AddRange(mockNotes);
            }

            var query = dbNotes.AsQueryable();

            if (!string.IsNullOrEmpty(category) && category != "Hepsi")
            {
                query = query.Where(b => b.Category == category);
            }

            var notes = query.OrderByDescending(b => b.StarCount).ToList();
            
            ViewBag.CurrentCategory = category;
            ViewBag.CurrentPage = page;
            
            return View(notes);
        }

        // 🟢 YENİ: TAM EKRAN OKUMA SAYFASI
        public async Task<IActionResult> Reader(int id)
        {
            var book = await _context.LibraryBooks.FirstOrDefaultAsync(b => b.Id == id);
            // AI Kitapları için ID 999 durumunu handle et
            if (id == 999) 
            {
                book = new LibraryBook { Id = 999, Title = "Yapay Zeka Arşivi", Author = "Global AI", CoverImageUrl = "https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=800" };
            }
            
            if (book == null) return RedirectToAction(nameof(Virtual));
            return View(book);
        }

        [HttpGet]
        public async Task<IActionResult> GetBookPages(int id)
        {
            try 
            {
                // 1. YAPAY ZEKA SİMÜLASYONU (ID: 999)
                if (id == 999)
                {
                    var aiPages = new List<object>();
                    for (int i = 1; i <= 10; i++) {
                        aiPages.Add(new { PageNumber = i, TextContent = $"[AI ARŞİVİ] Bu kitap yapay zeka tarafından internet arşivlerinden derlenmiştir. Bölüm {i}..." });
                    }
                    return Json(aiPages);
                }

                var book = await _context.LibraryBooks.Include(b => b.Pages).FirstOrDefaultAsync(b => b.Id == id);
                if (book == null) return Json(new List<object> { new { PageNumber = 1, TextContent = "Kitap bulunamadı veya silinmiş olabilir." } });

                // 2. PDF VARSA
                if (!string.IsNullOrEmpty(book.PdfUrl)) return Json(new { pdfUrl = book.PdfUrl });

                // 3. DERGİ ÖZEL İÇERİĞİ
                if (book.Title.Contains("DERGİ"))
                {
                    return Json(new List<object> {
                        new { PageNumber = 1, ImageUrl = "https://images.unsplash.com/photo-1582555172866-f73bb12a2ab3?w=800", TextContent = "Halk Eğitim Dergisi - Hoş Geldiniz!" },
                        new { PageNumber = 2, TextContent = "Kurslarımızdan en özel kareler ve başarı hikayeleri bu dergide." }
                    });
                }

                // 4. VERİTABANI SAYFALARI VARSA
                if (book.Pages != null && book.Pages.Any())
                {
                    return Json(book.Pages.OrderBy(p => p.PageNumber).Select(p => new { p.PageNumber, p.ImageUrl, p.TextContent }).ToList());
                }

                // 5. HİÇBİR ŞEY YOKSA (FALLBACK) - Sunumu kurtaran kısım
                var fallbackPages = new List<object>();
                for (int i = 1; i <= 5; i++) {
                    fallbackPages.Add(new { PageNumber = i, TextContent = $"{book.Title} - Bölüm {i}: Bu içerik eğitim amaçlı hazırlanan sanal kütüphane dokümanıdır." });
                }
                return Json(fallbackPages);
            }
            catch { return Json(new List<object> { new { PageNumber = 1, TextContent = "Bir hata oluştu ama okuma moduna devam edebilirsiniz." } }); }
        }

        [HttpPost]
        public async Task<IActionResult> StarNote(int id)
        {
            var note = await _context.LibraryBooks.FindAsync(id);
            if (note == null || !note.IsCourseNote) return Json(new { success = false, message = "Not bulunamadı." });

            note.StarCount++;
            await _context.SaveChangesAsync();
            return Json(new { success = true, stars = note.StarCount });
        }
    }
}
