using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BOL
{
    public class AchievementObject
    {
        private int _id;
        private string _title;
        private string _detail;
        private int _userId;
        private bool _status;

        public int AchievementId
        {
            get { return _id; }
            set { _id = value; }
        }

        public string AchievementTitle
        {
            get { return _title; }
            set { _title = value; }
        }

        public string AchievementDetail
        {
            get { return _detail; }
            set { _detail = value; }
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