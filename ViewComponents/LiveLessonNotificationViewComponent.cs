using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HalkEgitimSistemi.Data;
using System.Security.Claims;

namespace HalkEgitimSistemi.ViewComponents
{
    public class LiveLessonNotificationViewComponent : ViewComponent
    {
        private readonly AppDbContext _context;

        public LiveLessonNotificationViewComponent(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            if (!User.Identity!.IsAuthenticated || !User.IsInRole("Student"))
            {
                return Content(string.Empty);
            }

            var studentIdStr = HttpContext.User.Claims.FirstOrDefault(c => c.Type == "StudentId")?.Value;
            if (int.TryParse(studentIdStr, out int studentId))
            {
                var liveCourses = await _context.Applications
                    .Include(a => a.Course)
                    .Where(a => a.StudentId == studentId && a.Status == Models.ApplicationStatus.Approved && a.Course!.IsLive)
                    .Select(a => a.Course)
                    .ToListAsync();

                if (liveCourses.Any())
                {
                    return View(liveCourses);
                }
            }

            return Content(string.Empty);
        }
    }
}
