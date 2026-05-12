using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class NewsStory
    {
        public int Id { get; set; }

        [Required]
        [Display(Name = "Hikaye Başlığı")]
        public string Title { get; set; } = string.Empty;

        [Required]
        [Display(Name = "Görsel")]
        public string ImageUrl { get; set; } = string.Empty;

        [Display(Name = "Link (Opsiyonel)")]
        public string? ActionUrl { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;

        // 24 saat kontrolü için computed property
        public bool IsExpired => CreatedAt.AddHours(24) < DateTime.Now;
    }
}
