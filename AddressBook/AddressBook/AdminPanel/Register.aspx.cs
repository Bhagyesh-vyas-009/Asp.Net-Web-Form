using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AddressBook.AdminPanel
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            #region Local Variable
            SqlString sqlUserName = SqlString.Null;
            SqlString sqlPassword = SqlString.Null;
            SqlString sqlDisplayName = SqlString.Null;
            SqlString sqlMobileNo = SqlString.Null;
            SqlString sqlEmail = SqlString.Null;
            String strErrorMessage = "";
            #endregion

            #region Server Validation
            if (txtUserName.Text.Trim() == "")
                strErrorMessage += "Enter UserName<br/>";
            if (txtPassword.Text.Trim() == "")
                strErrorMessage += "Enter Password<br/>";
            if (txtDisplayName.Text.Trim() == "")
                strErrorMessage += "Enter Display Name<br/>";
            if (txtMobileNo.Text.Trim() == "")
                strErrorMessage += "Enter Mobile No<br/>";
            if (txtEmail.Text.Trim() == "")
                strErrorMessage += "Enter Email <br/>";

            if (strErrorMessage.Trim()!= "")
            {
                lblMessage.Text = strErrorMessage;
                lblMessage.Attributes.Add("class", "text-danger");
                return;
            }
            #endregion

            #region Assign Value
            if (txtUserName.Text.Trim() != "")
                sqlUserName=txtUserName.Text;
            if (txtPassword.Text.Trim() != "")
                sqlPassword=txtPassword.Text;
            if (txtDisplayName.Text.Trim() != "")
                sqlDisplayName=txtDisplayName.Text;
            if (txtMobileNo.Text.Trim() != "")
                sqlMobileNo=txtMobileNo.Text;
            if (txtEmail.Text.Trim() != "")
                sqlEmail=txtEmail.Text;
            #endregion

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            try
            {
                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Open();
               SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "[PR_User_Register]";

                cmd.Parameters.AddWithValue("@UserName", sqlUserName);
                cmd.Parameters.AddWithValue("@Password", sqlPassword);
                cmd.Parameters.AddWithValue("@DisplayName", sqlDisplayName);
                cmd.Parameters.AddWithValue("@MobileNo", sqlMobileNo);
                cmd.Parameters.AddWithValue("@Email", sqlEmail);
                cmd.ExecuteNonQuery();
                lblMessage.Text = "Registered Successfully";
                Response.Redirect("~/AdminPanel/Login.aspx");
            }
            catch(Exception ex)
            {
                lblMessage.Text = ex.Message;
                lblMessage.Attributes.Add("class", "text-danger");
            }
            finally
            {
                if (conn.State == System.Data.ConnectionState.Open)
                    conn.Close();
            }
        }
    }
}