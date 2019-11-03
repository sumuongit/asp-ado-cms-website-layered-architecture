using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BOL
{
    public class NewsObject
    {
        private int _id;
        private string _title;
        private string _link;
        private int _userId;
        private bool _status;

        public int NewsId
        {
            get { return _id; }
            set { _id = value; }
        }

        public string NewsTitle
        {
            get { return _title; }
            set { _title = value; }
        }

        public string NewsLink
        {
            get { return _link; }
            set { _link = value; }
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