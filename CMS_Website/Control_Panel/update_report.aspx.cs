using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BOL;
using System.IO;

namespace CMS_Website.Control_Panel
{
    
    public partial class update_report : System.Web.UI.Page
    {
       ReportDataAccessLayer dal = new ReportDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dashboard_status"] == null && Session["user_role"] == null && Session["Report_id"] == null)
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
                if (Session["Report_id"] != null)
                {
                    getReportById();
                }
                else
                {
                    Response.Redirect("/home.aspx");
                }
            }
        }

        protected void getReportById()
        {
            int id = int.Parse(Session["Report_id"].ToString());
            DataTable dt = new DataTable();
            try
            {
                dt = dal.SelectInformationById(id);
                tbxReportTitle.Text = dt.Rows[0]["ReportTitle"].ToString();
               
                if (dt.Rows[0]["Status"].ToString() == "True")
                {
                    ddlReportStatus.SelectedIndex = 0;
                }
                else
                {
                    ddlReportStatus.SelectedIndex = 1;
                }
            }
            catch
            {
                throw;
            }
        }




        protected void btn_back_Click(object sender, EventArgs e)
        {
            Session.Remove("Report_id");
            Response.Redirect("/Control_Panel/report.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            ReportObject reportObj = new ReportObject();

            reportObj.ReportId = int.Parse(Session["Report_id"].ToString());
            DataTable dt = dal.SelectInformationById(reportObj.ReportId);
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
            else
            {
                reportObj.ReportPath= dt.Rows[0]["ReportPath"].ToString();
            }

            try
            {
                int result = dal.UpdateInformation(reportObj);
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
    }
}