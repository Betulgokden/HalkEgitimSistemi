using HalkEgitimSistemi.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using HalkEgitimSistemi.Data;

namespace HalkEgitimSistemi.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;

        public HomeController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            // Veritabanındaki haberleri alıp ana sayfaya gönderiyoruz
            var haberler = _context.News.ToList();
            return View(haberler);
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