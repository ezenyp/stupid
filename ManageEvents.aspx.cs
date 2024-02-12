using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventNow
{
    public partial class ManageEvents : System.Web.UI.Page
    {
        Event ent = new Event();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void community_Click(object sender, EventArgs e)
        {
            string SearchName = community.Text;
            EventList.SelectCommand = "SELECT * FROM Event WHERE EventType LIKE '%" + SearchName + "%'";
            EventList.DataBind();
        }

        protected void entrepreneurship_Click(object sender, EventArgs e)
        {
            string SearchName = entrepreneurship.Text;
            EventList.SelectCommand = "SELECT * FROM Event WHERE EventType LIKE '%" + SearchName + "%'";
            EventList.DataBind();
        }

        protected void technology_Click(object sender, EventArgs e)
        {
            string SearchName = technology.Text;
            EventList.SelectCommand = "SELECT * FROM Event WHERE EventType LIKE '%" + SearchName + "%'";
            EventList.DataBind();
        }

        protected void science_Click(object sender, EventArgs e)
        {
            string SearchName = science.Text;
            EventList.SelectCommand = "SELECT * FROM Event WHERE EventType LIKE '%" + SearchName + "%'";
            EventList.DataBind();
        }

        protected void sports_Click(object sender, EventArgs e)
        {
            string SearchName = sports.Text;
            EventList.SelectCommand = "SELECT * FROM Event WHERE EventType LIKE '%" + SearchName + "%'";
            EventList.DataBind();
        }

        protected void art_Click(object sender, EventArgs e)
        {
            string SearchName = art.Text;
            EventList.SelectCommand = "SELECT * FROM Event WHERE EventType LIKE '%" + SearchName + "%'";
            EventList.DataBind();
        }

        protected void all_Click(object sender, EventArgs e)
        {
            EventList.SelectCommand = "SELECT * FROM Event";
            EventList.DataBind();
        }

        protected void RepeaterList1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            if (e.CommandName == "ViewDetails")
            {
                string eventID = e.CommandArgument.ToString();

                // Call your method to get detailed information based on the eventID
                Event eventDetails = ent.ViewEvent(Convert.ToInt32(eventID));

                // Now you have the details, you can use them as needed
                if (eventDetails != null)
                {
                    Response.Redirect("EventDetails.aspx?EventID=" + eventID);


                }
            }
            if (e.CommandName == "UpdateDetails")
            {
                string eventID = e.CommandArgument.ToString();
                Response.Redirect("EventUpdate.aspx?EventID=" + eventID);
            }

            if (e.CommandName == "DeleteDetails")
            {
                string eventID = e.CommandArgument.ToString();
                int result = 0;
                Event Eventlist = new Event();

                result = Eventlist.EventDelete(eventID);

                if (result > 0)
                {
                    Response.Redirect("ViewEvents.aspx");
                    Response.Write("<script>alert('Product Remove successfully');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Product Removal NOT successfully');</script>");
                }
            }

        }
    }
}