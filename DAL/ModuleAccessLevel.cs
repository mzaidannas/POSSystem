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
    
    public partial class ModuleAccessLevel
    {
        public int Id { get; set; }
        public int Company_Id { get; set; }
        public string AspNetRoles_Id { get; set; }
        public int Module_Id { get; set; }
    
        public virtual AspNetRole AspNetRole { get; set; }
        public virtual Module Module { get; set; }
    }
}
