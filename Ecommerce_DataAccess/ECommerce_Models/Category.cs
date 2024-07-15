using System;
using System.Collections.Generic;

namespace Ecommerce_DataAccess.ECommerce_Models;

public partial class Category
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public DateTime CreateDate { get; set; }

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
