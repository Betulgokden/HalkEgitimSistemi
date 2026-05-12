using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace HalkEgitimSistemi.Hubs
{
    [Authorize]
    public class PrivateChatHub : Hub
    {
        private readonly AppDbContext _context;

        public PrivateChatHub(AppDbContext context)
        {
            _context = context;
        }

        /// <summary>
        /// İki kullanıcı arasındaki özel sohbet odasına katılır.
        /// Admin her odaya katılabilir.
        /// </summary>
        public async Task JoinPrivateChat(string otherUserEmail)
        {
            var user = Context.User;
            if (user == null) return;

            string myEmail = user.FindFirstValue(ClaimTypes.Email) ?? string.Empty;
            
            // Grup ismini alfabetik sıralayarak benzersiz yapıyoruz
            string groupName = GetGroupName(myEmail, otherUserEmail);
            
            await Groups.AddToGroupAsync(Context.ConnectionId, groupName);
        }

        /// <summary>
        /// Admin'in herhangi bir konuşmayı izlemesi için.
        /// </summary>
        [Authorize(Roles = "Admin")]
        public async Task AdminSpyConversation(string email1, string email2)
        {
            string groupName = GetGroupName(email1, email2);
            await Groups.AddToGroupAsync(Context.ConnectionId, groupName);
        }

        public async Task SendPrivateMessage(string receiverEmail, string content, string type = "Text")
        {
            var user = Context.User;
            if (user == null) return;

            string senderEmail = user.FindFirstValue(ClaimTypes.Email) ?? string.Empty;
            string senderName = user.FindFirstValue("FullName") ?? user.Identity?.Name ?? "Kullanıcı";

            // --- CYBER SECURITY FORENSICS ---
            var httpContext = Context.GetHttpContext();
            string ipAddress = httpContext?.Connection?.RemoteIpAddress?.ToString() ?? "Unknown";
            string userAgent = httpContext?.Request?.Headers["User-Agent"].ToString() ?? "Unknown";

            // Siber Güvenlik Kontrolü: Kritik kelimeler veya şüpheli içerik taraması
            bool isSuspected = content.Contains("sql injection") || content.Contains("<script>") || content.Contains("DROP TABLE");

            // Mesajı Veritabanına Kaydet (SİSTEMDEN SİLİNEMEZ ARŞİV)
            var msg = new Message
            {
                SenderEmail = senderEmail,
                SenderName = senderName,
                ReceiverEmail = receiverEmail,
                Content = content,
                MessageType = type,
                SentAt = DateTime.Now,
                IsRead = false,
                IpAddress = ipAddress,
                UserAgent = userAgent,
                IsFlagged = isSuspected,
                ClientMetadata = "{\"source\":\"SignalR\", \"verified\":true}"
            };

            _context.Messages.Add(msg);

            // --- SHADOW AUDIT LOG (SİSTEMDEN SİLİNMEYEN KAYIT) ---
            var auditLog = new LogEntry
            {
                UserEmail = senderEmail,
                Action = "PrivateChatMessage",
                Message = $"SENDER: {senderEmail} | RECEIVER: {receiverEmail} | CONTENT: {content} | TYPE: {type}",
                IpAddress = ipAddress,
                ControllerName = "PrivateChatHub",
                Timestamp = DateTime.Now
            };
            _context.LogEntries.Add(auditLog);

            await _context.SaveChangesAsync();

            string groupName = GetGroupName(senderEmail, receiverEmail);

            // Alıcıya ve varsa odayı izleyen Admin'e mesajı ilet
            await Clients.Group(groupName).SendAsync("ReceivePrivateMessage", new {
                id = msg.Id,
                senderEmail = senderEmail,
                senderName = senderName,
                receiverEmail = receiverEmail,
                content = content,
                type = type,
                sentAt = msg.SentAt.ToString("HH:mm"),
                isFlagged = msg.IsFlagged
            });

            // Alıcı için bildirim
            await Clients.User(receiverEmail).SendAsync("NewMessageNotification", senderName, content);
        }

        private string GetGroupName(string email1, string email2)
        {
            var list = new List<string> { email1.ToLower(), email2.ToLower() };
            list.Sort();
            return $"private-{list[0]}-{list[1]}";
        }
    }
}
