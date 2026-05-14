using Microsoft.EntityFrameworkCore;
using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using HalkEgitimSistemi.Data;
using Microsoft.Extensions.Caching.Memory; // EKSİK OLAN VE HATALARI ÇÖZEN KÜTÜPHANE
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System;

namespace HalkEgitimSistemi.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IMemoryCache _cache; // using eklendiği için uzun yazıma gerek kalmadı

        public HomeController(AppDbContext context, IMemoryCache cache)
        {
            _context = context;
            _cache = cache;
        }

        [Microsoft.AspNetCore.OutputCaching.OutputCache(Duration = 300)]
        public async Task<IActionResult> Index()
        {
            const string cacheKey = "HomePageData_V1";

            // using eklendiği için artık TryGetValue ve out Dictionary dönüşümü hata vermeyecek
            if (!_cache.TryGetValue(cacheKey, out Dictionary<string, object>? data) || data == null)
            {
                data = new Dictionary<string, object>();
                try
                {
                    var newsTask = _context.News.AsNoTracking().OrderByDescending(n => n.PublishDate).Take(10).ToListAsync();
                    var neighborhoodsTask = _context.Neighborhoods.AsNoTracking().ToListAsync();
                    var settingsTask = _context.SiteSettings.AsNoTracking()
                        .Where(s => s.Group == "SocialResponsibility" || s.Group == "Stats")
                        .ToListAsync();
                    var jobsTask = _context.JobPostings.AsNoTracking()
                        .Where(j => j.IsActive && !j.IsDeleted)
                        .OrderByDescending(j => j.Id)
                        .Take(6)
                        .ToListAsync();
                    var coursesTask = _context.Courses.AsNoTracking()
                        .Where(c => c.IsActive && !c.IsDeleted)
                        .OrderByDescending(c => c.Id)
                        .Take(5)
                        .ToListAsync();
                    var studentsTask = _context.Students.AsNoTracking()
                        .Where(s => !s.IsDeleted)
                        .OrderByDescending(s => s.Points)
                        .Take(10)
                        .ToListAsync();

                    await Task.WhenAll(newsTask, neighborhoodsTask, settingsTask, jobsTask, coursesTask, studentsTask);

                    data["News"] = await newsTask;
                    data["Neighborhoods"] = await neighborhoodsTask;
                    var settings = await settingsTask;

                    data["KaragolProgress"] = settings.FirstOrDefault(s => s.Key == "KaragolGoalProgress")?.Value ?? "0";
                    data["KaragolTarget"] = settings.FirstOrDefault(s => s.Key == "KaragolGoalTarget")?.Value ?? "500";
                    data["LeaderNeighborhood"] = settings.FirstOrDefault(s => s.Key == "LeaderNeighborhood")?.Value ?? "-";

                    data["JobPostings"] = await jobsTask;

                    // Eğer iş ilanı yoksa Artvin geneli ilanlar ekleyelim
                    var jobPostings = (List<JobPosting>)data["JobPostings"];
                    if (jobPostings.Count == 0)
                    {
                        jobPostings.AddRange(new List<JobPosting>
                        {
                            new JobPosting { Title = "Mobilya Ustası", CompanyName = "Artvin Ahşap", Location = "Artvin Merkez", SalaryRange = "35.000₺ - 45.000₺", RequiredCategory = "ZANAAT" },
                            new JobPosting { Title = "Web Geliştirici", CompanyName = "Borçka Teknoloji", Location = "Borçka", SalaryRange = "40.000₺ - 60.000₺", RequiredCategory = "YAZILIM" },
                            new JobPosting { Title = "Turizm Rehberi", CompanyName = "Şavşat Gezi", Location = "Şavşat", SalaryRange = "30.000₺ - 40.000₺", RequiredCategory = "TURİZM" },
                            new JobPosting { Title = "Arıcılık Uzmanı", CompanyName = "Arhavi Bal", Location = "Arhavi", SalaryRange = "25.000₺ - 35.000₺", RequiredCategory = "TARIM" }
                        });
                        data["JobPostings"] = jobPostings;
                    }
                    data["NewestCourses"] = await coursesTask;
                    data["TopStudents"] = await studentsTask;

                    // Eğer veri yoksa görsel şov için mock veriler ekleyelim
                    var topStudents = (List<Student>)data["TopStudents"];
                    if (topStudents.Count == 0)
                    {
                        topStudents.AddRange(new List<Student>
                        {
                            new Student { FirstName = "Ahmet", LastName = "Yılmaz", Points = 2450 },
                            new Student { FirstName = "Ayşe", LastName = "Kaya", Points = 1820 },
                            new Student { FirstName = "Mehmet", LastName = "Demir", Points = 1650 },
                            new Student { FirstName = "Zeynep", LastName = "Çelik", Points = 1400 },
                            new Student { FirstName = "Can", LastName = "Öztürk", Points = 1250 }
                        });
                        data["TopStudents"] = topStudents;
                    }

                    // using eklendiği için Set metodu artık tanınacak
                    _cache.Set(cacheKey, data, TimeSpan.FromMinutes(5));
                }
                catch
                {
                    data["News"] = new List<News>();
                    data["Neighborhoods"] = new List<Neighborhood>();
                    data["KaragolProgress"] = "0";
                    data["KaragolTarget"] = "500";
                    data["LeaderNeighborhood"] = "-";
                    data["JobPostings"] = new List<JobPosting>();
                    data["NewestCourses"] = new List<Course>();
                    data["TopStudents"] = new List<Student>();
                }
            }

            ViewBag.Neighborhoods = data["Neighborhoods"];
            ViewBag.KaragolProgress = data["KaragolProgress"];
            ViewBag.KaragolTarget = data["KaragolTarget"];
            ViewBag.LeaderNeighborhood = data["LeaderNeighborhood"];
            ViewBag.JobPostings = data["JobPostings"];
            ViewBag.NewestCourses = data["NewestCourses"];
            ViewBag.TopStudents = data["TopStudents"];

            return View(data["News"] as List<News>);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}