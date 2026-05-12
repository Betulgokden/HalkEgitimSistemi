using HalkEgitimSistemi.Data;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HalkEgitimSistemi.Controllers
{
    public class EventsController : Controller
    {
        private readonly AppDbContext _context;

        public EventsController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        // API for FullCalendar.js
        [HttpGet]
        public async Task<IActionResult> GetEvents(bool onlyMine = false)
        {
            var allEvents = new List<object>();
            var studentIdStr = User.FindFirst("StudentId")?.Value;
            int? currentStudentId = int.TryParse(studentIdStr, out var sid) ? sid : null;

            // 1. VeritabanÄ±ndan gelen gerÃ§ek veriler
            var dbEvents = await _context.CalendarEvents.ToListAsync();
            foreach (var e in dbEvents)
            {
                allEvents.Add(new
                {
                    id = "manual-" + e.Id,
                    title = e.Title,
                    start = e.Start.ToString("yyyy-MM-ddTHH:mm:ss"),
                    end = e.End?.ToString("yyyy-MM-ddTHH:mm:ss"),
                    backgroundColor = e.ColorCode ?? "#C5A059",
                    textColor = "#fff",
                    extendedProps = new { description = "Ã–zel Etkinlik", type = "special" }
                });
            }

            var courseQuery = _context.Courses.Where(c => !c.IsDeleted);
            
            // "Benim Takvimim" Filtresi
            if (onlyMine && currentStudentId.HasValue)
            {
                var myCourseIds = await _context.Applications
                    .Where(a => a.StudentId == currentStudentId && a.Status == ApplicationStatus.Approved)
                    .Select(a => a.CourseId)
                    .ToListAsync();
                courseQuery = courseQuery.Where(c => myCourseIds.Contains(c.Id));
            }

            var dbCourses = await courseQuery.ToListAsync();
            foreach (var c in dbCourses)
            {
                allEvents.Add(new
                {
                    id = "course-" + c.Id,
                    title = c.CourseName,
                    start = c.StartDate.ToString("yyyy-MM-dd"),
                    end = c.EndDate.ToString("yyyy-MM-dd"),
                    backgroundColor = "#10b981",
                    textColor = "#fff",
                    extendedProps = new { description = c.Description, type = "course" }
                });

                if (c.ExamDate.HasValue)
                {
                    allEvents.Add(new
                    {
                        id = "exam-" + c.Id,
                        title = "ğŸ¯ " + c.CourseName + " SÄ±navÄ±",
                        start = c.ExamDate.Value.ToString("yyyy-MM-ddTHH:mm:ss"),
                        backgroundColor = "#ef4444",
                        textColor = "#fff",
                        extendedProps = new { description = "Kurs Sonu Sertifika SÄ±navÄ±", type = "exam" }
                    });
                }
            }

            // Mock veriler sadece genel takvimde Ã§Ä±ksÄ±n
            if (!onlyMine)
            {
                var year = DateTime.Now.Year;
                var mockData = new List<object>
                {
                    new { id="h1", title = "ğŸ† YÄ±lbaÅŸÄ±", start = $"{year}-01-01", backgroundColor = "#ef4444", extendedProps = new { description="Resmi Tatil - Yeni YÄ±lÄ±n Ä°lk GÃ¼nÃ¼", type="holiday" } },
                    new { id="h2", title = "ğŸŒ™ Ramazan BayramÄ± Arifesi", start = $"{year}-03-19T13:00:00", backgroundColor = "#f59e0b", extendedProps = new { description="YarÄ±m GÃ¼n Tatil", type="holiday" } },
                    new { id="h3", title = "ğŸ¬ Ramazan BayramÄ±", start = $"{year}-03-20", end = $"{year}-03-23", backgroundColor = "#ef4444", extendedProps = new { description="Dini Bayram / Resmi Tatil (3 GÃ¼n)", type="holiday" } },
                    new { id="h4", title = "ğŸ‡¹ğŸ‡· Ulusal Egemenlik ve Ã‡ocuk BayramÄ±", start = $"{year}-04-23", backgroundColor = "#ef4444", extendedProps = new { description="TBMM'nin AÃ§Ä±lÄ±ÅŸÄ± / Resmi Tatil", type="holiday" } },
                    new { id="h5", title = "ğŸ‘· Emek ve DayanÄ±ÅŸma GÃ¼nÃ¼", start = $"{year}-05-01", backgroundColor = "#ef4444", extendedProps = new { description="1 MayÄ±s Ä°ÅŸÃ§i BayramÄ± / Resmi Tatil", type="holiday" } },
                    new { id="h6", title = "ğŸƒ AtatÃ¼rk'Ã¼ Anma, GenÃ§lik ve Spor BayramÄ±", start = $"{year}-05-19", backgroundColor = "#ef4444", extendedProps = new { description="AtatÃ¼rk'Ã¼n Samsun'a Ã‡Ä±kÄ±ÅŸÄ± / Resmi Tatil", type="holiday" } },
                    new { id="h7", title = "ğŸ‘ Kurban BayramÄ± Arifesi", start = $"{year}-05-26T13:00:00", backgroundColor = "#f59e0b", extendedProps = new { description="YarÄ±m GÃ¼n Tatil", type="holiday" } },
                    new { id="h8", title = "ğŸ•‹ Kurban BayramÄ±", start = $"{year}-05-27", end = $"{year}-05-31", backgroundColor = "#ef4444", extendedProps = new { description="Dini Bayram / Resmi Tatil (4 GÃ¼n)", type="holiday" } },
                    new { id="h9", title = "ğŸ›¡ï¸ Demokrasi ve Milli Birlik GÃ¼nÃ¼", start = $"{year}-07-15", backgroundColor = "#ef4444", extendedProps = new { description="15 Temmuz Anma GÃ¼nÃ¼ / Resmi Tatil", type="holiday" } },
                    new { id="h10", title = "ğŸ–ï¸ Zafer BayramÄ±", start = $"{year}-08-30", backgroundColor = "#ef4444", extendedProps = new { description="BÃ¼yÃ¼k Taarruz Zaferi / Resmi Tatil", type="holiday" } },
                    new { id="h11", title = "ğŸ‡¹ğŸ‡· Cumhuriyet BayramÄ± Arifesi", start = $"{year}-10-28T13:00:00", backgroundColor = "#f59e0b", extendedProps = new { description="YarÄ±m GÃ¼n Tatil", type="holiday" } },
                    new { id="h12", title = "ğŸ‡¹ğŸ‡· Cumhuriyet BayramÄ±", start = $"{year}-10-29", backgroundColor = "#ef4444", extendedProps = new { description="Cumhuriyetimizin KuruluÅŸu / Resmi Tatil", type="holiday" } },
                    new { id="h13", title = "ğŸ•¯ï¸ 10 KasÄ±m AtatÃ¼rk'Ã¼ Anma GÃ¼nÃ¼", start = $"{year}-11-10", backgroundColor = "#4b5563", extendedProps = new { description="Ulu Ã–nder AtatÃ¼rk'Ã¼n Vefat YÄ±ldÃ¶nÃ¼mÃ¼", type="holiday" } },
                    new { id="h14", title = "ğŸ Ã–ÄŸretmenler GÃ¼nÃ¼", start = $"{year}-11-24", backgroundColor = "#C5A059", extendedProps = new { description="Millet Mektepleri'nin AÃ§Ä±lÄ±ÅŸÄ±", type="holiday" } },
                    
                    new { id="m1", title = "â„ï¸ KÄ±ÅŸ KayÄ±tlarÄ±", start = $"{year}-01-05", end = $"{year}-01-15", backgroundColor = "#3b82f6", extendedProps = new { description="Yeni dÃ¶nem kayÄ±t sÃ¼reci", type="other" } },
                    new { id="m2", title = "ğŸŒ± Bahar ÅenliÄŸi", start = $"{year}-04-23", end = $"{year}-04-26", backgroundColor = "#f59e0b", extendedProps = new { description="KampÃ¼s bahar etkinlikleri", type="other" } },
                    new { id="m3", title = "ğŸ¨ YaÄŸlÄ± Boya AtÃ¶lyesi", start = $"{year}-05-02T14:00:00", backgroundColor = "#C5A059", extendedProps = new { description="Halk EÄŸitim Sanat EtkinliÄŸi", type="special" } }
                };
                allEvents.AddRange(mockData);
            }

            return Json(allEvents);
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> UpdateEvent(string id, string start, string? end)
        {
            if (id.StartsWith("manual-"))
            {
                var eventId = int.Parse(id.Replace("manual-", ""));
                var ev = await _context.CalendarEvents.FindAsync(eventId);
                if (ev != null)
                {
                    ev.Start = DateTime.Parse(start);
                    if (end != null) ev.End = DateTime.Parse(end);
                    await _context.SaveChangesAsync();
                    return Json(new { success = true });
                }
            }
            else if (id.StartsWith("course-"))
            {
                var courseId = int.Parse(id.Replace("course-", ""));
                var course = await _context.Courses.FindAsync(courseId);
                if (course != null)
                {
                    course.StartDate = DateTime.Parse(start);
                    if (end != null) course.EndDate = DateTime.Parse(end);
                    await _context.SaveChangesAsync();
                    return Json(new { success = true });
                }
            }
            return Json(new { success = false });
        }

        [HttpGet]
        public async Task<IActionResult> ExportIcal(string id)
        {
            string title = "Etkinlik", desc = "", startStr = "", endStr = "";
            
            if (id.StartsWith("course-")) {
                var c = await _context.Courses.FindAsync(int.Parse(id.Replace("course-","")));
                if (c == null) return NotFound();
                title = c.CourseName; desc = c.Description; startStr = c.StartDate.ToString("yyyyMMddTHHmmssZ"); endStr = c.EndDate.ToString("yyyyMMddTHHmmssZ");
            }
            
            var ical = $@"BEGIN:VCALENDAR
VERSION:2.0
BEGIN:VEVENT
DTSTART:{startStr}
DTEND:{endStr}
SUMMARY:{title}
DESCRIPTION:{desc}
END:VEVENT
END:VCALENDAR";

            var bytes = System.Text.Encoding.UTF8.GetBytes(ical);
            return File(bytes, "text/calendar", $"{title}.ics");
        }
    }
}

