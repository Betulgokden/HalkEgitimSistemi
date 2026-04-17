using System.ComponentModel.DataAnnotations;

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
    }
}