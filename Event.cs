using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EventNow
{
    public class Event
    {
        string _connStr = ConfigurationManager.ConnectionStrings["EventNowDB.mdf"].ConnectionString;
        private int _eventID = 0;
        private string _eventName = string.Empty;
        private string _eventDesc = ""; // this is another way to specify empty string
        private string _eventType = "";
        private string _eventlocation= "";
        private int _eventduration1 = 0;
        private string _eventduration2 = "";
        private string _eventOrg = "";
        private DateTime _startdate;
        private DateTime _enddate;
        private string _eventlink = "";
        private string _eventimg = "";




        // Default constructor
        public Event()
        {
        }

        // Constructor that take in all data required to build a Product object
        public Event(int eventID, string eventName, string eventDesc, string eventType, string eventlocation,
                       int eventduration1, string eventduration2 , string eventOrg, DateTime startdate, DateTime enddate,
                      string eventlink, string eventimg)
        {
            _eventID = eventID;
            _eventName = eventName;
            _eventDesc = eventDesc;
            _eventType = eventType;
            _eventlocation = eventlocation;
            _eventduration1 = eventduration1;
            _eventduration2 = eventduration2;
            _eventOrg = eventOrg;
            _startdate = startdate;
            _enddate = enddate;
            _eventlink = eventlink;
            _eventimg = eventimg;
        }


        // Constructor that take in all except product ID
        public Event(string eventName, string eventDesc, string eventType, string eventlocation,
                       int eventduration1, string eventduration2, string eventOrg, DateTime startdate, DateTime enddate,
                     string eventlink, string eventimg)
           : this(0, eventName, eventDesc,  eventType,  eventlocation,
                        eventduration1,  eventduration2,  eventOrg,  startdate, enddate,
                        eventlink,  eventimg)
        {
        }


        //// Constructor that take in only Product ID. The other attributes will be set to 0 or empty.
/*        public Event(string eventID)
            : this(eventID, "", "", "","",0,"","", "", "", "", "")
        {
        }*/

        // Get/Set the attributes of the Product object.
        // Note the attribute name (e.g. Product_ID) is same as the actual database field name.
        // This is for ease of referencing.
        public int eventID
        {
            get { return _eventID; }
            set { _eventID = value; }
        }
        public string EventName
        {
            get { return _eventName; }
            set { _eventName = value; }
        }
        public string EventDesc
        {
            get { return _eventDesc; }
            set { _eventDesc = value; }
        }
        public string eventType
        {
            get { return _eventType; }
            set { _eventType = value; }
        }
        public string eventlocation
        {
            get { return _eventlocation; }
            set { _eventlocation = value; }
        }
        public int eventduration1
        {
            get { return _eventduration1; }
            set { _eventduration1 = value; }
        }
        public string eventduration2
        {
            get { return _eventduration2; }
            set { _eventduration2 = value; }
        }
        public string eventOrg
        {
            get { return _eventOrg; }
            set { _eventOrg = value; }
        }
        public DateTime startdate
        {
            get { return _startdate; }
            set { _startdate = value; }
        }
        public DateTime enddate
        {
            get { return _enddate; }
            set { _enddate = value; }
        }
        public string eventlink
        {
            get { return _eventlink; }
            set { _eventlink = value; }
        }
        public string eventimg
        {
            get { return _eventimg; }
            set { _eventimg = value; }
        }




        public Event ViewEvent(int eventID)
        {
            Event eventdetail = null;


            string name;
            string desc;
            string type;
            string location;
            int duration1;
            string duration2;
            string eventOrg;
            DateTime startdate;
            DateTime enddate;
            string eventlink;
            string eventimg;


            string queryStr = "SELECT * FROM Event WHERE EventID = @eventID";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@eventID", eventID);
            


            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                name = dr["EventName"].ToString();
                desc = dr["EventDesc"].ToString();
                type = dr["EventType"].ToString();
                location = dr["EventLocation"].ToString();
                duration1 = int.Parse(dr["EventDuration1"].ToString());
                duration2 = dr["EventDuration2"].ToString();
                eventOrg = dr["EventOrg"].ToString();
                startdate = DateTime.Parse(dr["EventStartDate"].ToString());
                enddate = DateTime.Parse(dr["EventEndDate"].ToString());
                eventlink = dr["EventLink"].ToString();
                eventimg = dr["EventImg"].ToString();




                eventdetail = new Event(eventID,name,desc,type,location,duration1,duration2,eventOrg,startdate,enddate,eventlink,eventimg);

            }
            else
            {
                eventdetail = null;

            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return eventdetail;

        }



        public int UpdateEvent( int EventID, string name, string desc, string type, string location, int duration1, string duration2, string org, DateTime startdate, DateTime enddate, string eventlink,string img)
        {
            string queryStr = "UPDATE Event SET" +
                //" EventID = @EventID, " +
                " EventName = @EventName, " +
                " EventDesc = @EventDesc, " +
                " EventType = @EventType, " +
                " EventLocation = @EventLocation, " +
                " EventDuration1 = @EventDuration1, " +
                " EventDuration2 = @EventDuration2, " +
                " EventOrg = @EventOrg, " +
                " EventStartDate = @EventStartDate1, " +
                " EventEndDate = @EventEndDate2, " +
                " EventLink = @EventLink, " +
                " EventImg = @EventImg " +
                " WHERE EventID = @EventID";
          


                SqlConnection conn = new SqlConnection(_connStr);
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                cmd.Parameters.AddWithValue("@EventID", EventID);
                cmd.Parameters.AddWithValue("@EventName", name);
                cmd.Parameters.AddWithValue("@EventDesc", desc);
                cmd.Parameters.AddWithValue("@EventType", type);
                cmd.Parameters.AddWithValue("@EventLocation", location);
                cmd.Parameters.AddWithValue("@EventDuration1", duration1);
                cmd.Parameters.AddWithValue("@EventDuration2", duration2);
                cmd.Parameters.AddWithValue("@EventOrg", org);
                cmd.Parameters.AddWithValue("@EventStartDate1", startdate);
                cmd.Parameters.AddWithValue("@EventEndDate2", enddate);
                cmd.Parameters.AddWithValue("@EventLink", eventlink);
                cmd.Parameters.AddWithValue("@EventImg", img);

                conn.Open();
                int nofRow = 0;
                nofRow = cmd.ExecuteNonQuery();

                conn.Close();

                return nofRow;
            

      
        }//end Update

        public int EventDelete(string EventID)
        {
            string queryStr = "DELETE FROM Event WHERE EventID=@EventID";
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@EventiD", EventID);
            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();
            //Response.Write("<script>alert('Delete successful');</script>");
            conn.Close();
            return nofRow;

        }

        public int EventInsert()
        {

            int result = 0;

            string queryStr = "INSERT INTO Event(EventName, EventDesc, EventType, EventLocation, EventDuration1, EventDuration2, EventOrg, EventStartDate, EventEndDate, EventLink, EventImg)"
                + " Values (@EventName, @EventDesc, @EventType, @EventLocation, @EventDuration1, @EventDuration2, @EventOrg, @EventStartDate, @EventEndDate, @EventLink, @EventImg)";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@EventName", this.EventName);
            cmd.Parameters.AddWithValue("@EventDesc", this.EventDesc);
            cmd.Parameters.AddWithValue("@EventType", this.eventType);
            cmd.Parameters.AddWithValue("@EventLocation", this.eventlocation);
            cmd.Parameters.AddWithValue("@EventDuration1", this.eventduration1);
            cmd.Parameters.AddWithValue("@EventDuration2", this.eventduration2);
            cmd.Parameters.AddWithValue("@EventOrg", this.eventOrg);
            cmd.Parameters.AddWithValue("@EventStartDate", this.startdate);
            cmd.Parameters.AddWithValue("@EventEndDate", this.enddate);
            cmd.Parameters.AddWithValue("@EventLink", this.eventlink);
            cmd.Parameters.AddWithValue("@EventImg", this.eventimg);

            conn.Open();
            result += cmd.ExecuteNonQuery();
            conn.Close();

            return result;
        }
    }

}