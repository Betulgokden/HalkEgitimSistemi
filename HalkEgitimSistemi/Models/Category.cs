using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class Category
    {
        public int Id { get; set; }

        [Display(Name = "Kategori Adı")]
        [Required(ErrorMessage = "Kategori adı boş bırakılamaz.")]
        public string CategoryName { get; set; } = string.Empty;

        [Display(Name = "Açıklama")]
        public string? Description { get; set; }

        [Display(Name = "İkon")]
        public string? IconClass { get; set; }

        // Bu kategorideki kursların listesi (İlişki kuruyoruz)
        public List<Course>? Courses { get; set; }
    }
}