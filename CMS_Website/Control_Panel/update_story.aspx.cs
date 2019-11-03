using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL;
using DAL;
using System.Data;

namespace CMS_Website.Control_Panel
{
    public partial class update_story : System.Web.UI.Page
    {
        // UserDataAccessLayer dal = new UserDataAccessLayer();
        StoryDataAccessLayer dal = new StoryDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dashboard_status"] == null && Session["user_role"] == null && Session["story_id"] ==null)
            {
                Response.Redirect("/home.aspx");
            }
            else
            {
                if(Session["user_role"].Equals("user"))
                {
                    lableStorySataus.Visible = false;
                    ddlStoryStatus.Visible = false;
                }
                else if (Session["user_role"].Equals("admin"))
                {
                    lableStorySataus.Visible = true;
                    ddlStoryStatus.Visible = true;
                }
            }

            if (!IsPostBack)
            {
                if (Session["story_id"] != null)
                {
                    getStroyById();
                }
                else
                {
                    Response.Redirect("/home.aspx");
                }
            }
        }

        public void getStroyById()
        {
            int id = int.Parse(Session["story_id"].ToString());
           
            DataTable dt = new DataTable();
            try
            {
                dt = dal.SelectInformationById(id);
                tbxStoryTitle.Text = dt.Rows[0]["StoryTitle"].ToString();
                tbxStoryDetail.Text = dt.Rows[0]["StoryDetail"].ToString();

                if (dt.Rows[0]["Status"].ToString() == "True")
                {
                    ddlStoryStatus.SelectedIndex = 0; 
                }
                else
                {
                    ddlStoryStatus.SelectedIndex = 1; 
                }
            }
            catch
            {
                throw;
            }

        }
        protected void btn_update_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Session["story_id"].ToString());
            StoryObject storyobj = new StoryObject();
            storyobj.StoryId = id;
            storyobj.StoryTitle = tbxStoryTitle.Text;
            storyobj.StoryDetail = tbxStoryDetail.Text;
            DateTime localDateTime, univDateTime;
            localDateTime = DateTime.Now;
            univDateTime = localDateTime.ToUniversalTime();
            storyobj.UpdateDate = univDateTime;
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
                int result = dal.UpdateInformation(storyobj);
                if (result == 1)
                {
                    SuccessPanel_story.Visible = true;
                  
                    //Response.Redirect("/Control_Panel/story.aspx");

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
            Session.Remove("story_id");
            Response.Redirect("/Control_Panel/story.aspx");
        }
    }
}