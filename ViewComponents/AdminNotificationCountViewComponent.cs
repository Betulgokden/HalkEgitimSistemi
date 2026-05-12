using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HalkEgitimSistemi.ViewComponents
{
    public class AdminNotificationCountViewComponent : ViewComponent
    {
        private readonly AppDbContext _context;

        public AdminNotificationCountViewComponent(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            // Pending Student Applications
            var studentAppCount = await _context.Applications.CountAsync(a => a.Status == ApplicationStatus.Pending && !a.IsDeleted);
            
            // Pending Instructor Applications
            var instructorAppCount = await _context.MasterTrainerApplications.CountAsync(a => a.Status == TrainerApplicationStatus.Pending);

            var total = studentAppCount + instructorAppCount;

            return View(total);
        }
    }
}
