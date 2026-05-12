using System;
using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    /// <summary>
    /// Küfür/argo ihlali ceza kayıtları.
    /// Kademeli ceza: 1.→1 ay, 2.→3 ay, 3.→6 ay, 4.+→kalıcı
    /// </summary>
    public class ProfanityBan
    {
        public int Id { get; set; }

        [Required]
        [Display(Name = "Kullanıcı E-posta")]
        public string UserEmail { get; set; } = string.Empty;

        [Display(Name = "Kullanıcı Adı")]
        public string UserName { get; set; } = string.Empty;

        [Display(Name = "Toplam İhlal Sayısı")]
        public int OffenseCount { get; set; } = 1;

        [Display(Name = "Ban Bitiş Tarihi")]
        public DateTime? BanUntil { get; set; }

        [Display(Name = "Kalıcı Ban")]
        public bool IsPermanent { get; set; } = false;

        [Display(Name = "Son İhlal Metni")]
        public string? LastOffenseText { get; set; }

        [Display(Name = "İlk İhlal Tarihi")]
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        [Display(Name = "Son İhlal Tarihi")]
        public DateTime UpdatedAt { get; set; } = DateTime.Now;

        [Display(Name = "Yönetici Notu")]
        public string? AdminNote { get; set; }

        /// <summary>
        /// Kullanıcı şu anda banlı mı?
        /// </summary>
        public bool IsCurrentlyBanned =>
            IsPermanent || (BanUntil.HasValue && BanUntil.Value > DateTime.Now);
    }
}
