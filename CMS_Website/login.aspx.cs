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
using BOL;
using DAL;


namespace CMS_Website
{
    public partial class login : System.Web.UI.Page
    {
        UserDataAccessLayer dal = new UserDataAccessLayer();
      
        protected void Page_Load(object sender, EventArgs e)
        {
            DangerPanel.Visible = false;
        }

        protected void btn_login(object sender, EventArgs e)
        {
            string email;
            string password;

            UserObject userObj = new UserObject();
            userObj.Email = TextBox_Useremail.Text;
            userObj.Password = TextBox_Password.Text;
            DataTable dt = new DataTable();
            try
            {
                dt = dal.SelectInformationByCredentiaInfo(userObj);
                int RowCount = dt.Rows.Count;

                if(RowCount==0)
                {
                    DangerPanel.Visible = true;
                }
                else
                {
                    for (int i = 0; i < RowCount; i++)
                    {
                        email = dt.Rows[i]["Email"].ToString();
                        password = dt.Rows[i]["Password"].ToString();

                        if (email == TextBox_Useremail.Text && password == TextBox_Password.Text && dt.Rows[i]["Status"].Equals(true))
                        {
                            if (dt.Rows[i]["RoleId"].Equals(1) && dt.Rows[i]["Status"].Equals(true))
                            {
                                Session["dashboard_status"] = "true";
                                Session["user_role"] = "admin";
                                Session["user_id"]= dt.Rows[i]["UserId"].ToString();
                                Response.Redirect("/Control_Panel/story.aspx");
                            }
                            else if (dt.Rows[i]["RoleId"].Equals(2) && dt.Rows[i]["Status"].Equals(true))
                            {
                                Session["dashboard_status"] = "true";
                                Session["user_role"] = "user";
                                Session["user_id"] = dt.Rows[i]["UserId"].ToString();
                                Response.Redirect("/Control_Panel/story.aspx");
                            }
                        }
                        else
                        {
                            DangerPanel.Visible = true;
                        }
                    }
                }

            }

            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }


        }
    }
}