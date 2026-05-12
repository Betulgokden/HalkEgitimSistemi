namespace HalkEgitimSistemi.Models
{
    public class GalleryLike
    {
        public int Id { get; set; }
        public string UserEmail { get; set; } = string.Empty;
        
        public int GalleryItemId { get; set; }
        public GalleryItem? GalleryItem { get; set; }
        
        public DateTime CreatedAt { get; set; } = DateTime.Now;
    }
}
