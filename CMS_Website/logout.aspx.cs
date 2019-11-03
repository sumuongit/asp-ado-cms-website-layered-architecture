using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS_Website
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["dashboard_status"] != null && Session["user_role"] != null)
            {
                Session.Abandon();
                Session.Clear();
                Response.Redirect("home.aspx");
            }
            else
            {
                Response.Redirect("home.aspx");
            }
        }
    }
}