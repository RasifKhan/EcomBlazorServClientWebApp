using System;
using System.Collections.Generic;

namespace Ecommerce_DataAccess.Data.Scaffolded;

public partial class VwCategoryProduct
{
    public string CategoryName { get; set; } = null!;

    public string ProductName { get; set; } = null!;

    public string? Description { get; set; }

    public string Color { get; set; } = null!;

    public int Id { get; set; }

    //public string? CreateDate { get; set; }
    public DateTime? CreateDate { get; set; }


}
