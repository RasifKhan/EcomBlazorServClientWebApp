

/////************************************Reteieving Data by Using LINQ 
//using Ecommerce_DataAccess.Data;
//using Microsoft.EntityFrameworkCore;
//using System.Data;
//public class ViewCatOrderInformation
//{
//    private readonly ApplicationDbContext _db;

//    public ViewCatOrderInformation(ApplicationDbContext db)
//    {
//        _db = db;
//    }
//    public DataTable GetViewCatOrderInfo(DateTime? fromDate, DateTime? toDate)
//    {
//        var data = new DataTable();
//        data.Columns.Add(columnName: "Id");
//        data.Columns.Add(columnName: "CategoryName");
//        data.Columns.Add(columnName: "ProductName");
//        data.Columns.Add(columnName: "Description");
//        data.Columns.Add(columnName: "Color");
//        data.Columns.Add(columnName: "CreateDate");
//        var infoFromDb= _db.VW_CategoryProduct.ToList();
//        if (fromDate != null && toDate != null)
//        {
//            //infoFromDb = infoFromDb
//            // .Where(item => DateTime.Parse(item.CreateDate) >= fromDate.Value && DateTime.Parse(item.CreateDate) <= toDate.Value)
//            // .ToList();
//             infoFromDb = infoFromDb
//             .Where(item => item.CreateDate.HasValue && item.CreateDate.Value.Date >= fromDate.Value.Date &&
//             item.CreateDate.Value.Date <= toDate.Value.Date)
//             .ToList();
//        }
//        else
//        {
//            // No date filtering needed, use all data
//            // infoFromDb remains unchanged in this case
//            //var infoFromDb = _db.VW_CategoryProduct.ToList();
//        }

//        var result = infoFromDb.ToList();
//        foreach (var item in result)
//        {
//            var row = data.NewRow();
//            row["Id"] = item.Id;
//            row["CategoryName"] = item.CategoryName;
//            row["ProductName"] = item.ProductName;
//            row["Description"] = item.Description;
//            row["Color"] = item.Color;
//            if (item.CreateDate.HasValue)
//            {
//                row["CreateDate"] = item.CreateDate.Value;
//            }
//            else
//            {
//                // Handle the case where CreateDate is null
//                // You can set a default value or handle it according to your requirements
//                row["CreateDate"] = DBNull.Value; // or DateTime.MinValue, or any other default value
//            }

//            data.Rows.Add(row);
//        }
//        return data;
//    }
//}
////*********************Retrieving Data by Using SQL 

using Ecommerce_DataAccess.Data;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Data;
using System.Linq;
public class ViewCatOrderInformation
{
    private readonly ApplicationDbContext _db;

    public ViewCatOrderInformation(ApplicationDbContext db)
    {
        _db = db;
    }

    public DataTable GetViewCatOrderInfo(DateTime? fromDate, DateTime? toDate)
    {
        var data = new DataTable();
        data.Columns.Add(columnName: "Id");
        data.Columns.Add(columnName: "CategoryName");
        data.Columns.Add(columnName: "ProductName");
        data.Columns.Add(columnName: "Description");
        data.Columns.Add(columnName: "Color");
        data.Columns.Add(columnName: "CreateDate");

        using (var connection = new SqlConnection(_db.Database.GetConnectionString()))
        {
            connection.Open();

            using (var command = new SqlCommand())
            {
                command.Connection = connection;

                if (fromDate != null && toDate != null)
                {
                    command.CommandText = @"
                        SELECT *
                        FROM VW_CategoryProduct
                        WHERE
                            (CreateDate IS NOT NULL AND
                                CAST(CreateDate AS DATE) >= @fromDate AND
                                CAST(CreateDate AS DATE) <= @toDate)";

                    command.Parameters.AddWithValue("@fromDate", fromDate ?? (object)DBNull.Value);
                    command.Parameters.AddWithValue("@toDate", toDate ?? (object)DBNull.Value);
                }
                else
                {
                    // No date filtering needed, include all records
                    command.CommandText = @"
                        SELECT *
                        FROM VW_CategoryProduct";
                }

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var row = data.NewRow();
                        row["Id"] = reader["Id"];
                        row["CategoryName"] = reader["CategoryName"];
                        row["ProductName"] = reader["ProductName"];
                        row["Description"] = reader["Description"];
                        row["Color"] = reader["Color"];
                        row["CreateDate"] = reader["CreateDate"] != DBNull.Value ? reader["CreateDate"] : DBNull.Value;
                        data.Rows.Add(row);
                    }
                }
            }
        }
        return data;
    }
}