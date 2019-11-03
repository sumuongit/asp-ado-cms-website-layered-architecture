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
    public partial class photo_gallery : System.Web.UI.Page
    {
        PhotoGalleryDataAccessLayer dal = new PhotoGalleryDataAccessLayer();
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

            LoadPhoto();
           
        }

        protected void LoadPhoto()
        {
            DataTable dt = new DataTable();
            dt = dal.SelectAllInformation();
            GridViewPhoto.DataSource = dt;
            GridViewPhoto.DataBind();
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            PhotoGalleryObject photogalleryObj = new PhotoGalleryObject();

            photogalleryObj.PhotoBrief = tbxPhotoBrief.Text;
            photogalleryObj.PhotoDetail = tbxPhotoDetail.Text;
            photogalleryObj.UserId= Int32.Parse(Session["user_id"].ToString());

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

            try
            {
                int result = dal.InsertInformation(photogalleryObj);
                if (result == 1)
                {
                    LoadPhoto();
                    SuccessPanel.Visible = true;
                    tbxPhotoBrief.Text = "";
                    tbxPhotoDetail.Text = "";
                    
                }
                else
                {
                    DangerPanel.Visible = true;
                    tbxPhotoBrief.Text = "";
                    tbxPhotoDetail.Text = "";
                   
                }

            }
            catch
            {
                throw;
            }


        }

        protected void GridViewPhoto_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadPhoto();
            GridViewPhoto.PageIndex = e.NewPageIndex;
            GridViewPhoto.DataBind();
        }

        protected void grdViewPhoto_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "lnkbtnPhotoEdit")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Session["PhotoGallery_id"] = id;
                Response.Redirect("/Control_Panel/update_photogallery.aspx"); /* Pass id in querystring for updating record */
            }
        }

        protected void GridViewPhoto_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Label lb = (Label)e.Row.Cells[4].FindControl("Status");
                if (lb.Text == "ACTIVE")
                {
                    e.Row.Cells[4].ForeColor = System.Drawing.Color.DarkGreen;
                }
                else if (lb.Text == "INACTIVE")
                {
                    e.Row.Cells[4].ForeColor = System.Drawing.Color.Crimson;
                }
            }
        }
    }
}