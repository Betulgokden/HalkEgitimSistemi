using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class Course
    {
        public int Id { get; set; }

        [Display(Name = "Kurs Adı")]
        [Required(ErrorMessage = "Kurs adı zorunludur.")]
        public string CourseName { get; set; } = string.Empty;

        [Display(Name = "Kurs Açıklaması")]
        public string Description { get; set; } = string.Empty;

        [Display(Name = "Kurs Görseli (URL)")]
        public string? ImageUrl { get; set; }

        [Display(Name = "Kontenjan")]
        public int Quota { get; set; } = 30;

        [Display(Name = "Başlangıç Tarihi")]
        public DateTime StartDate { get; set; } = DateTime.Now;

        [Display(Name = "Bitiş Tarihi")]
        public DateTime EndDate { get; set; } = DateTime.Now.AddMonths(3);

        [Display(Name = "Ders Başlangıç Saati")]
        public TimeSpan StartTime { get; set; } = new TimeSpan(9, 0, 0);

        [Display(Name = "Ders Bitiş Saati")]
        public TimeSpan EndTime { get; set; } = new TimeSpan(12, 0, 0);

        [Display(Name = "Aktif Mi?")]
        public bool IsActive { get; set; } = true;

        [Display(Name = "Süre (Saat)")]
        public int DurationHours { get; set; } = 60;

        [Display(Name = "Maksimum Devamsızlık (Saat)")]
        public int MaxAbsenceLimit { get; set; } = 4;

        [Display(Name = "Kurs Ücreti (₺)")]
        public decimal Price { get; set; } = 750;

        [Display(Name = "Neler Öğreneceksiniz?")]
        public string LearningOutcomes { get; set; } = string.Empty;

        [Display(Name = "Eğitim Müfredatı")]
        public string Curriculum { get; set; } = string.Empty;

        [Display(Name = "Gereksinimler")]
        public string Requirements { get; set; } = "Temel bilgisayar kullanımı.";

        [Display(Name = "Bu Kurs Kimler İçin?")]
        public string WhoIsItFor { get; set; } = "Kendini geliştirmek isteyen herkes.";

        [Display(Name = "Haftalık Ders Programı")]
        public string WeeklySyllabus { get; set; } = "Pazartesi: 09:00-12:00\nSalı: 09:00-12:00\nÇarşamba: 09:00-12:00";

        [Display(Name = "Sınav Tarihi")]
        public DateTime? ExamDate { get; set; }

        // Hangi kategoriye ait olduğu
        [Display(Name = "Kategori")]
        public int CategoryId { get; set; }
        public Category? Category { get; set; }

        public ICollection<Application>? Applications { get; set; }
        public ICollection<Comment>? Comments { get; set; }

        // Ortalama Puan Hesaplama
        public double AverageRating => Comments != null && Comments.Any() ? Comments.Average(c => c.Rating) : 0;

        // Soft Delete
        public bool IsDeleted { get; set; } = false;
        public DateTime? DeletedAt { get; set; }
        public string? DeletedBy { get; set; }


        // İlişkiler
        public List<Attendance>? Attendances { get; set; }
        public List<CourseResource>? Resources { get; set; }
        public List<CourseReview>? CourseReviews { get; set; }

        public bool IsLive { get; set; } = false;
        public string? LiveRoomId { get; set; }
        
        public Instructor? Instructor { get; set; }
    }
}