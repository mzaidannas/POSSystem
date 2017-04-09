using System;
using System.Linq;

namespace DAL
{
    public static class Common
    {
        private static POSDatabaseEntities db = new POSDatabaseEntities();
        public static User FetchUserProfile(string aspNetUser_Id)
        {
            return db.Users.FirstOrDefault(x => x.AspNetUser_Id == aspNetUser_Id);
        }
        public static void LogError(User userProfile, Exception ex, string url)
        {
            try
            {
                ErrorLog errorLog = new ErrorLog();
                errorLog.Company_Id = userProfile.Company_Id;
                errorLog.CreateDate = DateTime.UtcNow;
                errorLog.InnerException = ex.StackTrace;
                errorLog.Message = ex.Message;
                errorLog.Url = url;
                errorLog.User_Id = userProfile.Id;
                db.ErrorLogs.Add(errorLog);
                db.SaveChanges();
            }
            catch
            {
            }

        }
        public static void LogTransaction(User userProfile, string action, string detail, int? recordId, string tableName)
        {
            try
            {
                TransactionLog transactionLog = new TransactionLog();
                transactionLog.Action = action;
                transactionLog.Company_Id = userProfile.Company_Id;
                transactionLog.CreateDate = DateTime.UtcNow;
                transactionLog.Detail = detail;
                transactionLog.RecordId = recordId;
                transactionLog.TableName = tableName;
                transactionLog.User_Id = userProfile.Id;
                db.TransactionLogs.Add(transactionLog);
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                LogError(userProfile, ex, "DAL/Common/LogTransaction");
            }

        }
        public static void LogNotification(User userProfile, string aspNetRole_Id, int? user_Id, string notificationDetail, string url)
        {
            try
            {
                Notification notification = new Notification();
                notification.CreateDate = DateTime.UtcNow;
                notification.Detail = notificationDetail;
                notification.Url = url;
                notification.IsRead = false;
                notification.AspNetRole_Id = aspNetRole_Id;
                notification.User_Id = user_Id;
                notification.IsAlertShow = true;
                notification.Company_Id = userProfile.Company_Id;
                db.Notifications.Add(notification);
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                LogError(userProfile, ex, "DAL/Common/LogNotification");
            }

        }
    }
}
