using Microsoft.AspNetCore.Mvc;

namespace HalkEgitimSistemi.Controllers
{
    public class HomeController1 : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
