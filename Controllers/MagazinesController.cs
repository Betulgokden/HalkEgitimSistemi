using Microsoft.AspNetCore.Mvc;

namespace HalkEgitimSistemi.Controllers
{
    public class MagazinesController : Controller
    {
        public IActionResult Newsletter()
        {
            return View();
        }

        public IActionResult LifeLongLearning()
        {
            return View();
        }
    }
}
