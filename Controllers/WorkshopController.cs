using Microsoft.AspNetCore.Mvc;

namespace HalkEgitimSistemi.Controllers
{
    public class WorkshopController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
