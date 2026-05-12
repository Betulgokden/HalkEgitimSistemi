using System;
using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class Message
    {
        public int Id { get; set; }

        [Required]
        public string Content { get; set; } = string.Empty;

        public DateTime Date { get; set; } = DateTime.Now;

        [Required]
        public string SenderUsername { get; set; } = string.Empty;

        public string? ReceiverUsername { get; set; }

        public string Subject { get; set; } = "Mesaj";

        public bool IsFromInstructor { get; set; } = false;

        public bool IsRead { get; set; } = false;

        public int? ReceiverInstructorId { get; set; }
        public Instructor? ReceiverInstructor { get; set; }

        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string? SenderRole { get; set; } // Admin, Instructor, Student, Employer
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string? ReceiverRole { get; set; }

        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public int? EmployerId { get; set; }
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public int? StudentId { get; set; }

        // --- Virtual / NotMapped Properties (Zero-Migration Modernization) ---
        
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string SenderEmail { get => SenderUsername; set => SenderUsername = value; }

        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string SenderName { get => SenderUsername; set => SenderUsername = value; }

        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string ReceiverEmail { get => ReceiverUsername ?? ""; set => ReceiverUsername = value; }

        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string? ReceiverName { get => ReceiverUsername; set => ReceiverUsername = value; }

        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public DateTime SentAt { get => Date; set => Date = value; }

        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string MessageType { get; set; } = "Text";

        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public bool IsFlagged { get; set; } = false;

        // --- Cyber Security & Audit Trail ---
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public bool IsDeletedBySender { get; set; } = false;
        
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public bool IsDeletedByReceiver { get; set; } = false;
        
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string? IpAddress { get; set; }
        
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string? UserAgent { get; set; }
        
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string? ClientMetadata { get; set; } // JSON metadata for forensics
    }
}
