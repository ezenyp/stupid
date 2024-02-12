using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EventNow
{
    public class SignUpEvent
    {
        string _connStr = ConfigurationManager.ConnectionStrings["EventNowDB.mdf"].ConnectionString;
        private int _SignUpID = 0;
        private string _studentID = "";
        private string _SignUpEvents = "";
        private string _EventStatus = "";
        private string _EventName = "";
        private string _StudentFName = "";
        private string _StudentLName = "";

        public SignUpEvent(int SignUpID, string StudentID, string SignUpEvents, string EventStatus)
        {
            _SignUpID = SignUpID;
            _studentID = StudentID;
            _SignUpEvents = SignUpEvents;
            _EventStatus = EventStatus;
        }
        public SignUpEvent()
        {
        }

        public SignUpEvent(string StudentID, string SignUpEvents, string EventStatus)
        : this(0,StudentID, SignUpEvents, EventStatus)
        {
        }

        public SignUpEvent(int SignUpID)
       : this(SignUpID, "", "", "")
        {
        }

        public int SignUpID
        {
            get { return _SignUpID; }
            set { _SignUpID = value; }
        }

        public string studentID
        {
            get { return _studentID; }
            set { _studentID = value; }
        }
        public string SignUpEvents
        {
            get { return _SignUpEvents; }
            set { _SignUpEvents = value; }
        }

        public string EventStatus
        {
            get { return _EventStatus; }
            set { _EventStatus = value; }
        }


        public int SignUpEventInsert()
        {

            // string msg = null;
            int result = 0;

            string queryStr = "INSERT INTO SignUps(StudentID, SignedUpEvents, EventStatus)"
                + " values (@StudentID,@SignUpEvents, @EventStatus)";


            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@StudentID", this.studentID);
            cmd.Parameters.AddWithValue("@SignUpEvents", this.SignUpEvents);
            cmd.Parameters.AddWithValue("@EventStatus", this.EventStatus);

            conn.Open();
            result = cmd.ExecuteNonQuery(); // Returns no. of rows affected. Must be > 0
            conn.Close();

            return result;
        }//end Insert

        public bool IsSignUpRecordExists(string studentID, string signUpEvents)
        {
            string queryStr = "SELECT COUNT(*) FROM SignUps WHERE StudentID = @StudentID AND SignedUpEvents = @SignUpEvents";

            using (SqlConnection conn = new SqlConnection(_connStr))
            using (SqlCommand cmd = new SqlCommand(queryStr, conn))
            {
                cmd.Parameters.AddWithValue("@StudentID", studentID);
                cmd.Parameters.AddWithValue("@SignUpEvents", signUpEvents);

                conn.Open();
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

        public List<SignUpEvent> getSignUpAll(string studentID)
        {
            List<SignUpEvent> prodList = new List<SignUpEvent>();

            int SignUpID;
            
            string SignUpEvents;
            string EventStatus;



            string queryStr = "SELECT * FROM SignUps WHERE StudentID = @StudentID ORDER BY SignUpID";


            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@StudentID", studentID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                SignUpID = int.Parse(dr["SignUpID"].ToString());  
                studentID = dr["StudentID"].ToString();
                SignUpEvents = dr["SignedUpEvents"].ToString();
                EventStatus = dr["EventStatus"].ToString();

                SignUpEvent a = new SignUpEvent(SignUpID, studentID, SignUpEvents, EventStatus);
                prodList.Add(a);
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return prodList;

        }

        public List<SignUpEvent> getSignUpAll2(string studentID)
        {
            List<SignUpEvent> prodList = new List<SignUpEvent>();

            int SignUpID;

            string SignUpEvents;
            string EventStatus;



            string queryStr = "SELECT * FROM SignUps Order By SignUpID";


            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                SignUpID = int.Parse(dr["SignUpID"].ToString());
                studentID = dr["StudentID"].ToString();
                SignUpEvents = dr["SignedUpEvents"].ToString();
                EventStatus = dr["EventStatus"].ToString();

                SignUpEvent a = new SignUpEvent(SignUpID, studentID, SignUpEvents, EventStatus);
                prodList.Add(a);
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return prodList;

        }


        public SignUpEvent getSignUp(string SignUpID)
        {

            SignUpEvent SignUpDetail = null;

            string StudentID;
            string SignedUpEvents, EventStatus;
            string queryStr = "SELECT * FROM SignUps WHERE SignUpID = @SignUpID";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@SignUpID", SignUpID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                StudentID = dr["StudentID"].ToString();
                SignedUpEvents = dr["SignedUpEvents"].ToString();
                EventStatus = dr["EventStatus"].ToString();


                SignUpDetail = new SignUpEvent(int.Parse(SignUpID), StudentID, SignedUpEvents, EventStatus);
            }
            else
            {
                SignUpDetail = null;
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return SignUpDetail;
        }

        public int SignUpDelete(string SignUpID)
        {
            string queryStr = "DELETE FROM SignUps WHERE SignUpID=@SignUpID";
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@SignUpID", SignUpID);
            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();
            //  Response.Write("<script>alert('Delete successful');</script>");
            conn.Close();
            return nofRow;

        }//end Delete

        public int SignUpUpdate(string signupid, string signedupevents, string EventStatus)
        {
            string queryStr = 
                "UPDATE SignUps SET" +
    " SignedUpEvents = @SignedUpEvents," +
    " EventStatus = @EventStatus " + " WHERE SignUpID = @SignUpID";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@SignUpID", signupid);
            cmd.Parameters.AddWithValue("@SignedUpEvents", signedupevents);
            cmd.Parameters.AddWithValue("@EventStatus", EventStatus);


            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();

            conn.Close();

            return nofRow;

        }

    }
}