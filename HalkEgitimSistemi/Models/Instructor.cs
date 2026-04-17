using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class Instructor
    {
        public int Id { get; set; }

        [Display(Name = "Ad Soyad")]
        public string FullName { get; set; } = string.Empty;

        [Display(Name = "Ünvan / Pozisyon")]
        public string Title { get; set; } = string.Empty;

        [Display(Name = "Profil Fotoğrafı (URL)")]
        public string? ImageUrl { get; set; }

        // --- GİRİŞ BİLGİLERİ ---
        [Display(Name = "Kullanıcı Adı")]
        public string? Username { get; set; }

        [Display(Name = "Şifre")]
        public string? Password { get; set; }

        // Hangi kursun hocası? (İlişki)
        [Display(Name = "Uzmanlık Alanı (Kurs)")]
        public int? CourseId { get; set; }
        public Course? Course { get; set; }
    }
}