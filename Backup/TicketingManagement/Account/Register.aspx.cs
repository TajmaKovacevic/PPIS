using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using TicketingManagement.Model;
using System.Data.SqlClient;

namespace TicketingManagement.Account
{
    public partial class Register : System.Web.UI.Page
    {
        private string connectionString = "Data Source=LSIDEV02SPRJ28.lsi-dev.ad,1433;Initial Catalog=TestDB;Application Name=TicketingManagement;Trusted_Connection=Yes;";

        private DataSet set = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            CreateUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
        }

        //protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        //{
        //    FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);

        //    string continueUrl = RegisterUser.ContinueDestinationPageUrl;
        //    if (String.IsNullOrEmpty(continueUrl))
        //    {
        //        continueUrl = "~/";
        //    }
        //    Response.Redirect(continueUrl);
        //}

        protected void AddUser_Click(object sender, EventArgs e)
        {
            if (AddUser())
                Response.Redirect("~/Account/Register.aspx");
        }

        private bool AddUser()
        {
            UserInfo userInfo = new UserInfo();
            CreateUserWizardStep.FindControl("FirstName");

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    SqlCommand cmd = new SqlCommand("tblUsersInsert", connection);
                    cmd.Parameters.AddWithValue("@FirstName", "test");
                    cmd.Parameters.AddWithValue("@LastName", "test");
                    cmd.Parameters.AddWithValue("@UserName", CreateUser.UserName);
                    cmd.Parameters.AddWithValue("@Password", CreateUser.Password);
                    cmd.Parameters.AddWithValue("@Email", CreateUser.Email);
                    cmd.Parameters.AddWithValue("@UserType", "client");
                    cmd.Parameters.AddWithValue("@Active", true);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();
                }
                return true;
            }
            catch (System.Threading.ThreadAbortException)
            {
                // This is expected on a Redirect - so just continue on
                return false;
            }
        }
    }
}
