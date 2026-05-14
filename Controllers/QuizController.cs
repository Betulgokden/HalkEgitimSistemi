using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using System;
using System.Linq;
using System.Threading.Tasks;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize]
    public class QuizController : Controller
    {
        private readonly AppDbContext _context;

        public QuizController(AppDbContext context)
        {
            _context = context;
        }

        // Yarışma Ana Sayfası
        public async Task<IActionResult> Index()
        {
            var topStudents = await _context.Students
                .Where(s => !s.IsDeleted)
                .OrderByDescending(s => s.Points)
                .Take(10)
                .ToListAsync();

            ViewBag.RecentMatches = await _context.QuizMatches
                .Include(m => m.Student)
                .OrderByDescending(m => m.MatchDate)
                .Take(5)
                .ToListAsync();

            return View(topStudents);
        }

        // Yeni Bir Maç Başlat
        public async Task<IActionResult> StartMatch()
        {
            // Veritabanından rastgele 5 soru çekelim
            var questions = await _context.QuizQuestions
                .OrderBy(r => Guid.NewGuid())
                .Take(5)
                .ToListAsync();

            if (!questions.Any())
            {
                questions = new List<QuizQuestion>
                {
                    new QuizQuestion { Id = 1, QuestionText = "Aşağıdakilerden hangisi bir programlama dili DEĞİLDİR?", OptionA = "Python", OptionB = "Java", OptionC = "HTML", OptionD = "C#", CorrectAnswer = "C", Category = "Yazılım" },
                    new QuizQuestion { Id = 2, QuestionText = "Hangisi bir işletim sistemi türüdür?", OptionA = "Linux", OptionB = "Google Chrome", OptionC = "Microsoft Word", OptionD = "Photoshop", CorrectAnswer = "A", Category = "Bilişim" },
                    new QuizQuestion { Id = 3, QuestionText = "İnternet bağlantısı için hangisi gereklidir?", OptionA = "Yazıcı", OptionB = "Modem", OptionC = "Tarayıcı (Scanner)", OptionD = "Hoparlör", CorrectAnswer = "B", Category = "Donanım" },
                    new QuizQuestion { Id = 4, QuestionText = "Halk Eğitim sistemimizde kaç farklı eğitim modeli bulunmaktadır?", OptionA = "1", OptionB = "2", OptionC = "3", OptionD = "4", CorrectAnswer = "C", Category = "Genel" },
                    new QuizQuestion { Id = 5, QuestionText = "Yapay zeka modellerini eğitmek için kullanılan veri kümesine ne ad verilir?", OptionA = "Dataset", OptionB = "Software", OptionC = "Hardware", OptionD = "Network", CorrectAnswer = "A", Category = "Yapay Zeka" }
                };
            }

            return View("Match", questions);
        }

        // Maç Sonucunu Kaydet (AI Geri Bildirimli)
        [HttpPost]
        public async Task<IActionResult> SubmitResult(int score, int correct, int wrong, string? weakAreas)
        {
            // Kullanıcı oturumundan StudentId claim'ini al
            var studentIdClaim = User.FindFirstValue("StudentId");
            if (string.IsNullOrEmpty(studentIdClaim)) 
            {
                // Eğer StudentId yoksa (Admin veya Instructor ise), işlemi reddet veya uygun şekilde yönet
                return Json(new { success = false, message = "Sadece kursiyerler puan kaydedebilir." });
            }

            int studentId = int.Parse(studentIdClaim);
            var student = await _context.Students.FirstOrDefaultAsync(s => s.Id == studentId);
            if (student == null) return BadRequest();

            // Puan ve ELO Güncelleme (Basit ELO mantığı)
            student.Points += score;
            student.TotalMatches += 1;
            if (correct > wrong) {
                student.Wins += 1;
                student.EloRating += 25;
            } else {
                student.EloRating -= 15;
            }

            // AI Geri Bildirim Simülasyonu
            string aiFeedback = correct >= 4 
                ? "Mükemmel bir performans! Bilgi düzeyin standartların çok üzerinde." 
                : "Güzel bir deneme. Özellikle belirttiğin zayıf alanlarda kütüphane kaynaklarımıza göz atabilirsin.";

            var match = new QuizMatch
            {
                StudentId = student.Id,
                Score = score,
                CorrectAnswers = correct,
                WrongAnswers = wrong,
                MatchDate = DateTime.Now,
                AiFeedback = aiFeedback,
                WeakAreas = weakAreas,
                IsFreeCourseAwarded = score >= 400 // Örnek: 400 puan üstüne ödül
            };

            _context.QuizMatches.Add(match);
            await _context.SaveChangesAsync();

            return Json(new { success = true, feedback = aiFeedback, awarded = match.IsFreeCourseAwarded });
        }
    }
}
