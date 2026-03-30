using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace HalkEgitimSistemi.Controllers
{
    // BÜTÜN SAYFAYI ADMİNE KİLİTLİYORUZ
    [Authorize]
    public class NewsController : Controller
    {
        private readonly AppDbContext _context;

        public NewsController(AppDbContext context)
        {
            _context = context;
        }

        // 🟢 ZİYARETÇİLERE AÇIK: Haber Listesini Herkes Görebilir
        [AllowAnonymous]
        public async Task<IActionResult> Index()
        {
            return View(await _context.News.ToListAsync());
        }

        // 🟢 ZİYARETÇİLERE AÇIK: Haber Detayını Herkes Okuyabilir
        [AllowAnonymous]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();
            var news = await _context.News.FirstOrDefaultAsync(m => m.Id == id);
            if (news == null) return NotFound();
            return View(news);
        }

        // 🔴 SADECE ADMİN: Yeni Haber Ekleme Ekranı
        public IActionResult Create()
        {
            return View();
        }

        // 🔴 SADECE ADMİN: Yeni Haberi Veritabanına Kaydetme
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(News news)
        {
            if (ModelState.IsValid)
            {
                _context.Add(news);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(news);
        }

        // 🔴 SADECE ADMİN: Haber Düzenleme Ekranı
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();
            var news = await _context.News.FindAsync(id);
            if (news == null) return NotFound();
            return View(news);
        }

        // 🔴 SADECE ADMİN: Düzenlenen Haberi Veritabanında Güncelleme
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, News news)
        {
            if (id != news.Id) return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(news);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!NewsExists(news.Id)) return NotFound();
                    else throw;
                }
                return RedirectToAction(nameof(Index));
            }
            return View(news);
        }

        // 🔴 SADECE ADMİN: Haber Silme Onay Ekranı
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();
            var news = await _context.News.FirstOrDefaultAsync(m => m.Id == id);
            if (news == null) return NotFound();
            return View(news);
        }

        // 🔴 SADECE ADMİN: Haberi Veritabanından Tamamen Silme
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var news = await _context.News.FindAsync(id);
            if (news != null) _context.News.Remove(news);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool NewsExists(int id)
        {
            return _context.News.Any(e => e.Id == id);
        }
    }
}