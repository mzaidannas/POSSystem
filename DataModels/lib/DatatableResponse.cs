using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POSSystem.DataModels
{
    /// <summary>
    /// JQuery Datatable JSON Response Format
    /// </summary>
    /// <typeparam name="T">Datatype of returned model</typeparam>
    public class DatatableResponse<T>
    {
        public int draw;
        public int recordsTotal;
        public int recordsFiltered;
        public List<T> data = new List<T>();
    }
}
