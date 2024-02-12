using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventNow
{
    public partial class SignUpUpdate : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Event ent = null;
            Student stud = null;
            SignUpEvent signup = null;
            SignUpEvent a = new SignUpEvent();
            Event b = new Event();
            Student c = new Student();

            string signupID = Request.QueryString["SignUpID"].ToString();
            signup = a.getSignUp(signupID);
            string studentID = Request.QueryString["StudentID"].ToString();
            stud = c.ViewStudent(studentID);
            string eventID = Request.QueryString["SignedUpEvents"].ToString();
            ent = b.ViewEvent(Convert.ToInt32(eventID));

            
            lbl_StudentFName.Text = stud.FName;
            lbl_StudentLName.Text = stud.LName;
            lbl_EventName.Text = ent.EventName;
            lbl_StudentID.Text = signup.studentID;
            lbl_EventID.Text = signup.SignUpEvents;
            lbl_SignUpID.Text = signup.SignUpID.ToString();
            //lbl_StudentID.Text = signupID.ToString();


           


            //result = sign.SignUpUpdate(status);
            //if (result > 0)
            //{
            //    Response.Write("<script>alert('Product updated successfully');</script>");
            //}
            //else
            //{
            //    Response.Write("<script>alert('Product NOT updated');</script>");
            //}

            //Response.Redirect("SignUpEventView.aspx");
        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {
            int result = 0;
            string ID = lbl_SignUpID.Text;
            string studID = lbl_StudentID.Text;
            string eventID = lbl_EventID.Text;
            string status = Radio_SignUp.SelectedValue;
            SignUpEvent sign = new SignUpEvent();
            result = sign.SignUpUpdate(ID,eventID, status);

            if (result > 0)
            {
                Response.Write("<script>alert('Product updated successfully');</script>");
                //Response.Redirect("SignUpEventView.aspx");

            }
            else
            {
                Response.Write("<script>alert('Product NOT updated');</script>");
            }



           
            Response.Redirect("SignUpEventView.aspx?StudentID=" + Session["login"]);
        }

        protected void btn_Return_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUpEventView.aspx?StudentID=" + Session["login"]);
            
        }
    }
}