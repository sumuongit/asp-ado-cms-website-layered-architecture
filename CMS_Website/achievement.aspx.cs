using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS_Website
{
    public partial class achievements : System.Web.UI.Page
    {
        AchievementDataAccessLayer dal = new AchievementDataAccessLayer();
        AchievementPhotoDataAccessLayer dalAP = new AchievementPhotoDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadAchievement();
        }

        protected void LoadAchievement()
        {
            DataTable dt = new DataTable();
            dt = dal.SelectAllInformation_StaticPage();
            Repeater_Achievement.DataSource = dt;
            Repeater_Achievement.DataBind();
        }

        protected void Repeater_Achievement_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int AchievementId = Convert.ToInt32((e.Item.FindControl("hfAchievementId") as HiddenField).Value);
                Repeater rptPhoto = e.Item.FindControl("Repeater_Photo") as Repeater;
                rptPhoto.DataSource = dalAP.SelectAllInformation_StaticPage(AchievementId);
                rptPhoto.DataBind();
            }
        }
    }
}