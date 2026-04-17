using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace HalkEgitimSistemi.Controllers
{
    public class GalleryItemViewModel 
    {
        public string Url { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
    }

    [AllowAnonymous]
    public class GalleryController : Controller
    {
        public IActionResult Index()
        {
            // Galeriyi canlandırmak için başlık ve açıklamalar içeren genişletilmiş veri listesi
            var items = new List<GalleryItemViewModel>
            {
                new GalleryItemViewModel { Url = "https://images.unsplash.com/photo-1427504494785-3a9ca7044f45?w=800", Title = "Bilgisayar Okuryazarlığı", Description = "Temel bilişim eğitimlerimizden kareler." },
                new GalleryItemViewModel { Url = "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=800", Title = "Etkili İletişim", Description = "Grup çalışmaları ile sosyalleşme." },
                new GalleryItemViewModel { Url = "https://images.unsplash.com/photo-1542831371-29b0f74f9713?w=800", Title = "Yazılım Geliştirme", Description = "İleri seviye kodlama atölyelerimiz." },
                new GalleryItemViewModel { Url = "https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=800", Title = "Resim ve Sanat", Description = "Sanat atölyelerinde yaratıcılık." },
                new GalleryItemViewModel { Url = "https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=800", Title = "Aşçılık ve Mutfak", Description = "Gurme lezzetlerin hazırlandığı mutfaklarımız." },
                new GalleryItemViewModel { Url = "https://images.unsplash.com/photo-1524178232363-1fb2b075b655?w=800", Title = "Sunum Eğitimi", Description = "Topluluk önünde konuşma etkinliği." },
                new GalleryItemViewModel { Url = "https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=800", Title = "Gitar Eğitimleri", Description = "Müziğin ritmini yakalayan öğrencilerimiz." },
                new GalleryItemViewModel { Url = "https://images.unsplash.com/photo-1507838153414-b4b713384a76?w=800", Title = "Keman Sınıfı", Description = "Klasik müzik yeteneklerini geliştirirken." },
                new GalleryItemViewModel { Url = "https://images.unsplash.com/photo-1518611012118-696072aa579a?w=800", Title = "Spor ve Yoga", Description = "Zihin ve beden bütünlüğü için aktiviteler." },
                new GalleryItemViewModel { Url = "https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=800", Title = "Girişimcilik", Description = "Proje fikirlerinin tartışıldığı toplantılar." },
                new GalleryItemViewModel { Url = "https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=800", Title = "Robotik Kodlama", Description = "Yeni nesil mucitler iş başında." },
                new GalleryItemViewModel { Url = "https://images.unsplash.com/photo-1606787619248-f301830a5a57?w=800", Title = "Gastronomi Uzmanlığı", Description = "Dünya mutfaklarından harika tarifler." }
            };

            return View(items);
        }
    }
}
