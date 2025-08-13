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
using AddressBook;

namespace AddressBook.AdminPanel.City
{
    public partial class CityAddEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
                Response.Redirect("~/AdminPanel/Login.aspx");
            if (!Page.IsPostBack)
            {
                FillCountryDropDown();
                FillStateDropDown();
                if (Page.RouteData.Values["OperationName"] != null)
                {
                    if (Page.RouteData.Values["CityID"] != null)
                    {
                        lblMessage.Text = "Edit Mode | CityID " + Page.RouteData.Values["CityID"];
                        FillControls(Convert.ToInt32(AddressBook.UrlEncryptor.Decrypt(Page.RouteData.Values["CityID"].ToString())));
                    }
                }
                if (Request.QueryString["CityID"] != null)
                {
                    lblMessage.Text = "Edit Mode | CityID " + Request.QueryString["CityID"];
                    FillControls(Convert.ToInt32(AddressBook.UrlEncryptor.Decrypt(Request.QueryString["CityID"].ToString())));
                }
                if (Request.QueryString["CityID"] == null && Page.RouteData.Values["CityID"] == null)
                {
                    lblMessage.Text = "Add Mode";
                }
            }
        }

        private void FillDropDown()
        {
            //CommonDropDownListMethods.FillCountryDropDown();
        }
        #region Button : Save
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;
            SqlString strCityName = SqlString.Null;
            SqlInt32 sqlCountryID = SqlInt32.Null;
            SqlInt32 sqlStateID = SqlInt32.Null;

            try
            {

                String strErrorMessage = "";
                if (ddlCountryID.SelectedIndex == 0)
                {
                    strErrorMessage += "--Please Select Country <br/>";
                }
                if (ddlStateID.SelectedIndex == 0)
                {
                    strErrorMessage += "--Please Select State <br/>";
                }
                if (txtCityName.Text.Trim() == "")
                {
                    strErrorMessage += "--Please Enter City Name <br/>";
                }
                if (strErrorMessage != "")
                {
                    lblMessage.Text = strErrorMessage;
                    lblMessage.Attributes.Add("class", "text-danger");
                    return;
                }


                if (ddlCountryID.SelectedIndex > 0)
                {
                    sqlCountryID = Convert.ToInt32(ddlCountryID.SelectedValue);
                    ddlStateID.Enabled = true;
                }
                if (ddlStateID.SelectedIndex > 0)
                    sqlStateID = Convert.ToInt32(ddlStateID.SelectedValue);

                if (txtCityName.Text.Trim() != "")
                {
                    strCityName = txtCityName.Text.Trim();
                }

                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CityName", strCityName);
                cmd.Parameters.AddWithValue("@CountryID", sqlCountryID);
                cmd.Parameters.AddWithValue("@StateID", sqlStateID);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString().Trim());

                if (Request.QueryString["CityID"] != null)
                {
                    cmd.Parameters.AddWithValue("@CityID", AddressBook.UrlEncryptor.Decrypt(Request.QueryString["CityID"].ToString().Trim()));
                    cmd.CommandText = "[PR_City_UpdateByPK]";
                    cmd.ExecuteNonQuery();
                    Response.Redirect("~/AdminPanel/City/List");
                }
                if (Page.RouteData.Values["CityID"] != null)
                {
                    cmd.Parameters.AddWithValue("@CityID", AddressBook.UrlEncryptor.Decrypt(Page.RouteData.Values["CityID"].ToString().Trim()));
                    cmd.CommandText = "[PR_City_UpdateByPK]";
                    cmd.ExecuteNonQuery();
                    Response.Redirect("~/AdminPanel/City/List");
                }

                if (Request.QueryString["CityID"] == null && Page.RouteData.Values["CityID"] == null)
                {
                    cmd.CommandText = "[PR_City_Insert]";
                    cmd.ExecuteNonQuery();
                    txtCityName.Text = "";
                    ddlCountryID.SelectedIndex = 0;
                    ddlStateID.SelectedIndex = 0;
                    ddlCountryID.Focus();
                    lblMessage.Attributes.Add("class", "text-success");
                    lblMessage.Text = "Data Inserted Successfully";
                }

            }
            catch (Exception ex)
            {
                lblMessage.Attributes.Add("class", "text-danger");
                lblMessage.Text += ex.Message;
            }
            finally
            {
                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Close();
            }
        }
        #endregion

        private void FillCountryDropDown()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "[PR_Country_SelectForDropDownListByUserID]";
            cmd.Parameters.Add("@UserID", Session["UserID"].ToString().Trim());

            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                ddlCountryID.DataSource = sdr;
                ddlCountryID.DataValueField = "CountryID";
                ddlCountryID.DataTextField = "CountryName";
                ddlCountryID.DataBind();
            }

            ddlCountryID.Items.Insert(0, new ListItem("Select Country", "-1"));
            conn.Close();
        }

        private void FillStateDropDown()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "[PR_State_SelectForDropDownListByUserID]";
            //cmd.CommandText = "[PR_State_SelectForDropDownListByUserIDCountryID]";
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString().Trim());
            //cmd.Parameters.AddWithValue("@CountryID", CountryID);

            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                ddlStateID.DataSource = sdr;
                ddlStateID.DataValueField = "StateID";
                ddlStateID.DataTextField = "StateName";
                ddlStateID.DataBind();
            }

            ddlStateID.Items.Insert(0, new ListItem("Select State", "-1"));
            conn.Close();
        }

        private void FillControls(SqlInt32 CityID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);

            try
            {
                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "PR_City_SelectByPK";
                cmd.Parameters.AddWithValue("@CityID", CityID);

                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        if (!sdr["CountryID"].Equals(DBNull.Value))
                            ddlCountryID.SelectedValue = sdr["CountryID"].ToString().Trim();
                        if (!sdr["StateID"].Equals(DBNull.Value))
                            ddlStateID.SelectedValue = sdr["StateID"].ToString().Trim();
                        if (!sdr["CityName"].Equals(DBNull.Value))
                            txtCityName.Text = sdr["CityName"].ToString().Trim();
                        break;
                    }
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminPanel/City/List");
        }

    }
}