using Microsoft.AspNetCore.SignalR;

namespace HalkEgitimSistemi.Hubs
{
    public class AdminHub : Hub
    {
        // Adminlerin dinlediği odaya katılma
        public async Task JoinAdminGroup()
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, "Admins");
        }

        // Genel bildirim gönderme
        public async Task SendNotification(string message)
        {
            await Clients.Group("Admins").SendAsync("ReceiveNotification", message);
        }
    }
}
