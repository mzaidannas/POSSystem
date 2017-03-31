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
    
    public partial class Sale
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Sale()
        {
            this.SaleProducts = new HashSet<SaleProduct>();
        }
    
        public int Id { get; set; }
        public int Company_Id { get; set; }
        public int Status_Id { get; set; }
        public int User_Id { get; set; }
        public int SaleProduct_Id { get; set; }
        public string CustomerName { get; set; }
        public string CustomerAddress { get; set; }
        public string CustomerNumber { get; set; }
        public string CustomerEmail { get; set; }
        public string City { get; set; }
        public double GrossTotal { get; set; }
        public double Discount { get; set; }
        public double Payable { get; set; }
        public double Paid { get; set; }
        public double Returned { get; set; }
        public string BarcodeInvoice { get; set; }
        public string Details { get; set; }
        public string CreateBy { get; set; }
        public System.DateTime CreateDate { get; set; }
        public string UpdateBy { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<bool> IsActive { get; set; }
    
        public virtual Company Company { get; set; }
        public virtual SaleProduct SaleProduct { get; set; }
        public virtual Status Status { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SaleProduct> SaleProducts { get; set; }
    }
}
