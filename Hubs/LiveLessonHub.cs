using Microsoft.AspNetCore.SignalR;
using System.Collections.Concurrent;

namespace HalkEgitimSistemi.Hubs
{
    public class LiveLessonHub : Hub
    {
        // Aktif kullanıcıları oda bazlı tutmak için
        private static readonly ConcurrentDictionary<string, string> ConnectedUsers = new ConcurrentDictionary<string, string>();
        // ConnectionId -> RoomId
        private static readonly ConcurrentDictionary<string, string> UserRooms = new ConcurrentDictionary<string, string>();

        public async Task JoinRoom(string roomId, string username)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, roomId);
            ConnectedUsers[Context.ConnectionId] = username;
            UserRooms[Context.ConnectionId] = roomId;

            // Diğerlerine yeni biri katıldı bildir
            await Clients.OthersInGroup(roomId).SendAsync("UserJoined", username);
            
            // Mevcut aktif kullanıcı listesini çekmek için (isteğe bağlı)
            var usersInRoom = ConnectedUsers
                .Where(x => UserRooms.ContainsKey(x.Key) && UserRooms[x.Key] == roomId)
                .Select(x => x.Value)
                .ToList();
            
            await Clients.Group(roomId).SendAsync("UpdateUserList", usersInRoom);
        }

        private readonly Services.IProfanityFilterService _filter;

        public LiveLessonHub(Services.IProfanityFilterService filter)
        {
            _filter = filter;
        }

        // 1. El Kaldırma Sistemi
        public async Task RaiseHand(string roomId, string username)
        {
            await Clients.Group(roomId).SendAsync("ReceiveHandRaise", username);
        }

        // 2. Etkileşimli Beyaz Tahta
        public async Task Draw(string roomId, object drawData)
        {
            await Clients.OthersInGroup(roomId).SendAsync("ReceiveDraw", drawData);
        }

        public async Task ClearBoard(string roomId)
        {
            await Clients.Group(roomId).SendAsync("ClearBoard");
        }

        // 3. Sohbet
        public async Task SendMessage(string roomId, string username, string message)
        {
            if (string.IsNullOrWhiteSpace(message)) return;

            var user = Context.User;
            string email = user?.FindFirst(System.Security.Claims.ClaimTypes.Email)?.Value ?? "";

            // 1. BAN KONTROLÜ
            if (!string.IsNullOrEmpty(email) && await _filter.IsUserBannedAsync(email))
            {
                await Clients.Caller.SendAsync("ReceiveSystemWarning", "İhlal puanınız nedeniyle mesaj gönderemezsiniz.");
                return;
            }

            // 2. KÜFÜR FİLTRESİ
            string filtered = _filter.Filter(message, out bool wasCensored);
            if (wasCensored && !string.IsNullOrEmpty(email))
            {
                await _filter.ApplyPenaltyAsync(email, username, message);
                await Clients.Caller.SendAsync("ReceiveSystemWarning", "Sistem Botu: Lütfen nezaket kurallarına uyunuz!");
            }

            await Clients.Group(roomId).SendAsync("ReceiveMessage", username, filtered, DateTime.Now.ToString("HH:mm"), wasCensored);
        }

        public override async Task OnDisconnectedAsync(Exception? exception)
        {
            if (ConnectedUsers.TryRemove(Context.ConnectionId, out var username))
            {
                if (UserRooms.TryRemove(Context.ConnectionId, out var roomId))
                {
                    await Clients.OthersInGroup(roomId).SendAsync("UserLeft", username);
                    
                    var usersInRoom = ConnectedUsers
                        .Where(x => UserRooms.ContainsKey(x.Key) && UserRooms[x.Key] == roomId)
                        .Select(x => x.Value)
                        .ToList();
                    await Clients.Group(roomId).SendAsync("UpdateUserList", usersInRoom);
                }
            }
            await base.OnDisconnectedAsync(exception);
        }

        // Yoklama için aktif listeyi döndür
        public static List<string> GetActiveUsersInRoom(string roomId)
        {
            return ConnectedUsers
                .Where(x => UserRooms.ContainsKey(x.Key) && UserRooms[x.Key] == roomId)
                .Select(x => x.Value)
                .Distinct()
                .ToList();
        }
    }
}
