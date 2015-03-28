using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TicketingManagement.Model
{
    [Serializable]
    public class TicketModel
    {
        private string title;
        public string Title
        {
            get { return title; }
            set { title = value; }
        }

        private string description;
        public string Description
        {
            get { return description; }
            set { description = value; }
        }

        private string username;
        public string UserName
        {
            get { return username; }
            set { username = value; }
        }

        private string location;
        public string Location
        {
            get { return location; }
            set { location = value; }
        }

        private string contactperson;
        public string ContactPerson
        {
            get { return contactperson; }
            set { contactperson = value; }
        }

        private string contactnumber;
        public string ContactNumber
        {
            get { return contactnumber; }
            set { contactnumber = value; }
        }

        private string steps;
        public string Steps
        {
            get { return steps; }
            set { steps = value; }
        }

        private string actions;
        public string Actions
        {
            get { return actions; }
            set { actions = value; }
        }
        private DateTime created;
        public DateTime Created
        {
            get { return created; }
            set { created = value; }
        }
    }
}