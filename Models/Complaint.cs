using System;
using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public enum ComplaintStatus
    {
        [Display(Name = "Bekliyor")]
        Pending,
        [Display(Name = "İnceleniyor")]
        Reviewing,
        [Display(Name = "Çözüldü")]
        Resolved,
        [Display(Name = "Reddedildi")]
        Dismissed
    }

    public enum ComplaintCategory
    {
        [Display(Name = "Uygunsuz İçerik")]
        InappropriateContent,
        [Display(Name = "Hakaret / Küfür")]
        Harassment,
        [Display(Name = "Teknik Sorun")]
        TechnicalIssue,
        [Display(Name = "Eğitmen Şikayeti")]
        InstructorComplaint,
        [Display(Name = "Kurs İçeriği")]
        CourseContent,
        [Display(Name = "Diğer")]
        Other
    }

    /// <summary>
    /// Kullanıcı şikayet kaydı — yalnızca yönetici görebilir
    /// </summary>
    public class Complaint
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Ad Soyad zorunludur.")]
        [Display(Name = "Ad Soyad")]
        public string ReporterName { get; set; } = string.Empty;

        [Required(ErrorMessage = "E-posta zorunludur.")]
        [EmailAddress(ErrorMessage = "Geçersiz e-posta.")]
        [Display(Name = "E-posta")]
        public string ReporterEmail { get; set; } = string.Empty;

        [Required(ErrorMessage = "Konu zorunludur.")]
        [StringLength(200, ErrorMessage = "Konu en fazla 200 karakter olabilir.")]
        [Display(Name = "Şikayet Konusu")]
        public string Subject { get; set; } = string.Empty;

        [Required(ErrorMessage = "Açıklama zorunludur.")]
        [StringLength(2000, ErrorMessage = "Açıklama en fazla 2000 karakter olabilir.")]
        [Display(Name = "Açıklama")]
        public string Description { get; set; } = string.Empty;

        [Display(Name = "Kategori")]
        public ComplaintCategory Category { get; set; } = ComplaintCategory.Other;

        [Display(Name = "Şikayet Durumu")]
        public ComplaintStatus Status { get; set; } = ComplaintStatus.Pending;

        [Display(Name = "Yönetici Notu")]
        public string? AdminNote { get; set; }

        [Display(Name = "Şikayet Tarihi")]
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        [Display(Name = "İnceleme Tarihi")]
        public DateTime? ReviewedAt { get; set; }

        /// <summary>Şikayet edilen kişinin adı (isteğe bağlı)</summary>
        [Display(Name = "Şikayet Edilen")]
        public string? ReportedPersonName { get; set; }
    }
}
