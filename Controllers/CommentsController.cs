using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;

namespace HalkEgitimSistemi.Controllers
{
    public class CommentsController : Controller
    {
        private readonly AppDbContext _context;
        private readonly Services.IProfanityFilterService _filter;

        public CommentsController(AppDbContext context, Services.IProfanityFilterService filter)
        {
            _context = context;
            _filter = filter;
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddComment([Bind("CourseId,UserEmail,Content,Rating")] Comment comment)
        {
            if (ModelState.IsValid)
            {
                // 1. BAN KONTROLÜ
                if (await _filter.IsUserBannedAsync(comment.UserEmail))
                {
                    TempData["Error"] = "İhlal puanınız nedeniyle yorum yapma yetkiniz kısıtlanmıştır.";
                    return RedirectToAction("CourseDetail", "Courses", new { id = comment.CourseId });
                }

                // 2. KÜFÜR FİLTRESİ
                string filtered = _filter.Filter(comment.Content, out bool wasCensored);
                if (wasCensored)
                {
                    await _filter.ApplyPenaltyAsync(comment.UserEmail, "Kullanıcı", comment.Content);
                    comment.Content = filtered;
                    TempData["Warning"] = "Yorumunuz filtreye takıldığı için düzenlendi. Lütfen nezaket kurallarına uyunuz!";
                }

                comment.CreatedAt = DateTime.Now;
                _context.Add(comment);
                await _context.SaveChangesAsync();
                
                return RedirectToAction("CourseDetail", "Courses", new { id = comment.CourseId });
            }
            
            return RedirectToAction("CourseDetail", "Courses", new { id = comment.CourseId });
        }
    }
}
