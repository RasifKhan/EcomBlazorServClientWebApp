using Ecommerce_Model;

namespace EcommerceWeb_Server.Service.IService
{
    public interface IOrderCancel
    {
        public Task<OrderHeaderDTO> OrderCancel(OrderHeaderDTO orderHeaderDTO);
    }
}
