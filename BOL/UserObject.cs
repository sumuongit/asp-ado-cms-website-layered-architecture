using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BOL
{
    public class UserObject
    {
        private int _id;
        private string _name;
        private string _password;
        private string _email;
        private int _roleId;
        private bool _status;

        public int UserId
        {
            get { return _id; }
            set { _id = value; }
        }

        public string UserName
        {
            get { return _name; }
            set { _name = value; }
        }

        public string Password
        {
            get { return _password; }
            set { _password = value; }
        }

        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }

        public int RoleId
        {
            get { return _roleId; }
            set { _roleId = value; }
        }

        public bool Status
        {
            get { return _status; }
            set { _status = value; }
        }
    }
}