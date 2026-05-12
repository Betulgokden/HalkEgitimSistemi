using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.EntityFrameworkCore;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize(Roles = "Student")]
    public class ReviewsController : Controller
    {
        private readonly AppDbContext _context;

        public ReviewsController(AppDbContext context)
        {
            _context = context;
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SubmitReview(int courseId, int rating, string comment)
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");

            // Zaten yorum yapmış mı?
            var existing = await _context.CourseReviews
                .FirstOrDefaultAsync(r => r.CourseId == courseId && r.StudentId == studentId);

            if (existing != null)
            {
                existing.Rating = rating;
                existing.Comment = comment;
                existing.CreatedAt = DateTime.Now;
                _context.Update(existing);
            }
            else
            {
                var review = new CourseReview
                {
                    CourseId = courseId,
                    StudentId = studentId,
                    Rating = rating,
                    Comment = comment
                };
                _context.CourseReviews.Add(review);
            }

            await _context.SaveChangesAsync();
            TempData["Success"] = "Değerlendirmeniz için teşekkürler!";
            return RedirectToAction("CourseDetail", "Courses", new { id = courseId });
        }
    }
}
