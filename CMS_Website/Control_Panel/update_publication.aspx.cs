using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BOL;

namespace CMS_Website.Control_Panel
{
    public partial class update_publication : System.Web.UI.Page
    {
        PublicationDataAccessLayer dal = new PublicationDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dashboard_status"] == null && Session["user_role"] == null && Session["Publication_id"] == null)
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
                if (Session["Publication_id"] != null)
                {
                    getPublicationById();
                }
                else
                {
                    Response.Redirect("/home.aspx");
                }
            }
        }

        protected void getPublicationById()
        {
            int id = int.Parse(Session["Publication_id"].ToString());
            DataTable dt = new DataTable();
            try
            {
                dt = dal.SelectInformationById(id);
                tbxPublicationTitle.Text = dt.Rows[0]["PublicationTitle"].ToString();
                tbxPublicationLink.Text = dt.Rows[0]["PublicationPath"].ToString();

                if (dt.Rows[0]["Status"].ToString() == "True")
                {
                    ddlPublicationStatus.SelectedIndex = 0;
                }
                else
                {
                    ddlPublicationStatus.SelectedIndex = 1;
                }
            }
            catch
            {
                throw;
            }
        }


        protected void btn_back_Click(object sender, EventArgs e)
        {
            Session.Remove("Publication_id");
            Response.Redirect("/Control_Panel/publication.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            PublicationObject publicationObj = new PublicationObject();

            publicationObj.PublicationId = int.Parse(Session["Publication_id"].ToString());
            DataTable dt = dal.SelectInformationById(publicationObj.PublicationId);
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
                int result = dal.UpdateInformation(publicationObj);
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