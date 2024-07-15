using MailKit.Net.Smtp;
using Microsoft.AspNetCore.Identity.UI.Services;
using MimeKit;

namespace EcommerceWeb_Server.Helper
{
    public class OrderCancelEmail
    {
        public async Task EmailSendOrderCancel(string Email, int Id)
        {
            var message = new MimeMessage();
            message.From.Add(new MailboxAddress("ATL E-Shop", "ecommerceasiantech@gmail.com"));
            message.To.Add(new MailboxAddress("Customer",Email));
            message.Subject = "Order Cancellation";
            var bodyBuilder = new BodyBuilder();
            bodyBuilder.TextBody = $"Dear customer,\n\nYour order {Id} has been cancelled.";
            message.Body = bodyBuilder.ToMessageBody();
            //using (var client = new SmtpClient())
            //{
            //    await client.ConnectAsync("smtp.yourprovider.com", 587, false);
            //    await client.AuthenticateAsync("ecommerceasiantech@gmail.com", "xpzh dvrl ofgu vtyb");
            //    await client.SendAsync(message);
            //    await client.DisconnectAsync(true);
            //}
            using var emailClient = new SmtpClient();
            emailClient.Connect("smtp.gmail.com", 587, MailKit.Security.SecureSocketOptions.StartTls);
            // Use the generated App Password from Gmail App instead of your account password
            emailClient.Authenticate("ecommerceasiantech@gmail.com", "xpzh dvrl ofgu vtyb");
            emailClient.Send(message);
            emailClient.Disconnect(true);
        }
    }
}


