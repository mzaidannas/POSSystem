using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utility
{
    public enum Status
    {
        Pending = 2,
        [Description("Ready to ship")]
        ReadyToShip = 3,
        Dispatched = 4,
        Delivered = 5,
        Undelivered = 6,
        Returned = 9,
        Canceled = 10,
        Other = 11
    };
}
