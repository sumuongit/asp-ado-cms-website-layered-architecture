using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL;
using DAL;
using System.Data;
using System.IO;

namespace CMS_Website.Control_Panel
{
    public partial class update_news : System.Web.UI.Page
    {
        NewsDataAccessLayer dal = new NewsDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dashboard_status"] == null && Session["user_role"] == null && Session["News_id"] == null)
            {
                Response.Redirect("/home.aspx");
            }
            else
            {
                if (Session["user_role"].Equals("user"))
                {
                    Response.Redirect("/Control_Panel/story.aspx");
                }
            }

            if (!IsPostBack)
            {
                if (Session["News_id"] != null)
                {
                    getNewsById();
                }
                else
                {
                    Response.Redirect("/home.aspx");
                }
            }
        }

        protected void getNewsById()
        {
            int id = int.Parse(Session["News_id"].ToString());
            DataTable dt = new DataTable();
            try
            {
                dt = dal.SelectInformationById(id);
                tbxNewsTitle.Text = dt.Rows[0]["NewsTitle"].ToString();
                tbxNewsLink.Text = dt.Rows[0]["NewsLink"].ToString();
              
                if (dt.Rows[0]["Status"].ToString() == "True")
                {
                    ddlNewsStatus.SelectedIndex = 0;
                }
                else
                {
                    ddlNewsStatus.SelectedIndex = 1;
                }
            }
            catch
            {
                throw;
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            NewsObject newsObj = new NewsObject();

            newsObj.NewsId = int.Parse(Session["News_id"].ToString());
            DataTable dt = dal.SelectInformationById(newsObj.NewsId);
            newsObj.NewsTitle = tbxNewsTitle.Text;
            newsObj.NewsLink = tbxNewsLink.Text;
            newsObj.UserId = Int32.Parse(Session["user_id"].ToString());

            if (ddlNewsStatus.SelectedValue == "1")
            {
                newsObj.Status = true;
            }
            else if (ddlNewsStatus.SelectedValue == "0")
            {
                newsObj.Status = false;
            }

            try
            {
                int result = dal.UpdateInformation(newsObj);
                if (result == 1)
                {
                   
                    SuccessPanel.Visible = true;


                }
                else
                {
                    DangerPanel.Visible = true;

                }

            }
            catch
            {
                throw;
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Session.Remove("News_id");
            Response.Redirect("/Control_Panel/news.aspx");
        }
    }
}