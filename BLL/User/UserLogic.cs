using DAL;
using POSSystem.DataModels;
using POSSystem.Utility;
using System;
using System.Collections.Generic;

namespace POSSystem.BLL
{
    public class UserLogic
    {
        POSDatabaseEntities db = new POSDatabaseEntities();
        public UserLogic()
        {
        }

        public void SetUserRoles(ref User user, string aspNetUser_Id, List<string> roles)
        {
            //user.AspNetUser.AspNetRoles = new AspNetUser() {  };
        }

        public Message Save(User userProfile, User user, string aspNetUser_Id, List<string> roles)
        {
            Message msg = new Message();
            try
            {
                if (user.Id == 0)
                {
                    user.AspNetUser_Id = aspNetUser_Id;

                    user.CreateBy = userProfile.Id;
                    userProfile.CreateDate = DateTime.UtcNow;

                    db.Users.Add(user);
                    db.SaveChanges();

                    msg.Success = true;
                    msg.Action = "Save";
                    msg.MessageDetail = "User (" + user.FirstName + " " + user.LastName + ") has been created";
                }
                else
                {
                    db.Users.Add(user);
                    db.SaveChanges();

                    msg.Success = true;
                    msg.Action = "Update";
                    msg.MessageDetail = "User (" + user.FirstName + " " + user.LastName + ") has been updated";
                }

                userProfile.LogTransaction(msg.Action, msg.MessageDetail, user.Id, "User");
            }
            catch(Exception ex)
            {
                msg.Success = false;
                msg.Action = "Save";
                msg.MessageDetail = ex.Message;

                userProfile.LogError(ex, "BLL/User/Save");
            }

            return msg;
        }

        public CallBackData<User> FetchUserList(User userProfile, DatatableRequest<User> paging)
        {
            return null;
        }

        //public DatatableResponse<User> FetchUserById(User userProfile, DatatableRequest<string, User> paging)
        //{

        //}
    }
}
