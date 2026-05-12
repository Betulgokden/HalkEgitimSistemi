using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace HalkEgitimSistemi.Controllers
{
    [Authorize(Roles = "Instructor")]
    public class TeacherController : Controller
    {
        // ──────────────────────────────────────────────────────
        // QUIZ SORU YÖNETİMİ (Eğitmen Yetkisiyle)
        // ──────────────────────────────────────────────────────
        public async Task<IActionResult> ManageQuiz()
        {
            var questions = await _context.QuizQuestions
                .OrderByDescending(q => q.CreatedAt)
                .ToListAsync();
            return View(questions);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddQuizQuestion(QuizQuestion question)
        {
            if (ModelState.IsValid)
            {
                question.CreatedAt = DateTime.Now;
                _context.QuizQuestions.Add(question);
                await _context.SaveChangesAsync();
                TempData["Success"] = "Soru başarıyla eklendi.";
            }
            return RedirectToAction(nameof(ManageQuiz));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteQuizQuestion(int id)
        {
            var question = await _context.QuizQuestions.FindAsync(id);
            if (question != null)
            {
                _context.QuizQuestions.Remove(question);
                await _context.SaveChangesAsync();
                TempData["Info"] = "Soru silindi.";
            }
            return RedirectToAction(nameof(ManageQuiz));
        }

        private readonly AppDbContext _context;

        public TeacherController(AppDbContext context)
        {
            _context = context;
        }

        private int GetCourseId() => int.Parse(User.FindFirstValue("CourseId") ?? "0");
        private int GetInstructorId() => int.Parse(User.FindFirstValue("InstructorId") ?? "0");

        // ===================== DASHBOARD =====================
        public async Task<IActionResult> Dashboard()
        {
            int instructorId = GetInstructorId();
            int courseId = GetCourseId();
            
            if (instructorId == 0) return RedirectToAction("Login", "Account");

            var course = await _context.Courses.Include(c => c.Category).FirstOrDefaultAsync(c => c.Id == courseId);
            ViewBag.Course = course;
            ViewBag.CourseName = course?.CourseName ?? "Bilinmeyen Kurs";

            // Kursiyerler (Başvurular)
            var myStudents = await _context.Applications
                .Include(a => a.Attendances)
                .Where(a => a.CourseId == courseId && !a.IsDeleted)
                .OrderByDescending(a => a.ApplyDate)
                .ToListAsync();

            // Mesajlar
            var myMessages = await _context.Messages
                .Where(m => m.ReceiverInstructorId == instructorId)
                .OrderByDescending(m => m.Date)
                .ToListAsync();
            
            ViewBag.Messages = myMessages;
            ViewBag.UnreadCount = myMessages.Count(m => !m.IsRead);

            return View(myStudents);
        }

        // ===================== PROFİLİM =====================
        public async Task<IActionResult> MyProfile()
        {
            var instructor = await _context.Instructors
                .Include(i => i.Course)
                .FirstOrDefaultAsync(i => i.Id == GetInstructorId());
            if (instructor == null) return NotFound();

            return View(instructor);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> MyProfile(Instructor instructor, Microsoft.AspNetCore.Http.IFormFile? profileImage, Microsoft.AspNetCore.Http.IFormFile? cvFile)
        {
            if (instructor.Id != GetInstructorId()) return Forbid();

            var entry = await _context.Instructors.FindAsync(instructor.Id);
            if (entry == null) return NotFound();

            // Profil Resmi Yükleme
            if (profileImage != null && profileImage.Length > 0)
            {
                var uploadsFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "img", "profiles");
                if (!Directory.Exists(uploadsFolder)) Directory.CreateDirectory(uploadsFolder);

                var uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(profileImage.FileName);
                var filePath = Path.Combine(uploadsFolder, uniqueFileName);

                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await profileImage.CopyToAsync(fileStream);
                }
                entry.ImageUrl = "/img/profiles/" + uniqueFileName;
            }

            // CV Yükleme
            if (cvFile != null && cvFile.Length > 0)
            {
                var cvFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "cv");
                if (!Directory.Exists(cvFolder)) Directory.CreateDirectory(cvFolder);

                var uniqueCvName = Guid.NewGuid().ToString() + Path.GetExtension(cvFile.FileName);
                var filePath = Path.Combine(cvFolder, uniqueCvName);

                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await cvFile.CopyToAsync(fileStream);
                }
                entry.CvFilePath = "/uploads/cv/" + uniqueCvName;
            }

            entry.FullName = instructor.FullName;
            entry.Title = instructor.Title;
            if (!string.IsNullOrEmpty(instructor.Password))
            {
                entry.Password = instructor.Password;
            }

            await _context.SaveChangesAsync();
            TempData["Success"] = "Profiliniz ve CV'niz başarıyla güncellendi.";
            return RedirectToAction(nameof(MyProfile));
        }

        // ===================== KURS DÜZENLEME =====================
        public async Task<IActionResult> EditCourse()
        {
            int courseId = GetCourseId();
            var course = await _context.Courses
                .Include(c => c.Category)
                .FirstOrDefaultAsync(c => c.Id == courseId);

            if (course == null) return NotFound();

            ViewBag.CategoryId = new SelectList(_context.Categories, "Id", "CategoryName", course.CategoryId);
            return View(course);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditCourse(Course course)
        {
            int myCourseId = GetCourseId();
            if (course.Id != myCourseId) return Forbid();

            var entry = await _context.Courses.FindAsync(course.Id);
            if (entry == null) return NotFound();

            // Güncelle
            entry.CourseName = course.CourseName;
            entry.Description = course.Description;
            entry.ImageUrl = course.ImageUrl;
            entry.Quota = course.Quota;
            entry.DurationHours = course.DurationHours;
            entry.StartDate = course.StartDate;
            entry.EndDate = course.EndDate;
            entry.IsActive = course.IsActive;
            entry.CategoryId = course.CategoryId;

            await _context.SaveChangesAsync();
            TempData["Success"] = "Kurs bilgileri başarıyla güncellendi!";
            return RedirectToAction(nameof(Dashboard));
        }

        // ===================== ÖĞRENCİ TAM GÜNCELLEME =====================
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UpdateStudentStatus(
            int id,
            ApplicationStatus status,
            string? adminNote,
            string? firstName,
            string? lastName,
            string? email,
            string? phoneNumber,
            string? tcNo,
            string? birthPlace,
            DateTime? dateOfBirth,
            string? educationLevel)
        {
            var application = await _context.Applications.FirstOrDefaultAsync(a => a.Id == id && !a.IsDeleted);
            if (application == null) return NotFound();

            if (application.CourseId != GetCourseId()) return Forbid();

            // Durum & Not
            application.Status = status;
            application.AdminNote = adminNote;

            // Öğrenci bilgileri (boş gelmediyse güncelle)
            if (!string.IsNullOrWhiteSpace(firstName))   application.FirstName   = firstName;
            if (!string.IsNullOrWhiteSpace(lastName))    application.LastName    = lastName;
            if (!string.IsNullOrWhiteSpace(email))       application.Email       = email;
            if (!string.IsNullOrWhiteSpace(phoneNumber)) application.PhoneNumber = phoneNumber;
            if (!string.IsNullOrWhiteSpace(tcNo))        application.TcNo        = tcNo;
            if (!string.IsNullOrWhiteSpace(birthPlace))  application.BirthPlace  = birthPlace;
            if (dateOfBirth.HasValue)                    application.DateOfBirth = dateOfBirth.Value;
            if (!string.IsNullOrWhiteSpace(educationLevel)) application.EducationLevel = educationLevel;

            await _context.SaveChangesAsync();
            TempData["Success"] = $"{application.FirstName} {application.LastName} bilgileri güncellendi.";
            return RedirectToAction(nameof(Dashboard));
        }

        // ===================== YOKLAMA SİSTEMİ =====================
        public async Task<IActionResult> Attendance(DateTime? date)
        {
            int courseId = GetCourseId();
            if (courseId == 0) return NotFound();

            var selectedDate = date ?? DateTime.Now.Date;
            
            var students = await _context.Applications
                .Where(a => a.CourseId == courseId && a.Status == ApplicationStatus.Approved && !a.IsDeleted)
                .ToListAsync();

            var existingAttendances = await _context.Attendances
                .Where(at => at.CourseId == courseId && at.Date == selectedDate)
                .ToDictionaryAsync(at => at.ApplicationId, at => at.IsPresent);

            ViewBag.SelectedDate = selectedDate;
            ViewBag.ExistingAttendances = existingAttendances;
            ViewBag.CourseName = (await _context.Courses.FindAsync(courseId))?.CourseName;

            return View(students);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SaveAttendance(DateTime date, Dictionary<int, bool> attendanceData)
        {
            int courseId = GetCourseId();
            
            var oldAttendances = await _context.Attendances
                .Where(at => at.CourseId == courseId && at.Date == date.Date)
                .ToListAsync();
            _context.Attendances.RemoveRange(oldAttendances);

            foreach (var studentId in attendanceData.Keys)
            {
                _context.Attendances.Add(new Attendance
                {
                    ApplicationId = studentId,
                    CourseId = courseId,
                    Date = date.Date,
                    IsPresent = attendanceData[studentId]
                });
            }

            await _context.SaveChangesAsync();
            TempData["Success"] = "Yoklama başarıyla kaydedildi.";
            return RedirectToAction(nameof(Attendance), new { date = date.ToString("yyyy-MM-dd") });
        }

        // ===================== NOT SİSTEMİ =====================
        public async Task<IActionResult> Grading()
        {
            int courseId = GetCourseId();
            if (courseId == 0) return NotFound();

            var students = await _context.Applications
                .Where(a => a.CourseId == courseId && a.Status == ApplicationStatus.Approved && !a.IsDeleted)
                .ToListAsync();

            ViewBag.CourseName = (await _context.Courses.FindAsync(courseId))?.CourseName;
            return View(students);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> SaveGrades(Dictionary<int, int?> grades)
        {
            foreach (var item in grades)
            {
                var app = await _context.Applications.FindAsync(item.Key);
                if (app != null && app.CourseId == GetCourseId())
                {
                    app.ExamGrade = item.Value;
                }
            }

            await _context.SaveChangesAsync();
            TempData["Success"] = "Sınav notları başarıyla güncellendi.";
            return RedirectToAction(nameof(Grading));
        }

        // ===================== DERS MATERYALLERİ =====================
        public async Task<IActionResult> Materials()
        {
            int courseId = GetCourseId();
            var course = await _context.Courses.FindAsync(courseId);
            ViewBag.Course = course;
            var materials = await _context.CourseResources
                .Where(r => r.CourseId == courseId)
                .OrderByDescending(r => r.UploadDate)
                .ToListAsync();
            return View(materials);
        }

        [HttpPost]
        public async Task<IActionResult> UploadMaterial(IFormFile file, string title, string description, string resourceType)
        {
            int courseId = GetCourseId();
            if (file != null && file.Length > 0)
            {
                var uploadsDir = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads", "materials");
                Directory.CreateDirectory(uploadsDir);
                var fileName = Guid.NewGuid() + Path.GetExtension(file.FileName);
                var filePath = Path.Combine(uploadsDir, fileName);
                using (var stream = new FileStream(filePath, FileMode.Create))
                    await file.CopyToAsync(stream);

                _context.CourseResources.Add(new CourseResource
                {
                    CourseId = courseId,
                    Title = title ?? file.FileName,
                    FilePath = "/uploads/materials/" + fileName,
                    FileType = resourceType ?? "Diğer",
                    UploadDate = DateTime.Now
                });
                await _context.SaveChangesAsync();
                TempData["Success"] = "Materyal başarıyla yüklendi!";
            }
            return RedirectToAction(nameof(Materials));
        }

        [HttpPost]
        public async Task<IActionResult> DeleteMaterial(int id)
        {
            var mat = await _context.CourseResources.FindAsync(id);
            if (mat != null && mat.CourseId == GetCourseId())
            {
                _context.CourseResources.Remove(mat);
                await _context.SaveChangesAsync();
                TempData["Success"] = "Materyal silindi.";
            }
            return RedirectToAction(nameof(Materials));
        }

        // ===================== DUYURULAR =====================
        public async Task<IActionResult> Announcements()
        {
            int courseId = GetCourseId();
            var course = await _context.Courses.FindAsync(courseId);
            ViewBag.Course = course;
            var students = await _context.Applications
                .Include(a => a.Student)
                .Where(a => a.CourseId == courseId && a.Status == ApplicationStatus.Approved && !a.IsDeleted)
                .Select(a => a.Student)
                .ToListAsync();
            ViewBag.StudentCount = students.Count;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SendAnnouncement(string subject, string message)
        {
            int courseId = GetCourseId();
            int instructorId = GetInstructorId();
            var students = await _context.Applications
                .Include(a => a.Student)
                .Where(a => a.CourseId == courseId && a.Status == ApplicationStatus.Approved && !a.IsDeleted)
                .Select(a => a.Student)
                .ToListAsync();

            foreach (var student in students.Where(s => s != null))
            {
                _context.Messages.Add(new Message
                {
                    SenderUsername = User.Identity!.Name ?? "Öğretmen",
                    ReceiverInstructorId = 0,
                    Subject = $"📢 Duyuru: {subject}",
                    Content = message,
                    Date = DateTime.Now,
                    IsFromInstructor = true,
                    IsRead = false
                });
            }
            await _context.SaveChangesAsync();
            TempData["Success"] = $"Duyuru {students.Count} öğrenciye gönderildi!";
            return RedirectToAction(nameof(Announcements));
        }

        // ===================== MATERYAL TALEBİ =====================
        public IActionResult MaterialRequest()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SubmitMaterialRequest(string itemName, int quantity, string reason, string urgency)
        {
            // Yöneticiye iç mesaj olarak gönder
            _context.Messages.Add(new Message
            {
                SenderUsername = User.Identity!.Name ?? "Öğretmen",
                ReceiverInstructorId = 0,
                Subject = $"🔧 Materyal Talebi: {itemName} ({quantity} adet)",
                Content = $"Aciliyet: {urgency}\nGerekçe: {reason}",
                Date = DateTime.Now,
                IsFromInstructor = true,
                IsRead = false
            });
            await _context.SaveChangesAsync();
            TempData["Success"] = "Materyal talebiniz yönetime iletildi!";
            return RedirectToAction(nameof(MaterialRequest));
        }

        // ===================== SINIF PERFORMANSI =====================
        public async Task<IActionResult> ClassPerformance()
        {
            int courseId = GetCourseId();
            var course = await _context.Courses.FindAsync(courseId);
            ViewBag.Course = course;

            var apps = await _context.Applications
                .Include(a => a.Attendances)
                .Where(a => a.CourseId == courseId && !a.IsDeleted)
                .ToListAsync();

            int total = apps.Count;
            int approved = apps.Count(a => a.Status == ApplicationStatus.Approved);
            double avgAbsence = apps.Any() ? apps.Average(a => a.Attendances?.Count(at => !at.IsPresent) ?? 0) : 0;
            double avgExam = apps.Where(a => a.ExamGrade.HasValue).Any()
                ? apps.Where(a => a.ExamGrade.HasValue).Average(a => a.ExamGrade!.Value)
                : 0;

            ViewBag.Total = total;
            ViewBag.Approved = approved;
            ViewBag.AvgAbsence = Math.Round(avgAbsence, 1);
            ViewBag.AvgExam = Math.Round(avgExam, 1);
            ViewBag.Apps = apps;

            return View();
        }

        // ===================== E-SERGİ ESER GÖNDER =====================
        public async Task<IActionResult> ExhibitionSubmit()
        {
            int courseId = GetCourseId();
            var galleryItems = await _context.GalleryItems
                .Where(g => !g.IsDeleted)
                .OrderByDescending(g => g.CreatedAt)
                .Take(20)
                .ToListAsync();
            ViewBag.CourseId = courseId;
            return View(galleryItems);
        }

        // ===================== CANLI DERS YÖNETİMİ =====================
        [HttpPost]
        public async Task<IActionResult> ToggleLive(bool start)
        {
            int courseId = GetCourseId();
            var course = await _context.Courses.FindAsync(courseId);
            if (course == null) return NotFound();

            course.IsLive = start;
            if (start)
            {
                course.LiveRoomId = $"Course_{courseId}_{Guid.NewGuid().ToString().Substring(0, 8)}";
            }
            else
            {
                course.LiveRoomId = null;
            }

            await _context.SaveChangesAsync();
            return Json(new { success = true, isLive = course.IsLive, roomId = course.LiveRoomId });
        }
    }
}
