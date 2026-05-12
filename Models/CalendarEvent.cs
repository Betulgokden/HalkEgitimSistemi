using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class CalendarEvent
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "BaÅŸlÄ±k zorunludur.")]
        [Display(Name = "BaÅŸlÄ±k")]
        public string Title { get; set; } = string.Empty;

        [Required(ErrorMessage = "BaÅŸlangÄ±Ã§ tarihi zorunludur.")]
        [Display(Name = "BaÅŸlangÄ±Ã§")]
        public DateTime Start { get; set; }

        [Display(Name = "BitiÅŸ")]
        public DateTime? End { get; set; }

        [Display(Name = "Renk Kodu")]
        public string? ColorCode { get; set; } = "#C5A059"; // Default premium violet
    }
}

