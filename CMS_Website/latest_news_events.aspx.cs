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
    public partial class latest_news_events : System.Web.UI.Page
    {
        NewsDataAccessLayer dalN = new NewsDataAccessLayer();
        EventDataAccessLayer dalE = new EventDataAccessLayer();
        EventPhotoDataAccessLayer dalEP = new EventPhotoDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadNews();
            LoadEvent();
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

        protected void LoadEvent()
        {
            DataTable dt = new DataTable();
            dt = dalE.SelectAllInformation_StaticPage();
            Repeater_Event.DataSource = dt;
            Repeater_Event.DataBind();
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