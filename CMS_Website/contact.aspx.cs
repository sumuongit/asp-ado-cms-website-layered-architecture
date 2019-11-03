using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS_Website
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SuccessPanel.Visible = false;
        }

        protected void btn_send_Click(object sender, EventArgs e)
        {
            SmtpSection secObj = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");

            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(secObj.From,"CMS"); //--- Email address of the sender
                mail.To.Add("info@testbd.org"); //---- Email address of the recipient.
                mail.Subject = TextBox_Subject.Text; //---- Subject of email.
                mail.Body = TextBox_Message.Text + " \n" + "Name : " + TextBox_Name.Text + "\n" + "Email : " + TextBox_Email.Text; //---- Content of email.

                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Host = secObj.Network.Host; //---- SMTP Host Details. 
                smtpClient.EnableSsl = secObj.Network.EnableSsl; //---- Specify whether host accepts SSL Connections or not.
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential(secObj.Network.UserName, secObj.Network.Password);
                //---Your Email and password
                smtpClient.UseDefaultCredentials = true;
                smtpClient.Credentials = NetworkCred;
                //System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                smtpClient.Port = secObj.Network.Port; //---- SMTP Server port number. This varies from host to host. 
                try
                {
                    smtpClient.Send(mail);
                    SuccessPanel.Visible = true;
                    TextBox_Name.Text = "";
                    TextBox_Email.Text = "";
                    TextBox_Subject.Text = "";
                    TextBox_Message.Text = "";

                }
                catch (Exception ex)
                {
                    SuccessPanel.Visible = false;
                    UnsuccessPanel.Visible = true;
                    Exception ex2 = ex;
                }
            }
            
        }
    }
}