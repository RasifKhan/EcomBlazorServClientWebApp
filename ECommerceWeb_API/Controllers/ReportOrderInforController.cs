
using AspNetCore.Reporting;
using DevExpress.DataAccess.Native.Data;
using DevExpress.XtraReports;
using Ecommerce_Business.Repository.IRepository;
using ECommerceWeb_API.Helper;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using System.Text;
using System.Data;
using Ecommerce_DataAccess.Data;
namespace ECommerceWeb_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReportOrderInforController : ControllerBase
    {

        private readonly ApplicationDbContext _dbContext;

        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly IReportEmployeeList _reportEmployeeList;

        private readonly ViewCatOrderInformation _viewCatOrderInformation;

        private readonly Category_Information _category_Information;
        // private readonly Category_Information  _category_Information=new Category_Information();
        // Category_Information _category_Information = new Category_Information(db);
        public ReportOrderInforController(IWebHostEnvironment webHostEnvironment, IReportEmployeeList reportEmployeeList, ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
            _category_Information = new Category_Information(_dbContext);
            _viewCatOrderInformation=new ViewCatOrderInformation(_dbContext);

            _webHostEnvironment = webHostEnvironment;
            _reportEmployeeList = reportEmployeeList;
            System.Text.Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);
        }










        [HttpGet]
        [Route("GetNewReport")]
        // public async Task<IActionResult> GetNewReport(int reportType)
        public async Task<IActionResult> GetNewReport(int reportType, string? productName)
        {
            try
            {
                //var orderData = await _reportEmployeeList.GetOrderReport();
                var dt = await _reportEmployeeList.GetOrderReport(productName);
                if (dt == null || !dt.Any())
                {
                    return BadRequest("No data available for the report.");
                }
                string mimeType = "";
                int extension = 1;
                var path = $"{this._webHostEnvironment.WebRootPath}Report\\reportOrderInfo.rdlc";
                Dictionary<string, string> parameters = new Dictionary<string, string>(); //del
                parameters.Add("param", productName);   //del
                LocalReport localReport = new LocalReport(path);
                localReport.AddDataSource("dsOrderInfo", dt);
                if (reportType == 1)
                {
                    var result = localReport.Execute(RenderType.Pdf, extension, parameters, mimeType);
                    return File(result.MainStream, "application/pdf");
                }
                else
                {
                    var result = localReport.Execute(RenderType.Excel, extension, parameters, mimeType);
                    return File(result.MainStream, "application/msexcel", "report.xls");
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine($"An error occurred: {ex.Message}");
                return StatusCode(500, "An error occurred while generating the report.");
            }
        }

        //--------------------
        //--------------------

        [HttpGet]
        [Route("GetCategoryReport")]
        public IActionResult GetCategoryReport(int reportType)
        {
            try
            {
              var  data = _category_Information.GetCategoryInfo();

                string mimeType = "";
                int extension = 1;

                var path = $"{this._webHostEnvironment.WebRootPath}Report\\ReportCategory.rdlc";
                Dictionary<string, string> parameters = new Dictionary<string, string>(); //del
                                                                                          // parameters.Add("param",productName);   //del
                LocalReport localReport = new LocalReport(path);
                localReport.AddDataSource("dsCategoryInfo", data);
                if (reportType == 1)
                {
                    var result = localReport.Execute(RenderType.Pdf, extension, parameters, mimeType);
                    return File(result.MainStream, "application/pdf");
                }
                else
                {
                    var result = localReport.Execute(RenderType.Excel, extension, parameters, mimeType);
                    return File(result.MainStream, "application/msexcel", "report.xls");
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine($"An error occurred: {ex.Message}");
                return StatusCode(500, "An error occurred while generating the report.");
            }
        }
        //*****************************************************
        //*****************************************************
        [HttpGet]
        [Route("GetViewCatOrderReport")]
        public IActionResult GetViewCatOrderReport(int reportType, DateTime? fromDate, DateTime? toDate)
        {
            try
            {
               // var data = new System.Data.DataTable();
                var data = _viewCatOrderInformation.GetViewCatOrderInfo(fromDate,toDate);

                string mimeType = "";
                int extension = 1;

                var path = $"{this._webHostEnvironment.WebRootPath}Report\\ReportView_CatOrder.rdlc";
                Dictionary<string, string> parameters = new Dictionary<string, string>(); //del
                                                                // parameters.Add("param2", toDate);
                if (fromDate != null)
                {
                    parameters.Add("param1", fromDate.Value.ToString("MM/dd/yyyy"));
                }

                if (toDate != null)
                {
                    parameters.Add("param2", toDate.Value.ToString("MM/dd/yyyy"));
                }

                LocalReport localReport = new LocalReport(path);
                localReport.AddDataSource("dsReportViewCatOrder", data);
                if (reportType == 1)
                {
                    var result = localReport.Execute(RenderType.Pdf, extension, parameters, mimeType);
                    return File(result.MainStream, "application/pdf");
                }
                else
                {
                    var result = localReport.Execute(RenderType.Excel, extension, parameters, mimeType);
                    return File(result.MainStream, "application/msexcel", "report.xls");
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine($"An error occurred: {ex.Message}");
                return StatusCode(500, "An error occurred while generating the report.");
            }
        }
    }
}