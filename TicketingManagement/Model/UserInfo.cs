using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TicketingManagement.Model
{
    /// <summary>
    /// Summary description for UserInfo.
    /// </summary>
    [Serializable]
    public class UserInfo
    {
        //public enum UserType { Client = 1, Employee = 2, Manager = 3, Administrator = 4 };
        public enum UserLoginAttemptStatus { Unknown = -1, Failed = 0, Passed = 1 };

        public UserInfo()
        {
            LoginAttemptStatus = UserLoginAttemptStatus.Unknown;

            // Always an empty collection, never a null
            UserProperties = new Dictionary<string, string>();
        }

        private string userLoginID;
        public string UserLoginID
        {
            get { return userLoginID; }
            set { userLoginID = value; }
        }

        private string userFirstName;
        public string UuserFirstName
        {
            get { return userFirstName; }
            set { userFirstName = value; }
        }

        private string userLastName;
        public string UuserLasttName
        {
            get { return userLastName; }
            set { userLastName = value; }
        }

        private string email;
        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        private string userType;
        public string UserType
        {
            get { return userType; }
            set { userType = value; }
        }

        private string initialPageURL;
        public string InitialPageURL
        {
            get { return initialPageURL; }
            set { initialPageURL = value; }
        }

        private int clientActive = -1;
        public int ClientActive
        {
            get { return clientActive; }
            set { clientActive = value; }
        }


        public UserLoginAttemptStatus LoginAttemptStatus { get; set; }
        
        /// <summary>
        /// Gets the user properties collection (i.e. tblUserProperties).
        /// </summary>
        public IDictionary<string, string> UserProperties { get; set; }
    }
}