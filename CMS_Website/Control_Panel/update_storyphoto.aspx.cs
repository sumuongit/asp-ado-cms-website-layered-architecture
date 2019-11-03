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
    public partial class update_storyphoto : System.Web.UI.Page
    {
        StoryPhotoDataAccessLayer dal = new StoryPhotoDataAccessLayer();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dashboard_status"] == null && Session["user_role"] == null && Session["photo_id"] == null)
            {
                Response.Redirect("/home.aspx");
            }

            if (!IsPostBack)
            {
                if (Session["photo_id"] != null)
                {
                    getPhotoById();
                }
                else
                {
                    Response.Redirect("/home.aspx");
                }
            }
        }

        protected void getPhotoById()
        {
            int id = int.Parse(Session["photo_id"].ToString());

            DataTable dt = new DataTable();
            try
            {
                dt = dal.SelectInformationById(id);
                StoryPhoto.ImageUrl= "~/Story_Photos/" +dt.Rows[0]["PhotoPath"].ToString();
                
                if (dt.Rows[0]["PhotoStatus"].ToString() == "True")
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
            int id=int.Parse(Session["photo_id"].ToString());
            DataTable dt= dal.SelectInformationById(id);

            StoryPhotoObject photoObj = new StoryPhotoObject();
            photoObj.PhotoId = int.Parse(Session["photo_id"].ToString());
            photoObj.StoryId = Int32.Parse(dt.Rows[0]["StoryId"].ToString());

            if (FileUploadStory.HasFile)
            {
                string extension = Path.GetExtension(FileUploadStory.FileName);
                string photopath = Guid.NewGuid().ToString() + extension;
                string uploadFolder = "~/Story_Photos/";
                FileUploadStory.SaveAs(Server.MapPath(uploadFolder + photopath));
                photoObj.PhotoPath = photopath;
                if (ddlPhotoStatus.SelectedValue == "1")
                {
                    photoObj.Status = true;
                }
                else if (ddlPhotoStatus.SelectedValue == "0")
                {
                    photoObj.Status = false;
                }

                try
                {
                    int result = dal.UpdateInformation(photoObj);
                    if (result == 1)
                    {
                        getPhotoById();
                        PanelSuccess.Visible = true;


                    }
                    
                }
                catch
                {
                    throw;
                }
                
            }
            else
            {
                photoObj.PhotoPath = dt.Rows[0]["PhotoPath"].ToString();
                if (ddlPhotoStatus.SelectedValue == "1")
                {
                  
                    photoObj.Status = true;
                }
                else if (ddlPhotoStatus.SelectedValue == "0")
                {
                  
                    photoObj.Status = false;
                }

                try
                {
                    int result = dal.UpdateInformation(photoObj);
                    if (result == 1)
                    {
                        getPhotoById();
                        PanelSuccess.Visible = true;


                    }

                }
                catch
                {
                    throw;
                }

            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Session.Remove("photo_id");
            Response.Redirect("/Control_Panel/story.aspx");
        }
    }
}