using System.ComponentModel.DataAnnotations;

namespace HalkEgitimSistemi.Models
{
    public class LibraryBookPage
    {
        public int Id { get; set; }

        public int LibraryBookId { get; set; }
        public LibraryBook? LibraryBook { get; set; }

        public int PageNumber { get; set; }

        public string ImageUrl { get; set; } = string.Empty;

        // Metin okuma (Text-to-Speech) için sayfanın düz metni
        public string TextContent { get; set; } = string.Empty;
    }
}
