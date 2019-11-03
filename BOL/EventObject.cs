using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BOL
{
    public class EventObject
    {
        private int _id;
        private string _title;
        private string _detail;
        private DateTime _date;
        private int _userId;
        private bool _status;

        public int EventId
        {
            get { return _id; }
            set { _id = value; }
        }

        public string EventTitle
        {
            get { return _title; }
            set { _title = value; }
        }

        public string EventDetail
        {
            get { return _detail; }
            set { _detail = value; }
        }

        public DateTime EventDate
        {
            get { return _date; }
            set { _date = value; }
        }

        public int UserId
        {
            get { return _userId; }
            set { _userId = value; }
        }

        public bool Status
        {
            get { return _status; }
            set { _status = value; }
        }
    }
}