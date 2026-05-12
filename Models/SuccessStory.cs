using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class SuccessStory
    {
        public int Id { get; set; }

        [Required]
        [Display(Name = "Başlık")]
        public string Title { get; set; } = string.Empty;

        [Required]
        [Display(Name = "Özet")]
        public string Summary { get; set; } = string.Empty;

        [Required]
        [Display(Name = "Hikaye Detayı")]
        public string Content { get; set; } = string.Empty;

        [Display(Name = "Kapak Görseli")]
        public string? CoverImage { get; set; }

        [Display(Name = "Öncesi Görseli")]
        public string? BeforeImage { get; set; }

        [Display(Name = "Sonrası Görseli")]
        public string? AfterImage { get; set; }

        [Display(Name = "YouTube Video Linki")]
        public string? VideoUrl { get; set; }

        // İlişkiler
        [Display(Name = "İlgili Kurs")]
        public int? CourseId { get; set; }
        public Course? Course { get; set; }

        [Display(Name = "Kursiyer")]
        public int? StudentId { get; set; }
        public Student? Student { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public bool IsActive { get; set; } = true;
    }
}
