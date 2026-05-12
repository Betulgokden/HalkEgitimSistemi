using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace HalkEgitimSistemi.Models
{
    public class QuizMatch
    {
        public int Id { get; set; }
        
        public int StudentId { get; set; }
        [ForeignKey("StudentId")]
        public Student? Student { get; set; }

        public int Score { get; set; }
        public int CorrectAnswers { get; set; }
        public int WrongAnswers { get; set; }
        public DateTime MatchDate { get; set; } = DateTime.Now;

        // AI Feedback Storage
        public string? AiFeedback { get; set; }
        public string? WeakAreas { get; set; }

        public bool IsFreeCourseAwarded { get; set; } = false;
    }
}
