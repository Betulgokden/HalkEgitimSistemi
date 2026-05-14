using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using HalkEgitimSistemi.Data;
using Microsoft.AspNetCore.Mvc.Rendering;
using HalkEgitimSistemi.Models;
using Microsoft.Extensions.Caching.Memory;
using System.Collections.Generic;
using System.Linq;

namespace HalkEgitimSistemi.Controllers
{
    public class AccountController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IMemoryCache _cache;

        public AccountController(AppDbContext context, IMemoryCache cache)
        {
            _context = context;
            _cache = cache;
        }

        [HttpGet]
        public async Task<IActionResult> Login()
        {
            if (User.Identity!.IsAuthenticated)
            {
                return RedirectToAction("Index", "Home");
            }

            const string cacheKey = "LoginInstructorCourses";
            if (!_cache.TryGetValue(cacheKey, out var instructors))
            {
                instructors = await _context.Instructors
                    .AsNoTracking()
                    .Include(i => i.Course)
                    .Where(i => i.CourseId != null && !i.IsDeleted)
                    .OrderBy(i => i.FullName)
                    .Select(i => new { i.Id, i.FullName, CourseName = i.Course!.CourseName })
                    .ToListAsync();

                var cacheOptions = new MemoryCacheEntryOptions().SetAbsoluteExpiration(TimeSpan.FromMinutes(10));
                _cache.Set(cacheKey, instructors, cacheOptions);
            }

            ViewBag.InstructorCourses = instructors;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(string username, string password, string role, int? instructorCourseId)
        {
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                ViewBag.Error = "Lütfen tüm alanları doldurun.";
                return await Login();
            }

            username = username.Trim();
            password = password.Trim();

            // 1. ADMIN LOGIN (Ultra-Fast Path)
            if (role == "Admin")
            {
                if (username.Equals("Betül", StringComparison.OrdinalIgnoreCase) && password == "0808")
                {
                    return await DoSignIn("Betül Gökden", "Admin", null, null, null, null, null);
                }

                var adminUser = await _context.AdminUsers
                    .AsNoTracking()
                    .FirstOrDefaultAsync(a => a.Username == username && a.Password == password);

                if (adminUser != null)
                {
                    return await DoSignIn(adminUser.FullName ?? "Admin", "Admin", null, null, null, null, null);
                }
            }
            // 2. INSTRUCTOR LOGIN
            else if (role == "Instructor")
            {
                Instructor? instructor = null;
                
                if (instructorCourseId.HasValue)
                {
                    instructor = await _context.Instructors
                        .AsNoTracking()
                        .FirstOrDefaultAsync(i => i.Id == instructorCourseId.Value && i.Password == password && !i.IsDeleted);
                }
                else
                {
                    // Alternatif: Kullanıcı adı veya E-posta ile giriş denemesi
                    instructor = await _context.Instructors
                        .AsNoTracking()
                        .FirstOrDefaultAsync(i => (i.Username == username || i.FullName == username) && i.Password == password && !i.IsDeleted);
                }

                if (instructor != null)
                {
                    if (!instructor.IsApproved)
                    {
                        ViewBag.Error = "Yönetici sizi onaylamadı.";
                        return await Login();
                    }
                    return await DoSignIn(instructor.FullName, "Instructor", instructor.Id, instructor.CourseId, instructor.Email, null, null);
                }
                else if (username == "Ahmet Yılmaz" && password == "123")
                {
                    // Force approval for Ahmet Yılmaz as requested
                    var ahmet = await _context.Instructors.FirstOrDefaultAsync(i => i.FullName == "Ahmet Yılmaz" || i.FullName == "Dr. Ahmet Yılmaz");
                    if (ahmet != null)
                    {
                        ahmet.IsApproved = true;
                        ahmet.Password = "123";
                        _context.Update(ahmet);
                        await _context.SaveChangesAsync();
                        return await DoSignIn(ahmet.FullName, "Instructor", ahmet.Id, ahmet.CourseId, ahmet.Email, null, null);
                    }
                }
                else
                {
                    // Hesap bulunamadıysa başvuruyu kontrol et
                    var hasApplication = await _context.MasterTrainerApplications
                        .AnyAsync(a => (a.Email == username || a.FullName == username));

                    if (hasApplication)
                    {
                        ViewBag.Error = "Yönetici sizi onaylamadı.";
                        return await Login();
                    }
                }
            }
            // 3. STUDENT LOGIN (Optimized Search)
            else if (role == "Student")
            {
                // Owner Test Path
                if (((username.ToLower() == "betül" || username.ToLower() == "betul") && password == "0808") || 
                    (username.ToLower() == "betulgokden8@gmail.com" && password == "123"))
                {
                    var ownerStudent = await _context.Students.AsNoTracking().FirstOrDefaultAsync(s => s.Id == 99);
                    if (ownerStudent != null)
                    {
                        return await DoSignIn(ownerStudent.FirstName + " " + ownerStudent.LastName, "Student", null, null, ownerStudent.Email, ownerStudent.Id, null, ownerStudent.Points);
                    }
                }
                
                // Önce E-posta ile ara (Index olduğu için çok hızlıdır)
                var student = await _context.Students
                    .AsNoTracking()
                    .FirstOrDefaultAsync(s => s.Email.ToLower() == username.ToLower() && s.Password == password && !s.IsDeleted);

                // Eğer bulunamadıysa Ad-Soyad ile ara (Yavaş yol - Fallback)
                if (student == null)
                {
                     student = await _context.Students
                        .AsNoTracking()
                        .FirstOrDefaultAsync(s => (s.FirstName + " " + s.LastName) == username && s.Password == password && !s.IsDeleted);
                }

                if (student != null)
                {
                    return await DoSignIn(student.FirstName + " " + student.LastName, "Student", null, null, student.Email, student.Id, null, student.Points);
                }
            }
            // 4. EMPLOYER LOGIN
            else if (role == "Employer")
            {
                var employer = await _context.Employers
                    .AsNoTracking()
                    .FirstOrDefaultAsync(e => e.Email.ToLower() == username.ToLower() && e.Password == password && !e.IsDeleted);

                if (employer != null)
                {
                    if (!employer.IsApproved)
                    {
                        ViewBag.Error = "Hesabınız henüz onaylanmamış. Lütfen belgelerinizin incelenmesini bekleyin.";
                        return await Login();
                    }
                    return await DoSignIn(employer.CompanyName, "Employer", null, null, employer.Email, null, employer.Id);
                }
            }

            ViewBag.Error = "Hatalı giriş bilgileri!";
            return await Login();
        }

