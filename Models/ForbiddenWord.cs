using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class ForbiddenWord
    {
        public int Id { get; set; }

        [Required]
        [Display(Name = "Yasaklı Kelime")]
        public string Word { get; set; } = string.Empty;

        [Display(Name = "Eklenme Tarihi")]
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        [Display(Name = "Ekleyen")]
        public string? CreatedBy { get; set; }
    }
}
