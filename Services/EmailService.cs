using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using System.Net.Mail;
using System.Net;

namespace HalkEgitimSistemi.Services
{
    public interface IEmailService
    {
        Task SendEmailAsync(string to, string subject, string body);
        Task SendApplicationApprovalAsync(string toEmail, string studentName, string courseName, DateTime startDate);
        Task SendApplicationRejectionAsync(string toEmail, string studentName, string courseName, string? reason);
        Task SendWelcomeEmailAsync(string toEmail, string studentName);
        Task SendCourseReminderAsync(string toEmail, string studentName, string courseName, DateTime courseDate, string reminderType);
        Task SendBulkCourseNotificationAsync(List<string> emails, string courseName, string message);
    }

    public class EmailService : IEmailService
    {
        private readonly AppDbContext _context;
        private readonly IConfiguration _config;

        public EmailService(AppDbContext context, IConfiguration config)
        {
            _context = context;
            _config = config;
        }

        // ── Temel gönderim metodu ──────────────────────────────────────────
        public async Task SendEmailAsync(string to, string subject, string body)
        {
            var log = new EmailLog
            {
                ToEmail = to,
                Subject = subject,
                Body = body,
                SentDate = DateTime.Now,
                IsSuccess = true
            };

            try
            {
                var smtpHost = _config["Email:SmtpHost"];
                var smtpPort = int.TryParse(_config["Email:SmtpPort"], out int port) ? port : 587;
                var smtpUser = _config["Email:Username"];
                var smtpPass = _config["Email:Password"];

                if (!string.IsNullOrEmpty(smtpHost) && !string.IsNullOrEmpty(smtpUser))
                {
                    // Gerçek SMTP gönderimi
                    using var client = new SmtpClient(smtpHost, smtpPort)
                    {
                        Credentials = new NetworkCredential(smtpUser, smtpPass),
                        EnableSsl = true
                    };
                    var mail = new MailMessage(smtpUser, to, subject, body)
                    {
                        IsBodyHtml = true
                    };
                    await client.SendMailAsync(mail);
                }
                else
                {
                    // Simülasyon: log'a kaydediyoruz
                    await Task.Delay(50);
                }
            }
            catch (Exception ex)
            {
                log.IsSuccess = false;
                log.ErrorMessage = ex.Message;
            }
            finally
            {
                _context.EmailLogs.Add(log);
                await _context.SaveChangesAsync();
            }
        }

        // ── Başvuru Onay E-postası ─────────────────────────────────────────
        public async Task SendApplicationApprovalAsync(string toEmail, string studentName,
            string courseName, DateTime startDate)
        {
            string subject = $"🎉 Başvurunuz Onaylandı — {courseName}";
            string body = $@"
<!DOCTYPE html>
<html lang='tr'>
<head><meta charset='utf-8'></head>
<body style='font-family: Open Sans, Arial, sans-serif; background:#f9f9f9; padding:20px;'>
  <div style='max-width:600px;margin:0 auto;background:#fff;border-radius:8px;overflow:hidden;box-shadow:0 2px 10px rgba(0,0,0,0.08);'>
    <div style='background:#1a1a2e;padding:30px;text-align:center;'>
      <h1 style='color:#fff;margin:0;font-size:22px;'>Halk Eğitim Merkezi</h1>
      <p style='color:#aaa;margin:5px 0 0;font-size:13px;'>Yaşam Boyu Öğrenme Platformu</p>
    </div>
    <div style='padding:40px 30px;'>
      <h2 style='color:#1a1a2e;'>🎉 Tebrikler, {studentName}!</h2>
      <p style='color:#444;line-height:1.7;'>
        <strong>{courseName}</strong> kursuna yaptığınız başvuru <strong>onaylandı</strong>.
      </p>
      <div style='background:#f0fdf4;border-left:4px solid #22c55e;padding:15px 20px;border-radius:4px;margin:20px 0;'>
        <p style='margin:0;color:#166534;'><strong>📅 Kurs Başlangıç Tarihi:</strong> {startDate:dd MMMM yyyy, dddd}</p>
      </div>
      <p style='color:#666;font-size:14px;'>
        Kurs detaylarına ve ders programına sisteme giriş yaparak ulaşabilirsiniz.
      </p>
      <div style='text-align:center;margin:30px 0;'>
        <a href='https://halkeğitim.com' style='background:#1a1a2e;color:#fff;padding:12px 30px;border-radius:4px;text-decoration:none;font-weight:600;'>
          Sisteme Giriş Yap
        </a>
      </div>
    </div>
    <div style='background:#f9f9f9;padding:15px 30px;text-align:center;font-size:12px;color:#999;'>
      Halk Eğitim Merkezi © {DateTime.Now.Year} — Bu e-posta otomatik gönderilmiştir.
    </div>
  </div>
</body>
</html>";

            await SendEmailAsync(toEmail, subject, body);
        }

