using AddressBook.Content;
using Microsoft.Win32.SafeHandles;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AddressBook.AdminPanel.Country
{
    public partial class CountryAddEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UserID"] == null)
                    Response.Redirect("~/AdminPanel/Login");
                if (Page.RouteData.Values["OperationName"] != null)
                {
                    if (Page.RouteData.Values["CountryID"] != null)
                    {
                        lblMessage.Text = "Edit Mode | CountryID " + Page.RouteData.Values["CountryID"];
                        FillControls(Convert.ToInt32(AddressBook.UrlEncryptor.Decrypt(Page.RouteData.Values["CountryID"].ToString())));
                    }
                    else
                        lblMessage.Text = "Add Mode";
                }
                if (Request.QueryString["CountryID"] != null)
                {
                    lblMessage.Text = "Edit Mode | CountryID " + Request.QueryString["CountryID"];
                    FillControls(Convert.ToInt32(AddressBook.UrlEncryptor.Decrypt(Request.QueryString["CountryID"].ToString())));
                }
                else if (Request.QueryString["CountryID"] == null)
                {
                    lblMessage.Text = "Add Mode";
                }
            }
        }

        #region CountrySave
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlString strCountryName = SqlString.Null;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;
            try
            {
                if (txtCountryName.Text.Trim() != "")
                    strCountryName = txtCountryName.Text.Trim();

                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@CountryName", strCountryName);
                if (Session["UserID"]!=null)
                    cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString().Trim());

                if (Request.QueryString["CountryID"] != null)
                {
                    cmd.Parameters.AddWithValue("@CountryID", AddressBook.UrlEncryptor.Decrypt(Request.QueryString["CountryID"].ToString().Trim()));
                    //cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString().Trim());
                    cmd.CommandText = "[PR_Country_UpdateByPK]";
                    cmd.ExecuteNonQuery();
                    Response.Redirect("~/AdminPanel/Country/List");
                }
                if (Page.RouteData.Values["CountryID"] != null)
                {
                    cmd.Parameters.AddWithValue("@CountryID", AddressBook.UrlEncryptor.Decrypt(Page.RouteData.Values["CountryID"].ToString().Trim()));
                    //cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString().Trim());
                    cmd.CommandText = "[PR_Country_UpdateByPK]";
                    cmd.ExecuteNonQuery();
                    Response.Redirect("~/AdminPanel/Country/List");
                }

                if (Request.QueryString["CountryID"] == null && Page.RouteData.Values["CountryID"] == null)
                {
                    //cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString().Trim());
                    cmd.CommandText = "[PR_Country_Insert]";
                    cmd.ExecuteNonQuery();
                    lblMessage.Attributes.Add("class", "text-success");
                    lblMessage.Text = "Data Inserted Successfully";
                    txtCountryName.Text = "";
                    txtCountryName.Focus();
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
        private void FillControls(SqlInt32 CountryID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            try
            {

                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "[PR_Country_SelectByPK]";
                cmd.Parameters.AddWithValue("@CountryID", CountryID.ToString().Trim());
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        if (sdr["CountryName"].Equals(DBNull.Value) != true)
                        {
                            txtCountryName.Text = sdr["CountryName"].ToString().Trim();
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
            Response.Redirect("~/AdminPanel/Country/List");
        }
    }
}