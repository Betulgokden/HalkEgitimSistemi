using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class GalleryItem
    {
        public int Id { get; set; }
        [Required]
        public string Title { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string ImageUrl { get; set; } = string.Empty;

        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public decimal? Price { get; set; } // Satış fiyatı (Sunum için NotMapped)
        
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string? Category { get; set; } // El sanatı kategorisi
        
        // Hangi kursa ait olduğu (null ise genel galeridir)
        public int? CourseId { get; set; }
        public Course? Course { get; set; }

        // Gelişmiş Özellikler
        public int ViewCount { get; set; } = 0;
        public string? ExifInfo { get; set; } // Kamera, ISO, Diyafram vb. (JSON)
        public string? Tags { get; set; } // AI tarafından üretilen etiketler (virgülle ayrılmış)
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        // İlişkiler
        public List<GalleryComment> Comments { get; set; } = new();
        public List<GalleryLike> Likes { get; set; } = new();

        // Soft Delete
        public bool IsDeleted { get; set; } = false;
        public DateTime? DeletedAt { get; set; }
        public string? DeletedBy { get; set; }
    }
}
