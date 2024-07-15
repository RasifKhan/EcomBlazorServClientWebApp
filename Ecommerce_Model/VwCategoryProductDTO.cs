using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecommerce_Model
{
    public class VwCategoryProductDTO
    {
        public string CategoryName { get; set; } = null!;

        public string ProductName { get; set; } = null!;

        public string Description { get; set; } = null!;

        public string Color { get; set; } = null!;

        public int Id { get; set; }

    }
}
