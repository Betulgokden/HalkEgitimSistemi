namespace HalkEgitimSistemi.Models
{
    public class RecycleBinItem
    {
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public string Type { get; set; } = string.Empty; // Course, Instructor, News, Application, Category
        public DateTime? DeletedAt { get; set; }
        public string? DeletedBy { get; set; }
        public string Details { get; set; } = string.Empty;
    }
}
