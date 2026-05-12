using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class NewsComment
    {
        public int Id { get; set; }

        [Required]
        public int NewsId { get; set; }
        public News? News { get; set; }

        [Required(ErrorMessage = "Yorum alanı boş bırakılamaz.")]
        public string Content { get; set; } = string.Empty;

        [Required]
        public string UserEmail { get; set; } = string.Empty;

        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public bool IsApproved { get; set; } = true;
    }

    public class NewsLike
    {
        public int Id { get; set; }
        public int NewsId { get; set; }
        public News? News { get; set; }
        public string UserEmail { get; set; } = string.Empty;
    }
}
