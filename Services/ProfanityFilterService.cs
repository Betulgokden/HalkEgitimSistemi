using System.Text.RegularExpressions;
using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.EntityFrameworkCore;

namespace HalkEgitimSistemi.Services
{
    public interface IProfanityFilterService
    {
        string Filter(string text, out bool wasCensored);
        Task<bool> IsUserBannedAsync(string userEmail);
        Task ApplyPenaltyAsync(string userEmail, string userName, string offenseText);
    }

    public class ProfanityFilterService : IProfanityFilterService
    {
        private readonly AppDbContext _context;

        // ============================================================
        // ÇOKLU DİL KÜFÜR / ARGO LİSTESİ
        // TR | EN | DE | FR | AR | RU | ES | IT | NL | PT
        // ============================================================
        private static readonly HashSet<string> _badWords = new HashSet<string>(
            StringComparer.OrdinalIgnoreCase)
        {
            // ===== TÜRKÇE =====
            "orospu", "orospu çocuğu", "oç", "piç", "piçlik",
            "am", "amk", "amına", "amını", "amına koyayım",
            "göt", "götü", "götlek",
            "sik", "sikiş", "sikeyim", "sikerim", "siktir",
            "yarrak", "yarak", "yarrağa",
            "ibne", "ibnelik",
            "oğlum", "bok", "boktan", "boklu",
            "pezevenk", "pezo",
            "kahpe", "kahpelerin",
            "salak", "gerizekalı", "dangalak",
            "aptal", "mal", "geri zekalı",
            "puşt", "puştluk",
            "şerefsiz", "şerefsizlik",
            "namussuz", "alçak", "it",
            "lan", "bok",
            "lavuk", "serseri",

            // ===== İNGİLİZCE =====
            "fuck", "fucker", "fucking", "fucked", "fucks",
            "shit", "shitty", "shitter",
            "bitch", "bitching",
            "asshole", "ass", "asses",
            "cunt", "cunts",
            "dick", "dicks", "dickhead",
            "cock", "cocks",
            "pussy", "pussies",
            "bastard", "bastards",
            "whore", "whores",
            "slut", "sluts",
            "nigger", "nigga",
            "motherfucker", "mf",
            "damn", "dammit",
            "hell",
            "retard", "retarded",
            "idiot", "stupid",
            "moron",

            // ===== ALMANCA =====
            "scheiße", "scheisse", "scheiß",
            "arsch", "arschloch",
            "fick", "ficken", "gefickt",
            "hurensohn", "hure",
            "wichser", "wichsen",
            "schwanz", "schwanzlutscher",
            "fotze",
            "idiot", "blödmann", "depp",
            "dummkopf", "trottel",
            "vollidiot",
            "nutte",

            // ===== FRANSIZCA =====
            "merde", "putain", "salope",
            "connard", "connasse",
            "enculé", "encule",
            "bordel", "bâtard", "batard",
            "foutre", "va te faire foutre",
            "pute", "salaud",
            "con", "conne",
            "idiot", "imbécile", "imbecile",
            "crétin", "cretin",

            // ===== ARAPÇA (transliteration) =====
            "kuss", "kuss ummak", "sharmouta",
            "ibn el sharmouta", "yel'an",
            "kalb", "hayawan", "zibbi",
            "kos", "kos omak",

            // ===== RUSÇA (transliteration) =====
            "blyad", "blyadt",
            "khuy", "khuylo",
            "pizda", "pizdet",
            "yebat", "yob",
            "mudak", "muda",
            "suka", "sukin syn",
            "eblan", "dolboyob",
            "govno",

            // ===== İSPANYOLCA =====
            "puta", "puto", "putísima",
            "mierda",
            "coño", "cono",
            "cabron", "cabrón",
            "joder", "hostia",
            "gilipollas",
            "imbécil", "imbecil",
            "idiota", "pendejo",
            "marica", "maricón",
            "hijo de puta",

            // ===== İTALYANCA =====
            "cazzo", "vaffanculo",
            "stronzo", "stronza",
            "minchia", "figa",
            "puttana", "bastardo",
            "figlio di puttana",
            "idiota", "imbecille",

            // ===== HOLLANDACA =====
            "kut", "kutwijf",
            "lul", "eikel",
            "godverdomme",
            "klootzak", "kloot",
            "hoer", "slet",
            "idioot", "stom",

            // ===== PORTEKİZCE =====
            "porra", "caralho",
            "buceta", "puta", "viado",
            "merda", "foda", "fodase",
            "corno", "vagabunda",
            "imbecil", "idiota"
        };