        // ── Başvuru Red E-postası ──────────────────────────────────────────
        public async Task SendApplicationRejectionAsync(string toEmail, string studentName,
            string courseName, string? reason)
        {
            string subject = $"Başvuru Durumu — {courseName}";
            string reasonText = string.IsNullOrEmpty(reason)
                ? "Kontenjan doluluğu veya uygunluk kriterlerine ilişkin değerlendirme sonucunda"
                : reason;

            string body = $@"
<!DOCTYPE html>
<html lang='tr'>
<head><meta charset='utf-8'></head>
<body style='font-family: Open Sans, Arial, sans-serif; background:#f9f9f9; padding:20px;'>
  <div style='max-width:600px;margin:0 auto;background:#fff;border-radius:8px;overflow:hidden;box-shadow:0 2px 10px rgba(0,0,0,0.08);'>
    <div style='background:#1a1a2e;padding:30px;text-align:center;'>
      <h1 style='color:#fff;margin:0;font-size:22px;'>Halk Eğitim Merkezi</h1>
    </div>
    <div style='padding:40px 30px;'>
      <h2 style='color:#1a1a2e;'>Sayın {studentName},</h2>
      <p style='color:#444;line-height:1.7;'>
        <strong>{courseName}</strong> kursuna yaptığınız başvuru değerlendirilmiş olup bu dönem için kabul edilememiştir.
      </p>
      <div style='background:#fff5f5;border-left:4px solid #ef4444;padding:15px 20px;border-radius:4px;margin:20px 0;'>
        <p style='margin:0;color:#991b1b;'><strong>Gerekçe:</strong> {reasonText}</p>
      </div>
      <p style='color:#666;font-size:14px;'>
        Bir sonraki dönemde tekrar başvurabilirsiniz. Diğer kurslarımıza da göz atmanızı öneririz.
      </p>
    </div>
    <div style='background:#f9f9f9;padding:15px 30px;text-align:center;font-size:12px;color:#999;'>
      Halk Eğitim Merkezi © {DateTime.Now.Year}
    </div>
  </div>
</body>
</html>";

            await SendEmailAsync(toEmail, subject, body);
        }

        // ── Hoş Geldin E-postası (İlk Giriş) ─────────────────────────────
        public async Task SendWelcomeEmailAsync(string toEmail, string studentName)
        {
            string subject = "Halk Eğitim Merkezine Hoş Geldiniz! 🌟";
            string body = $@"
<!DOCTYPE html>
<html lang='tr'>
<head><meta charset='utf-8'></head>
<body style='font-family: Open Sans, Arial, sans-serif; background:#f9f9f9; padding:20px;'>
  <div style='max-width:600px;margin:0 auto;background:#fff;border-radius:8px;overflow:hidden;box-shadow:0 2px 10px rgba(0,0,0,0.08);'>
    <div style='background:linear-gradient(135deg,#1a1a2e,#16213e);padding:40px 30px;text-align:center;'>
      <h1 style='color:#fff;margin:0;font-size:26px;letter-spacing:1px;'>HEM Sistemi</h1>
      <p style='color:#94a3b8;margin:8px 0 0;'>Yaşam Boyu Öğrenme Platformu</p>
    </div>
    <div style='padding:40px 30px;'>
      <h2 style='color:#1a1a2e;'>Merhaba, {studentName}! 👋</h2>
      <p style='color:#444;line-height:1.8;'>
        Halk Eğitim Merkezi sistemine hoş geldiniz. Artık kurslara başvurabilir, eğitmenlerinizle iletişime geçebilir ve
        eğitim sürecinizi takip edebilirsiniz.
      </p>
      <div style='background:#eff6ff;border-radius:8px;padding:20px;margin:20px 0;'>
        <h3 style='color:#1d4ed8;margin:0 0 10px;font-size:14px;text-transform:uppercase;letter-spacing:1px;'>
          Yapabilecekleriniz
        </h3>
        <ul style='color:#334155;margin:0;padding-left:20px;line-height:2;'>
          <li>Kurslara başvurun ve kayıt sürecinizi takip edin</li>
          <li>Eğitmenlerinize soru sorun</li>
          <li>Kurs grup sohbetine katılın</li>
          <li>Sertifikalarınızı indirin</li>
        </ul>
      </div>
    </div>
    <div style='background:#f9f9f9;padding:15px 30px;text-align:center;font-size:12px;color:#999;'>
      Halk Eğitim Merkezi © {DateTime.Now.Year}
    </div>
  </div>
</body>
</html>";

            await SendEmailAsync(toEmail, subject, body);
        }

