using Microsoft.AspNetCore.Mvc;
using HalkEgitimSistemi.Data;
using Microsoft.EntityFrameworkCore;

namespace HalkEgitimSistemi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MapController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IConfiguration _configuration;

        public MapController(AppDbContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }

        // 🛑 SECURITY: Serving Map Configuration via Backend Proxy
        // This ensures API Keys (if any) are never exposed directly in frontend JS code.
        [HttpGet("config")]
        public async Task<IActionResult> GetMapConfig()
        {
            // Even though we use Leaflet/OSM (Public), we provide a secure endpoint 
            // for future transitions to Google Maps or Mapbox.
            var config = new
            {
                Provider = "Leaflet/OpenStreetMap",
                Center = new { Lat = 41.2592, Lng = 41.6785 }, // Borçka HEM Coordinates (Hükümet Cad.)
                Zoom = 14,
                Styles = "Cyber-Dark-Vibrant",
                Neighborhoods = await _context.Neighborhoods.ToListAsync(),
                Goal = new
                {
                    Progress = await _context.SiteSettings.Where(s => s.Key == "KaragolGoalProgress").Select(s => s.Value).FirstOrDefaultAsync() ?? "0",
                    Target = await _context.SiteSettings.Where(s => s.Key == "KaragolGoalTarget").Select(s => s.Value).FirstOrDefaultAsync() ?? "500"
                }
            };

            return Ok(config);
        }

        [HttpGet("neighborhoods")]
        public async Task<IActionResult> GetNeighborhoodStats()
        {
            var stats = await _context.Neighborhoods
                .Select(n => new {
                    n.Id,
                    n.Name,
                    n.ActiveStudents,
                    n.Intensity,
                    n.Latitude,
                    n.Longitude
                })
                .ToListAsync();

            return Ok(stats);
        }
    }
}
