using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class PromoCode
    {
        public int Id { get; set; }
        
        [Required]
        public string Code { get; set; } = string.Empty;
        
        public int CourseId { get; set; }
        public Course? Course { get; set; }
        
        public int StudentId { get; set; }
        public Student? Student { get; set; }
        
        public bool IsUsed { get; set; } = false;
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public DateTime? UsedAt { get; set; }
        
        public int PointCost { get; set; }
    }
}
