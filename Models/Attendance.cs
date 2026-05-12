using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class Attendance
    {
        public int Id { get; set; }

        [Required]
        public int ApplicationId { get; set; }
        public Application? Application { get; set; }

        [Required]
        public int CourseId { get; set; }
        public Course? Course { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime Date { get; set; }

        [Display(Name = "Geldi Mi?")]
        public bool IsPresent { get; set; } = true;

        [Display(Name = "Not")]
        public string? Note { get; set; }
    }
}
