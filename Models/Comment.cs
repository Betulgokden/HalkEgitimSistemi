using System;
using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class Comment
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Lütfen e-posta adresinizi giriniz.")]
        [EmailAddress(ErrorMessage = "Geçersiz e-posta adresi.")]
        [Display(Name = "E-Posta")]
        public string UserEmail { get; set; } = string.Empty;

        [Required(ErrorMessage = "Lütfen bir yorum yazınız.")]
        [Display(Name = "Yorum")]
        public string Content { get; set; } = string.Empty;

        [Range(1, 5, ErrorMessage = "Lütfen 1 ile 5 arasında bir puan veriniz.")]
        [Display(Name = "Puan")]
        public int Rating { get; set; } = 5;

        public DateTime CreatedAt { get; set; } = DateTime.Now;

        // İlişkiler
        public int CourseId { get; set; }
        public Course? Course { get; set; }
    }
}
