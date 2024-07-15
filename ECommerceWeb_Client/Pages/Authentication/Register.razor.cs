using Ecommerce_Model;
using ECommerceWeb_Client.Service.IService;
using Microsoft.AspNetCore.Components;

namespace ECommerceWeb_Client.Pages.Authentication
{
    public partial class Register
    {

        private SignUpRequestDTO SignUpRequest = new();
        public bool IsProcessing { get; set; } = false;

        public bool ShowRegistrationErrors { get; set; }
        public IEnumerable<String> Errors { get; set; }


        //@inject IAuthenticationService _authService //we will inject in different way
        //@inject NavigationManager _navigationManager 
        [Inject]
        public IAuthenticationService _authService { get; set; }
        [Inject]
        public NavigationManager _navigationManager { get; set; }
        private async Task RegisterUser()
        {
            ShowRegistrationErrors = false;
            IsProcessing = true;
            //var result=_authService.RegisterUser(SignUpRequest).GetAwaiter().GetResult();
            var result = await _authService.RegisterUser(SignUpRequest);

            if (result.IsRegistrationSuccessful)
            {
                //registration is successful
                _navigationManager.NavigateTo("/login");
            }
            else
            {
                //failure  
                Errors = result.Errors;
                ShowRegistrationErrors = true;
            }
            IsProcessing = false;
        }
    }
}

