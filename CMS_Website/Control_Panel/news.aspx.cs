using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL;
using DAL;
using System.IO;
using System.Data;

namespace CMS_Website.Control_Panel
{
    public partial class news : System.Web.UI.Page
    {
        NewsDataAccessLayer dal = new NewsDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dashboard_status"] == null && Session["user_role"] == null)
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

            LoadNews();
        }

        protected void LoadNews()
        {
            DataTable dt = new DataTable();
            dt = dal.SelectAllInformation();
            GridViewNews.DataSource = dt;
            GridViewNews.DataBind();
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            NewsObject newsObj = new NewsObject();

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
                int result = dal.InsertInformation(newsObj);
                if (result == 1)
                {
                    LoadNews();
                    SuccessPanel.Visible = true;
                    tbxNewsTitle.Text = "";
                    tbxNewsLink.Text = "";
                    
                }
                else
                {
                    DangerPanel.Visible = true;
                    tbxNewsTitle.Text = "";
                    tbxNewsLink.Text = "";
                }

            }
            catch
            {
                throw;
            }
        }

        protected void GridViewNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadNews();
            GridViewNews.PageIndex = e.NewPageIndex;
            GridViewNews.DataBind();
        }

        protected void grdViewNews_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "lnkbtnNewsEdit")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Session["News_id"] = id;
                Response.Redirect("/Control_Panel/update_news.aspx");
            }
        }

        protected void GridViewNews_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Label lb = (Label)e.Row.Cells[3].FindControl("Status");
                if (lb.Text == "ACTIVE")
                {
                    e.Row.Cells[3].ForeColor = System.Drawing.Color.DarkGreen;
                }
                else if (lb.Text == "INACTIVE")
                {
                    e.Row.Cells[3].ForeColor = System.Drawing.Color.Crimson;
                }
            }
        }
    }
}