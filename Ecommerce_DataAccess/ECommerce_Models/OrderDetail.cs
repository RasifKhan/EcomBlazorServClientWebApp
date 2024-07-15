using System;
using System.Collections.Generic;

namespace Ecommerce_DataAccess.ECommerce_Models;

public partial class OrderDetail
{
    public int Id { get; set; }

    public int OrderHeaderId { get; set; }

    public int ProductId { get; set; }

    public int Count { get; set; }

    public double Price { get; set; }

    public string Size { get; set; } = null!;

    public string ProductName { get; set; } = null!;
}
