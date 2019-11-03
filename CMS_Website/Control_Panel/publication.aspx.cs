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
    public partial class publication : System.Web.UI.Page
    {
        PublicationDataAccessLayer dal = new PublicationDataAccessLayer();
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

            LoadPublication();
        }

        protected void LoadPublication()
        {
            DataTable dt = new DataTable();
            dt = dal.SelectAllInformation();
            GridViewPublication.DataSource = dt;
            GridViewPublication.DataBind();
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            PublicationObject publicationObj = new PublicationObject();

            publicationObj.PublicationTitle = tbxPublicationTitle.Text;
            publicationObj.PublicationPath = tbxPublicationLink.Text;
            publicationObj.UserId = Int32.Parse(Session["user_id"].ToString());

            if (ddlPublicationStatus.SelectedValue == "1")
            {
                publicationObj.Status = true;
            }
            else if (ddlPublicationStatus.SelectedValue == "0")
            {
                publicationObj.Status = false;
            }

            try
            {
                int result = dal.InsertInformation(publicationObj);
                if (result == 1)
                {
                    LoadPublication();
                    SuccessPanel.Visible = true;
                    tbxPublicationTitle.Text = "";
                    tbxPublicationLink.Text = "";

                }
                else
                {
                    DangerPanel.Visible = true;
                    tbxPublicationTitle.Text = "";
                    tbxPublicationLink.Text = "";
                }

            }
            catch
            {
                throw;
            }
        }

        protected void GridViewPublication_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadPublication();
            GridViewPublication.PageIndex = e.NewPageIndex;
            GridViewPublication.DataBind();
        }

        protected void grdViewPublication_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "lnkbtnPublicationEdit")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Session["Publication_id"] = id;
                Response.Redirect("/Control_Panel/update_publication.aspx");
            }
        }

        protected void GridViewPublication_RowDataBound(object sender, GridViewRowEventArgs e)
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