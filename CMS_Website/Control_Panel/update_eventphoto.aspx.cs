﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BOL;
using System.Data;
using System.IO;

namespace CMS_Website.Control_Panel
{
    public partial class update_eventphoto : System.Web.UI.Page
    {
        EventPhotoDataAccessLayer dal = new EventPhotoDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dashboard_status"] == null && Session["user_role"] == null && Session["EventPhoto_id"] == null)
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
                if (Session["EventPhoto_id"] != null)
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
            int id = int.Parse(Session["EventPhoto_id"].ToString());

            DataTable dt = new DataTable();
            try
            {
                dt = dal.SelectInformationById(id);
                EventPhoto.ImageUrl = "~/Event_Photos/" + dt.Rows[0]["PhotoPath"].ToString();

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

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Session.Remove("EventPhoto_id");
            Response.Redirect("/Control_Panel/event.aspx");
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Session["EventPhoto_id"].ToString());
            DataTable dt = dal.SelectInformationById(id);

            EventPhotoObject photoObj = new EventPhotoObject();
            photoObj.PhotoId = int.Parse(Session["EventPhoto_id"].ToString());
            photoObj.EventId = Int32.Parse(dt.Rows[0]["EventId"].ToString());

            if (FileUpload.HasFile)
            {
                string extension = Path.GetExtension(FileUpload.FileName);
                string photopath = Guid.NewGuid().ToString() + extension;
                string uploadFolder = "~/Event_Photos/";
                FileUpload.SaveAs(Server.MapPath(uploadFolder + photopath));
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
    }
}