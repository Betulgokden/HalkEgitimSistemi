using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class Neighborhood
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; } = string.Empty;
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        
        // Activity metrics for the heat map
        public int ActiveStudents { get; set; } = 0;
        public int CompletedCourses { get; set; } = 0;
        
        // Heat level (0.0 to 1.0) calculated dynamically or stored
        public double Intensity { get; set; } = 0.0;
    }
}
