using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using System.Web.Mvc;
using System.Web.Routing;
using Newtonsoft.Json;
using POSSystem.DataModels;
using DAL;
using System.Web.Script.Serialization;

namespace POSSystem.Models
{
    public class Generic
    {
        //public ReturnData<User> UserLoginSetup(User userProfile, UserType userType, User requestUser, RegisterViewModel registerViewModel, ApplicationUserManager userManager)
        //{
        //    ReturnData<User> returnData = new ReturnData<User>();

        //    try
        //    {
        //        if (requestUser.IsLoginSetup)
        //        {
        //            string roleName = userType.AspNetRole.Name;

        //            if (!String.IsNullOrEmpty(requestUser.AspNetUser_Id))
        //            {
        //                AspNetUser aspNetUser = db.AspNetUsers.FirstOrDefault(x => x.Id == requestUser.AspNetUser_Id);
        //                aspNetUser.PasswordHash = (new PasswordHasher()).HashPassword(registerViewModel.Password);
        //                db.SaveChanges();
        //                userManager.RemoveFromRoles(aspNetUser.Id);
        //                userManager.AddToRole(aspNetUser.Id, roleName);
        //            }
        //            else
        //            {
        //                var user = new ApplicationUser { UserName = registerViewModel.UserName, Email = registerViewModel.Email };
        //                requestUser.AspNetUser_Id = user.Id;
        //                var result = userManager.Create(user, registerViewModel.Password);
        //                if (!result.Succeeded)
        //                {
        //                    returnData.msg.Success = false;
        //                    returnData.msg.MessageDetail = result.Errors.ToArray()[0];
        //                }
        //                else
        //                    userManager.AddToRole(user.Id, roleName);
        //            }
        //        }
        //        else
        //        {
        //            if (!String.IsNullOrEmpty(requestUser.AspNetUser_Id))
        //            {
        //                db.Users.FirstOrDefault(x => x.AspNetUser_Id == requestUser.AspNetUser_Id).AspNetUser_Id = null;
        //                db.SaveChanges();
        //                userManager.RemoveFromRoles(requestUser.AspNetUser_Id);
        //                db.AspNetUsers.Remove(db.AspNetUsers.FirstOrDefault(x => x.Id == requestUser.AspNetUser_Id));
        //                db.SaveChanges();
        //                requestUser.AspNetUser_Id = null;

        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        returnData.msg.Success = false;
        //        returnData.msg.MessageDetail = Message.ErrorMessage;
        //        userProfile.LogError(ex, "Models/Generic/UserLoginSetup");
        //    }

        //    returnData.Data = requestUser.AspNetUser_Id;
        //    return returnData;

        //}
        public static void StoreModelToCookies<T>(ControllerContext context, string cookieName, T newModel) where T : class
        {
            var serializer = new JavaScriptSerializer();
            HttpCookie cookie;
            T savedModel;
            cookie = new HttpCookie(cookieName);
            savedModel = newModel;
            cookie.Value = POSSystem.Security.Common.CompressString(serializer.Serialize(savedModel));
            context.HttpContext.Response.Cookies.Add(cookie);
        }
        public static void ClearCookies(HttpContext context, string[] cookieNames)
        {
            foreach (string cookieName in cookieNames)
            {
                try
                {
                    HttpCookie currentUserCookie = context.Request.Cookies[cookieName];
                    context.Response.Cookies.Remove(cookieName);
                    currentUserCookie.Expires = DateTime.Now.AddDays(-10);
                    currentUserCookie.Value = null;
                    context.Response.SetCookie(currentUserCookie);
                }
                catch
                {
                }
            }
        }
    }
}
//public class ModuleAuthorizeAttribute : AuthorizeAttribute
//{
//    WarehouseManagementEntities db = new WarehouseManagementEntities();
//    public override void OnAuthorization(AuthorizationContext filterContext)
//    {
//        base.OnAuthorization(filterContext);
//        if (!filterContext.HttpContext.User.Identity.IsAuthenticated)
//        {
//            filterContext.Result = new RedirectResult("~/Account/Login?returnUrl=" + filterContext.HttpContext.Request.UrlReferrer.AbsolutePath);
//        }
//        else
//        {
//            try
//            {
//                System.Web.Routing.RouteData routeData = filterContext.RequestContext.RouteData;
//                string controller = routeData.GetRequiredString("controller");
//                string action = routeData.GetRequiredString("action");

//                HttpCookie cookie = System.Web.HttpContext.Current.Request.Cookies["ModuleAccessLevel"];
//                List<ModuleAccessLevelCookie> deserializedObjList = (List<ModuleAccessLevelCookie>)JsonConvert.DeserializeObject(Warehouse.Models.Generic.DecompressString(cookie.Value), typeof(List<ModuleAccessLevelCookie>));
//                List<ModuleAccessLevelCookie> userRoles = deserializedObjList.Where(x => x.Controller == controller && x.Action == action).ToList();

//                if (!(userRoles.Count != 0))
//                {
//                    string html = System.IO.File.ReadAllText(HttpContext.Current.Server.MapPath("~/Views/ErrorPage/UnAuthorized.html")).Replace("{!#returnUrl#!}", (ReferenceEquals(filterContext.HttpContext.Request.UrlReferrer, null) ? "/" : filterContext.HttpContext.Request.UrlReferrer.AbsolutePath));
//                    filterContext.Result = new ContentResult { Content = html };
//                    //   filterContext.Result = new Message() { Success=false,MessageDetail= html };
//                    return;
//                }
//            }
//            catch
//            {
//                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new
//                {
//                    controller = "Account",
//                    action = "Login",
//                }));
//            }
//        }
//    }
//}