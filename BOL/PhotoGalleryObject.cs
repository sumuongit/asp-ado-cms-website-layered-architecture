using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BOL
{
    public class PhotoGalleryObject
    {
        private int _id;
        private string _path;
        private string _brief;
        private string _detail;
        private int _userId;
        private bool _status;

        public int PhotoId
        {
            get { return _id; }
            set { _id = value; }
        }

        public string PhotoPath
        {
            get { return _path; }
            set { _path = value; }
        }
        public string PhotoBrief
        {
            get { return _brief; }
            set { _brief = value; }
        }

        public string PhotoDetail
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