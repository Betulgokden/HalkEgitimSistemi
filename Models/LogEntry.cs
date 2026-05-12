using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class LogEntry
    {
        public int Id { get; set; }

        [Display(Name = "Kullanıcı")]
        public string? UserEmail { get; set; }

        [Display(Name = "İşlem")]
        public string Action { get; set; } = string.Empty;

        [Display(Name = "Detay")]
        public string Message { get; set; } = string.Empty;

        [Display(Name = "Tarih")]
        public DateTime Timestamp { get; set; } = DateTime.Now;

        [Display(Name = "IP Adresi")]
        public string? IpAddress { get; set; }

        [Display(Name = "Modül")]
        public string? ControllerName { get; set; }
    }
}
