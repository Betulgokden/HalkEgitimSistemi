using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using HalkEgitimSistemi.Data;
using Microsoft.AspNetCore.Mvc.Rendering;
using HalkEgitimSistemi.Models;

namespace HalkEgitimSistemi.Controllers
{
    public class AccountController : Controller
    {
        private readonly AppDbContext _context;

        public AccountController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Login()
        {
            // Eğitmen listesini gönder (ID = Instructor.Id)
            ViewBag.InstructorCourses = _context.Instructors
                .Include(i => i.Course)
                .Where(i => i.CourseId != null)
                .Select(i => new { i.Id, CourseName = i.Course!.CourseName + " (" + i.FullName + ")" })
                .ToList();
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(string username, string password, string role, int? instructorCourseId)
        {
            // 1. YÖNETİCİ GİRİŞİ
            if (role == "Admin")
            {
                if (username == "admin" && password == "123")
                {
                    var claims = new List<Claim> 
                    { 
                        new Claim(ClaimTypes.Name, "Sistem Yöneticisi"),
                        new Claim(ClaimTypes.Role, "Admin")
                    };
                    var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));
                    return RedirectToAction("Dashboard", "Admin");
                }
            }
            // 2. ÖĞRETMEN GİRİŞİ — Ad Soyad + Şifre + Seçilen Kurs Doğrulaması
            else if (role == "Instructor")
            {
                // Önce seçilen eğitmeni ID'den bulalım (Daha güvenli ve kesin)
                Instructor? instructor = null;
                if (instructorCourseId.HasValue)
                {
                    instructor = await _context.Instructors
                        .Include(i => i.Course)
                        .FirstOrDefaultAsync(i => i.Id == instructorCourseId.Value);
                }

                if (instructor != null)
                {
                    // Şifre kontrolü
                    bool isPasswordCorrect = instructor.Password == password;
                    
                    // İsim kontrolü (Esnek: "Ahmet Yılmaz", "Dr. Ahmet Yılmaz" içerisinde var mı bakıyoruz)
                    // Hem kullanıcı adını hem tam adı kontrol ediyoruz
                    string typedName = (username ?? "").ToLower().Trim();
                    string dbFullName = (instructor.FullName ?? "").ToLower().Trim();
                    string dbUsername = (instructor.Username ?? "").ToLower().Trim();

                    bool isNameMatch = dbFullName.Contains(typedName) || typedName.Contains(dbFullName) || dbUsername == typedName;

                    if (isPasswordCorrect && isNameMatch)
                    {
                        var claims = new List<Claim> 
                        { 
                            new Claim(ClaimTypes.Name, instructor.FullName),
                            new Claim(ClaimTypes.Role, "Instructor"),
                            new Claim("InstructorId", instructor.Id.ToString()),
                            new Claim("CourseId", instructor.CourseId?.ToString() ?? "0")
                        };
                        var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                        await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));
                        return RedirectToAction("Dashboard", "Teacher");
                    }
                }
            }

            ViewBag.Error = "Hatalı Ad Soyad, şifre veya kurs seçimi!";
            ViewBag.InstructorCourses = _context.Instructors
                .Include(i => i.Course)
                .Where(i => i.CourseId != null)
                .Select(i => new { i.Id, CourseName = i.Course!.CourseName + " (" + i.FullName + ")" })
                .ToList();
            return View();
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Index", "Home");
        }
    }
}