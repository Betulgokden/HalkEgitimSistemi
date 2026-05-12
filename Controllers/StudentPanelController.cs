using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize(Roles = "Student")]
    public class StudentPanelController : Controller
    {
        private readonly AppDbContext _context;

        public StudentPanelController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var studentIdStr = User.FindFirst("StudentId")?.Value;
            if (string.IsNullOrEmpty(studentIdStr)) return RedirectToAction("Login", "Account");
            
            var studentId = int.Parse(studentIdStr);
            
            var student = await _context.Students
                .Include(s => s.Applications)
                    .ThenInclude(a => a.Course)
                .Include(s => s.Applications)
                    .ThenInclude(a => a.Attendances)
                .FirstOrDefaultAsync(s => s.Id == studentId);

            if (student == null) return NotFound();

            return View(student);
        }

        public async Task<IActionResult> CourseDetails(int id)
        {
            var studentId = int.Parse(User.FindFirst("StudentId")?.Value ?? "0");
            
            var application = await _context.Applications
                .Include(a => a.Course)
                .Include(a => a.Attendances)
                .FirstOrDefaultAsync(a => a.Id == id && a.StudentId == studentId);

            if (application == null) return NotFound();

            return View(application);
        }
    }
}
