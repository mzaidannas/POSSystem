using System.Web.Mvc;
using POSSystem.BLL;
using DAL;
using POSSystem.DataModels;

namespace POSSystem.Controllers
{
    [Authorize]
    public class UserController : Controller
    {
        UserLogic userLogic = new UserLogic();
        public UserController()
        {

        }

        [Authorize]
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult _UserForm()
        {
            return PartialView();
        }

        //public JsonResult FetchUser(DatatableRequest<string, User> paging)
        //{
        //    return Json(userLogic.FetchUserList());
        //}
    }
}