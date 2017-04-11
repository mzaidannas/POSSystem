using DAL;
using POSSystem.Utility;
using POSSystem.DataModels;
using System;
using System.Linq;

namespace POSSystem.BLL
{
    public class RoleLogic
    {
        public POSDatabaseEntities db = new POSDatabaseEntities();

        public CallBackData<AspNetRole> FetchRoleList(User userProfile, DatatableRequest<AspNetRole> paging)
        {
            CallBackData<AspNetRole> callBackData = new CallBackData<AspNetRole>();
            try
            {
                callBackData.tableData.data = db.AspNetRoles.ToList();
                callBackData.tableData.draw = paging.draw;
                callBackData.tableData.recordsFiltered = callBackData.tableData.data.Count;
                callBackData.tableData.recordsTotal = callBackData.tableData.data.Count;

                callBackData.msg.Action = "FetchRoleList";
            }
            catch(Exception ex)
            {
                callBackData.msg.Success = false;
                callBackData.msg.Action = "FetchRoleList";
                callBackData.msg.MessageDetail = ex.Message;

                userProfile.LogError(ex, "BLL,RoleLogic/FetchRoleList");
            }

            return callBackData;
        }

        //public AspNetRole FetchRoleById(User userProfile, string aspNetRole_Id)
        //{

        //}
    }
}
