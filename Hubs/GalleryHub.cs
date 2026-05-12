using Microsoft.AspNetCore.SignalR;

namespace HalkEgitimSistemi.Hubs
{
    public class GalleryHub : Hub
    {
        public async Task SendLike(int galleryItemId)
        {
            await Clients.All.SendAsync("ReceiveLike", galleryItemId);
        }

        public async Task SendComment(int galleryItemId, string user, string content, decimal? x, decimal? y)
        {
            await Clients.All.SendAsync("ReceiveComment", galleryItemId, user, content, x, y);
        }
    }
}
