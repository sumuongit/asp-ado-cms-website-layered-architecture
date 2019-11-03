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
    public partial class story : System.Web.UI.Page
    {
        StoryDataAccessLayer dal = new StoryDataAccessLayer();
        StoryPhotoDataAccessLayer dalSP = new StoryPhotoDataAccessLayer();


        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Session["dashboard_status"]==null && Session["user_role"]==null )
            {
                Response.Redirect("/home.aspx");
            }
            else
            {
                if (Session["user_role"].Equals("user"))
                {
                    lableStorySataus.Visible = false;
                    ddlStoryStatus.Visible = false;

                    LabelPhotoStatus.Visible = false;
                    ddlPhotoStatus.Visible = false;
                }
                else if (Session["user_role"].Equals("admin"))
                {
                    lableStorySataus.Visible = true;
                    ddlStoryStatus.Visible = true;

                    LabelPhotoStatus.Visible = true;
                    ddlPhotoStatus.Visible = true;
                }
            }

            if (!IsPostBack)
            {
                LoadAllStory();
                LoadAllStoryPhoto();
                LoadStoryTitle();

            }

            SuccessPanel_story.Visible = false;
            DangerPanel.Visible = false;
        }

        protected void LoadAllStory()
        {
            DataTable dt = new DataTable();

            if (Session["user_role"].Equals("user"))
            {
                dt = dal.SelectInformationByUserId(Int32.Parse(Session["user_id"].ToString()));

                GridViewStory.DataSource = dt;
                GridViewStory.DataBind();
            }
            else
            {
                dt = dal.SelectAllInformation();
                GridViewStory.DataSource = dt;
                GridViewStory.DataBind();
            }
        }
        protected void LoadAllStoryPhoto()
        {
            DataTable dt = new DataTable();

            if (Session["user_role"].Equals("user"))
            {
                dt = dalSP.SelectInformationByUserId(Int32.Parse(Session["user_id"].ToString()));
                GridViewPhoto.DataSource = dt;
                GridViewPhoto.DataBind();
            }
            else
            {
                dt = dalSP.SelectAllInformation();
                GridViewPhoto.DataSource = dt;
                GridViewPhoto.DataBind();
            }
        }
        protected void LoadStoryTitle()
        {
            if(Session["user_role"].Equals("user"))
            {
                DataTable dt = new DataTable();

                dt = dal.SelectInformationByUserId(Int32.Parse(Session["user_id"].ToString()));

                ddlStoryTitle.DataTextField = dt.Columns["StoryTitle"].ToString();
                ddlStoryTitle.DataValueField = dt.Columns["StoryId"].ToString(); ;
                ddlStoryTitle.DataSource = dt;
                ddlStoryTitle.DataBind();

                ddlStoryTitle.Items.Insert(0, "--Select Story Title--");
            }
            else if(Session["user_role"].Equals("admin"))
            {
                DataTable dt = new DataTable();

                dt = dal.SelectAllInformation();

                ddlStoryTitle.DataTextField = dt.Columns["StoryTitle"].ToString();
                ddlStoryTitle.DataValueField = dt.Columns["StoryId"].ToString(); ;
                ddlStoryTitle.DataSource = dt;
                ddlStoryTitle.DataBind();

                ddlStoryTitle.Items.Insert(0, "--Select Story Title--");
            }
           
        }

       

        protected void grdView_RowCommandStory(object sender, GridViewCommandEventArgs e)
        {
            ///* This condition work when click on edit button */
            if (e.CommandName == "lnkbtnEditStory")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Session["story_id"] = id;
                Response.Redirect("/Control_Panel/update_story.aspx"); /* Pass id in querystring for updating record */
            }
            
        }

        

        protected void btn_save_Click(object sender, EventArgs e)
        {
            
            StoryObject storyobj = new StoryObject();
            storyobj.StoryTitle = tbxStoryTitle.Text;
            storyobj.StoryDetail = tbxStoryDetail.Text;
            storyobj.UserId = Int32.Parse(Session["user_id"].ToString());
            if (ddlStoryStatus.Visible == true)
            {
                if (ddlStoryStatus.SelectedValue == "1")
                {
                    storyobj.Status = true;
                }
                else if (ddlStoryStatus.SelectedValue == "0")
                {
                    storyobj.Status = false;
                }
            }

            else
            {
                storyobj.Status = false;
            }
           
            try
            {
                int result = dal.InsertInformation(storyobj);
                if(result==1)
                {
                    LoadAllStory();
                    LoadAllStoryPhoto();
                    LoadStoryTitle();
                    SuccessPanel_story.Visible = true;
                    tbxStoryTitle.Text = "";
                    tbxStoryDetail.Text = "";
                }
                else
                {
                    DangerPanel.Visible = true;
                    tbxStoryTitle.Text = "";
                    tbxStoryDetail.Text = "";
                }

            }
            catch
            {
                throw;
            }
        }

        protected void ddlStoryTitle_SelectedIndexChanged(object sender, EventArgs e)
        {           
            tbxStoryId.Text = ddlStoryTitle.SelectedValue;
            if(tbxStoryId.Text.Equals("--Select Story Title--"))
            {
                LoadAllStory();
                LoadAllStoryPhoto();
            }
            else
            { 
                int id = Int32.Parse(tbxStoryId.Text);
                if(Session["user_role"].Equals("user"))
                {
                    DataTable dt = dal.SelectInformationById(id);
                    if (dt.Rows[0]["Status"].Equals(true))
                    {
                        btnUpload.Visible = false;
                    }
                    else
                    {
                        btnUpload.Visible = true;
                    }
                }
                LoadAllStory();
                LoadPhotoById(id);
            }
        }

        protected void LoadPhotoById(int id)
        {

            DataTable dt = new DataTable();
            dt = dalSP.SelectInformationByStoryId(id);
            GridViewPhoto.DataSource = dt;
            GridViewPhoto.DataBind();
            
        }

        protected void btn_upload_Click(object sender, EventArgs e)
        {
            
            if (FileUploadStory.HasFiles)
            {
                string photopath = "";
                string uploadFolder = "~/Story_Photos/";

                DataTable dt = new DataTable();
                dt.Columns.Add("StoryId");
                dt.Columns.Add("PhotoPath");
                dt.Columns.Add("Status");
                StoryPhotoObject storyphotoobj = new StoryPhotoObject();

                foreach (HttpPostedFile uploadedFile in FileUploadStory.PostedFiles)
                {
                    string extension = Path.GetExtension(uploadedFile.FileName);
                    photopath = Guid.NewGuid().ToString() + extension;
                    uploadedFile.SaveAs(Server.MapPath(uploadFolder + photopath));

                  
                    storyphotoobj.StoryId = Int32.Parse(tbxStoryId.Text);
                    storyphotoobj.PhotoPath = photopath;
                    if (ddlPhotoStatus.Visible == true)
                    {
                        if (ddlPhotoStatus.SelectedValue == "1")
                        {
                            storyphotoobj.Status = true;
                        }
                        else if (ddlPhotoStatus.SelectedValue == "0")
                        {
                            storyphotoobj.Status = false;
                        }
                    }

                    else
                    {
                        storyphotoobj.Status = true;
                    }
                   

                    dt.Rows.Add(new Object[] { storyphotoobj.StoryId, storyphotoobj.PhotoPath, storyphotoobj.Status });

                }

                try
                {
                    dalSP.InsertInformation(dt);
                    LoadAllStory();
                    LoadAllStoryPhoto();
                    LoadStoryTitle();
                    PanelSuccess.Visible = true;
                    

                }
                catch
                {
                    PanelFaild.Visible = true;
                    throw;
                   
                }
            }            

        }

        protected void GridViewStory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadAllStory();
            LoadAllStoryPhoto();
            GridViewStory.PageIndex = e.NewPageIndex;
            GridViewStory.DataBind();
        }

        protected void GridViewPhoto_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadAllStory();
            LoadAllStoryPhoto();
            GridViewPhoto.PageIndex = e.NewPageIndex;
            GridViewPhoto.DataBind();
        }

        protected void GridViewStory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lb = (Label)e.Row.Cells[3].FindControl("Status");
                if (lb.Text == "ACTIVE")
                {                    
                    //e.Row.Cells[3].BackColor = System.Drawing.Color.DarkGreen;
                    e.Row.Cells[3].ForeColor = System.Drawing.Color.DarkGreen;
                    if(Session["user_role"].Equals("user"))
                    {
                        e.Row.Cells[4].Text = "";
                       
                    }
                    
                    
                }
                else if(lb.Text == "INACTIVE")
                {
                    //e.Row.Cells[3].BackColor = System.Drawing.Color.Crimson;
                    e.Row.Cells[3].ForeColor = System.Drawing.Color.Crimson;
                   
                }
            }
        }

        
        protected void GridViewPhoto_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if(Session["user_role"].Equals("user"))
                {
                    Label lb_storyStatus = (Label)e.Row.Cells[3].FindControl("Status_Story");
                    if (lb_storyStatus.Text == "ACTIVE")
                    {
                        //e.Row.Cells[3].BackColor = System.Drawing.Color.DarkGreen;
                        e.Row.Cells[5].Text = "";

                    }
                    
                }
                
                
                Label lb_photoStatus = (Label)e.Row.Cells[4].FindControl("Status_Photo");
                if (lb_photoStatus.Text == "ACTIVE")
                {
                    //e.Row.Cells[3].BackColor = System.Drawing.Color.DarkGreen;
                    e.Row.Cells[4].ForeColor = System.Drawing.Color.DarkGreen;
                    
                }
                else if (lb_photoStatus.Text == "INACTIVE")
                {
                    //e.Row.Cells[3].BackColor = System.Drawing.Color.Crimson;
                    e.Row.Cells[4].ForeColor = System.Drawing.Color.Crimson;
                }
            }
        }

        protected void grdViewPhoto_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "lnkbtnPhotoEdit")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Session["photo_id"] = id;
                Response.Redirect("/Control_Panel/update_storyphoto.aspx"); /* Pass id in querystring for updating record */
            }
        }

        
    }
}