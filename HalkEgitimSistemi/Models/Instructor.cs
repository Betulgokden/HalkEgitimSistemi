using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class Instructor
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Ad alanı zorunludur")]
        public string FirstName { get; set; } = string.Empty;

        [Required(ErrorMessage = "Soyad alanı zorunludur")]
        public string LastName { get; set; } = string.Empty;

        [Required(ErrorMessage = "Uzmanlık alanı zorunludur")]
        public string Expertise { get; set; } = string.Empty;

        public string PhoneNumber { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;

        // Karmaşık ilişkiler yerine sadece ID tutuyoruz (Hata riskini sıfırlar)
        public int? ParentId { get; set; }

        public string InstructorName => $"{FirstName} {LastName}";
    }
}