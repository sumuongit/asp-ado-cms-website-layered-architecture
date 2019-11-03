using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BOL
{
    public class StoryPhotoObject
    {
        private int _id;
        private int _Storyid;
        private string _path;
        private bool _status;

        public int PhotoId
        {
            get { return _id; }
            set { _id = value; }
        }

        public int StoryId
        {
            get { return _Storyid; }
            set { _Storyid = value; }
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