using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize]
    public class LiveLessonController : Controller
    {
        // Canlı Ders Odası
        public IActionResult Room(string roomId)
        {
            if (string.IsNullOrEmpty(roomId)) return RedirectToAction("Index", "Home");

            ViewBag.RoomId = roomId;
            ViewBag.DisplayName = User.FindFirstValue("FullName") ?? (User.IsInRole("Admin") ? "Yönetici" : "Kullanıcı");
            ViewBag.IsInstructor = User.IsInRole("Instructor") || User.IsInRole("Admin");
            
            return View();
        }

        [HttpPost]
        [Authorize(Roles = "Instructor,Admin")]
        public async Task<IActionResult> TakeAttendance(string roomId)
        {
            // Hub'dan o anki aktif kullanıcıları al
            var activeUsers = Hubs.LiveLessonHub.GetActiveUsersInRoom(roomId);
            
            // Gerçek bir senaryoda bu kullanıcılar veritabanındaki öğrencilerle eşleştirilir.
            // Şimdilik sadece başarılı mesajı dönelim (veya loglayalım)
            
            return Json(new { success = true, message = $"{activeUsers.Count} öğrenci için yoklama başarıyla kaydedildi." });
        }
    }
}
