using Ecommerce_Model;
using ECommerceWeb_Client.Service.IService;
using Microsoft.AspNetCore.Components;
using System.Web;

namespace ECommerceWeb_Client.Pages.Authentication
{
    public partial class Login
    {
        private SignInRequestDTO SignInRequest = new();
        public bool IsProcessing { get; set; } = false;

        public bool ShowSignInErrors { get; set; }
        public String Errors { get; set; }
        [Inject]
        public IAuthenticationService _authService { get; set; }
        [Inject]
        public NavigationManager _navigationManager { get; set; }

        public string ReturnUrl {get; set;}
        private async Task LoginUser()
        {
            ShowSignInErrors = false;
            IsProcessing = true;
            var result = await _authService.Login(SignInRequest);

            if (result.IsAuthSuccessful)
            {

                var absoluteUrl = new Uri(_navigationManager.Uri);
                var queryParam = HttpUtility.ParseQueryString(absoluteUrl.Query);
                ReturnUrl = queryParam["returnUrl"];
                if (string.IsNullOrEmpty(ReturnUrl))
                {   //empty
                    //registration is successful
                    // _navigationManager.NavigateTo("/",forceLoad:true); 
                    _navigationManager.NavigateTo("/");  // navigate to the homePage
                }
                else
                {
                    _navigationManager.NavigateTo("/" + ReturnUrl);
                }
            }
            
        
            else
            {
                //failure  
                Errors = result.ErrorMessage;
                ShowSignInErrors = true;
            }
            IsProcessing = false;
        }
    }
}

