using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BOL;

namespace CMS_Website
{
    public partial class reports_and_publications : System.Web.UI.Page
    {
        ReportDataAccessLayer dalR = new ReportDataAccessLayer();
        PublicationDataAccessLayer dalP = new PublicationDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
                LoadReport();
                LoadPublication();
        }

        protected void LoadReport()
        {
            DataTable dt = new DataTable();
            dt = dalR.SelectAllInformation();
            DataView dv = dt.DefaultView;
            dv.RowFilter = "Status = True";
            DataTable dtNew = dv.ToTable();
            RepeaterReport.DataSource = dtNew;
            RepeaterReport.DataBind();
        }

        protected void LoadPublication()
        {
            DataTable dt = new DataTable();
            dt = dalP.SelectAllInformation();
            DataView dv = dt.DefaultView;
            dv.RowFilter = "Status = True";
            DataTable dtNew = dv.ToTable();
            RepeaterPublication.DataSource = dtNew;
            RepeaterPublication.DataBind();
        }
    }
}