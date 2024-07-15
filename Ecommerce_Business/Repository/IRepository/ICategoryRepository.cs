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
    public interface ICategoryRepository
    {
        public Task<CategoryDTO> Create(CategoryDTO objDTO);
        public Task <CategoryDTO> Update(CategoryDTO objDTO);
        public Task <int> Delete(int Id);

        public Task<int> DeleteFromSP(int Id);
        public Task <CategoryDTO> Get(int Id);
        public Task<IEnumerable<CategoryDTO>> GetAll();
    }
}

