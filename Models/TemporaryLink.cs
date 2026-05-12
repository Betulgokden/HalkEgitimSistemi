using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class TemporaryLink
    {
        public int Id { get; set; }
        
        [Required]
        public string CertificateCode { get; set; } = string.Empty;
        
        [Required]
        public string Token { get; set; } = string.Empty;
        
        public DateTime ExpiryDate { get; set; }
        
        public bool IsUsed { get; set; } = false;
        
        public DateTime CreatedAt { get; set; } = DateTime.Now;
    }
}
