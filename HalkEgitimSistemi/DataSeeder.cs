using HalkEgitimSistemi.Data;
using Microsoft.EntityFrameworkCore;

namespace HalkEgitimSistemi
{
    public class DataSeeder
    {
        public static async Task SeedInstructorPasswords(AppDbContext context)
        {
            var instructors = await context.Instructors.ToListAsync();
            bool changed = false;
            foreach (var instructor in instructors)
            {
                // Kullanıcı adı her zaman FullName olmalı (eski formatları düzelt)
                if (instructor.Username != instructor.FullName)
                {
                    instructor.Username = instructor.FullName;
                    instructor.Password = "123";
                    changed = true;
                }
                // Şifresi boş olanları da düzelt
                if (string.IsNullOrEmpty(instructor.Password))
                {
                    instructor.Password = "123";
                    changed = true;
                }
            }
            if (changed)
                await context.SaveChangesAsync();
        }
        public static async Task FixDatabaseEncoding(AppDbContext context)
        {
            var apps = await context.Applications.ToListAsync();
            bool changed = false;
            foreach (var a in apps)
            {
                var oldFirst = a.FirstName;
                var oldLast = a.LastName;
                var oldEmail = a.Email;
                var oldTc = a.TcNo;

                a.FirstName = FixEncoding(a.FirstName);
                a.LastName = FixEncoding(a.LastName);
                a.Email = FixEmail(a.Email);
                a.TcNo = CheckAndFixTc(a.TcNo);
                
                if (oldFirst != a.FirstName || oldLast != a.LastName || oldEmail != a.Email || oldTc != a.TcNo)
                    changed = true;
            }
            if (changed)
                await context.SaveChangesAsync();
        }

        private static string FixEncoding(string text)
        {
            if (string.IsNullOrEmpty(text)) return text;
            return text.Replace("Ã¼", "ü")
                       .Replace("ÅŸ", "ş")
                       .Replace("ÄŸ", "ğ")
                       .Replace("Ä±", "ı")
                       .Replace("Ã‡", "Ç")
                       .Replace("Ã¶", "ö")
                       .Replace("Ã§", "ç")
                       .Replace("Ä°", "İ")
                       .Replace("Ã–", "Ö")
                       .Replace("Ãœ", "Ü")
                       .Replace("Åž", "Ş")
                       .Replace("Äž", "Ğ");
        }

        private static string FixEmail(string email)
        {
            if (string.IsNullOrEmpty(email)) return email;
            var fixedEmail = FixEncoding(email);
            return fixedEmail.Replace("ü", "u").Replace("ş", "s").Replace("ğ", "g").Replace("ı", "i").Replace("ç", "c").Replace("ö", "o")
                             .Replace("Ü", "u").Replace("Ş", "s").Replace("Ğ", "g").Replace("İ", "i").Replace("Ç", "c").Replace("Ö", "o");
        }

        private static string CheckAndFixTc(string? tc)
        {
            if (string.IsNullOrEmpty(tc)) return "";
            if (tc.Contains("e+") || tc.Contains("E+")) 
            {
                var r = new Random(tc.GetHashCode());
                long num = (long)(r.NextDouble() * 9000000000) + 10000000000;
                return num.ToString();
            }
            return tc;
        }
    }
}
