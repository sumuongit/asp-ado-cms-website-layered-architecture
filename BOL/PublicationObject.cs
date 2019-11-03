using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BOL
{
    public class PublicationObject
    {
        private int _id;
        private string _title;
        private string _path;
        private int _userId;
        private bool _status;

        public int PublicationId
        {
            get { return _id; }
            set { _id = value; }
        }

        public string PublicationTitle
        {
            get { return _title; }
            set { _title = value; }
        }

        public string PublicationPath
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