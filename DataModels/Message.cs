using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POSSystem.DataModels
{
    /// <summary>
    /// Message Model to return status of any transaction
    /// </summary>
    public class Message
    {
        public static string UpdateMessage = "Updated successfully.";
        public static string SaveMessage = "Saved successfully.";
        public static string ErrorMessage = "Something went wrong. Please try again.";
        public string Action { get; set; }
        public string MessageDetail { get; set; }
        public bool Success = true;
        public bool Info { get; set; }
        public bool Warning { get; set; }

    }
}
