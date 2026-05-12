using System;
using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class AcademicNote
    {
        public int Id { get; set; }
        
        [Required]
        public string Title { get; set; } = string.Empty;
        
        [Required]
        public string Content { get; set; } = string.Empty; // Rich text content or summary
        
        public string? PdfUrl { get; set; }
        
        public int CourseId { get; set; }
        public Course? Course { get; set; }
        
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        
        public string? InstructorName { get; set; }
    }

    public class AcademicTest
    {
        public int Id { get; set; }
        
        [Required]
        public string TestTitle { get; set; } = string.Empty;
        
        public int CourseId { get; set; }
        public Course? Course { get; set; }
        
        public List<AcademicQuestion> Questions { get; set; } = new();
        
        public DateTime CreatedAt { get; set; } = DateTime.Now;
    }

    public class AcademicQuestion
    {
        public int Id { get; set; }
        
        public int AcademicTestId { get; set; }
        public AcademicTest? AcademicTest { get; set; }
        
        [Required]
        public string QuestionText { get; set; } = string.Empty;
        
        [Required]
        public string OptionA { get; set; } = string.Empty;
        [Required]
        public string OptionB { get; set; } = string.Empty;
        [Required]
        public string OptionC { get; set; } = string.Empty;
        [Required]
        public string OptionD { get; set; } = string.Empty;
        
        [Required]
        public string CorrectAnswer { get; set; } = "A"; // A, B, C, D
    }
}
