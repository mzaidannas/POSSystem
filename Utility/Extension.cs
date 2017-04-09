using DAL;
using System;
using System.Globalization;
using System.Linq;

namespace POSSystem.Utility
{
    public static class Extension
    {
        public static User FetchUserProfile(this string aspNetUser_Id)
        {
            return DAL.Common.FetchUserProfile(aspNetUser_Id);
        }
        public static void LogError(this User userProfile, Exception ex, string url)
        {
            DAL.Common.LogError(userProfile, ex, url);
        }
        public static void LogTransaction(this User userProfile, string action, string detail, int? recordId, string tableName)
        {
            DAL.Common.LogTransaction(userProfile, action, detail, recordId, tableName);
        }

        /// <summary>
        /// Reimplement this to use simple .net string conversions
        /// </summary>
        /// <param name="date"></param>
        /// <param name="toUtc"></param>
        /// <returns></returns>
        public static DateTime? DbDate(this string date, bool toUtc = false)
        {

            if (!string.IsNullOrEmpty(date))
            {
                //var asd=  DateTime.UtcNow.ToUniversalTime();
                //  var singapore = TimeZoneInfo.FindSystemTimeZoneById("Pakistan Standard Time");
                // var ss= TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, singapore);
                DateTime dt = DateTime.Parse(date, CultureInfo.GetCultureInfo("en-GB"));
                if (toUtc)
                    return DateTimeOffset.Parse(string.Format("{0:MM/dd/yyyy}", dt)).UtcDateTime;

                else
                    return dt;// DateTime.Parse(date, CultureInfo.GetCultureInfo("en-GB"));
            }
            else
                return null;
        }
        /// <summary>
        /// Reimplement this using simple date.toString()
        /// </summary>
        /// <param name="date"></param>
        /// <param name="timeZoneHours"></param>
        /// <param name="isAddTime"></param>
        /// <returns></returns>
        public static string ViewDate(this DateTime date, double timeZoneHours = 0, bool isAddTime = false)
        {
            if (date == DateTime.MinValue)
            {
                return String.Empty;
            }
            else if (!ReferenceEquals(date, null))
            {
                if (((DateTime)date).Hour != 0)
                {
                    date = ((DateTime)date).AddHours(timeZoneHours);
                }
            }
            if (isAddTime)
                return string.Format("{0:dd/MM/yyyy hh:mm:ss tt}", date);

            return string.Format("{0:dd/MM/yyyy}", date);
        }
        public static string CurrencyRule(this double value)
        {
            double num; string result = String.Empty;
            if (double.TryParse(Convert.ToString(value), out num))
            {
                if (num < 0)
                    result = "(" + String.Format("{0:n}", (num * -1)) + ")";

                else
                    result = (Convert.ToString(value) == "0" ? "0" : String.Format("{0:n}", value));
            }
            return result;
        }
        public static void LogNotification(this User userProfile, string aspNetRole_Id, int? user_Id, string notificationDetail, string url)
        {
            DAL.Common.LogNotification(userProfile, aspNetRole_Id, user_Id, notificationDetail, url);
        }
        public static string FetchUniquePath(this string directoryPath, string imageName)
        {
            string[] values = { System.IO.Path.GetFileName(imageName), System.IO.Path.GetExtension(imageName) };
            values[0] = values[0] + DateTime.UtcNow.Ticks;
            if (!System.IO.Directory.Exists(directoryPath))
            {
                System.IO.Directory.CreateDirectory(directoryPath);
            }
            int i = 0;
            while (System.IO.File.Exists(directoryPath + "/" + values[0] + i + "." + values[1]))
            {
                i++;
            }
            return values[0] + i + "." + values[1];
        }
        /// <summary>
        /// For use in excel reports plugin
        /// </summary>
        /// <param name="str"></param>
        /// <param name="length"></param>
        /// <returns></returns>
        //public static DataTable RemoveColumns(this DataTable dt, String columns)
        //{
        //    String[] removeColumns = columns.Split(',');
        //    foreach (String columnName in removeColumns)
        //    {
        //        try
        //        {
        //            dt.Columns.Remove(columnName);
        //        }
        //        catch (Exception)
        //        {

        //        }

        //    }
        //    return dt;
        //}
        //public static Workbook GenerateFormatedDataSheet(this Workbook book, DataTable dt)
        //{
        //    Worksheet sheet = book.Worksheets[0];
        //    sheet.Cells.ImportDataTable(dt, true, "A1");

        //    Style style = book.Styles[book.Styles.Add()];

        //    //Set background Pattern
        //    style.Pattern = BackgroundType.Solid;

        //    //Set Font Bold
        //    style.Font.IsBold = true;

        //    //Set Font Italic


        //    Cells cells = book.Worksheets[0].Cells;


        //    Range range = cells.CreateRange(0, 0, 1, dt.Columns.Count);
        //    StyleFlag flag = new StyleFlag();

        //    //Set Foreground Color attribute of Style
        //    flag.CellShading = true;

        //    //Set Font Color attribute of Style
        //    flag.FontColor = true;

        //    //Apply the style (described above)to the range.
        //    range.ApplyStyle(style, flag);
        //    for (int i = 0; i < dt.Columns.Count; i++)
        //    {

        //        book.Worksheets[0].Cells.SetColumnWidth(i, 30);
        //        book.Worksheets[0].Cells.SetRowHeight(i, 20);
        //    }


        //    for (int i = 1; i <= dt.Rows.Count; i++)
        //    {
        //        for (int j = 0; j < dt.Columns.Count; j++)
        //        {
        //            Cell cell = sheet.Cells[i, j];
        //            Aspose.Cells.Style style1;

        //            //Get the style from A1 cell
        //            style1 = cell.GetStyle();

        //            //Setting the vertical alignment
        //            style1.VerticalAlignment = TextAlignmentType.Left;

        //            //Setting the horizontal alignment
        //            style1.HorizontalAlignment = TextAlignmentType.Left;
        //            cell.SetStyle(style1);

        //        }


        //    }

        //    return book;
        //}
        public static string Truncate(this string str, int length)
        {
            if (String.IsNullOrEmpty(str)) return str;
            return str.Length <= length ? str : str.Substring(0, length - 4) + " ...";
        }
    }
}
