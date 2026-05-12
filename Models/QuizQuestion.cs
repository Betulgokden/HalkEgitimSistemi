using System;

namespace HalkEgitimSistemi.Models
{
    public class QuizQuestion
    {
        public int Id { get; set; }
        public string QuestionText { get; set; } = string.Empty;
        public string OptionA { get; set; } = string.Empty;
        public string OptionB { get; set; } = string.Empty;
        public string OptionC { get; set; } = string.Empty;
        public string OptionD { get; set; } = string.Empty;
        public string CorrectAnswer { get; set; } = "A"; // A, B, C, D
        public int Difficulty { get; set; } = 1; // 1: Kolay, 2: Orta, 3: Zor
        public string? Category { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.Now;
    }
}
