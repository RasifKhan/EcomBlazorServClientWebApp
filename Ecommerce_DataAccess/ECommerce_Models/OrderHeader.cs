using System;
using System.Collections.Generic;

namespace Ecommerce_DataAccess.ECommerce_Models;

public partial class OrderHeader
{
    public int Id { get; set; }

    public string UserId { get; set; } = null!;

    public double OrderTotal { get; set; }

    public DateTime OrderDate { get; set; }

    public DateTime ShippingDate { get; set; }

    public string Status { get; set; } = null!;

    public string? SessionId { get; set; }

    public string? PaymentIntentId { get; set; }

    public string Name { get; set; } = null!;

    public string PhoneNumber { get; set; } = null!;

    public string StreetAddress { get; set; } = null!;

    public string State { get; set; } = null!;

    public string City { get; set; } = null!;

    public string PostalCode { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string? Carrier { get; set; }

    public string? Tracking { get; set; }
}
