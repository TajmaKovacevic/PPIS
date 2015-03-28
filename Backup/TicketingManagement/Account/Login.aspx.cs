using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TicketingManagement.Model;
using System.Data.SqlClient;
using System.Data;

namespace TicketingManagement.Account
{
    public partial class Login : System.Web.UI.Page
    {
        private string connectionString = "Data Source=LSIDEV02SPRJ28.lsi-dev.ad,1433;Initial Catalog=TestDB;Application Name=TicketingManagement;Trusted_Connection=Yes;";
        
        private DataSet set = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void login_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(LoginUser.UserName))
                HandleLogin(LoginUser.UserName, LoginUser.Password);
        }

        private void HandleLogin(string userId, string psw)
        {
            UserInfo userInfo = new UserInfo();
            
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    SqlCommand cmd = new SqlCommand("tblUsersAuthenticate", connection);
                    cmd.Parameters.AddWithValue("@UserName", userId);
                    cmd.Parameters.AddWithValue("@Password", psw);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;

                    da.Fill(set);
                }

                if (set.Tables != null && set.Tables[0].Rows.Count == 1)
                {
                    DataRow row = set.Tables[0].Rows[0];

                    userInfo.UserLoginID = row["UserName"].ToString();
                    userInfo.UserType = row["UserType"].ToString();

                    if (userInfo.UserType.Contains("administrator"))
                        Response.Redirect("~/Account/Register.aspx");
                    else if (userInfo.UserType.Contains("client"))
                        Response.Redirect("~/Ticket/Display.aspx");
                    else if (userInfo.UserType.Contains("employee"))
                        Response.Redirect("~/Ticket/Display.aspx");
                    else if (userInfo.UserType.Contains("manager"))
                        Response.Redirect("~/Ticket/Display.aspx");
                    else
                        Response.Redirect("~/About.aspx");
                }
            }
            catch (System.Threading.ThreadAbortException)
            {
                // This is expected on a Redirect - so just continue on
                throw;
            }
        }
    }
}
