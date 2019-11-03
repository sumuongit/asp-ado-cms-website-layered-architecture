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
    
    public partial class update_banner : System.Web.UI.Page
    {
        BannerDataAccessLayer dal = new BannerDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dashboard_status"] == null && Session["user_role"] == null && Session["Banner_id"] == null)
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
                if (Session["Banner_id"] != null)
                {
                    getBannerById();
                }
                else
                {
                    Response.Redirect("/home.aspx");
                }
            }
        }

        protected void getBannerById()
        {
            int id = int.Parse(Session["Banner_id"].ToString());
            DataTable dt = new DataTable();
            try
            {
                dt = dal.SelectInformationById(id);
                tbxBannerInfo.Text = dt.Rows[0]["BannerInformation"].ToString();
                BannerPhoto.ImageUrl = "~/Banner_Photos/" + dt.Rows[0]["PhotoPath"].ToString();
                if (dt.Rows[0]["Status"].ToString() == "True")
                {
                    ddlBannerStatus.SelectedIndex = 0;
                }
                else
                {
                    ddlBannerStatus.SelectedIndex = 1;
                }
            }
            catch
            {
                throw;
            }
        }
        protected void btn_update_Click(object sender, EventArgs e)
        {
            BannerObject bannerObj = new BannerObject();

            bannerObj.BannerId = int.Parse(Session["Banner_id"].ToString());
            DataTable dt = dal.SelectInformationById(bannerObj.BannerId);
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
            else
            {
                bannerObj.PhotoPath = dt.Rows[0]["PhotoPath"].ToString();
            }

            try
            {
                int result = dal.UpdateInformation(bannerObj);
                if (result == 1)
                {
                    getBannerById();
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
            Session.Remove("Banner_id");
            Response.Redirect("/Control_Panel/Banner.aspx");
        }
    }
}