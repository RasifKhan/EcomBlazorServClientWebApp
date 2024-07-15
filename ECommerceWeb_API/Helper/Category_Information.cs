
using Ecommerce_DataAccess.Data;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace ECommerceWeb_API.Helper
{
    public class Category_Information
    {
        private readonly ApplicationDbContext _db;
        public Category_Information(ApplicationDbContext db)
        {
            _db= db;
        }
        public DataTable GetCategoryInfo()
        {
            var data=new DataTable();
            data.Columns.Add(columnName: "Id");
            data.Columns.Add(columnName: "Name");

            var catInfoFromDb= _db.Categories.ToList();
          

            foreach (var item in catInfoFromDb)
            {
                var row=data.NewRow();
                row["Id"] = item.Id;
                row["Name"]=item.Name;
                data.Rows.Add(row);
            }
            return data;
        }
    }
}


