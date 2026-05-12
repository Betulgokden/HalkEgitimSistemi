using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HalkEgitimSistemi.Controllers
{
    public class SuccessStoriesController : Controller
    {
        private readonly AppDbContext _context;

        public SuccessStoriesController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            // İstatistikleri çek
            ViewBag.EmployedCount = await _context.Students.CountAsync(s => s.IsEmployed);
            ViewBag.BusinessCount = await _context.Students.CountAsync(s => s.StartedBusiness);
            ViewBag.TotalGraduates = await _context.Applications.CountAsync(a => a.IsCompleted);

            var stories = await _context.SuccessStories
                .Include(s => s.Course)
                .Include(s => s.Student)
                .Where(s => s.IsActive)
                .OrderByDescending(s => s.CreatedAt)
                .ToListAsync();

            return View(stories);
        }

        public async Task<IActionResult> Details(int id)
        {
            var story = await _context.SuccessStories
                .Include(s => s.Course)
                .Include(s => s.Student)
                .FirstOrDefaultAsync(s => s.Id == id);

            if (story == null) return NotFound();

            // YouTube linkini embed formatına çevir
            if (!string.IsNullOrEmpty(story.VideoUrl))
            {
                story.VideoUrl = ConvertToYoutubeEmbed(story.VideoUrl);
            }

            return View(story);
        }

        private string ConvertToYoutubeEmbed(string url)
        {
            if (url.Contains("watch?v="))
            {
                return url.Replace("watch?v=", "embed/");
            }
            if (url.Contains("youtu.be/"))
            {
                return url.Replace("youtu.be/", "youtube.com/embed/");
            }
            return url;
        }
    }
}