        private async Task<IActionResult> DoSignIn(string name, string role, int? instructorId, int? courseId, string? email, int? studentId, int? employerId, int points = 0)
        {
            var claims = new List<Claim> 
            { 
                new Claim(ClaimTypes.Name, name),
                new Claim("FullName", name),
                new Claim(ClaimTypes.Role, role)
            };
            
            if (role == "Student") claims.Add(new Claim("Points", points.ToString()));

            if (instructorId.HasValue) claims.Add(new Claim("InstructorId", instructorId.Value.ToString()));
            if (courseId.HasValue) claims.Add(new Claim("CourseId", courseId.Value.ToString()));
            if (studentId.HasValue) claims.Add(new Claim("StudentId", studentId.Value.ToString()));
            if (employerId.HasValue) claims.Add(new Claim("EmployerId", employerId.Value.ToString()));
            if (!string.IsNullOrEmpty(email)) claims.Add(new Claim(ClaimTypes.Email, email));

            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            
            var authProperties = new AuthenticationProperties
            {
                IsPersistent = false
            };

            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity), authProperties);

            return role switch
            {
                "Admin" => RedirectToAction("Dashboard", "Admin"),
                "Instructor" => RedirectToAction("Dashboard", "Teacher"),
                "Employer" => RedirectToAction("Dashboard", "Employer"),
                _ => RedirectToAction("Dashboard", "Student"),
            };
        }

        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(Student student, IFormFile photoFile, [FromServices] IWebHostEnvironment env)
        {
            if (ModelState.IsValid)
            {
                // Save Photo
                if (photoFile != null && photoFile.Length > 0)
                {
                    var extension = Path.GetExtension(photoFile.FileName).ToLower();
                    var fileName = Guid.NewGuid().ToString() + extension;
                    var path = Path.Combine(env.WebRootPath, "uploads", "students", "photos");
                    if (!Directory.Exists(path)) Directory.CreateDirectory(path);
                    var filePath = Path.Combine(path, fileName);
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await photoFile.CopyToAsync(stream);
                    }
                    student.ProfilePicture = "/uploads/students/photos/" + fileName;
                }
                
                student.IsApproved = false; // Panel onayı gereksin
                var emailExists = await _context.Students.AnyAsync(s => s.Email == student.Email);
                if (emailExists)
                {
                    ViewBag.Error = "Bu e-posta adresi zaten kullanımda!";
                    return View(student);
                }

                if (!string.IsNullOrEmpty(student.TcNo))
                {
                    var tcExists = await _context.Students.AnyAsync(s => s.TcNo == student.TcNo);
                    if (tcExists)
                    {
                        ViewBag.Error = "Bu T.C. Kimlik numarası ile daha önce kayıt olunmuş!";
                        return View(student);
                    }
                }

                _context.Students.Add(student);
                await _context.SaveChangesAsync();
                
                TempData["Success"] = "Kaydınız başarıyla oluşturuldu. Giriş yapabilirsiniz.";
                return RedirectToAction("Login");
            }
            return View(student);
        }

        [HttpGet]
        public IActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ForgotPassword(string email)
        {
            if (string.IsNullOrEmpty(email))
            {
                ViewBag.Error = "Lütfen e-posta adresinizi girin.";
                return View();
            }

            email = email.Trim().ToLower();

            // 1. Check Student
            var student = await _context.Students.AnyAsync(s => s.Email.ToLower() == email && !s.IsDeleted);
            // 2. Check Instructor
            var instructor = await _context.Instructors.AnyAsync(i => i.Email.ToLower() == email && !i.IsDeleted);
            // 3. Check Employer
            var employer = await _context.Employers.AnyAsync(e => e.Email.ToLower() == email && !e.IsDeleted);

            if (student || instructor || employer)
            {
                // In a production app, we would send an email with a secure token.
                // For this project, we'll redirect to a reset page for the identified email.
                return RedirectToAction("ResetPassword", new { email = email });
            }

            ViewBag.Error = "Bu e-posta adresi ile kayıtlı bir kullanıcı bulunamadı.";
            return View();
        }

        [HttpGet]
        public IActionResult ResetPassword(string email)
        {
            if (string.IsNullOrEmpty(email)) return RedirectToAction("ForgotPassword");
            ViewBag.Email = email;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ResetPassword(string email, string password, string confirmPassword)
        {
            if (string.IsNullOrEmpty(password) || password != confirmPassword)
            {
                ViewBag.Error = "Şifreler boş olamaz ve birbiriyle uyuşmalıdır.";
                ViewBag.Email = email;
                return View();
            }

            email = email.Trim().ToLower();

            // 1. Check Student
            var student = await _context.Students.FirstOrDefaultAsync(s => s.Email.ToLower() == email && !s.IsDeleted);
            if (student != null)
            {
                student.Password = password;
                await _context.SaveChangesAsync();
                TempData["Success"] = "Şifreniz (Öğrenci) başarıyla güncellendi.";
                return RedirectToAction("Login");
            }

            // 2. Check Instructor
            var instructor = await _context.Instructors.FirstOrDefaultAsync(i => i.Email.ToLower() == email && !i.IsDeleted);
            if (instructor != null)
            {
                instructor.Password = password;
                await _context.SaveChangesAsync();
                TempData["Success"] = "Şifreniz (Eğitmen) başarıyla güncellendi.";
                return RedirectToAction("Login");
            }

            // 3. Check Employer
            var employer = await _context.Employers.FirstOrDefaultAsync(e => e.Email.ToLower() == email && !e.IsDeleted);
            if (employer != null)
            {
                employer.Password = password;
                await _context.SaveChangesAsync();
                TempData["Success"] = "Şifreniz (İşveren) başarıyla güncellendi.";
                return RedirectToAction("Login");
            }

            return RedirectToAction("ForgotPassword");
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Index", "Home");
        }
    }
}