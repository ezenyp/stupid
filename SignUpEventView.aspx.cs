using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventNow
{
    public partial class SignUpEventView : System.Web.UI.Page
    {
        SignUpEvent myevent = new SignUpEvent();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }
        protected void bind()
        {
           
           List<SignUpEvent> EventList = new List<SignUpEvent>();
            string studentID = (string)Session["login"];
           //string StudentID = Request.QueryString["StudentID"].ToString();
            EventList = myevent.getSignUpAll(studentID);
            gv_Signupview.DataSource = EventList;
            gv_Signupview.DataBind();

        }

        protected void gv_Signupview_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the currently selected row.
            GridViewRow row = gv_Signupview.SelectedRow;


            // Get Product ID from the selected row, which is the 
            // first row, i.e. index 0.
            string signupID = row.Cells[0].Text;
            string studentID = row.Cells[1].Text;
            string eventID = row.Cells[2].Text;

            // Redirect to next page, with the Product Id added to the URL,
            // e.g. ProductDetails.aspx?ProdID=1
            Response.Redirect("SignUpDetail.aspx?SignUpID=" + signupID +"&StudentID=" + studentID  + "&SignedUpEvents=" + eventID);
            
        }

        protected void gv_Signupview_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int result = 0;
            SignUpEvent prod = new SignUpEvent();
            string categoryID = gv_Signupview.DataKeys[e.RowIndex].Value.ToString();
            result = prod.SignUpDelete(categoryID);

            if (result > 0)
            {

                Response.Write("<script>alert('Product removal successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Product Removal NOT successfully');</script>");
            }

           Response.Redirect("SignUpEventView.aspx");

        }






        /*  protected void gv_Signupview_RowUpdating(object sender, GridViewUpdateEventArgs e)
          {
              int result = 0;
              SignUpEvent prod = new SignUpEvent();
              GridViewRow row = (GridViewRow)gv_Signupview.Rows[e.RowIndex];
              string id = gv_Signupview.DataKeys[e.RowIndex].Value.ToString();
              string tid = ((TextBox)row.Cells[0].Controls[0]).Text;
              string teventid = ((TextBox)row.Cells[2].Controls[0]).Text;
              string status = ((TextBox)row.Cells[3].Controls[0]).Text;

              result = prod.SignUpUpdate(id,teventid, status);
              if (result > 0)
              {
                  Response.Write("<script>alert('Event updated successfully');</script>");
              }
              else
              {
                  Response.Write("<script>alert('Event NOT updated');</script>");
              }
              gv_Signupview.EditIndex = -1;
              bind();

          }

          protected void gv_Signupview_RowEditing(object sender, GridViewEditEventArgs e)
          {
              //GridViewRow row = gv_Signupview.SelectedRow;

              //// Get Product ID from the selected row, which is the 
              //// first row, i.e. index 0.
              //string studentID = row.Cells[0].Text;
              //string eventID = row.Cells[1].Text;

              //// Redirect to next page, with the Product Id added to the URL,
              //// e.g. ProductDetails.aspx?ProdID=1
              //Response.Redirect("SignUpUpdate.aspx?StudentID=" + studentID + "&SignedUpEvents=" + eventID);
              gv_Signupview.EditIndex = e.NewEditIndex;
              bind();

          }

          protected void gv_Signupview_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
          {
              gv_Signupview.EditIndex = -1;
              bind();

          }

  */
    }
}