using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class AdminUser
    {
        public int Id { get; set; }

        [Required]
        [Display(Name = "Kullanıcı Adı")]
        public string Username { get; set; } = string.Empty;

        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public virtual string Email { get => Username; set => Username = value; }

        [Required]
        [Display(Name = "Şifre")]
        public string Password { get; set; } = string.Empty;

        [Required]
        [Display(Name = "Ad Soyad")]
        public string FullName { get; set; } = string.Empty;
    }
}
