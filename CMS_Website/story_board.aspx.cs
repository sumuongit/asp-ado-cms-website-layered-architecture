using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL;
using DAL;
using System.Data;

namespace CMS_Website
{
    
    public partial class story_board : System.Web.UI.Page
    {
        StoryDataAccessLayer dal = new StoryDataAccessLayer();
        StoryPhotoDataAccessLayer dalSP = new StoryPhotoDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadStoryBoard();
           
        }

        protected void LoadStoryBoard()
        {
            DataTable dt = new DataTable();
            dt = dal.SelectAllInformation_StaticPage();
            Repeater_Story.DataSource = dt;
            Repeater_Story.DataBind();
        }
        protected void Repeater_Story_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int storyId = Convert.ToInt32((e.Item.FindControl("hfStoryId") as HiddenField).Value);
                Repeater rptPhoto = e.Item.FindControl("Repeater_Photo") as Repeater;
                rptPhoto.DataSource = dalSP.SelectAllInformation_StaticPage(storyId);
                rptPhoto.DataBind();
                
            }
        }
    }
}