using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BOL;
using DAL;
using System.Data;
using System.Web.Services;

namespace CMS_Website
{
    public partial class home : System.Web.UI.Page
    {
        StoryDataAccessLayer dal = new StoryDataAccessLayer();
        NewsDataAccessLayer dalN = new NewsDataAccessLayer();
        StoryPhotoDataAccessLayer dalSP = new StoryPhotoDataAccessLayer();
        EventDataAccessLayer dalE = new EventDataAccessLayer();
        EventPhotoDataAccessLayer dalEP = new EventPhotoDataAccessLayer();
        BannerDataAccessLayer dalB = new BannerDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            //LoadStory();
            LoadNews();
            LoadEvent();
            LoadBanner();
        }

        //protected void LoadStory()
        //{
        //    DataTable dt = new DataTable();
        //    dt = dal.SelectAllInformation_StaticPage();
        //    Repeater_Story.DataSource = dt.AsEnumerable().Take(3).CopyToDataTable();
        //    Repeater_Story.DataBind();
        //}

        protected void LoadEvent()
        {
            DataTable dt = new DataTable();
            dt = dalE.SelectAllInformation_StaticPage();
            Repeater_Event.DataSource = dt.AsEnumerable().Take(2).CopyToDataTable();
            Repeater_Event.DataBind();
        }

        protected void LoadNews()
        {
            DataTable dt = new DataTable();
            dt = dalN.SelectAllInformation();
            DataView dv = dt.DefaultView;
            dv.RowFilter = "Status = True";
            DataTable dtNew = dv.ToTable();
            RepeaterNews.DataSource = dtNew;
            RepeaterNews.DataBind();
        }

        protected void LoadBanner()
        {
            DataTable dt = new DataTable();
            dt = dalB.SelectAllInformation();
            DataView dv = dt.DefaultView;
            dv.RowFilter = "Status = True";
            DataTable dtNew = dv.ToTable();
            RepeaterBannerindicators.DataSource = dtNew;
            RepeaterBannerindicators.DataBind();
            RepeaterBanner.DataSource = dtNew;
            RepeaterBanner.DataBind();
        }

        protected void Repeater_Story_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int storyId = Convert.ToInt32((e.Item.FindControl("hfStoryId") as HiddenField).Value);
                Repeater rptPhoto = e.Item.FindControl("Repeater_Photo") as Repeater;
                rptPhoto.DataSource = dalSP.SelectAllInformation_HomePage(storyId);
                rptPhoto.DataBind();
            }
        }

        protected void Repeater_Event_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int eventId = Convert.ToInt32((e.Item.FindControl("hfEventId") as HiddenField).Value);
                Repeater rptPhoto = e.Item.FindControl("Repeater_Photo") as Repeater;
                rptPhoto.DataSource = dalEP.SelectAllInformation_StaticPage(eventId);
                rptPhoto.DataBind();
            }
        }
        
    }
}