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
    public partial class EventNow : System.Web.UI.Page
    {
        Event aevent = null;
        Student astudent = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            Event aEvent = new Event();
            Student aStudent = new Student();

            string EventID = Request.QueryString["eventID"].ToString();
            string studentIDD = (string)Session["login"];
            string StudentID = Request.QueryString["StudentID"].ToString();
            aevent = aEvent.ViewEvent(Convert.ToInt32(EventID));
            astudent = aStudent.ViewStudent(StudentID);
            lbl_eventID.Text = EventID.ToString();
            lbl_eventName.Text = aevent.EventName;
            lbl_Student.Text = StudentID.ToString();
            lbl_StudentFName.Text = astudent.FName;
            lbl_StudentLName.Text = astudent.LName;

            if (!IsPostBack) //check if the webpage is loaded for the first time.
            {
                ViewState["PreviousPage"] =
            Request.UrlReferrer;//Saves the Previous page url in ViewState
            }



        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            int result = 0;
            SignUpEvent signup = new SignUpEvent(lbl_Student.Text,lbl_eventID.Text, SignUpStatus.SelectedValue);
            string studentID = lbl_Student.Text;
            string eventID = lbl_eventID.Text;
            if (!signup.IsSignUpRecordExists(studentID, eventID))
            {


                result = signup.SignUpEventInsert();
                if (result > 0)
                {
                    Response.Write("<script>alert('Insert Successfully');</script>");

                    lbl_Student.Text = "";
                    lbl_eventID.Text = "";
                    SignUpStatus.Text = "";

                }
                else
                {
                    Response.Write("<script>alert('Insert NOT successful');</script>");

                }
                Response.Redirect("SignUpEventView.aspx");
            }
            else
            {
                Response.Write("<script>alert('You have already SignUp for the event');</script>");
            }
        }

        protected void btn_return_Click(object sender, EventArgs e)
        {
            if (ViewState["PreviousPage"] != null)    //Check if the ViewState 
                                                      //contains Previous page URL
            {
                Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to 
                                                                        //Previous page by retrieving the PreviousPage Url from ViewState.
            }
        }
    }
}