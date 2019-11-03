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
    public partial class update_event : System.Web.UI.Page
    {
        EventDataAccessLayer dal = new EventDataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dashboard_status"] == null && Session["user_role"] == null && Session["Event_id"] == null)
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
                if (Session["Event_id"] != null)
                {
                    getEventById();
                }
                else
                {
                    Response.Redirect("/home.aspx");
                }
            }
        }

        protected void getEventById()
        {
            int id = int.Parse(Session["Event_id"].ToString());

            DataTable dt = new DataTable();
            try
            {
                dt = dal.SelectInformationById(id);
                tbxEventTitle.Text = dt.Rows[0]["EventTitle"].ToString();
                tbxEventDetail.Text = dt.Rows[0]["EventDetail"].ToString();
                tbxEventDate.Text = dt.Rows[0]["EventDate"].ToString();

                if (dt.Rows[0]["Status"].ToString() == "True")
                {
                    ddlEventStatus.SelectedIndex = 0;
                }
                else
                {
                    ddlEventStatus.SelectedIndex = 1;
                }
            }
            catch
            {
                throw;
            }
        }
        protected void btn_update_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Session["Event_id"].ToString());
            EventObject eventObj = new EventObject();
            eventObj.EventId = id;
            eventObj.EventTitle = tbxEventTitle.Text;
            eventObj.EventDetail = tbxEventDetail.Text;
            eventObj.UserId = Int32.Parse(Session["user_id"].ToString());
            //eventObj.EventDate = Convert.ToDateTime(tbxEventDate.Text);
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
                int result = dal.UpdateInformation(eventObj);
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
            Session.Remove("Event_id");
            Response.Redirect("/Control_Panel/event.aspx");
        }
    }
}