using BOL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;

namespace CMS_Website.Control_Panel
{
    public partial class Banner : System.Web.UI.Page
    {
        BannerDataAccessLayer dal = new BannerDataAccessLayer();
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
            LoadBanner();
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            BannerObject bannerObj = new BannerObject();

            bannerObj.BannerInformation = tbxBannerInfo.Text;
            bannerObj.UserId = Int32.Parse(Session["user_id"].ToString());

            if (ddlBannerStatus.SelectedValue == "1")
            {
                bannerObj.Status = true;
            }
            else if (ddlBannerStatus.SelectedValue == "0")
            {
                bannerObj.Status = false;
            }

            if (PhotoUpload.HasFile)
            {
                string extension = Path.GetExtension(PhotoUpload.FileName);
                string photopath = Guid.NewGuid().ToString() + extension;
                string uploadFolder = "~/Banner_Photos/";
                PhotoUpload.SaveAs(Server.MapPath(uploadFolder + photopath));
                bannerObj.PhotoPath = photopath;
            }

            try
            {
                int result = dal.InsertInformation(bannerObj);
                if (result == 1)
                {
                    LoadBanner();
                    SuccessPanel.Visible = true;
                    tbxBannerInfo.Text = "";
                }
                else
                {
                    DangerPanel.Visible = true;
                    tbxBannerInfo.Text = "";
                }

            }
            catch
            {
                throw;
            }


        }


        protected void LoadBanner()
        {
            DataTable dt = new DataTable();
            dt = dal.SelectAllInformation();
            GridViewBanner.DataSource = dt;
            GridViewBanner.DataBind();
        }

        protected void GridViewBanner_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadBanner();
            GridViewBanner.PageIndex = e.NewPageIndex;
            GridViewBanner.DataBind();
        }

        protected void grdViewBanner_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "lnkbtnBannerEdit")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Session["Banner_id"] = id;
                Response.Redirect("/Control_Panel/update_banner.aspx"); /* Pass id in querystring for updating record */
            }
        }

        protected void GridViewBanner_RowDataBound(object sender, GridViewRowEventArgs e)
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