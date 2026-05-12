using System;
using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    /// <summary>
    /// Kurs bazlı grup chat — öğrenci + o kursun öğretmeni
    /// </summary>
    public class CourseChatMessage
    {
        public int Id { get; set; }

        [Required]
        public int CourseId { get; set; }
        public Course? Course { get; set; }

        [Required]
        public string SenderName { get; set; } = string.Empty;

        /// <summary>Gönderenin rolü: "Student" veya "Instructor"</summary>
        [Required]
        public string SenderRole { get; set; } = "Student";

        /// <summary>Filtre uygulandıktan sonraki mesaj metni</summary>
        [Required]
        public string Message { get; set; } = string.Empty;

        /// <summary>Orijinal ham metin (admin/öğretmen görebilir)</summary>
        public string OriginalMessage { get; set; } = string.Empty;

        public bool IsCensored { get; set; } = false;

        public DateTime SentAt { get; set; } = DateTime.Now;

        /// <summary>Mesajı gönderen öğrencinin e-postası (Student rolü için)</summary>
        public string? SenderEmail { get; set; }

        /// <summary>Mesajı gönderen eğitmenin Id'si (Instructor rolü için)</summary>
        public int? InstructorId { get; set; }
    }
}
