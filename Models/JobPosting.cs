using System;
using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class JobPosting
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Şirket adı zorunludur.")]
        [Display(Name = "Şirket / Kurum Adı")]
        public string CompanyName { get; set; } = string.Empty;

        [Required(ErrorMessage = "İlan başlığı zorunludur.")]
        [Display(Name = "İlan Başlığı")]
        public string Title { get; set; } = string.Empty;

        [Required(ErrorMessage = "İş tanımı zorunludur.")]
        [Display(Name = "İş Tanımı")]
        public string Description { get; set; } = string.Empty;

        [Display(Name = "Aranan Nitelikler")]
        public string Requirements { get; set; } = string.Empty;

        [Display(Name = "Konum")]
        public string Location { get; set; } = "Borçka, Artvin";

        [Display(Name = "Çalışma Şekli")]
        public string JobType { get; set; } = "Tam Zamanlı"; // Tam Zamanlı, Yarı Zamanlı, Uzaktan

        [Display(Name = "Maaş Aralığı")]
        public string SalaryRange { get; set; } = string.Empty;

        public DateTime CreatedAt { get; set; } = DateTime.Now;

        [Display(Name = "Son Başvuru Tarihi")]
        public DateTime? Deadline { get; set; }

        public bool IsActive { get; set; } = true;
        public bool IsDeleted { get; set; } = false;

        [Display(Name = "İş Veren ID")]
        public int EmployerId { get; set; }

        [Display(Name = "Aranan Kategori")]
        public string RequiredCategory { get; set; } = string.Empty;

        [Display(Name = "İletişim Bilgisi")]
        public string ContactEmail { get; set; } = string.Empty;
    }
}
