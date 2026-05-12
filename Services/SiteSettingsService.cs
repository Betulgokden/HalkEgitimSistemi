using HalkEgitimSistemi.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;

namespace HalkEgitimSistemi.Services
{
    public interface ISiteSettingsService
    {
        Task<string> GetSettingAsync(string key, string defaultValue = "");
        Task<Dictionary<string, string>> GetAllSettingsAsync();
    }

    public class SiteSettingsService : ISiteSettingsService
    {
        private readonly AppDbContext _context;
        private readonly IMemoryCache _cache;
        private const string CacheKey = "GlobalSiteSettings";

        public SiteSettingsService(AppDbContext context, IMemoryCache cache)
        {
            _context = context;
            _cache = cache;
        }

        public async Task<string> GetSettingAsync(string key, string defaultValue = "")
        {
            var settings = await GetAllSettingsAsync();
            return settings.TryGetValue(key, out var value) ? value : defaultValue;
        }

        public async Task<Dictionary<string, string>> GetAllSettingsAsync()
        {
            if (!_cache.TryGetValue(CacheKey, out Dictionary<string, string>? settings) || settings == null)
            {
                settings = await _context.SiteSettings
                    .AsNoTracking()
                    .ToDictionaryAsync(s => s.Key, s => s.Value);

                _cache.Set(CacheKey, settings, TimeSpan.FromMinutes(30));
            }
            return settings;
        }
    }
}
