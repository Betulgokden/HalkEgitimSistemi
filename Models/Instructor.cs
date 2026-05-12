using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class Instructor
    {
        public int Id { get; set; }

        [Display(Name = "Ad Soyad")]
        public string FullName { get; set; } = string.Empty;

        public bool IsApproved { get; set; } = false; // Eğitmenler artık admin onayı bekler.

        [Display(Name = "Ünvan / Pozisyon")]
        public string Title { get; set; } = string.Empty;

        [Display(Name = "Vesikalık Fotoğraf (URL)")]
        public string? ImageUrl { get; set; }

        [Display(Name = "Ev Adresi")]
        public string? Address { get; set; }

        [Display(Name = "Doğum Yılı")]
        public int? BirthYear { get; set; }

        // --- GİRİŞ BİLGİLERİ ---
        [Display(Name = "E-posta / Kullanıcı Adı")]
        public string? Username { get; set; }
        
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string Email { get => Username ?? ""; set => Username = value; }

        [Display(Name = "Şifre")]
        public string? Password { get; set; }

        // Hangi kursun hocası? (İlişki)
        [Display(Name = "Uzmanlık Alanı (Kurs)")]
        public int? CourseId { get; set; }
        public Course? Course { get; set; }

        [Display(Name = "CV Dosyası (PDF)")]
        public string? CvFilePath { get; set; }

        public List<Message> ReceivedMessages { get; set; } = new();
        public List<InstructorSchedule> Schedules { get; set; } = new();

        // Soft Delete
        public bool IsDeleted { get; set; } = false;
        public DateTime? DeletedAt { get; set; }
        public string? DeletedBy { get; set; }
    }
}