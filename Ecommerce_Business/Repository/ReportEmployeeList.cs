using AutoMapper;
using Ecommerce_Business.Repository.IRepository;
using Ecommerce_DataAccess;
using Ecommerce_DataAccess.Data;
using Ecommerce_Model;
using Microsoft.EntityFrameworkCore;
using Stripe;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Ecommerce_Business.Repository
{
    public class ReportEmployeeList : IReportEmployeeList
    {
        private readonly ApplicationDbContext _db;
        private readonly IMapper _mapper;
        public ReportEmployeeList(ApplicationDbContext db, IMapper mapper)
        {
            _db = db;
            _mapper= mapper;
        }
        public async Task<IEnumerable<OrderDetailDTO>> GetOrderReport(string productName)
        {
            IEnumerable<OrderDetail> orderDetailList;

            if (!string.IsNullOrEmpty(productName))
            {
                // If productName is provided, filter the results based on it
                orderDetailList = await _db.OrderDetails.Where(o => o.ProductName == productName)
                                  .ToListAsync();
            }
            else
            {
                // If no productName provided, retrieve all order details
                orderDetailList = await _db.OrderDetails.ToListAsync();
                //orderDetailList = await _db.VwCategoryProducts .ToListAsync();
            }

            List<OrderDetailDTO> orderDetailDTOList = new List<OrderDetailDTO>();
            foreach (OrderDetail item in orderDetailList)
            {
                OrderDetailDTO orderDetailDTO = new OrderDetailDTO
                {
                    Id = item.Id,
                    ProductName = item.ProductName,
                    Price = item.Price,
                };
                orderDetailDTOList.Add(orderDetailDTO);
            }
            return orderDetailDTOList;
        }
    }
}
    
