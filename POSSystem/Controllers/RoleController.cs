using DAL;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using POSSystem.DataModels;
using System;
using System.Web.Mvc;
using POSSystem.Utility;
using System.Web;

namespace POSSystem.Controllers
{
    public class RoleController : Controller
    {
        [AllowAnonymous]
        public Message Save(User userProfile, AspNetRole role)
        {
            Message msg = new Message();
            try
            {
                RoleManager<IdentityRole> roleManager = new RoleManager<IdentityRole>(
                                  new RoleStore<IdentityRole>(new POSDatabaseEntities()));
                IdentityResult roleresult = roleManager.Create( new IdentityRole(role.Name) );

                msg.Success = true;
                msg.Action = "Save";
                msg.MessageDetail = "Role (" + role.Name + ") has been added";
                userProfile.LogTransaction(msg.Action, msg.MessageDetail, null, "AspNetRole");
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Action = "Save";
                msg.MessageDetail = ex.Message;
                userProfile.LogError(ex, "BLL/RoleLogic/Save");
            }

            return msg;
        }

        [AllowAnonymous]
        // GET: Role
        public ActionResult Index()
        {
            return View();
        }

        [AllowAnonymous]
        public PartialViewResult _RoleForm()
        {
            return PartialView();
        }

        [AllowAnonymous]
        public JsonResult FetchRoleList(DatatableRequest<AspNetRole> paging)
        {
            User userProfile = User.Identity.GetUserId().FetchUserProfile();
            return Json(new BLL.RoleLogic().FetchRoleList(userProfile, paging) );
        }
    }
}