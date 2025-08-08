using Microsoft.Win32.SafeHandles;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;
using System.Linq;
using System.Security.AccessControl;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AddressBook.AdminPanel.Contact
{
    public partial class ContactAddEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ContactID"] == null)
            {
                lblMessage.Text = "Add Mode";
            }
            else
            {
                lblMessage.Text = "Edit Mode | ContactID=" + Request.QueryString["ContactID"];
                FillControls(Convert.ToInt32(Request.QueryString["ContactID"]));
            }
        }

        #region ContactSave
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlString strContactName = SqlString.Null;
            SqlInt32 strContactID = Convert.ToInt32(Request.QueryString["ContactID"]);
            String ContactPhotoPath = "";
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;
            try
            {
                if (txtContactName.Text.Trim() != "")
                    strContactName = txtContactName.Text.Trim();

                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ContactName", strContactName);
                cmd.Parameters.AddWithValue("@ContactPhotoPath", ContactPhotoPath.ToString().Trim());

                if (fuContactPhotoPath.HasFile)
                {
                    String FolderName = "~/UserContent/";
                    String AbsolutePath = Server.MapPath(FolderName);
                    if (!Directory.Exists(AbsolutePath))
                        Directory.CreateDirectory(AbsolutePath);
                    ContactPhotoPath = "~/UserContent/" + fuContactPhotoPath.FileName.ToString().Trim();
                }
                else
                {
                    lblMessage.Text = "Please Choose File";
                    lblMessage.Attributes.Add("class", "text-danger");
                }

                fuContactPhotoPath.SaveAs(Server.MapPath(ContactPhotoPath));

                if (Request.QueryString["ContactID"] != null)
                {
                    cmd.Parameters.AddWithValue("@ContactID", Request.QueryString["ContactID"].ToString().Trim());
                    cmd.CommandText = "PR_Contact_UpdateByPK";
                    cmd.ExecuteNonQuery();
                    Response.Redirect("~/AdminPanel/Contact/ContactList.aspx");
                }
                else
                {
                    cmd.CommandText = "PR_Contact_Insert";
                    cmd.ExecuteNonQuery();
                    lblMessage.Attributes.Add("class", "text-success");
                    lblMessage.Text = "Data Inserted Successfully";
                    txtContactName.Text = "";
                    txtContactName.Focus();
                }
                conn.Close();
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
        #endregion

        #region FillControls
        private void FillControls(SqlInt32 ContactID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            try
            {

                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "[PR_Contact_SelectByPK]";
                cmd.Parameters.AddWithValue("@ContactID", ContactID.ToString().Trim());
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        if (sdr["ContactName"].Equals(DBNull.Value) != true)
                        {
                            txtContactName.Text = sdr["ContactName"].ToString().Trim();
                        }
                        break;
                    }
                }
                else
                {
                    lblMessage.Text = "No Data";
                    lblMessage.Attributes.Add("class", "text-info");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text += ex.Message;
            }
            finally
            {
                if (conn.State == System.Data.ConnectionState.Open)
                    conn.Close();

            }
        }
        #endregion

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminPanel/Contact/ContactList.aspx");
        }
    }
}