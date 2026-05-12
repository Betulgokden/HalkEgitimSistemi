using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Http;
using System.Security.Claims;

namespace HalkEgitimSistemi.Services
{
    public interface IAuditService
    {
        Task LogActionAsync(string action, string message, string? controller = null);
    }

    public class AuditService : IAuditService
    {
        private readonly AppDbContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public AuditService(AppDbContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task LogActionAsync(string action, string message, string? controller = null)
        {
            var httpContext = _httpContextAccessor.HttpContext;
            var userEmail = httpContext?.User?.Identity?.Name ?? "Sistem";
            var ipAddress = httpContext?.Connection?.RemoteIpAddress?.ToString();

            var logEntry = new LogEntry
            {
                UserEmail = userEmail,
                Action = action,
                Message = message,
                Timestamp = DateTime.Now,
                IpAddress = ipAddress,
                ControllerName = controller
            };

            _context.LogEntries.Add(logEntry);
            await _context.SaveChangesAsync();
        }
    }
}
