using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration;
using System.Xml.Linq;
using System.Net.Mail;
using BOL;
using DAL;
using System.Net.Configuration;

namespace CMS_Website
{
    public partial class forget_password : System.Web.UI.Page
    {
        UserDataAccessLayer dal = new UserDataAccessLayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            SuccessPanel.Visible = false;
            DangerPanel.Visible = false;
        }

        protected void btn_send(object sender, EventArgs e)
        {
            int count_success=0;
            string email;

            UserObject userObj = new UserObject();
            userObj.Email = TextBox_forget_Useremail.Text;
            DataTable dt = new DataTable();

            try
            {
                dt = dal.SelectInformationByEmail(userObj);
                int RowCount = dt.Rows.Count;

                for (int i = 0; i < RowCount; i++)
                {
                    email = dt.Rows[i]["Email"].ToString();
                    if (email == TextBox_forget_Useremail.Text)
                    {
                        if (dt.Rows[i]["RoleId"].Equals(2) && dt.Rows[i]["Status"].Equals(true))
                        {
                            count_success++;
                            
                            SmtpSection secObj = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");

                            using (MailMessage mail = new MailMessage())
                            {
                                mail.From = new MailAddress(secObj.From, "CMS"); //--- Email address of the sender
                                mail.To.Add(TextBox_forget_Useremail.Text); //---- Email address of the recipient.
                                mail.Subject = "Password for login in CMS"; //---- Subject of email.
                                mail.Body = "Your password is: " + dt.Rows[i]["Password"].ToString(); //---- Content of email.

                                SmtpClient smtpClient = new SmtpClient();
                                smtpClient.Host = secObj.Network.Host; //---- SMTP Host Details. 
                                smtpClient.EnableSsl = secObj.Network.EnableSsl; //---- Specify whether host accepts SSL Connections or not.
                                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential(secObj.Network.UserName, secObj.Network.Password);
                                //---Your Email and password
                                smtpClient.UseDefaultCredentials = true;
                                smtpClient.Credentials = NetworkCred;
                                smtpClient.Port = secObj.Network.Port;
                                try
                                {
                                    smtpClient.Send(mail);
                                    SuccessPanel.Visible = true;
                                }
                                catch (Exception ex)
                                {
                                    UnsuccessPanel.Visible = true;
                                    Exception ex2 = ex;
                                    string errorMessage = string.Empty;
                                    while (ex2 != null)
                                    {
                                        errorMessage += ex2.ToString();
                                        ex2 = ex2.InnerException;
                                    }

                                }
                            }
                            
                        }

                    }
                }

                if(count_success==0)
                {
                    DangerPanel.Visible = true;
                }
              
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
    }
}