using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace POSSystem.Controllers
{
    [Authorize]
    public class UserController : Controller
    {
        public UserController()
        {
        }

        [Authorize]
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
    }
}