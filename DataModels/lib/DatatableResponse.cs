using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace POSSystem.DataModels
{
    public class DatatableResponse<T>
    {
        public int draw;
        public int recordsTotal;
        public int recordsFiltered;
        public List<T> data;
    }
}
