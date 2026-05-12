using Microsoft.AspNetCore.Mvc;
using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using System.Linq;
using System;
using System.Threading.Tasks;

namespace HalkEgitimSistemi.Controllers
{
    public class IdeaBankController : Controller
    {
        private readonly AppDbContext _context;

        public IdeaBankController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var ideas = _context.Ideas.OrderByDescending(i => i.Likes).ToList();
            return View(ideas);
        }

        [HttpPost]
        public async Task<IActionResult> SubmitIdea(string title, string category, string description, string author)
        {
            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(description))
            {
                return Json(new { success = false, message = "Lütfen başlık ve açıklama alanlarını doldurun." });
            }

            var idea = new Idea
            {
                Title = title,
                Category = category,
                Description = description,
                AuthorName = string.IsNullOrEmpty(author) ? "Anonim" : author,
                CreatedAt = DateTime.Now,
                Likes = 0
            };

            _context.Ideas.Add(idea);
            await _context.SaveChangesAsync();

            return Json(new { success = true, message = "Fikriniz kumbaraya atıldı! Teşekkürler." });
        }

        [HttpPost]
        public async Task<IActionResult> LikeIdea(int id)
        {
            var idea = await _context.Ideas.FindAsync(id);
            if (idea != null)
            {
                idea.Likes++;
                await _context.SaveChangesAsync();
                return Json(new { success = true, newLikes = idea.Likes });
            }
            return Json(new { success = false });
        }
    }
}
