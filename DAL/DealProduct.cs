//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class DealProduct
    {
        public int Id { get; set; }
        public int Deal_Id { get; set; }
        public Nullable<int> Product_Id { get; set; }
        public double Quantity { get; set; }
        public int SortOrder { get; set; }
    
        public virtual Deal Deal { get; set; }
        public virtual Product Product { get; set; }
    }
}
