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
    
    public partial class ProductCategory
    {
        public int Id { get; set; }
        public int Product_Id { get; set; }
        public int Category_Id { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual Product Product { get; set; }
    }
}
