using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POSSystem.DataModels
{
    /// <summary>
    /// Model for JQuery Datatable Request
    /// </summary>
    /// <typeparam name="T">Additional RequestData Datatype</typeparam>
    public class DatatableRequest<T>
    {
        public int draw;
        public List<DatatableColumn> columns;
        public List<DatatableOrder> order;
        public int start;
        public int length;
        public DatatableSearch search;
        public T data;
    }

    /// <summary>
    /// JQuery Datatable Single Column
    /// </summary>
    /// <typeparam name="T">Column Datatype</typeparam>
    public class DatatableColumn
    {
        public string data;
        public string name;
        public bool searchable;
        public bool orderable;
        public DatatableSearch search;

    }
    /// <summary>
    /// JQuery Datatable Search
    /// </summary>
    public class DatatableSearch
    {
        public string value;
        public bool regex;
    }

    /// <summary>
    /// JQuery Datatable Sort Datatype
    /// </summary>
    public class DatatableOrder
    {
        public int column;
        public string dir;
    }
}
