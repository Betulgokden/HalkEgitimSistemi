using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class GalleryComment
    {
        public int Id { get; set; }
        
        [Required]
        public string Content { get; set; } = string.Empty;
        
        public string UserEmail { get; set; } = string.Empty;
        
        // Nokta Atışı (Hotspot) Koordinatları
        public decimal? X { get; set; } // Resme göre % koordinat (0-100)
        public decimal? Y { get; set; }
        
        public bool IsInstructorResponse { get; set; } = false;

        public bool IsApproved { get; set; } = true;
        
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        
        // İlişki
        public int GalleryItemId { get; set; }
        public GalleryItem? GalleryItem { get; set; }
    }
}
