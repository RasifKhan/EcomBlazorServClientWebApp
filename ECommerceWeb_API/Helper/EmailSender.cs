using MailKit.Net.Smtp;
using MailKit.Security;
using Microsoft.AspNetCore.Identity.UI.Services;
using MimeKit;
namespace ECommerceWeb_API.Helper
{
    public class EmailSender : IEmailSender
    {
        public async Task SendEmailAsync(string email, string subject, string htmlMessage)
        {
            try
            {
                var emailToSend = new MimeMessage();
                emailToSend.From.Add(MailboxAddress.Parse("ecommerceasiantech@gmail.com"));
                //emailToSend.From.Add(new MailboxAddress("ATL E-Shop", "ecommerceasiantech@gmail.com"));
                emailToSend.To.Add(MailboxAddress.Parse(email));
                emailToSend.Subject = subject;
                emailToSend.Body = new TextPart(MimeKit.Text.TextFormat.Html) { Text = htmlMessage };
                using var emailClient = new SmtpClient();
                emailClient.Connect("smtp.gmail.com", 587, MailKit.Security.SecureSocketOptions.StartTls);
                // Use the generated App Password from Gmail App instead of your account password
                emailClient.Authenticate("ecommerceasiantech@gmail.com", "xpzh dvrl ofgu vtyb");
                emailClient.Send(emailToSend);
                emailClient.Disconnect(true);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
