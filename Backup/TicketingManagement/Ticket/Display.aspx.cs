using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TicketingManagement.Ticket
{
    public partial class Display : System.Web.UI.Page
    {
        protected ImageButton addUser;        
        private string connectionString = "Data Source=LSIDEV02SPRJ28.lsi-dev.ad,1433;Initial Catalog=TestDB;Application Name=TicketingManagement;Trusted_Connection=Yes;";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the list of users
            DataSet userDS = GetAllTickets();
            if (userDS != null && userDS.Tables[0].Rows.Count > 0)
            {
                //bind data 
                ticketList.DataSource = userDS;
                ticketList.DataBind();
            }
        }

        protected void ticketList_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            LinkButton link = e.Item.FindControl("linkUser") as LinkButton;
            if (link == null)
                return;

            link.Click += new EventHandler(linkTicket_Click);
        }


        protected void ticketList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            LinkButton link = e.Item.FindControl("linkUser") as LinkButton;
            if (link == null)
                return;

            link.CommandName = DataBinder.Eval(e.Item.DataItem, "Title").ToString();
            link.Text = HttpUtility.HtmlEncode(DataBinder.Eval(e.Item.DataItem, "Title").ToString());
        }


        private void linkTicket_Click(object sender, EventArgs e)
        {
            LinkButton link = sender as LinkButton;
            if (link == null)
                return;

            Response.Redirect("AdminUser.aspx");
        }

        private DataSet GetAllTickets()
        {
            DataSet result = new DataSet();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand cmd = new SqlCommand("tblTicketSelectAll", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;

                da.Fill(result);
            }

            return result;
        }
    }
}