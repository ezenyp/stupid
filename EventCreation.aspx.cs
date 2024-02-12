using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace EventNow
{
    public partial class EventCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void btn_Create_Click(object sender, EventArgs e)
        {
            int result = 0;

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
                        str += " #" + td_EventType.Items[i].Text;
                    }
                }
            }

            string image = "";
            if (td_EventImg.HasFile == true)
            {
                image = "Images\\" + td_EventImg.FileName;
            }


            DateTime startDate, endDate;

            if (DateTime.TryParse(td_EventStartDate.Text, out startDate) && DateTime.TryParse(td_EventEndDate.Text, out endDate))

            {

                Event newEvent = new Event(td_EventName.Text, td_EventDesc.Text, str ,td_EventLocation.Text, Convert.ToInt32(td_EventDuration1.Text), td_EventDuration2.Text, td_EventOrg.Text, startDate, endDate, Eventmode_radiobutton.SelectedValue, td_EventImg.FileName);

                result = newEvent.EventInsert();

                if (result > 0)
                {
                    string saveimg = Server.MapPath(" ") + "\\" + image;
                    td_EventImg.SaveAs(saveimg);

                    Response.Write("<script>alert('Event Created Successfully');</script>");
                    td_EventName.Text = "";
                    td_EventDesc.Text = "";
                    td_EventType.Text = "";
                    td_EventLocation.Text = "";
                    td_EventDuration1.Text = "";
                    td_EventDuration2.Text = "";
                    td_EventOrg.Text = "";
                    td_EventStartDate.Text = "";
                    td_EventEndDate.Text = "";
                    Eventmode_radiobutton.SelectedValue = "";
                }
                else
                {
                    Response.Write("<script>alert('Error Creating Event');</script>");
                }
            }

            else
            {
                Response.Write("<script>alert('Invalid date format');</script>");
            }
        }

        protected void validateEventType_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = td_EventType.Items.Cast<ListItem>().Any(li => li.Selected);
        }
    }
}