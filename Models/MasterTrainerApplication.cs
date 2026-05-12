using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public enum TrainerApplicationStatus
    {
        [Display(Name = "Onay Bekliyor")]
        Pending,
        [Display(Name = "Onaylandı")]
        Approved,
        [Display(Name = "Reddedildi")]
        Rejected
    }

    public class MasterTrainerApplication
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Ad Soyad zorunludur.")]
        [Display(Name = "Ad Soyad")]
        public string FullName { get; set; } = string.Empty;

        [Required(ErrorMessage = "T.C. Kimlik No zorunludur.")]
        [StringLength(11, MinimumLength = 11, ErrorMessage = "T.C. Kimlik No 11 haneli olmalıdır.")]
        [Display(Name = "T.C. Kimlik No")]
        public string TcNo { get; set; } = string.Empty;

        [Required(ErrorMessage = "Doğum Yılı zorunludur.")]
        [Display(Name = "Doğum Yılı (Yaş Hesabı İçin)")]
        public int BirthYear { get; set; }

        [Required(ErrorMessage = "Telefon zorunludur.")]
        [Display(Name = "Telefon")]
        public string Phone { get; set; } = string.Empty;

        [Required(ErrorMessage = "E-posta zorunludur.")]
        [EmailAddress(ErrorMessage = "Geçersiz e-posta.")]
        [Display(Name = "E-posta")]
        public string Email { get; set; } = string.Empty;

        [Required(ErrorMessage = "Adres zorunludur.")]
        [Display(Name = "Ev Adresi")]
        public string Address { get; set; } = string.Empty;

        [Required(ErrorMessage = "Vesikalık Fotoğraf zorunludur.")]
        [Display(Name = "Vesikalık Fotoğraf (URL)")]
        public string? PhotoPath { get; set; }

        [Display(Name = "Mezuniyet Durumu")]
        public string? GraduationStatus { get; set; }

        [Required(ErrorMessage = "Kategori seçimi zorunludur.")]
        [Display(Name = "Uzmanlık Alanı (Kategori)")]
        public int CategoryId { get; set; }

        [Required(ErrorMessage = "Branş seçimi zorunludur.")]
        [Display(Name = "Uzmanlık Alanı (Branş)")]
        public int CourseId { get; set; }

        [Display(Name = "Uzmanlık Alanı (Metin)")]
        public string Specialty { get; set; } = string.Empty;

        [Display(Name = "CV Dosyası")]
        public string? CvPath { get; set; }

        [Display(Name = "Adli Sicil Kaydı")]
        public string? CriminalRecordPath { get; set; }

        [Display(Name = "Diploma / Sertifika")]
        public string? DiplomaPath { get; set; }

        [Display(Name = "Haftalık Müsaitlik (JSON)")]
        public string? AvailabilityJson { get; set; }

        [Display(Name = "Başvuru Durumu")]
        public TrainerApplicationStatus Status { get; set; } = TrainerApplicationStatus.Pending;

        [Display(Name = "Başvuru Tarihi")]
        public DateTime ApplyDate { get; set; } = DateTime.Now;
    }
}
