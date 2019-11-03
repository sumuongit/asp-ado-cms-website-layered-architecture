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
    public partial class achievement : System.Web.UI.Page
    {
        AchievementDataAccessLayer dal = new AchievementDataAccessLayer();
        AchievementPhotoDataAccessLayer dalAP = new AchievementPhotoDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dashboard_status"] == null && Session["user_role"] == null)
            {
                Response.Redirect("/home.aspx");
            }
            else
            {
                if(Session["user_role"].Equals("user"))
                {
                    Response.Redirect("/Control_Panel/story.aspx");
                }
            }

            if (!IsPostBack)
            {
                LoadAchievement();
                LoadAchievementTitle();
                LoadAllAchievementPhoto();
            }
            
        }

        protected void LoadAchievement()
        {
            DataTable dt = new DataTable();

            dt = dal.SelectAllInformation();
            GridViewAchievement.DataSource = dt;
            GridViewAchievement.DataBind();
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            AchievementObject achievementObj = new AchievementObject();
            achievementObj.AchievementTitle = tbxAchievementTitle.Text;
            achievementObj.AchievementDetail = tbxAchievementDetail.Text;
            achievementObj.UserId = Int32.Parse(Session["user_id"].ToString());

            if (ddlAchievementStatus.SelectedValue == "1")
            {
                achievementObj.Status = true;
            }
            else if (ddlAchievementStatus.SelectedValue == "0")
            {
                achievementObj.Status = false;
            }


            try
            {
                int result = dal.InsertInformation(achievementObj);
                if (result == 1)
                {
                    LoadAchievement();
                    LoadAchievementTitle();
                    LoadAllAchievementPhoto();
                    SuccessPanel_story.Visible = true;
                    tbxAchievementTitle.Text = "";
                    tbxAchievementDetail.Text = "";

                }
                else
                {
                    LoadAchievement();
                    LoadAchievementTitle();
                    LoadAllAchievementPhoto();
                    DangerPanel.Visible = true;
                    tbxAchievementTitle.Text = "";
                    tbxAchievementDetail.Text = "";
                }

            }
            catch
            {
                throw;
            }
        }

        protected void GridViewAchievement_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadAchievement();
            GridViewAchievement.PageIndex = e.NewPageIndex;
            GridViewAchievement.DataBind();
        }

        protected void grdView_RowCommandAchievement(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "lnkbtnEditAchievement")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Session["Achievement_id"] = id;
                Response.Redirect("/Control_Panel/update_achievement.aspx");
            }
        }

        protected void GridViewAchievement_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void LoadAchievementTitle()
        {
            DataTable dt = new DataTable();

            dt = dal.SelectAllInformation();

            ddlAchievementTitle.DataTextField = dt.Columns["AchievementTitle"].ToString();
            ddlAchievementTitle.DataValueField = dt.Columns["AchievementId"].ToString(); ;
            ddlAchievementTitle.DataSource = dt;
            ddlAchievementTitle.DataBind();

            ddlAchievementTitle.Items.Insert(0, "--Select Achievement Title--");


        }
        protected void btn_upload_Click(object sender, EventArgs e)
        {
            if (FileUploadAchievement.HasFiles)
            {
                string photopath = "";
                string uploadFolder = "~/Achievement_Photos/";

                DataTable dt = new DataTable();
                dt.Columns.Add("AchievementId");
                dt.Columns.Add("PhotoPath");
                dt.Columns.Add("Status");
                AchievementPhotoObject achievementphotoObj = new AchievementPhotoObject();

                foreach (HttpPostedFile uploadedFile in FileUploadAchievement.PostedFiles)
                {
                    string extension = Path.GetExtension(uploadedFile.FileName);
                    photopath = Guid.NewGuid().ToString() + extension;
                    uploadedFile.SaveAs(Server.MapPath(uploadFolder + photopath));


                    achievementphotoObj.AchievementId = Int32.Parse(tbxAchievementId.Text);
                    achievementphotoObj.PhotoPath = photopath;

                    if (ddlPhotoStatus.SelectedValue == "1")
                    {
                        achievementphotoObj.Status = true;
                    }
                    else if (ddlPhotoStatus.SelectedValue == "0")
                    {
                        achievementphotoObj.Status = false;
                    }

                    dt.Rows.Add(new Object[] { achievementphotoObj.AchievementId, achievementphotoObj.PhotoPath, achievementphotoObj.Status });

                }

                try
                {
                    dalAP.InsertInformation(dt);

                    LoadAchievement();
                    LoadAchievementTitle();
                    LoadAllAchievementPhoto();

                    PanelSuccess.Visible = true;

                }
                catch
                {
                    PanelFaild.Visible = true;
                    throw;
                }
            }
        }

        protected void ddlAchievementTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            tbxAchievementId.Text = ddlAchievementTitle.SelectedValue;

            if (tbxAchievementId.Text.Equals("--Select Achievement Title--"))
            {
                LoadAllAchievementPhoto();
            }
            else
            {
                int id = Int32.Parse(tbxAchievementId.Text);
                LoadPhotoById(id);
            }
        }

        protected void LoadAllAchievementPhoto()
        {
            DataTable dt = new DataTable();

            dt = dalAP.SelectAllInformation();
            GridViewPhoto.DataSource = dt;
            GridViewPhoto.DataBind();

        }
        protected void GridViewPhoto_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadAllAchievementPhoto();
            GridViewPhoto.PageIndex = e.NewPageIndex;
            GridViewPhoto.DataBind();
        }

        protected void grdViewPhoto_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "lnkbtnPhotoEdit")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Session["AchievementPhoto_id"] = id;
                Response.Redirect("/Control_Panel/update_achievementphoto.aspx");
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
            dt = dalAP.SelectInformationByAchievementId(id);
            GridViewPhoto.DataSource = dt;
            GridViewPhoto.DataBind();

        }
    }
}