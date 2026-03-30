namespace HalkEgitimSistemi.Models
{
    public class Category
    {
        public int Id { get; set; }

        // Buradaki "= string.Empty;" eki sarı uyarıları siler.
        public string CategoryName { get; set; } = string.Empty;

        public string Description { get; set; } = string.Empty;

        // Kategoriye ait kursların listesi
        public virtual ICollection<Course>? Courses { get; set; }
    }
}