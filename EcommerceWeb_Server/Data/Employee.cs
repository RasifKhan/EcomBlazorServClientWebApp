using System.Data;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Security.Cryptography;

namespace EcommerceWeb_Server.Data
{
    public class Employee
    {
        public DataTable GetEmployee()
        {
            {
                var dt = new DataTable();
                dt.Columns.Add(columnName: "EmpId");
                dt.Columns.Add(columnName: "EmpName");
                dt.Columns.Add(columnName: "Department");
                dt.Columns.Add(columnName: "Designation");
                dt.Columns.Add(columnName: "JoinDate");
                DataRow row1;
                for (int i = 1; i <= 50; i++)
                {
                    row1 = dt.NewRow();
                    row1["EmpId"] = i;
                    row1["EmpName"] = "Robert " + i;
                    row1["Department"] = "Information Technology";
                    row1["Designation"] = "Software Engineer";
                    row1["JoinDate"] = DateTime.Now.AddYears(-30).AddDays(i); dt.Rows.Add(row1);
                }
                return dt;
            }
        }
    }
}
