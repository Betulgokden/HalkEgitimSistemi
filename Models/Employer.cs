using System;
using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class Employer
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Şirket adı zorunludur.")]
        [Display(Name = "Şirket Adı")]
        public string CompanyName { get; set; } = string.Empty;

        [Required(ErrorMessage = "Vergi numarası zorunludur.")]
        [Display(Name = "Vergi No / Mersis No")]
        public string TaxNumber { get; set; } = string.Empty;

        [Display(Name = "Sektör")]
        public string Sector { get; set; } = "Genel";

        [Required(ErrorMessage = "Yetkili kişi adı zorunludur.")]
        [Display(Name = "Yetkili Kişi")]
        public string AuthorizedPerson { get; set; } = string.Empty;

        [Required(ErrorMessage = "E-posta adresi zorunludur.")]
        [EmailAddress(ErrorMessage = "Geçersiz e-posta adresi.")]
        public string Email { get; set; } = string.Empty;

        [Required(ErrorMessage = "Şifre zorunludur.")]
        [DataType(DataType.Password)]
        public string Password { get; set; } = string.Empty;

        [Display(Name = "Vergi Levhası (PDF/JPG)")]
        public string? TaxPlatePath { get; set; }

        public bool IsApproved { get; set; } = false; // Admin onayı (Genel)
        public bool IsVerified { get; set; } = false; // Kurumsal doğrulama rozeti
        public string? Badges { get; set; } // "Eğitim Dostu, Sponsor" vb.
        
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public bool IsDeleted { get; set; } = false;
    }
}