        public ProfanityFilterService(AppDbContext context)
        {
            _context = context;
        }

        public string Filter(string text, out bool wasCensored)
        {
            wasCensored = false;
            if (string.IsNullOrWhiteSpace(text)) return text;

            string result = text;

            // 1. Veritabanındaki özel yasaklı kelimeleri çek (Senkron simülasyonu veya cache önerilir)
            // Performans için burayı optimize ediyoruz.
            var dbWords = _context.ForbiddenWords.Select(f => f.Word).ToList();
            var allWords = _badWords.Concat(dbWords).Distinct().OrderByDescending(w => w.Length).ToList();

            foreach (var word in allWords)
            {
                string pattern = Regex.Escape(word);
                if (Regex.IsMatch(result, pattern, RegexOptions.IgnoreCase))
                {
                    string replacement = new string('*', word.Length);
                    result = Regex.Replace(result, pattern, replacement, RegexOptions.IgnoreCase);
                    wasCensored = true;
                }
            }

            return result;
        }

        public async Task<bool> IsUserBannedAsync(string userEmail)
        {
            if (string.IsNullOrWhiteSpace(userEmail)) return false;

            var ban = await _context.ProfanityBans
                .AsNoTracking()
                .FirstOrDefaultAsync(b => b.UserEmail == userEmail);

            if (ban == null) return false;
            if (ban.IsPermanent) return true;
            if (ban.BanUntil.HasValue && ban.BanUntil.Value > DateTime.Now) return true;

            return false;
        }

        public async Task ApplyPenaltyAsync(string userEmail, string userName, string offenseText)
        {
            if (string.IsNullOrWhiteSpace(userEmail)) return;

            var ban = await _context.ProfanityBans
                .FirstOrDefaultAsync(b => b.UserEmail == userEmail);

            if (ban == null)
            {
                ban = new ProfanityBan
                {
                    UserEmail = userEmail,
                    UserName = userName,
                    OffenseCount = 1,
                    LastOffenseText = offenseText,
                    CreatedAt = DateTime.Now,
                    UpdatedAt = DateTime.Now
                };
                _context.ProfanityBans.Add(ban);
            }
            else
            {
                ban.OffenseCount++;
                ban.UpdatedAt = DateTime.Now;
                ban.LastOffenseText = offenseText;
                ban.UserName = userName;

                // KREATİF CEZA ALGORİTMASI
                if (ban.OffenseCount >= 10)
                {
                    ban.IsPermanent = true;
                    ban.AdminNote = "10+ İhlal: Hesap otomatik donduruldu. Yönetici incelemesi bekleniyor.";
                }
                else if (ban.OffenseCount >= 5)
                {
                    // 5 Puan: Yorum yapma/mesaj yetkisi süresiz (veya çok uzun süreli) kısıtlama
                    ban.BanUntil = DateTime.Now.AddYears(1); 
                    ban.AdminNote = "5 İhlal: Süresiz (1 Yıl) kısıtlama uygulandı.";
                }
                else if (ban.OffenseCount >= 3)
                {
                    // 3 Puan: 1 saat ban
                    ban.BanUntil = DateTime.Now.AddHours(1);
                    ban.AdminNote = "3 İhlal: 1 Saatlik geçici ban.";
                }
            }

            await _context.SaveChangesAsync();
        }
    }
}
