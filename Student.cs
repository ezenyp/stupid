using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EventNow
{
    public class Student
    {
        string _connStr = ConfigurationManager.ConnectionStrings["EventNowDB.mdf"].ConnectionString;
        private string _StudentID = null;
        private string _FName = string.Empty;
        private string _LName = ""; // this is another way to specify empty string
        private int _MobileNo = 0;
        private string _Email = "";
        private string _Sex = "";




        // Default constructor
        public Student()
        {
        }

        // Constructor that take in all data required to build a Product object
        public Student(string StudentID, string FName, string LName, int MobileNo, string Email,
                       string Sex)
        {
            _StudentID = StudentID;
            _FName = FName;
            _LName = LName;
            _MobileNo = MobileNo;
            _Email = Email;
            _Sex = Sex;
        }


        // Constructor that take in all except product ID
        //public Student(string FName, string LName, int MobileNo, string Email,
        //               string Sex)
        //   : this(null, FName, LName, MobileNo, Email,
        //                Sex)
        //{
        //}


        //// Constructor that take in only Product ID. The other attributes will be set to 0 or empty.
        //public Student(string StudentID)
        //    : this(StudentID, "", "", 0, "", "")
        //{
        //}

        // Get/Set the attributes of the Product object.
        // Note the attribute name (e.g. Product_ID) is same as the actual database field name.
        // This is for ease of referencing.
        public string StudentID
        {
            get { return _StudentID; }
            set { _StudentID = value; }
        }
        public string FName
        {
            get { return _FName; }
            set { _FName = value; }
        }
        public string LName
        {
            get { return _LName; }
            set { _LName = value; }
        }
        public int MobileNo
        {
            get { return _MobileNo; }
            set { _MobileNo = value; }
        }
        public string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }
        public string Sex
        {
            get { return _Sex; }
            set { _Sex = value; }
        }




        public Student ViewStudent(string StudentID)
        {
            Student studentdetail = null;


            string fname;
            string lname;
            int MobileNo;
            string Email;
            string Sex;



            string queryStr = "SELECT * FROM Students WHERE StudentID = @StudentID";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@StudentID", StudentID);


            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                fname = dr["FName"].ToString();
                lname = dr["LName"].ToString();
                MobileNo = int.Parse(dr["MobileNo"].ToString());
                Email = dr["Email"].ToString();
                Sex = dr["Sex"].ToString();


                studentdetail = new Student(StudentID, fname,lname,MobileNo,Email,Sex);

            }
            else
            {
                studentdetail = null;

            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return studentdetail;

        }
    }
}