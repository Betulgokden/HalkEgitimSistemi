using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public enum ExhibitionType
    {
        Painting = 0,
        Object3D = 1,
        Video = 2
    }

    public class ExhibitionItem
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Eser Adı zorunludur.")]
        [Display(Name = "Eser Adı")]
        public string Title { get; set; } = string.Empty;

        [Display(Name = "Görsel")]
        public string? ImageUrl { get; set; }

        [Display(Name = "3D Model URL (.glb)")]
        public string? ModelUrl { get; set; }

        [Display(Name = "Video URL (.mp4)")]
        public string? VideoUrl { get; set; }

        public ExhibitionType Type { get; set; } = ExhibitionType.Painting;

        [Required(ErrorMessage = "Kursiyer Adı zorunludur.")]
        [Display(Name = "Kursiyer Adı")]
        public string ArtistName { get; set; } = string.Empty;

        [Display(Name = "İlgili Kurs")]
        public int? CourseId { get; set; }
        public Course? Course { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;

        // 3D Sanal Sergi Koordinatları
        public float PositionX { get; set; } = 0;
        public float PositionY { get; set; } = 1.6f;
        public float PositionZ { get; set; } = -5;
        public float RotationY { get; set; } = 0;
        
        // 🛒 PAZAR YERİ ÖZELLİKLERİ (Sunum için NotMapped)
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public decimal? Price { get; set; }
        
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string? Material { get; set; } // Kullanılan malzeme (Deri, Ahşap vb.)
        
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string? Color { get; set; } // Ana renkler
        
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string? Dimensions { get; set; } // Boyutlar
        
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string? Story { get; set; } // Eserin hikayesi / yapılış amacı

        // 📊 SATIŞ TAKİP SİSTEMİ
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public bool IsSold { get; set; } = false;
        
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public DateTime? SoldAt { get; set; }
        
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string? BuyerName { get; set; }
        
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string? BuyerPhone { get; set; }

        // Kursiyer İlişkisi (Yeni)
        public int? StudentId { get; set; }
        public Student? Student { get; set; }
    }
}
