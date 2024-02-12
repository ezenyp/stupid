using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventNow
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void button_login_Click(object sender, EventArgs e)
        {
            string studentID = tb_adminid.Text;
            string Password = tb_password.Text;
            Session["login"] = studentID;
            Response.Redirect("SignUpEventView.aspx?StudentID=" + studentID);
            
        }
    }
}