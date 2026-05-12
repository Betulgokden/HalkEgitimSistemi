using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class Certificate
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "T.C. Kimlik No zorunludur.")]
        [StringLength(11, MinimumLength = 11, ErrorMessage = "T.C. Kimlik No 11 hane olmalıdır.")]
        [Display(Name = "T.C. Kimlik No")]
        public string TcNo { get; set; } = string.Empty;

        [Required(ErrorMessage = "Sertifika No zorunludur.")]
        [Display(Name = "Sertifika No")]
        public string CertificateNo { get; set; } = string.Empty;

        [Required(ErrorMessage = "Ad Soyad zorunludur.")]
        [Display(Name = "Ad Soyad")]
        public string FullName { get; set; } = string.Empty;

        [Required(ErrorMessage = "Kurs Adı zorunludur.")]
        [Display(Name = "Kurs Adı")]
        public string CourseName { get; set; } = string.Empty;

        [Required(ErrorMessage = "Veriliş Tarihi zorunludur.")]
        [Display(Name = "Veriliş Tarihi")]
        [DataType(DataType.Date)]
        public DateTime IssueDate { get; set; } = DateTime.Now;
    }
}
