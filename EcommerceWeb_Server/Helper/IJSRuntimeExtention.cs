﻿using Microsoft.JSInterop;

namespace EcommerceWeb_Server.Helper
{
    public static class IJSRuntimeExtention
    {
        public static async ValueTask ToastrSuccess(this IJSRuntime jsRuntime, string message)
        {
            await jsRuntime.InvokeVoidAsync("ShowToastr", "success", message);
        }

        public static async ValueTask ToastrError(this IJSRuntime jsRuntime, string message)
        {
            await jsRuntime.InvokeVoidAsync("ShowToastr", "error", message);
        }
    }
}



//using Microsoft.JSInterop;
//namespace RasifWeb.Helper
//{
//    public static class IJSRuntimeExtention
//    {
//        public static async ValueTask ToastrSuccess(this IJSRuntime jsRuntime, string message)
//        {
//            await jsRuntime.InvokeVoidAsync("ShowToastr", "success", message);
//        }
//        public static async ValueTask ToastrError(this IJSRuntime jsRuntime, string message)
//        {
//            await jsRuntime.InvokeVoidAsync("ShowToastr", "error", message);
//        }
//    }
//}
