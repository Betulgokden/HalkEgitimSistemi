using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using System.Text.RegularExpressions;

namespace HalkEgitimSistemi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class HalkBotController : ControllerBase
    {
        private readonly AppDbContext _context;

        public HalkBotController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet("map/config")]
        public async Task<IActionResult> GetMapConfig()
        {
            var neighborhoods = await _context.Neighborhoods.AsNoTracking().ToListAsync();
            
            var config = new
            {
                Center = new { Lat = 41.2583, Lng = 41.6781 },
                Zoom = 14,
                Neighborhoods = neighborhoods.Select(n => new {
                    n.Name,
                    n.Latitude,
                    n.Longitude,
                    n.ActiveStudents,
                    n.Intensity
                })
            };

            return Ok(config);
        }

        [HttpPost("chat")]
        public async Task<IActionResult> Chat([FromBody] BotRequest request)
        {
            if (string.IsNullOrWhiteSpace(request.Message))
                return BadRequest(new { response = "Lütfen bir mesaj yazın." });

            string safeMessage = System.Net.WebUtility.HtmlEncode(request.Message);
            string message = safeMessage.ToLower();
            string responseText = "";
            
            // 1. Ücret/Fiyat Sorgusu
            if (message.Contains("ücret") || message.Contains("fiyat") || message.Contains("kaç para") || message.Contains("maliyet") || message.Contains("para"))
            {
                var courses = await _context.Courses.Where(c => !c.IsDeleted).AsNoTracking().ToListAsync();
                Course? matchedCourse = null;

                foreach (var course in courses)
                {
                    string courseNameLower = course.CourseName.ToLower();
                    if (message.Contains(courseNameLower) || courseNameLower.Split(' ').Any(word => word.Length > 3 && message.Contains(word)))
                    {
                        matchedCourse = course;
                        break;
                    }
                }

                if (matchedCourse != null)
                {
                    responseText = $"<b>{matchedCourse.CourseName}</b> kursumuzun güncel ücreti <b>{matchedCourse.Price:C2}</b>'dir. Kurs süresi {matchedCourse.DurationHours} saattir. Kayıt işlemleri için öğrenci panelini kullanabilirsiniz.";
                    return Ok(new { response = responseText });
                }
                responseText = "Kurs ücretlerimizi öğrenmek istiyorsunuz. Borçka HEM'de kurslarımız genellikle 500₺ ile 2500₺ arasında değişmektedir. Detaylı liste için 'Kurslar' sayfamızı ziyaret edebilirsiniz.";
            }
            // 2. Kurs Listesi/Branş Sorgusu
            else if (message.Contains("kurs") || message.Contains("branş") || message.Contains("neler var") || message.Contains("eğitim") || message.Contains("ders"))
            {
                var count = await _context.Courses.CountAsync(c => !c.IsDeleted);
                var categories = await _context.Categories.Where(c => !c.IsDeleted).Take(5).Select(c => c.CategoryName).AsNoTracking().ToListAsync();
                responseText = $"Şu anda sistemimizde aktif <b>{count}</b> farklı eğitim bulunmaktadır! <br><br>Popüler kategorilerimiz: <u>{string.Join(", ", categories)}</u>. <br><br>Sizin ilgi alanınız nedir? Size uygun bir branş mutlaka vardır.";
            }
            // 🚀 BORÇKA DİJİTAL EKOSİSTEM (HALKBOT MASTERY)
            else if (message.Contains("harita") || message.Contains("ısı haritası") || message.Contains("mahalle") || message.Contains("lider"))
            {
                var totalStudents = await _context.Students.CountAsync(u => !u.IsDeleted);
                responseText = $"🗺️ <b>Borçka Canlı Isı Haritası:</b> <br>Şu an sistemimizde kayıtlı <b>{totalStudents}</b> kursiyerimiz Borçka genelinde eğitim görüyor.<br><br>" +
                               "• <b>En Aktif Bölge:</b> Gündoğdu ve Merkez mahalleleri şu an siber etkileşimde lider durumda!<br>" +
                               "• <b>Isı Verisi:</b> Haritadaki neon parlamalar, o bölgedeki kursiyer yoğunluğunu ve başarı oranlarını temsil eder.";
                return Ok(new { response = responseText });
            }
            else if (message.Contains("karagöl") || message.Contains("fidan") || message.Contains("sosyal sorumluluk") || message.Contains("ağaç") || message.Contains("proje"))
            {
                responseText = "🌲 <b>Borçka'ya Değer Projesi:</b> <br>Doğayı ve dijitalleşmeyi birleştiriyoruz! <br><br>" +
                               "Hedefimiz Borçka genelinde <b>500 yeni mezun</b> verdiğimizde, Borçka Belediyesi ve Kaymakamlığı desteğiyle <u>Karagöl çevresine 500 fidan</u> dikmektir. <br><br>" +
                               "Siz de bir kursa katılarak bu yeşil harekete destek olabilirsiniz!";
                return Ok(new { response = responseText });
            }
            else if (message.Contains("not") || message.Contains("yükle") || message.Contains("yıldız") || message.Contains("kütüphane") || message.Contains("paylaş"))
            {
                responseText = "📖 <b>Dijital Not Kütüphanesi:</b> <br>Öğrencilerimiz kendi aldıkları notları paylaşarak 'Yıldız' topluyorlar.<br><br>" +
                               "• <b>Ödül:</b> Her ayın sonunda en çok yıldız alan 3 öğrencimize <u>1 adet dilediği kurs %100 indirimli</u> (ücretsiz) olarak tanımlanır. Yardımlaşarak kazanın!";
                return Ok(new { response = responseText });
            }
            // 3. İletişim & Konum
            else if (message.Contains("nerede") || message.Contains("adres") || message.Contains("telefon") || message.Contains("iletişim") || message.Contains("borçka") || message.Contains("konum"))
            {
                responseText = "🏛️ <b>Borçka Halk Eğitimi Merkezi:</b> <br>" +
                               "<b>Adres:</b> Merkez Mah. Hükümet Cad. No:45 (Hükümet Konağı Yanı), Borçka/ARTVİN<br>" +
                               "<b>Telefon:</b> 0466 312 40 40 <br>" +
                               "<b>Çalışma Saatleri:</b> Hafta içi her gün 08:30 - 21:00 arası açığız.";
                return Ok(new { response = responseText });
            }
            // 4. Yönetim & Liderlik
            else if (message.Contains("kaymakam") || message.Contains("belediye başkanı") || message.Contains("yönetici") || message.Contains("betül") || message.Contains("ercan"))
            {
                responseText = "🏛️ <b>Kurumsal Liderlik:</b> <br>" +
                               "Kurumumuz, Borçka Kaymakamı Sayın <b>Betül Büyükkılıç</b> ve Borçka Belediye Başkanı Sayın <b>Ercan Orhan</b>'ın vizyoner destekleriyle Borçka'yı dijital geleceğe taşımaktadır.<br><br>" +
                               "Resmi logolarımızı ve güncel duyurularımızı sayfa sonundaki kurumsal alanda görebilirsiniz.";
                return Ok(new { response = responseText });
            }
            // 5. Kayıt & Giriş İşlemleri
            else if (message.Contains("kayıt") || message.Contains("üye") || message.Contains("başvuru") || message.Contains("nasıl katılırım"))
            {
                responseText = "📝 <b>Nasıl Kayıt Olunur?</b> <br><br>" +
                               "1. Sağ üstteki 'Giriş' butonundan 'Kursiyer' seçeneğini tıklayın.<br>" +
                               "2. Henüz hesabınız yoksa 'Kayıt Ol' formunu doldurun.<br>" +
                               "3. Ardından dilediğiniz kursun detay sayfasından 'Hemen Başvur' butonuna basın.<br><br>" +
                               "Onay işlemleri genellikle 24 saat içinde tamamlanır.";
                return Ok(new { response = responseText });
            }
            // 6. Sertifika & E-Devlet
            else if (message.Contains("sertifika") || message.Contains("belge") || message.Contains("e-devlet") || message.Contains("onay"))
            {
                responseText = "🎓 <b>Sertifika Süreci:</b> <br>Kurslarımızı başarıyla tamamlayan tüm kursiyerlerimiz <b>MEB Onaylı</b> sertifika almaya hak kazanır.<br><br>" +
                               "• <b>E-Devlet:</b> Sertifikalarınız otomatik olarak E-Devlet sistemine işlenir ve 'Yaygın Eğitim Sertifika Belgesi Sorgulama' ekranından görüntülenebilir.";
                return Ok(new { response = responseText });
            }
            // 7. Haberler & Galeri
            else if (message.Contains("haber") || message.Contains("etkinlik") || message.Contains("fotoğraf") || message.Contains("galeri") || message.Contains("resim"))
            {
                responseText = "📸 <b>Medya Merkezi:</b> <br>Borçka'daki en yeni eğitim etkinliklerini ve kursiyerlerimizin çalışmalarını 'Medya' menüsü altındaki 'Galeri' ve 'Haberler' sayfalarımızda görebilirsiniz.<br><br>" +
                               "Görsel bir şölen için mutlaka göz atın!";
                return Ok(new { response = responseText });
            }
            // 8. Selamlaşma & Kimlik
            else if (message.Contains("merhaba") || message.Contains("selam") || message.Contains("hey") || message.Contains("naber") || message.Contains("nasılsın") || message.Contains("kimsin"))
            {
                responseText = "Merhaba! Ben Borçka Dijital Kampüs asistanınız <b>HalkBot Pro</b>. 🤖<br><br>" +
                               "Size kurs kayıtları, sertifikalar, Borçka ısı haritası veya fidan dikme projemiz hakkında her türlü bilgiyi verebilirim. Borçka'nın dijital dönüşümünde size nasıl rehberlik edebilirim?";
            }
            // Varsayılan Yanıt
            else
            {
                responseText = "Borçka Halk Eğitim Merkezi ile ilgili her bilgiye hakimim! Size şu konularda yardımcı olabilirim: <br><br>" +
                               "• <b>Kurslar:</b> Ücretler ve branş listesi.<br>" +
                               "• <b>Sertifika:</b> E-Devlet entegrasyonu.<br>" +
                               "• <b>Kayıt:</b> Üyelik ve başvuru adımları.<br>" +
                               "• <b>Vizyon:</b> Karagöl fidan projesi ve Isı Haritası.<br><br>" +
                               "Hangi konuda detaylı bilgi istersiniz?";
            }

            return Ok(new { response = responseText });
        }
    }

    public class BotRequest
    {
        public string Message { get; set; } = string.Empty;
    }
}
