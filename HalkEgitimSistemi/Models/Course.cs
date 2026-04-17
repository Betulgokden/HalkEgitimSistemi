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

        [Display(Name = "Aktif Mi?")]
        public bool IsActive { get; set; } = true;

        [Display(Name = "Süre (Saat)")]
        public int DurationHours { get; set; } = 60;

        // Hangi kategoriye ait olduğu
        [Display(Name = "Kategori")]
        public int CategoryId { get; set; }
        public Category? Category { get; set; }

        // İlişkiler
        public List<Application>? Applications { get; set; }
    }
}