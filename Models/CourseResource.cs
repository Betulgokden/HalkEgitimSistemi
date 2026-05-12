using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class CourseResource
    {
        public int Id { get; set; }

        [Required]
        [Display(Name = "Dosya Başlığı")]
        public string Title { get; set; } = string.Empty;

        [Display(Name = "Dosya Yolu")]
        public string FilePath { get; set; } = string.Empty;

        [Display(Name = "Dosya Türü")]
        public string FileType { get; set; } = string.Empty;

        [Display(Name = "Yükleme Tarihi")]
        public DateTime UploadDate { get; set; } = DateTime.Now;

        [Required]
        public int CourseId { get; set; }
        public Course? Course { get; set; }
    }
}
