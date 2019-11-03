using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BOL;
using System.Data;

namespace CMS_Website.Control_Panel
{
    public partial class update_achievement : System.Web.UI.Page
    {
        AchievementDataAccessLayer dal = new AchievementDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dashboard_status"] == null && Session["user_role"] == null && Session["Achievement_id"] == null)
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
                if (Session["Achievement_id"] != null)
                {
                    getAchievementById();
                }
                else
                {
                    Response.Redirect("/home.aspx");
                }
            }
        }

        protected void getAchievementById()
        {
            int id = int.Parse(Session["Achievement_id"].ToString());

            DataTable dt = new DataTable();
            try
            {
                dt = dal.SelectInformationById(id);
                tbxAchievementTitle.Text = dt.Rows[0]["AchievementTitle"].ToString();
                tbxAchievementDetail.Text = dt.Rows[0]["AchievementDetail"].ToString();

                if (dt.Rows[0]["Status"].ToString() == "True")
                {
                    ddlAchievementStatus.SelectedIndex = 0;
                }
                else
                {
                    ddlAchievementStatus.SelectedIndex = 1;
                }
            }
            catch
            {
                throw;
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Session["Achievement_id"].ToString());
            AchievementObject achievementObj = new AchievementObject();
            achievementObj.AchievementId = id;
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
                int result = dal.UpdateInformation(achievementObj);
                if (result == 1)
                {
                    SuccessPanel_story.Visible = true;

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
            Session.Remove("Achievement_id");
            Response.Redirect("/Control_Panel/achievement.aspx");
        }
    }
}