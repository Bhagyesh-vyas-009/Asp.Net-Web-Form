using AddressBook.AdminPanel.Contact;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AddressBook.AdminPanel.Contact
{
    public partial class ContactList : System.Web.UI.Page
    {
        #region PageLoad
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillContactGrid();
            }

        }
        #endregion

        protected void gvContact_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteCommand")
            {
                if (e.CommandArgument.ToString() != "")
                {
                    DeleteContact(Convert.ToInt32(e.CommandArgument.ToString().Trim()));
                }
            }
        }

        #region FillContactGrid
        private void FillContactGrid()
        {

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;
            try
            {
                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "PR_Contact_SelectAll";
                SqlDataReader objSDR = cmd.ExecuteReader();
                gvContact.DataSource = objSDR;
                gvContact.DataBind();
            }
            catch (Exception ex)
            {
                lblMessageContact.Text = ex.Message;
                lblMessageContact.Attributes.Add("class", "text-danger");
            }
            finally
            {
                if (conn.State == System.Data.ConnectionState.Open)
                    conn.Close();
            }
        }
        #endregion

        #region DeleteContact
        private void DeleteContact(SqlInt32 ContactID)
        {

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;
            try
            {
                conn.Open();

                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.CommandText = "[PR_Contact_SelectByPK]";
                cmd.Parameters.AddWithValue("@ContactID", ContactID.ToString().Trim());

                SqlDataReader sdr=cmd.ExecuteReader();
                String path = "";
                if(sdr.HasRows)
                {
                    while (sdr.Read()) {
                        if (sdr["ContactPhotoPath"] != null)
                            path = sdr["ContactPhotoPath"].ToString().Trim();
                    }
                }
                FileInfo file = new FileInfo(Server.MapPath(path));
                if (file.Exists)
                {
                    file.Delete();
                }
                sdr.Close();
                cmd.Dispose();
                SqlCommand cmd1 = conn.CreateCommand();
                cmd1.CommandType = System.Data.CommandType.StoredProcedure;
                cmd1.CommandText = "[PR_Contact_DeleteByPK]";
                cmd1.Parameters.AddWithValue("@ContactID", ContactID.ToString().Trim());
                cmd1.ExecuteNonQuery();

                lblMessageContact.Text = "Data Deleted";
                lblMessageContact.Attributes.Add("class", "text-success");
                FillContactGrid();
                conn.Close();
            }
            catch (Exception ex)
            {
                lblMessageContact.Text = ex.Message;
                lblMessageContact.Attributes.Add("class", " text-danger");
            }
            finally
            {
                conn.Close();
            }
        }
        #endregion
    }
}