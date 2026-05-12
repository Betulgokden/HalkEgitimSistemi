using System;
using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class InstructorSchedule
    {
        public int Id { get; set; }

        [Required]
        public int InstructorId { get; set; }
        public Instructor? Instructor { get; set; }

        [Required]
        [Display(Name = "Gün")]
        public string Day { get; set; } = string.Empty; // Pazartesi, Salı...

        [Required]
        [Display(Name = "Başlangıç Saati")]
        public TimeSpan StartTime { get; set; }

        [Required]
        [Display(Name = "Bitiş Saati")]
        public TimeSpan EndTime { get; set; }

        [Display(Name = "Ders Adı / Not")]
        public string? Note { get; set; }
    }
}
