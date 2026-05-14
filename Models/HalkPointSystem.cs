using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class HalkPointActivity
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string ActivityType { get; set; } = string.Empty; // "DailyLogin", "CourseCompletion", "BotInteraction"
        public int PointAmount { get; set; }
        public DateTime Date { get; set; } = DateTime.Now;
    }

    public class HalkPointCode
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int CourseId { get; set; }
        public string GeneratedCode { get; set; } = string.Empty;
        public bool IsUsed { get; set; } = false;
        public DateTime CreatedAt { get; set; } = DateTime.Now;
    }
}
