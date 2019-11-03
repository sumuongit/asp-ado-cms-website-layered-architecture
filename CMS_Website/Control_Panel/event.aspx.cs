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
    public partial class _event : System.Web.UI.Page
    {
        EventDataAccessLayer dal = new EventDataAccessLayer();
        EventPhotoDataAccessLayer dalEP = new EventPhotoDataAccessLayer();
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
            if (!IsPostBack)
            {
                LoadEvent();
                LoadEventTitle();
                LoadAllEventPhoto();
            }
           
        }

        protected void LoadEvent()
        {
            DataTable dt = new DataTable();
            dt = dal.SelectAllInformation();
            GridViewEvent.DataSource = dt;
            GridViewEvent.DataBind();
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            EventObject eventObj = new EventObject();
            eventObj.EventTitle = tbxEventTitle.Text;
            eventObj.EventDetail = tbxEventDetail.Text;
            eventObj.UserId = Int32.Parse(Session["user_id"].ToString());
            DateTime localDateTime, univDateTime;
            localDateTime = DateTime.Parse(tbxEventDate.Text);
            univDateTime = localDateTime.ToUniversalTime();
            eventObj.EventDate = univDateTime;
            
            if (ddlEventStatus.SelectedValue == "1")
            {
                eventObj.Status = true;
            }
            else if (ddlEventStatus.SelectedValue == "0")
            {
                eventObj.Status = false;
            }
            

            try
            {
                int result = dal.InsertInformation(eventObj);
                if (result == 1)
                {
                    LoadEvent();
                    LoadEventTitle();
                    LoadAllEventPhoto();

                    SuccessPanel_story.Visible = true;
                    tbxEventTitle.Text = "";
                    tbxEventDetail.Text = "";
                  
                }
                else
                {
                    DangerPanel.Visible = true;
                    tbxEventTitle.Text = "";
                    tbxEventDetail.Text = "";
                }

            }
            catch
            {
                throw;
            }
        }

        protected void GridViewEvent_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadEvent();
            GridViewEvent.PageIndex = e.NewPageIndex;
            GridViewEvent.DataBind();
        }

        protected void grdView_RowCommandEvent(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "lnkbtnEditEvent")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Session["Event_id"] = id;
                Response.Redirect("/Control_Panel/update_event.aspx");
            }
        }
        
        protected void GridViewEvent_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void LoadEventTitle()
        {
                DataTable dt = new DataTable();

                dt = dal.SelectAllInformation();

                ddlEventTitle.DataTextField = dt.Columns["EventTitle"].ToString();
                ddlEventTitle.DataValueField = dt.Columns["EventId"].ToString(); ;
                ddlEventTitle.DataSource = dt;
                ddlEventTitle.DataBind();

                ddlEventTitle.Items.Insert(0, "--Select Event Title--");
          

        }

        protected void btn_upload_Click(object sender, EventArgs e)
        {
            if (FileUploadEvent.HasFiles)
            {
                string photopath = "";
                string uploadFolder = "~/Event_Photos/";

                DataTable dt = new DataTable();
                dt.Columns.Add("EventId");
                dt.Columns.Add("PhotoPath");
                dt.Columns.Add("Status");
                EventPhotoObject eventphotoObj = new EventPhotoObject();

                foreach (HttpPostedFile uploadedFile in FileUploadEvent.PostedFiles)
                {
                    string extension = Path.GetExtension(uploadedFile.FileName);
                    photopath = Guid.NewGuid().ToString() + extension;
                    uploadedFile.SaveAs(Server.MapPath(uploadFolder + photopath));


                    eventphotoObj.EventId = Int32.Parse(tbxEventId.Text);
                    eventphotoObj.PhotoPath = photopath;
                   
                    if (ddlPhotoStatus.SelectedValue == "1")
                    {
                        eventphotoObj.Status = true;
                    }
                    else if (ddlPhotoStatus.SelectedValue == "0")
                    {
                        eventphotoObj.Status = false;
                    }
                    
                    dt.Rows.Add(new Object[] { eventphotoObj.EventId, eventphotoObj.PhotoPath, eventphotoObj.Status });

                }

                try
                {
                    dalEP.InsertInformation(dt);
                    LoadEvent();
                    LoadEventTitle();
                    LoadAllEventPhoto();

                    PanelSuccess.Visible = true;

                }
                catch
                {
                    PanelFaild.Visible = true;
                    throw;
                }
            }
        }

        protected void ddlEventTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            tbxEventId.Text = ddlEventTitle.SelectedValue;
            if (tbxEventId.Text.Equals("--Select Event Title--"))
            {
                LoadAllEventPhoto();
            }
            else
            {
                int id = Int32.Parse(tbxEventId.Text);
                LoadPhotoById(id);
            }
        }

        protected void LoadAllEventPhoto()
        {
            DataTable dt = new DataTable();
            
            dt = dalEP.SelectAllInformation();
            GridViewPhoto.DataSource = dt;
            GridViewPhoto.DataBind();
           
        }

        protected void GridViewPhoto_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadAllEventPhoto();
            GridViewPhoto.PageIndex = e.NewPageIndex;
            GridViewPhoto.DataBind();
        }

        protected void grdViewPhoto_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "lnkbtnPhotoEdit")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Session["EventPhoto_id"] = id;
                Response.Redirect("/Control_Panel/update_eventphoto.aspx");
            }
        }

        protected void GridViewPhoto_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void LoadPhotoById(int id)
        {

            DataTable dt = new DataTable();
            dt = dalEP.SelectInformationByEventId(id);
            GridViewPhoto.DataSource = dt;
            GridViewPhoto.DataBind();

        }
    }
}