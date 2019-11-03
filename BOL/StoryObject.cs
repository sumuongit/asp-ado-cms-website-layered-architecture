using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BOL
{
    public class StoryObject
    {
        private int _id;
        private string _title;
        private string _detail;
        private string _path;
        private DateTime _updatedate;
        private int _userId;
        private bool _status;

        public int StoryId
        {
            get { return _id; }
            set { _id = value; }
        }

        public string StoryTitle
        {
            get { return _title; }
            set { _title = value; }
        }

        public string StoryDetail
        {
            get { return _detail; }
            set { _detail = value; }
        }

        public string PhotoPath
        {
            get { return _path; }
            set { _path = value; }
        }

        public DateTime UpdateDate
        {
            get { return _updatedate; }
            set { _updatedate = value; }
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