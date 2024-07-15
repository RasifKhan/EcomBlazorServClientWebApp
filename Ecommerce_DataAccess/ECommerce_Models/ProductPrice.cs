using System;
using System.Collections.Generic;

namespace Ecommerce_DataAccess.ECommerce_Models;

public partial class ProductPrice
{
    public int Id { get; set; }

    public int ProductId { get; set; }

    public string Size { get; set; } = null!;

    public double Price { get; set; }

    public virtual Product Product { get; set; } = null!;
}
