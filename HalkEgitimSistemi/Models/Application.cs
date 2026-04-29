using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public enum ApplicationStatus
    {
        [Display(Name = "Onay Bekliyor")]
        Pending,
        [Display(Name = "Onaylandı")]
        Approved,
        [Display(Name = "Reddedildi")]
        Rejected
    }

    public class Application
    {
        public int Id { get; set; }

        [Display(Name = "Adınız")]
        [Required(ErrorMessage = "Ad alanı zorunludur.")]
        public string FirstName { get; set; } = string.Empty;

        [Display(Name = "Soyadınız")]
        [Required(ErrorMessage = "Soyad alanı zorunludur.")]
        public string LastName { get; set; } = string.Empty;

        [Display(Name = "T.C. Kimlik No")]
        public string? TcNo { get; set; }

        [Display(Name = "Telefon")]
        [Required(ErrorMessage = "Telefon zorunludur.")]
        public string PhoneNumber { get; set; } = string.Empty;

        [Display(Name = "E-posta")]
        [EmailAddress(ErrorMessage = "Geçersiz e-posta.")]
        public string Email { get; set; } = string.Empty;

        [Display(Name = "Başvurulan Kurs")]
        public int CourseId { get; set; }
        public Course? Course { get; set; }

        [Display(Name = "Başvuru Tarihi")]
        public DateTime ApplyDate { get; set; } = DateTime.Now;

        [Display(Name = "Doğum Tarihi")]
        [Required(ErrorMessage = "Doğum tarihi zorunludur.")]
        [DataType(DataType.Date)]
        public DateTime DateOfBirth { get; set; }

        [Display(Name = "Eğitim Durumu")]
        [Required(ErrorMessage = "Eğitim durumu zorunludur.")]
        public string EducationLevel { get; set; } = string.Empty;

        [Display(Name = "Başvuru Durumu")]
        public ApplicationStatus Status { get; set; } = ApplicationStatus.Pending;

        [Display(Name = "Doğum Yeri")]
        public string? BirthPlace { get; set; }

        [Display(Name = "Yönetici Notu")]
        public string? AdminNote { get; set; }

        [Display(Name = "Sertifika Kodu")]
        public string? CertificateCode { get; set; }

        [Display(Name = "Eğitimi Tamamladı Mı?")]
        public bool IsCompleted { get; set; } = false;
    }
}