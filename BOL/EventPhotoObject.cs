using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BOL
{
    public class EventPhotoObject
    {
        private int _id;
        private int _Eventid;
        private string _path;
        private bool _status;

        public int PhotoId
        {
            get { return _id; }
            set { _id = value; }
        }

        public int EventId
        {
            get { return _Eventid; }
            set { _Eventid = value; }
        }

        public string PhotoPath
        {
            get { return _path; }
            set { _path = value; }
        }

        public bool Status
        {
            get { return _status; }
            set { _status = value; }
        }
    }
}