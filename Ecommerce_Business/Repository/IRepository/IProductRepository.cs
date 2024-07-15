using Ecommerce_Model;
using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.JavaScript;
using System.Text;
using System.Threading.Tasks;

namespace Ecommerce_Business.Repository.IRepository
{
    public interface IProductRepository
    {
        public Task<ProductDTO> Create(ProductDTO objDTO);
        public Task <ProductDTO> Update(ProductDTO objDTO);
        public Task <int> Delete(int Id);
        public Task <ProductDTO> Get(int Id);
        public Task<IEnumerable<ProductDTO>> GetAll();
    }
}

