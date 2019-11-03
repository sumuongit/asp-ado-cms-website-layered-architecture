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
    public partial class report : System.Web.UI.Page
    {
       ReportDataAccessLayer dal = new ReportDataAccessLayer();
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

            LoadReport();
        }

        protected void LoadReport()
        {
            DataTable dt = new DataTable();
            dt = dal.SelectAllInformation();
            GridViewReport.DataSource = dt;
            GridViewReport.DataBind();
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            ReportObject reportObj = new ReportObject();

            reportObj.ReportTitle = tbxReportTitle.Text;
            reportObj.UserId = Int32.Parse(Session["user_id"].ToString());

            if (ddlReportStatus.SelectedValue == "1")
            {
                reportObj.Status = true;
            }
            else if (ddlReportStatus.SelectedValue == "0")
            {
                reportObj.Status = false;
            }

            if (ReportUpload.HasFile)
            {
                string extension = Path.GetExtension(ReportUpload.FileName);
                string reportpath = Guid.NewGuid().ToString() + extension;
                string uploadFolder = "~/Report_Files/";
                ReportUpload.SaveAs(Server.MapPath(uploadFolder + reportpath));
                reportObj.ReportPath = reportpath;
            }

            try
            {
                int result = dal.InsertInformation(reportObj);
                if (result == 1)
                {
                    LoadReport();
                    SuccessPanel.Visible = true;
                    tbxReportTitle.Text = "";
                   

                }
                else
                {
                    DangerPanel.Visible = true;
                    tbxReportTitle.Text = "";
                  
                }

            }
            catch
            {
                throw;
            }
        }

        protected void GridViewReport_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadReport();
            GridViewReport.PageIndex = e.NewPageIndex;
            GridViewReport.DataBind();
        }

        protected void grdViewReport_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "lnkbtnReportEdit")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Session["Report_id"] = id;
                Response.Redirect("/Control_Panel/update_report.aspx");
            }
        }

        protected void GridViewReport_RowDataBound(object sender, GridViewRowEventArgs e)
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