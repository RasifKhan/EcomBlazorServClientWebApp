﻿using Ecommerce_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecommerce_Business.Repository.IRepository
{
    public interface IOrderRepository
    {
        public Task<OrderDTO> Get(int id);
        public Task<IEnumerable<OrderDTO>> GetAll(string? userId = null, string? status = null);
        public Task<OrderDTO> Create(OrderDTO objDTO);
        public Task<int> Delete(int id);
        public Task<OrderHeaderDTO> UpdateHeader(OrderHeaderDTO objDTO);

        public Task<OrderHeaderDTO> MarkPaymentSuccessful(int id);

        public Task<bool> UpdateOrderStatus(int OrderId, string status);

        public Task<OrderHeaderDTO> CancleOrder(int id);

    }
}
