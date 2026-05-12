using Microsoft.EntityFrameworkCore;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using HalkEgitimSistemi.Data;

namespace HalkEgitimSistemi.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;

        public HomeController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            try
            {
                var haberler = await _context.News.OrderByDescending(n => n.PublishDate).Take(10).ToListAsync();
                ViewBag.Neighborhoods = await _context.Neighborhoods.ToListAsync();
                
                var settings = await _context.SiteSettings
                    .Where(s => s.Group == "SocialResponsibility" || s.Group == "Stats")
                    .ToListAsync();
                
                ViewBag.KaragolProgress = settings.FirstOrDefault(s => s.Key == "KaragolGoalProgress")?.Value ?? "0";
                ViewBag.KaragolTarget = settings.FirstOrDefault(s => s.Key == "KaragolGoalTarget")?.Value ?? "500";
                ViewBag.LeaderNeighborhood = settings.FirstOrDefault(s => s.Key == "LeaderNeighborhood")?.Value ?? "-";
                
                ViewBag.JobPostings = await _context.JobPostings
                    .Where(j => j.IsActive && !j.IsDeleted)
                    .OrderByDescending(j => j.Id)
                    .Take(6)
                    .ToListAsync();

                ViewBag.NewestCourses = await _context.Courses
                    .Where(c => c.IsActive && !c.IsDeleted)
                    .OrderByDescending(c => c.Id)
                    .Take(5)
                    .ToListAsync();

                return View(haberler);
            }
            catch (Exception ex)
            {
                // Kritik: Veritabanı hatası olsa bile ana sayfanın açılmasını sağla
                ViewBag.Neighborhoods = new List<Neighborhood>();
                ViewBag.KaragolProgress = "0";
                ViewBag.KaragolTarget = "500";
                ViewBag.LeaderNeighborhood = "-";
                return View(new List<News>());
            }
        }



        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}