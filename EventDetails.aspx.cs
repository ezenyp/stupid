using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventNow
{
    public partial class EventDetails : System.Web.UI.Page
    {
        Event aEvent = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            Event eventlist = new Event();
            string EventID = Request.QueryString["EventID"].ToString();
            aEvent = eventlist.ViewEvent(Convert.ToInt32(EventID));
            EventName_label.Text = aEvent.EventName;
            EventDesc_Label.Text = aEvent.EventDesc;
            EventType_Label.Text = aEvent.eventType;
            EventLocation_Label.Text = aEvent.eventlocation;
            EventDuration_Label.Text = aEvent.eventduration1.ToString();
            EventDuration2_label.Text = aEvent.eventduration2;
            EventOrganization_label.Text = aEvent.eventOrg;
            EventStartDate_Label.Text = aEvent.startdate.ToString("MM/dd/yyyy");
            EventEndDate_Label.Text = aEvent.enddate.ToString("MM/dd/yyyy");
            EventMode_lbl.Text= aEvent.eventlink;
            Event_image.ImageUrl = "~\\Images\\" + aEvent.eventimg;

            if (!IsPostBack) //check if the webpage is loaded for the first time.
            {
                ViewState["PreviousPage"] =
            Request.UrlReferrer;//Saves the Previous page url in ViewState
            }
        }


        protected void return_btb_Click(object sender, EventArgs e)
        {

            if (ViewState["PreviousPage"] != null)    //Check if the ViewState 
                                                      //contains Previous page URL
            {
                Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to 
                                                                        //Previous page by retrieving the PreviousPage Url from ViewState.
            }

        }

        protected void SignUp_btb_Click(object sender, EventArgs e)
        {
            string EventID = Request.QueryString["EventID"].ToString();
            Response.Redirect("EventNow.aspx?EventID=" + EventID + "&StudentID=" + Session["login"]);
        }
    }
}