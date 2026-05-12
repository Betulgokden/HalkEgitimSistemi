using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HalkEgitimSistemi.Models
{
    public class News
    {
        public int Id { get; set; }

        [Display(Name = "Haber Başlığı")]
        public string Title { get; set; } = string.Empty;

        [Display(Name = "Haber İçeriği")]
        public string Content { get; set; } = string.Empty;

        // Hataları bitirmek için her iki ismi de kabul edecek şekilde sabitliyoruz:
        public DateTime Date { get; set; } = DateTime.Now;
        public DateTime PublishDate { get; set; } = DateTime.Now;

        public string? PosterUrl { get; set; }
        public string? ImageUrl { get; set; }

        public int? CourseId { get; set; }
        public Course? Course { get; set; }

        // Soft Delete
        public bool IsDeleted { get; set; } = false;
        public DateTime? DeletedAt { get; set; }
        public string? DeletedBy { get; set; }

        // İlişkiler
        public List<NewsComment> Comments { get; set; } = new();
        public List<NewsLike> Likes { get; set; } = new();

        [NotMapped]
        public int ViewCount { get; set; } = 0;
    }
}