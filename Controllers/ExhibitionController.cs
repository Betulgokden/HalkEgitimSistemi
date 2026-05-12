using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HalkEgitimSistemi.Controllers
{
    public class ExhibitionController : Controller
    {
        private readonly AppDbContext _context;

        public ExhibitionController(AppDbContext context)
        {
            _context = context;
        }

        // 📊 DEMO SATIŞ TAKİPÇİSİ (Sunum boyunca verileri tutar)
        private static readonly Dictionary<int, (string Name, string Phone, DateTime Date)> _salesTracker = new();

        // Kullanıcı Tarafı: Masonry Galeri
        public async Task<IActionResult> Index()
        {
            var items = await _context.ExhibitionItems
                .Include(e => e.Course)
                .OrderByDescending(e => e.CreatedAt)
                .ToListAsync();

            // Mock data filling...
            var mockItems = new List<ExhibitionItem>
            {
                new ExhibitionItem { Id = 1001, Title = "İğne Oyası", ArtistName = "Zeynep Y.", Price = 550, ImageUrl = "https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=800", Material = "İpek", Color = "Krem", Dimensions = "50cm", Story = "Anadolu mirası." },
                new ExhibitionItem { Id = 1002, Title = "Deri Çanta", ArtistName = "Murat C.", Price = 1450, ImageUrl = "https://images.unsplash.com/photo-1590874103328-eac38a683ce7?w=800", Material = "Deri", Color = "Taba", Dimensions = "30cm", Story = "El dikişi." },
                new ExhibitionItem { Id = 1003, Title = "Ahşap Oyma", ArtistName = "Mehmet Ö.", Price = 2100, ImageUrl = "https://images.unsplash.com/photo-1582555172866-f73bb12a2ab3?w=800", Material = "Ceviz", Color = "Kahve", Dimensions = "60cm", Story = "Rölyef çalışması." },
                new ExhibitionItem { Id = 1004, Title = "Taş Boyama", ArtistName = "Elif K.", Price = 320, ImageUrl = "https://images.unsplash.com/photo-1525904097878-94fb15835963?w=800", Material = "Taş", Color = "Renkli", Dimensions = "15cm", Story = "Doğal sanat." }
            };
            items.AddRange(mockItems);

            // Satış durumlarını uygula ve fiyatlandır
            var rng = new Random();
            foreach(var item in items) {
                if (item.Price == null || item.Price == 0) item.Price = rng.Next(350, 2500);

                if (_salesTracker.ContainsKey(item.Id)) {
                    var sale = _salesTracker[item.Id];
                    item.IsSold = true;
                    item.BuyerName = sale.Name;
                    item.BuyerPhone = sale.Phone;
                    item.SoldAt = sale.Date;
                }
            }

            return View(items);
        }

        // 🛒 SATIN ALMA İŞLEMİ (AJAX)
        [HttpPost]
        public IActionResult ProcessPurchase(int id, string name, string phone)
        {
            if (!_salesTracker.ContainsKey(id))
            {
                _salesTracker[id] = (name, phone, DateTime.Now);
                return Json(new { success = true, message = "Sipariş başarıyla kaydedildi!" });
            }
            return Json(new { success = false, message = "Bu ürün zaten satılmış." });
        }

        // 👑 YÖNETİCİ & ÖĞRETMEN: SATIŞ TAKİP PANELİ
        [Authorize(Roles = "Admin,Instructor")]
        public IActionResult SalesDashboard()
        {
            // Tüm eserleri getir ve satış durumlarını işle
            var allItems = new List<ExhibitionItem>
            {
                new ExhibitionItem { Id = 1001, Title = "İğne Oyası", ArtistName = "Zeynep Y.", Price = 550 },
                new ExhibitionItem { Id = 1002, Title = "Deri Çanta", ArtistName = "Murat C.", Price = 1450 },
                new ExhibitionItem { Id = 1003, Title = "Ahşap Oyma", ArtistName = "Mehmet Ö.", Price = 2100 },
                new ExhibitionItem { Id = 1004, Title = "Taş Boyama", ArtistName = "Elif K.", Price = 320 }
            };

            var salesReport = allItems.Where(i => _salesTracker.ContainsKey(i.Id)).Select(i => {
                var sale = _salesTracker[i.Id];
                i.IsSold = true;
                i.BuyerName = sale.Name;
                i.BuyerPhone = sale.Phone;
                i.SoldAt = sale.Date;
                return i;
            }).ToList();

            return View(salesReport);
        }

        // 3D Sanal Sergi
        public async Task<IActionResult> Virtual()
        {
            var items = await _context.ExhibitionItems
                .AsNoTracking()
                .Include(e => e.Course)
                .OrderByDescending(e => e.CreatedAt)
                .ToListAsync();

            // Zenginleştirilmiş Mock Veri (16 benzersiz eser - Tüm duvarları doldurmak için)
            var additionalMocks = new List<ExhibitionItem>
            {
                new ExhibitionItem { Id = 3001, Title = "Dantel İşlemeli Masa Örtüsü", ArtistName = "Fatma K.", ImageUrl = "https://images.unsplash.com/photo-1621274798528-c29093bd33dc?w=800", Price = 850, Material = "Koton", Color = "Beyaz", Dimensions = "160x220", Story = "1 aylık el emeği." },
                new ExhibitionItem { Id = 3002, Title = "El Yapımı İpek Elbise", ArtistName = "Zeynep Y.", ImageUrl = "https://images.unsplash.com/photo-1539109132314-3477524c8830?w=800", Price = 2400, Material = "İpek", Color = "Mürdüm", Dimensions = "38 Beden", Story = "Bursa ipeği." },
                new ExhibitionItem { Id = 3003, Title = "El Dokuması Uşak Halısı", ArtistName = "Emine A.", ImageUrl = "https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?w=800", Price = 4500, Material = "Yün", Color = "Kök Boya", Dimensions = "2x3 m", Story = "Geleneksel motifler." },
                new ExhibitionItem { Id = 1004, Title = "Modern Taş Boyama", ArtistName = "Elif K.", ImageUrl = "https://images.unsplash.com/photo-1525904097878-94fb15835963?w=600", Price = 320, Material = "Taş", Color = "Renkli", Dimensions = "15cm", Story = "Doğal sanat." },
                new ExhibitionItem { Id = 1005, Title = "Geleneksel Ebru Tablosu", ArtistName = "Caner K.", ImageUrl = "https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=600", Price = 850, Material = "Kağıt", Color = "Mavi-Yeşil", Dimensions = "50x70", Story = "Su üzerine nakış." },
                new ExhibitionItem { Id = 1006, Title = "Seramik Vazo", ArtistName = "Selin A.", ImageUrl = "https://images.unsplash.com/photo-1565193566173-7a0ee3dbe261?w=600", Price = 1200, Material = "Seramik", Color = "Turkuaz", Dimensions = "40cm", Story = "El formlu." },
                new ExhibitionItem { Id = 1007, Title = "Hat Sanatı", ArtistName = "Hasan K.", ImageUrl = "https://images.unsplash.com/photo-1563214157-9dbf9df35e61?w=600", Price = 3500, Material = "Kuşe Kağıt", Color = "Siyah-Altın", Dimensions = "100x70", Story = "Kaligrafi." },
                new ExhibitionItem { Id = 1008, Title = "Minyatür Sanatı", ArtistName = "Ayşe Y.", ImageUrl = "https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=600", Price = 1800, Material = "Parşömen", Color = "Çok Renkli", Dimensions = "20x30", Story = "Osmanlı minyatürü." },
                new ExhibitionItem { Id = 1009, Title = "Makrome Duvar Süsü", ArtistName = "Derya B.", ImageUrl = "https://images.unsplash.com/photo-1533038590840-1cde6e668a91?w=600", Price = 450, Material = "Pamuk İp", Color = "Ekru", Dimensions = "80x120", Story = "Bohem tarz." },
                new ExhibitionItem { Id = 1010, Title = "Cam Altı Boyama", ArtistName = "Ahmet L.", ImageUrl = "https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?w=600", Price = 1300, Material = "Cam", Color = "Zümrüt", Dimensions = "40x40", Story = "Geleneksel motifler." },
                new ExhibitionItem { Id = 1011, Title = "Telkari Gümüş Kolye", ArtistName = "Mert S.", ImageUrl = "https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=600", Price = 950, Material = "Gümüş", Color = "Parlak", Dimensions = "5cm", Story = "Mezopotamya sanatı." },
                new ExhibitionItem { Id = 1012, Title = "Keçe İğneleme Figür", ArtistName = "Berna T.", ImageUrl = "https://images.unsplash.com/photo-1584905066891-002916976767?w=600", Price = 280, Material = "Yün", Color = "Pastel", Dimensions = "20cm", Story = "Yumuşak dokunuş." },
                new ExhibitionItem { Id = 1013, Title = "Tezhip Çalışması", ArtistName = "Fatma R.", ImageUrl = "https://images.unsplash.com/photo-1578301978693-85fa9c0320b9?w=600", Price = 4200, Material = "Altın Varak", Color = "Lacivert-Altın", Dimensions = "30x40", Story = "Kitap süsleme." },
                new ExhibitionItem { Id = 1014, Title = "Ahşap Kakma Kutusu", ArtistName = "Ömer G.", ImageUrl = "https://images.unsplash.com/photo-1610701596007-11502861dcfa?w=600", Price = 1100, Material = "Sedef", Color = "Gümüşi", Dimensions = "25x15", Story = "Geometrik desenler." },
                new ExhibitionItem { Id = 1015, Title = "Karakalem Portre", ArtistName = "Ebru H.", ImageUrl = "https://images.unsplash.com/photo-1544465544-1b71aee9dfa3?w=600", Price = 750, Material = "Karakalem", Color = "Siyah-Beyaz", Dimensions = "50x70", Story = "Gerçekçi çizim." },
                new ExhibitionItem { Id = 1016, Title = "Mozaik Lamba", ArtistName = "Kemal P.", ImageUrl = "https://images.unsplash.com/photo-1565814329452-e1efa11c5b89?w=600", Price = 650, Material = "Cam Mozaik", Color = "Gökkuşağı", Dimensions = "30x50", Story = "Otantik aydınlatma." }
            };
            items.AddRange(additionalMocks);

            // Tüm eserleri fiyatlandır (Hepsini ücretlendir talebi için)
            var rng2 = new Random();
            foreach (var item in items)
            {
                if (item.Price == null || item.Price == 0)
                {
                    item.Price = rng2.Next(450, 5000);
                }
            }

            // 🏛️ 3D YERLEŞTİRME MANTIĞI (Tüm duvarları doldur)
            for (int i = 0; i < items.Count; i++)
            {
                var item = items[i];
                item.PositionY = 1.8f;

                // 4 ana yöne dağıt (Kuzey, Güney, Doğu, Batı)
                int wallIndex = i % 4;
                int posInWall = i / 4;
                float offset = (posInWall * 4.0f) - 6.0f; // Eserler arası mesafe

                switch (wallIndex)
                {
                    case 0: // ÖN DUVAR (Kuzey)
                        item.PositionX = offset;
                        item.PositionZ = -6.5f;
                        item.RotationY = 0;
                        break;
                    case 1: // ARKA DUVAR (Güney)
                        item.PositionX = offset;
                        item.PositionZ = 6.5f;
                        item.RotationY = 180;
                        break;
                    case 2: // SAĞ DUVAR (Doğu)
                        item.PositionX = 6.5f;
                        item.PositionZ = offset;
                        item.RotationY = -90;
                        break;
                    case 3: // SOL DUVAR (Batı)
                        item.PositionX = -6.5f;
                        item.PositionZ = offset;
                        item.RotationY = 90;
                        break;
                }
            }

            return View(items);
        }

        // Admin Tarafı: Eser Yükleme
        [Authorize(Roles = "Admin")]
        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [Authorize(Roles = "Admin,Instructor")]
        [HttpPost]
        public async Task<IActionResult> Create(ExhibitionItem item, IFormFile? mediaFile, decimal? Price)
        {
            item.Price = Price;
            
            if (mediaFile != null)
            {
                var extension = Path.GetExtension(mediaFile.FileName).ToLower();
                var fileName = Guid.NewGuid().ToString() + extension;
                var subFolder = (extension == ".mp4" || extension == ".mov") ? "videos" : "images";
                var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/exhibition", subFolder, fileName);
                
                Directory.CreateDirectory(Path.GetDirectoryName(path)!);
                using (var stream = new FileStream(path, FileMode.Create))
                {
                    await mediaFile.CopyToAsync(stream);
                }

                if (subFolder == "videos")
                {
                    item.VideoUrl = "/uploads/exhibition/videos/" + fileName;
                    item.Type = ExhibitionType.Video;
                    // Video için bir placeholder görsel (isteğe bağlı)
                    item.ImageUrl = "https://images.unsplash.com/photo-1492724441997-5dc865305da7?w=800"; 
                }
                else
                {
                    item.ImageUrl = "/uploads/exhibition/images/" + fileName;
                    item.Type = ExhibitionType.Painting;
                }
                
                _context.ExhibitionItems.Add(item);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            
            ViewBag.Error = "Lütfen bir dosya seçiniz.";
            return View(item);
        }
    }
}
