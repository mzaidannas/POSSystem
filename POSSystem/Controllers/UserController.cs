using System.Web.Mvc;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Threading.Tasks;
using POSSystem.BLL;
using POSSystem.DataModels;
using POSSystem.Models;
using DAL;
using POSSystem.Utility;
using System.Collections.Generic;

namespace POSSystem.Controllers
{
    [AllowAnonymous]
    public class UserController : Controller
    {
        UserLogic userLogic = new UserLogic();
        private ApplicationUserManager _userManager;
        public UserController()
        {
        }
        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        [AllowAnonymous]
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult _UserForm()
        {
            return PartialView();
        }

        //
        // GET: /Account/Register
        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(RegisterUser model)
        {
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser { UserName = model.Username, Email = model.Email };
                var result = await UserManager.CreateAsync(user, model.Password);
                if (result.Succeeded)
                {
                    // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                    // Send an email with this link
                    // string code = await UserManager.GenerateEmailConfirmationTokenAsync(user.Id);
                    // var callbackUrl = Url.Action("ConfirmEmail", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);
                    // await UserManager.SendEmailAsync(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>");

                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        [AllowAnonymous]
        [HttpPost]
        public JsonResult FetchUserList(DatatableRequest<User> data)
        {
            User userProfile = User.Identity.GetUserId().FetchUserProfile();
            return Json( new BLL.UserLogic().FetchUserList(userProfile, data) );
        }
    }
}