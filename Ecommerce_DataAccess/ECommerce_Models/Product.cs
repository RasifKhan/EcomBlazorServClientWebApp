using System;
using System.Collections.Generic;

namespace Ecommerce_DataAccess.ECommerce_Models;

public partial class Product
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; } = null!;

    public bool ShopFavorites { get; set; }

    public bool CustomerFavorites { get; set; }

    public string Color { get; set; } = null!;

    public string ImageUrl { get; set; } = null!;

    public int CategoryId { get; set; }

    public virtual Category Category { get; set; } = null!;

    public virtual ICollection<ProductPrice> ProductPrices { get; set; } = new List<ProductPrice>();
}
