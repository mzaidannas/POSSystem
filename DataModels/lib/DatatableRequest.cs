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
    /// <typeparam name="T">Single Column Datatype</typeparam>
    /// <typeparam name="TData">Additional RequestData Datatype</typeparam>
    public class DatatableRequest<T,TData>
    {
        public int draw;
        public List<DatatableColumn<T>> columns;
        public List<DatatableOrder> order;
        public int start;
        public int length;
        public DatatableSearch search;
        public TData data;
    }

    /// <summary>
    /// JQuery Datatable Single Column
    /// </summary>
    /// <typeparam name="T">Column Datatype</typeparam>
    public class DatatableColumn<T>
    {
        public T data;
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
