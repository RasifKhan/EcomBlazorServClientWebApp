//using DevExpress.DataAccess.Native.Data;
using Ecommerce_DataAccess.Data;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace ECommerceWeb_API.Helper
{
    public class ViewCatOrderInformation
    {
        private readonly ApplicationDbContext _db;
        public ViewCatOrderInformation(ApplicationDbContext db)
        {
            _db= db;
        }
        public DataTable GetViewCatOrderInfo()
        {
            var data=new DataTable();
            data.Columns.Add(columnName: "Id");
            data.Columns.Add(columnName: "CategoryName");
            data.Columns.Add(columnName: "ProductName");
            data.Columns.Add(columnName: "Description");
            data.Columns.Add(columnName: "Color");
           

            var infoFromDb= _db.VWCategoryProducts.ToList();
          

            foreach (var item in infoFromDb)
            {
                var row=data.NewRow();
                row["Id"] = item.Id;
                row["CategoryName"] =item.CategoryName;
                row["ProductName"] = item.ProductName;
                row["Description"] = item.Description;
                row["Color"] = item.Color;

                data.Rows.Add(row);
            }
            return data;
        }
    }
}


