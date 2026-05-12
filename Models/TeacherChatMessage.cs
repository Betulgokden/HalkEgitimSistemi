using System;
using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    /// <summary>
    /// Sadece öğretmenler arası grup chat mesajları
    /// </summary>
    public class TeacherChatMessage
    {
        public int Id { get; set; }

        public int? InstructorId { get; set; }
        public Instructor? Instructor { get; set; }

        [Required]
        public string SenderName { get; set; } = string.Empty;

        [Required]
        public string Message { get; set; } = string.Empty;

        /// <summary>Küfür filtresiyle değiştirilmeden önceki orijinal metin (admin için)</summary>
        public string OriginalMessage { get; set; } = string.Empty;

        public bool IsCensored { get; set; } = false;

        public DateTime SentAt { get; set; } = DateTime.Now;
    }
}
