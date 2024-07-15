using Ecommerce_Model;
using System.IO.Pipes;

namespace ECommerceWeb_Client.Service.IService
{
    public interface IOrderService
    {
        public  Task<IEnumerable<OrderDTO>> GetAll(string? userId);
        public Task<OrderDTO> Get(int orderId);
        public Task<OrderDTO> Create(StripePaymentDTO paymentDTO);
        public Task<OrderHeaderDTO> MarkPaymentSuccessful(OrderHeaderDTO orderHeaderDTO);
    }
}
