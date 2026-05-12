using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    [Microsoft.EntityFrameworkCore.Index(nameof(Email), IsUnique = true)]
    public class Student
    {
        public int Id { get; set; }
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        
        [Required]
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public string? PhoneNumber { get; set; }
        
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public int? NeighborhoodId { get; set; }
        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public Neighborhood? Neighborhood { get; set; }
        
        public bool IsApproved { get; set; } = false; // Yeni: Genel onay durumu
        
        // Profil Detayları (Panel Başvurusu ve CV için)
        public string? TcNo { get; set; }
        
        [Display(Name = "Doğum Tarihi")]
        public DateTime? BirthDate { get; set; }
        
        [Display(Name = "Ev Adresi")]
        public string? Address { get; set; }

        public string? BirthPlace { get; set; }
        public string? Summary { get; set; } 
        public string? Skills { get; set; } 
        
        [Display(Name = "Vesikalık Fotoğraf")]
        public string? ProfilePicture { get; set; }

        public bool IsDeleted { get; set; } = false;

        // İstatistikler için
        public bool IsEmployed { get; set; } = false; // İşe girdi mi?
        public bool StartedBusiness { get; set; } = false; // Kendi işini kurdu mu?

        // E-posta bildirimleri
        public bool WelcomeEmailSent { get; set; } = false; // Hoş geldin e-postası gönderildi mi?

        // Gamification & Talent System
        public int Points { get; set; } = 0;
        public int SuccessScore { get; set; } = 0; // 0-100 arası başarı puanı
        public int EloRating { get; set; } = 1200; // Yeni: Rekabetçi puanlama
        public int Wins { get; set; } = 0; // Bilgi yarışması galibiyetleri
        public int TotalMatches { get; set; } = 0; // Toplam katıldığı yarışma
        public string? Badges { get; set; } // "MEB, Onur, Lider" vb.
        public string? PortfolioUrl { get; set; }
        public bool IsSpotlight { get; set; } = false; // Haftanın yeteneği mi?
        public bool IsAvailableForWork { get; set; } = true; // Hemen işe başlayabilir mi?
        public bool IsVerified { get; set; } = false; // Güvenlik doğrulaması yapıldı mı?
        public string? SecurityLog { get; set; } // Örn: "Last login from ART-08 IP"

        public List<Application> Applications { get; set; } = new();
    }
}