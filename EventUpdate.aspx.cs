using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventNow
{
    public partial class EventUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Event eventlist = new Event();
            Event b = new Event();
            string eventID = Request.QueryString["EventID"].ToString();
            eventlist = b.ViewEvent(Convert.ToInt32(eventID));
            EventID_Label.Text = eventlist.eventID.ToString();
            /* tb_EventName.Text = eventlist.EventName;
             tb_EventDesc.Text = eventlist.EventDesc;
             td_EventType.SelectedValue = eventlist.eventType;
             tb_EventLocation.Text = eventlist.eventlocation;
             tb_EventDuration.Text = eventlist.eventduration1.ToString();
             DropDownList1.SelectedValue = eventlist.eventduration2;
             tb_StartDate.Text = eventlist.startdate.ToString();
             tb_Enddate.Text = eventlist.enddate.ToString();
             tb_EventOrganization.Text = eventlist.eventOrg.ToString();*/
            if (!IsPostBack) //check if the webpage is loaded for the first time.
            {
                ViewState["PreviousPage"] =
            Request.UrlReferrer;//Saves the Previous page url in ViewState
            }


        }

        protected void Update_btb_Click(object sender, EventArgs e)
        {
            int result = 0;
            Event eventlist = new Event();
            int EventID = int.Parse(EventID_Label.Text);
            string EventName = tb_EventName.Text;
            string EventDesc = tb_EventDesc.Text;
            string EventType = td_EventType.SelectedValue;
            string EventLocation = tb_EventLocation.Text;
            int EventDuration = int.Parse(tb_EventDuration.Text);
            string EventDuration2 = DropDownList1.SelectedValue;
            string EventOrg = tb_EventOrganization.Text;
            DateTime EventStarttime = DateTime.Parse(tb_StartDate.Text);
            DateTime EventEndtime = DateTime.Parse(tb_Enddate.Text);
            string image = Event_FileUpload.FileName;
            string eventmode = Eventmode_radiobutton.SelectedValue;

            String str = "";
            for (int i = 0; i <= td_EventType.Items.Count - 1; i++)
            {
                if (td_EventType.Items[i].Selected)
                {
                    if (str == "")
                    {
                        str = td_EventType.Items[i].Text;
                    }
                    else
                    {
                        str += "," + td_EventType.Items[i].Text;
                    }
                }
            }

            if (Event_FileUpload.HasFile == true)
            {
                image = Event_FileUpload.FileName;
            }

            DateTime startDate, endDate;

            if (DateTime.TryParse(tb_StartDate.Text, out startDate) && DateTime.TryParse(tb_Enddate.Text, out endDate))

            {


                result = eventlist.UpdateEvent(EventID, EventName, EventDesc, str, EventLocation, EventDuration, EventDuration2, EventOrg, EventStarttime, EventEndtime, eventmode, image);

                if (result > 0)

                {

                    string saveimg = Server.MapPath(" ") + "\\" + image;
                    lbl_Result.Text = saveimg.ToString();
                    Event_FileUpload.SaveAs(saveimg);
                    Response.Write("<script>alert('Event updated successfully');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Event NOT updated');</script>");
                }

            }
        }

        protected void Return_btb_Click(object sender, EventArgs e)
        {
            if (ViewState["PreviousPage"] != null)    //Check if the ViewState 
                                                      //contains Previous page URL
            {
                Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to 
                                                                        //Previous page by retrieving the PreviousPage Url from ViewState.
            }
        }

        protected void validateEventType_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = td_EventType.Items.Cast<ListItem>().Any(li => li.Selected);
        }

    }
}