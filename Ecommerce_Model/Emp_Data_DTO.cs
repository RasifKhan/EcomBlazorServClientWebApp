using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecommerce_Model
{
    public class Emp_Data_DTO
    {
            public int EmpId { get; set; }
            public string EmpName { get; set; }
            public string Department { get; set; }
            public string Designation { get; set; }
            public DateTime JoinDate { get; set; }
    }
}
