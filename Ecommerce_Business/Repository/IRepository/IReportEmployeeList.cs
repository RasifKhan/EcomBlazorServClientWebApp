using Ecommerce_Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecommerce_Business.Repository.IRepository
{
    public interface IReportEmployeeList
    {
        // Task<DataTable> GetEmployee();

        // Task<IEnumerable<Emp_Data_DTO>> GetEmployee();

        // Task<IEnumerable<OrderDetailDTO>> GetOrderReport();

        //  Task<IEnumerable<OrderDetailDTO>> GetOrderReport(string productName);

        Task<IEnumerable<OrderDetailDTO>> GetOrderReport(string productName);





    }
}
