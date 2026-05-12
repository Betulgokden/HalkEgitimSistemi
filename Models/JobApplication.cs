using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HalkEgitimSistemi.Models
{
    public enum JobApplicationStatus
    {
        Pending,
        Reviewed,
        Accepted,
        Rejected
    }

    public class JobApplication
    {
        [Key]
        public int Id { get; set; }

        public int JobPostingId { get; set; }
        [ForeignKey("JobPostingId")]
        public JobPosting? JobPosting { get; set; }

        public int? StudentId { get; set; }
        [ForeignKey("StudentId")]
        public Student? Student { get; set; }

        [Required]
        public string ApplicantFullName { get; set; } = string.Empty;

        [Required]
        [EmailAddress]
        public string ApplicantEmail { get; set; } = string.Empty;

        public string ApplicantPhone { get; set; } = string.Empty;

        public string ExperienceSummary { get; set; } = string.Empty;

        public JobApplicationStatus Status { get; set; } = JobApplicationStatus.Pending;

        public DateTime AppliedAt { get; set; } = DateTime.Now;

        // Digital Signature Artifacts
        public string? StudentSignatureData { get; set; } // Base64 Canvas Data
        public string? EmployerStampData { get; set; } // Path to Stamp
        public string? AdminStampData { get; set; } // Path to Cold Signature

        public string? PdfReportPath { get; set; }
    }
}
