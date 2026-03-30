using System.ComponentModel.DataAnnotations.Schema;

namespace HalkEgitimSistemi.Models
{
    public class Course
    {
        public int Id { get; set; }

        public string CourseName { get; set; } = string.Empty;

        public int Quota { get; set; }

        public decimal Price { get; set; }

        public int CategoryId { get; set; }

        [ForeignKey("CategoryId")]
        public virtual Category? Category { get; set; }
    }
}