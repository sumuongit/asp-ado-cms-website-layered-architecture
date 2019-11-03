using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BOL
{
    public class BannerObject
    {
        private int _id;
        private string _path;
        private string _info;
        private int _userId;
        private bool _status;

        public int BannerId
        {
            get { return _id; }
            set { _id = value; }
        }

        public string PhotoPath
        {
            get { return _path; }
            set { _path = value; }
        }
        public string BannerInformation
        {
            get { return _info; }
            set { _info = value; }
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