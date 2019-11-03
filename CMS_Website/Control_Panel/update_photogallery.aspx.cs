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
    public partial class update_photogallery : System.Web.UI.Page
    {
        PhotoGalleryDataAccessLayer dal = new PhotoGalleryDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dashboard_status"] == null && Session["user_role"] == null && Session["PhotoGallery_id"] == null)
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
                if (Session["PhotoGallery_id"] != null)
                {
                    getPhotoGalleryById();
                }
                else
                {
                    Response.Redirect("/home.aspx");
                }
            }
        }

        protected void getPhotoGalleryById()
        {
            int id = int.Parse(Session["PhotoGallery_id"].ToString());
            DataTable dt = new DataTable();
            try
            {
                dt = dal.SelectInformationById(id);
                tbxPhotoBrief.Text = dt.Rows[0]["PhotoBrief"].ToString();
                tbxPhotoDetail.Text = dt.Rows[0]["PhotoDetail"].ToString();
                PhotoGallery.ImageUrl = "~/Photo_gallery/" + dt.Rows[0]["PhotoPath"].ToString();
                if (dt.Rows[0]["Status"].ToString() == "True")
                {
                    ddlPhotoStatus.SelectedIndex = 0;
                }
                else
                {
                    ddlPhotoStatus.SelectedIndex = 1;
                }
            }
            catch
            {
                throw;
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            PhotoGalleryObject photogalleryObj = new PhotoGalleryObject();

            photogalleryObj.PhotoId = int.Parse(Session["PhotoGallery_id"].ToString());
            DataTable dt = dal.SelectInformationById(photogalleryObj.PhotoId);
            photogalleryObj.PhotoBrief = tbxPhotoBrief.Text;
            photogalleryObj.PhotoDetail = tbxPhotoDetail.Text;
            photogalleryObj.UserId = Int32.Parse(Session["user_id"].ToString());

            if (ddlPhotoStatus.SelectedValue == "1")
            {
                photogalleryObj.Status = true;
            }
            else if (ddlPhotoStatus.SelectedValue == "0")
            {
                photogalleryObj.Status = false;
            }

            if (PhotoUpload.HasFile)
            {
                string extension = Path.GetExtension(PhotoUpload.FileName);
                string photopath = Guid.NewGuid().ToString() + extension;
                string uploadFolder = "~/Photo_gallery/";
                PhotoUpload.SaveAs(Server.MapPath(uploadFolder + photopath));
                photogalleryObj.PhotoPath = photopath;
            }
            else
            {
                photogalleryObj.PhotoPath = dt.Rows[0]["PhotoPath"].ToString();
            }

            try
            {
                int result = dal.UpdateInformation(photogalleryObj);
                if (result == 1)
                {
                    getPhotoGalleryById();
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
            Session.Remove("PhotoGallery_id");
            Response.Redirect("/Control_Panel/photo_gallery.aspx");
        }
    }
}