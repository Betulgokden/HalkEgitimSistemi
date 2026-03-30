using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class Application
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Ad Soyad alanı zorunludur")]
        public string FullName { get; set; } // Ad Soyad

        [Required(ErrorMessage = "Telefon alanı zorunludur")]
        public string PhoneNumber { get; set; } // Telefon

        public string EducationStatus { get; set; } // Öğrenim Durumu

        public string BirthPlace { get; set; } // Nereli Olduğu

        public DateTime ApplyDate { get; set; } = DateTime.Now; // Başvuru Tarihi

        // Hangi kursa başvurduğunu bağladık
        public int CourseId { get; set; }
        public Course? Course { get; set; }
    }
}