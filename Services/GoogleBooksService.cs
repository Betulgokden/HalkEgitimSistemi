using System.Net.Http.Json;
using HalkEgitimSistemi.Models;

namespace HalkEgitimSistemi.Services
{
    public class GoogleBooksService
    {
        private readonly HttpClient _httpClient;

        public GoogleBooksService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<List<LibraryBook>> SearchBooksAsync(string category, int maxResults = 12)
        {
            try
            {
                // Google Books API query (subject filter)
                var url = $"https://www.googleapis.com/books/v1/volumes?q=subject:{category}&maxResults={maxResults}&orderBy=relevance&langRestrict=tr";
                var response = await _httpClient.GetFromJsonAsync<GoogleBooksResponse>(url);

                if (response?.Items == null) return new List<LibraryBook>();

                return response.Items.Select(item => new LibraryBook
                {
                    Title = item.VolumeInfo.Title,
                    Author = item.VolumeInfo.Authors != null ? string.Join(", ", item.VolumeInfo.Authors) : "Bilinmeyen Yazar",
                    Category = category,
                    Description = item.VolumeInfo.Description ?? "Açıklama bulunmuyor.",
                    CoverImageUrl = item.VolumeInfo.ImageLinks?.Thumbnail?.Replace("http://", "https://") ?? "https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=400",
                    PreviewLink = item.VolumeInfo.PreviewLink?.Replace("http://", "https://") ?? string.Empty,
                    PublishedDate = item.VolumeInfo.PublishedDate ?? "Bilinmiyor",
                    PageCount = item.VolumeInfo.PageCount
                }).ToList();
            }
            catch (Exception ex)
            {
                // Log exception if needed
                Console.WriteLine($"API Error: {ex.Message}");
                return new List<LibraryBook>();
            }
        }
    }

    // JSON DTOs for Google Books API
    public class GoogleBooksResponse
    {
        public List<GoogleBookItem>? Items { get; set; }
    }

    public class GoogleBookItem
    {
        public GoogleVolumeInfo VolumeInfo { get; set; } = new();
    }

    public class GoogleVolumeInfo
    {
        public string Title { get; set; } = string.Empty;
        public List<string>? Authors { get; set; }
        public string? Description { get; set; }
        public GoogleImageLinks? ImageLinks { get; set; }
        public string? PreviewLink { get; set; }
        public string? PublishedDate { get; set; }
        public int PageCount { get; set; }
    }

    public class GoogleImageLinks
    {
        public string? Thumbnail { get; set; }
    }
}
