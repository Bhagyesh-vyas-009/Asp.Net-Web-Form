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
    public partial class Login_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
             #region Local Variable
            SqlString sqlLoginUserName = SqlString.Null;
            SqlString sqlLoginPassword = SqlString.Null;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            #endregion
            #region ServerSide Validation
            String strErrorMessage = "";
            if (txtLoginUserName.Text.Trim() == "")
                strErrorMessage += "Enter UserName<br/>";
            if (txtLoginPassword.Text.Trim() == "")
                strErrorMessage += "Enter Password<br/>";

            if (strErrorMessage.Trim() != "")
            {
                lblMessage.Text = strErrorMessage;
                lblMessage.Attributes.Add("class", "text-danger");
                return;
            }
            #endregion

            #region Assign Value
            if (txtLoginUserName.Text.Trim() != "")
                sqlLoginUserName = txtLoginUserName.Text.Trim();
            if (txtLoginPassword.Text.Trim() != "")
                sqlLoginPassword = txtLoginPassword.Text.Trim();
            #endregion

            try
            {

                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "[PR_User_SelectByUserNamePassword]";
                cmd.Parameters.AddWithValue("@UserName", sqlLoginUserName);
                cmd.Parameters.AddWithValue("@Password", sqlLoginPassword);

                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    lblMessage.Text = "Valid User";
                    while (sdr.Read()) {
                        if (!sdr["UserID"].Equals(DBNull.Value))
                            Session["UserID"]= sdr["UserID"].ToString().Trim();
                        if (!sdr["DisplayName"].Equals(DBNull.Value))
                            Session["DisplayName"] = sdr["DisplayName"].ToString().Trim();
                        break;
                    }
                    txtLoginPassword.Text = "";
                    txtLoginUserName.Text = "";
                    Response.Redirect("~/AdminPanel/Default.aspx");
                }
                else
                {
                    lblMessage.Text = "UserName or Password is invalid";
                    lblMessage.Attributes.Add("class", "text-danger");
                }
            }
            catch (Exception ex)
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