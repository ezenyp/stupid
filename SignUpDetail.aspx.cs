using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventNow
{
    public partial class SignUpDetail : System.Web.UI.Page
    {
        Event ent = null;
        Student stud = null;
        SignUpEvent signup = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            SignUpEvent a= new SignUpEvent();
            Event b = new Event();
            Student c = new Student();
            
            string signupID = Request.QueryString["SignUpID"].ToString();
            signup = a.getSignUp(signupID);
            string studentID = Request.QueryString["StudentID"].ToString();
            stud = c.ViewStudent(studentID);
            string eventID = Request.QueryString["SignedUpEvents"].ToString();
            ent = b.ViewEvent(Convert.ToInt32(eventID));

            if (ent == null && stud == null)
            {
                // Display a message indicating that both the event and student have been deleted
                lbl_DeletedMessage.Text = "The event and student have been deleted.";
                lbl_EventID.Visible = false;
                lbl_Attending.Visible = false;
                lbl_StudentFName.Visible = false;
                lbl_StudentLName.Visible = false;
                lbl_EventName.Visible = false;
                lbl_StudentID.Visible = false;
                lbl_SignUpID.Visible = false;
                btn_update.Visible = false;

            }
            else if (ent == null)
            {
                // Display a message indicating that the event has been deleted
                lbl_DeletedMessage.Text = "The event has been deleted.";
                lbl_EventID.Visible = false;
                lbl_Attending.Visible = false;
                lbl_StudentFName.Visible = false;
                lbl_StudentLName.Visible = false;
                lbl_EventName.Visible = false;
                lbl_StudentID.Visible = false;
                lbl_SignUpID.Visible = false;
                btn_update.Visible = false;
            }
            else if (stud == null)
            {
                // Display a message indicating that the student has been deleted
                lbl_DeletedMessage.Text = "The student has been deleted.";
                lbl_EventID.Visible = false;
                lbl_Attending.Visible = false;
                lbl_StudentFName.Visible = false;
                lbl_StudentLName.Visible = false;
                lbl_EventName.Visible = false;
                lbl_StudentID.Visible = false;
                lbl_SignUpID.Visible = false;
                btn_update.Visible = false;
            }
            else
            {
                // Display event and student details
                lbl_EventID.Text = signup.SignUpEvents;
                lbl_Attending.Text = signup.EventStatus;
                lbl_StudentFName.Text = stud.FName;
                lbl_StudentLName.Text = stud.LName;
                lbl_EventName.Text = ent.EventName;
                lbl_StudentID.Text = signup.studentID;
                lbl_SignUpID.Text = signup.SignUpID.ToString();
            }
            //lbl_StudentID.Text = signupID.ToString();
        }

        protected void btn_Return_Click(object sender, EventArgs e)
        {
            string studentID = lbl_StudentID.Text;
            Response.Redirect("SignUpEventView.aspx?StudentID=" + Session["Login"]);
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            string signupID = lbl_SignUpID.Text;
            string studentID = lbl_StudentID.Text;
            string eventID = lbl_EventID.Text;
            Response.Redirect("SignUpUpdate.aspx?SignUpID="+signupID+"&StudentID=" + studentID + "&SignedUpEvents=" + eventID);
        }
    }
}