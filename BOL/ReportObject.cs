using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BOL
{
    public class ReportObject
    {
        private int _id;
        private string _title;
        private string _path;
        private int _userId;
        private bool _status;

        public int ReportId
        {
            get { return _id; }
            set { _id = value; }
        }

        public string ReportTitle
        {
            get { return _title; }
            set { _title = value; }
        }

       
        public string ReportPath
        {
            get { return _path; }
            set { _path = value; }
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