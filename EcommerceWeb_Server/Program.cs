using Ecommerce_Business.Repository;
using Ecommerce_Business.Repository.IRepository;
using Ecommerce_DataAccess.Data;
using EcommerceWeb_Server.Data;
using EcommerceWeb_Server.Service;
using EcommerceWeb_Server.Service.IService;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.EntityFrameworkCore;
using Syncfusion.Blazor;
using Microsoft.AspNetCore.Identity;
using Stripe;



//Old Key//Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("MjY3MDgxNkAzMjMyMmUzMDJlMzBIRDIyUWo2Sld0Wlh1K21idWh4NEs3Mm9USm1TaVAwTFVTTXN5WExKUGEwPQ ==");


Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("Mjc3MjQ2M0AzMjMzMmUzMDJlMzBJTWVKNnhLSzBqbUgzeEdCYnkxclRSWGRWSU9iYll3OXlYT2FKNDhRZkk4PQ ==");


var builder = WebApplication.CreateBuilder(args);


builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
builder.Services.AddSyncfusionBlazor();
builder.Services.AddSingleton<WeatherForecastService>();


builder.Services.AddDbContext<ApplicationDbContext>(options =>
   options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddIdentity<IdentityUser,IdentityRole>().AddDefaultTokenProviders().AddDefaultUI()
    .AddEntityFrameworkStores<ApplicationDbContext>();

//builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
    //.AddEntityFrameworkStores<ApplicationDbContext>();

builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
builder.Services.AddScoped<IProductRepository, ProductRepository>();
builder.Services.AddScoped<IProductPriceRepository, ProductPriceRepository>();
builder.Services.AddScoped<IOrderRepository, OrderRepository>();
builder.Services.AddScoped<IFileUpload,FileUpload>();
builder.Services.AddScoped<IDbInitializer, DbInitializer>();


//builder.Services.AddScoped<IEmailSendOrderCancel, EmailSendOrderCancel>();




//builder.services.AddSyncfusionBlazor();

builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
var app = builder.Build();

StripeConfiguration.ApiKey = builder.Configuration.GetSection("Stripe")["ApiKey"];

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}
app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();
SeedDatabase();
app.UseAuthentication();
app.UseAuthorization();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();

void SeedDatabase()
{
    using (var scope =app.Services.CreateScope())
    {
        var dbInitializer = scope.ServiceProvider.GetRequiredService<IDbInitializer>();
        dbInitializer.Initialize();
    }
}
