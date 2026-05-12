using System;
using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class EmailLog
    {
        public int Id { get; set; }

        [Required]
        [EmailAddress]
        public string ToEmail { get; set; } = string.Empty;

        [Required]
        public string Subject { get; set; } = string.Empty;

        [Required]
        public string Body { get; set; } = string.Empty;

        public DateTime SentDate { get; set; } = DateTime.Now;

        public bool IsSuccess { get; set; } = true;

        public string? ErrorMessage { get; set; }
    }
}
