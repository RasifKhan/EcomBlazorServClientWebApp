using ECommerceWeb_Client.Service.IService;
using Microsoft.AspNetCore.Components;

namespace ECommerceWeb_Client.Pages.Authentication
{
    public partial class Logout
    {
        [Inject]
        public IAuthenticationService _authService { get; set; }
        [Inject]
        public NavigationManager  _navigationManager {get;set;}

        protected async override Task OnInitializedAsync()
        {
            await _authService.Logout();
            //_navigationManager.NavigateTo("/", forceLoad: true);
            _navigationManager.NavigateTo("/");
        }
    }
}
