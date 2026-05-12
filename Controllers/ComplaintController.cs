using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HalkEgitimSistemi.Controllers
{
    public class ComplaintController : Controller
    {
        private readonly AppDbContext _context;

        public ComplaintController(AppDbContext context)
        {
            _context = context;
        }

        // GET: Complaint/Create — Herkes erişebilir
        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        // POST: Complaint/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Complaint model)
        {
            if (!ModelState.IsValid)
                return View(model);

            model.CreatedAt = DateTime.Now;
            model.Status = ComplaintStatus.Pending;

            _context.Complaints.Add(model);
            await _context.SaveChangesAsync();

            TempData["Success"] = "Şikayetiniz alındı. Yöneticimiz en kısa sürede inceleyecektir.";
            return RedirectToAction("Create");
        }

        // GET: Admin/Complaints — Sadece admin
        [Authorize(Roles = "Admin")]
        [HttpGet]
        public async Task<IActionResult> AdminIndex(ComplaintStatus? status, ComplaintCategory? category)
        {
            var query = _context.Complaints.AsQueryable();

            if (status.HasValue)
                query = query.Where(c => c.Status == status);
            if (category.HasValue)
                query = query.Where(c => c.Category == category);

            var complaints = await query
                .OrderByDescending(c => c.CreatedAt)
                .ToListAsync();

            ViewBag.StatusFilter = status;
            ViewBag.CategoryFilter = category;
            ViewBag.PendingCount = await _context.Complaints.CountAsync(c => c.Status == ComplaintStatus.Pending);

            return View("~/Views/Admin/Complaints.cshtml", complaints);
        }

        // POST: Complaint/Review — Admin şikayeti günceller
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Review(int id, ComplaintStatus status, string? adminNote)
        {
            var complaint = await _context.Complaints.FindAsync(id);
            if (complaint == null) return NotFound();

            complaint.Status = status;
            complaint.AdminNote = adminNote;
            complaint.ReviewedAt = DateTime.Now;

            await _context.SaveChangesAsync();
            TempData["Success"] = "Şikayet güncellendi.";
            return RedirectToAction(nameof(AdminIndex));
        }

        // DELETE: Complaint/Delete
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            var complaint = await _context.Complaints.FindAsync(id);
            if (complaint == null) return NotFound();

            _context.Complaints.Remove(complaint);
            await _context.SaveChangesAsync();

            TempData["Success"] = "Şikayet silindi.";
            return RedirectToAction(nameof(AdminIndex));
        }
    }
}
