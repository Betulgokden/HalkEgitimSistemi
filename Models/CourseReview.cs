using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class CourseReview
    {
        public int Id { get; set; }

        [Required]
        public int StudentId { get; set; }
        public Student? Student { get; set; }

        [Required]
        public int CourseId { get; set; }
        public Course? Course { get; set; }

        [Range(1, 5)]
        public int Rating { get; set; }

        [Required]
        [MaxLength(500)]
        public string Comment { get; set; } = string.Empty;

        public DateTime CreatedAt { get; set; } = DateTime.Now;
        
        public bool IsApproved { get; set; } = true; // Admin onayına tabi tutulabilir
    }
}
