using Ecommerce_Model;
using ECommerceWeb_Client.ViewModels;

namespace ECommerceWeb_Client.Service.IService
{
    public interface IPaymentService
    {
        public Task<SuccessModelDTO> Checkout(StripePaymentDTO model);
    }
}
