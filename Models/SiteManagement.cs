using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class SiteSettings
    {
        [Key]
        public int Id { get; set; }
        
        [Required]
        public string Key { get; set; } = string.Empty;
        
        public string Value { get; set; } = string.Empty;
        
        public string Group { get; set; } = "General"; // Branding, Security, AI, etc.
        
        public DateTime LastUpdated { get; set; } = DateTime.Now;
        public string UpdatedBy { get; set; } = "System";
    }

    public class SiteLog
    {
        [Key]
        public int Id { get; set; }
        
        public DateTime Timestamp { get; set; } = DateTime.Now;
        
        [Required]
        public string Action { get; set; } = string.Empty;
        
        public string Details { get; set; } = string.Empty;
        
        public string User { get; set; } = "System";
        
        public string IpAddress { get; set; } = string.Empty;
        
        public string Severity { get; set; } = "Info"; // Info, Warning, Critical
    }
}