        // ── Kurs Hatırlatma E-postası ──────────────────────────────────────
        public async Task SendCourseReminderAsync(string toEmail, string studentName,
            string courseName, DateTime courseDate, string reminderType)
        {
            string subject = reminderType == "tomorrow"
                ? $"⏰ Yarın Kursunuz Var! — {courseName}"
                : $"📅 Kursunuz Yaklaşıyor — {courseName}";

            string reminderText = reminderType == "tomorrow"
                ? $"<strong>Yarın</strong>, {courseDate:dd MMMM yyyy dddd} günü saat <strong>{courseDate:HH:mm}</strong>'de kursunuz başlayacak."
                : $"<strong>{courseDate:dd MMMM yyyy, dddd}</strong> tarihinde kursunuz başlıyor.";

            string body = $@"
<!DOCTYPE html>
<html lang='tr'>
<head><meta charset='utf-8'></head>
<body style='font-family: Open Sans, Arial, sans-serif; background:#f9f9f9; padding:20px;'>
  <div style='max-width:600px;margin:0 auto;background:#fff;border-radius:8px;overflow:hidden;box-shadow:0 2px 10px rgba(0,0,0,0.08);'>
    <div style='background:#1a1a2e;padding:30px;text-align:center;'>
      <h1 style='color:#fff;margin:0;font-size:22px;'>Halk Eğitim Merkezi</h1>
    </div>
    <div style='padding:40px 30px;'>
      <h2 style='color:#1a1a2e;'>Sayın {studentName},</h2>
      <p style='color:#444;line-height:1.7;'>{reminderText}</p>
      <div style='background:#fefce8;border-left:4px solid #eab308;padding:15px 20px;border-radius:4px;margin:20px 0;'>
        <p style='margin:0;color:#713f12;'><strong>📚 Kurs:</strong> {courseName}</p>
        <p style='margin:5px 0 0;color:#713f12;'><strong>📅 Tarih:</strong> {courseDate:dd.MM.yyyy HH:mm}</p>
      </div>
      <p style='color:#666;font-size:14px;'>Hazırlıklı gelin, bol öğrenmeler! 🎓</p>
    </div>
    <div style='background:#f9f9f9;padding:15px 30px;text-align:center;font-size:12px;color:#999;'>
      Halk Eğitim Merkezi © {DateTime.Now.Year}
    </div>
  </div>
</body>
</html>";

            await SendEmailAsync(toEmail, subject, body);
        }

        // ── Toplu Bildirim ─────────────────────────────────────────────────
        public async Task SendBulkCourseNotificationAsync(List<string> emails,
            string courseName, string message)
        {
            string subject = $"📢 Duyuru — {courseName}";
            string body = $@"
<!DOCTYPE html>
<html lang='tr'>
<head><meta charset='utf-8'></head>
<body style='font-family: Open Sans, Arial, sans-serif; background:#f9f9f9; padding:20px;'>
  <div style='max-width:600px;margin:0 auto;background:#fff;border-radius:8px;overflow:hidden;box-shadow:0 2px 10px rgba(0,0,0,0.08);'>
    <div style='background:#1a1a2e;padding:30px;text-align:center;'>
      <h1 style='color:#fff;margin:0;font-size:22px;'>Halk Eğitim Merkezi</h1>
    </div>
    <div style='padding:40px 30px;'>
      <h2 style='color:#1a1a2e;'>{courseName} — Duyuru</h2>
      <div style='background:#f8fafc;border-radius:6px;padding:20px;line-height:1.8;color:#334155;'>
        {message.Replace("\n", "<br>")}
      </div>
    </div>
    <div style='background:#f9f9f9;padding:15px 30px;text-align:center;font-size:12px;color:#999;'>
      Halk Eğitim Merkezi © {DateTime.Now.Year}
    </div>
  </div>
</body>
</html>";

            foreach (var email in emails)
            {
                await SendEmailAsync(email, subject, body);
            }
        }
    }
}
