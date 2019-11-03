using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BOL
{
    public class AchievementPhotoObject
    {
        private int _id;
        private int _Achievementid;
        private string _path;
        private bool _status;

        public int PhotoId
        {
            get { return _id; }
            set { _id = value; }
        }

        public int AchievementId
        {
            get { return _Achievementid; }
            set { _Achievementid = value; }
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