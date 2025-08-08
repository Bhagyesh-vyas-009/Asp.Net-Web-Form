using AddressBook.AdminPanel.Country;
using Microsoft.Win32.SafeHandles;
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

namespace AddressBook.AdminPanel.State
{
    public partial class StateAddEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
                Response.Redirect("~/AdminPanel/Login.aspx");
            if (!Page.IsPostBack)
            {
                FillCountryDropDownList();
                if (Request.QueryString["StateID"] != null)
                {
                    lblMessage.Text = "Edit Mode | StateID " + Request.QueryString["StateID"];
                    FillControls(Convert.ToInt32(Request.QueryString["StateID"]));
                }
                else
                {
                    lblMessage.Text = "Add Mode";
                }
            }
        }
        private void FillCountryDropDownList()
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;
            conn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            if (Session["UserID"]!=null)
            {
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString().Trim());
                cmd.CommandText = "PR_Country_SelectForDropDownListByUserID";
            }
            else
                cmd.CommandText = "PR_Country_SelectForDropDownList";
            SqlDataReader objSDR = cmd.ExecuteReader();
            if (objSDR.HasRows)
            {
                ddlCountryID.DataSource = objSDR;
                ddlCountryID.DataValueField = "CountryID";
                ddlCountryID.DataTextField = "CountryName";
                ddlCountryID.DataBind();
            }
            ddlCountryID.Items.Insert(0, new ListItem("Select Country", "-1"));

            conn.Close();
        }

        #region StateSave
        protected void btnSave_Click(object sender, EventArgs e)
        {
            #region Local Variable
            SqlString strStateName = SqlString.Null;
            SqlInt32 sqlCountryID = SqlInt32.Null;
            String errorMessage = "";
            #endregion

            #region Server Side Validation
            if (ddlCountryID.SelectedIndex == 0)
            {
                errorMessage += "Select Country<br/>";
            }
            if (txtStateName.Text == "")
            {
                errorMessage += "Enter StateName<br/>";
            }

            if (errorMessage != "")
            {
                lblMessage.Text = errorMessage;
                lblMessage.Attributes.Add("class", "text-danger");
                return;
            }
            #endregion

            #region Gather Information
            if (ddlCountryID.SelectedIndex > 0)
            {
                sqlCountryID = Convert.ToInt32(ddlCountryID.SelectedValue);
            }
            if (txtStateName.Text.Trim() != "")
            {
                strStateName = txtStateName.Text.Trim();
            }
            #endregion

            #region Connection & Command Object
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;
            try
            {
                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@StateName", strStateName);
                cmd.Parameters.AddWithValue("@CountryID", sqlCountryID);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString().Trim());

                #endregion
                if (Request.QueryString["StateID"] != null)
                {
                    #region Edit State
                    cmd.Parameters.AddWithValue("@StateID", Request.QueryString["StateID"].ToString().Trim());
                    cmd.CommandText = "PR_State_UpdateByPK";
                    cmd.ExecuteNonQuery();
                    Response.Redirect("~/AdminPanel/State/StateList.aspx");
                    #endregion
                }
                else
                {
                    #region Insert State
                    cmd.CommandText = "[PR_State_Insert]";
                    cmd.ExecuteNonQuery();
                    lblMessage.Attributes.Add("class", "text-success");
                    lblMessage.Text = "Data Inserted Successfully";
                    lblMessage.Attributes.Add("class", "text-success");
                    ddlCountryID.SelectedIndex = 0;
                    txtStateName.Text = "";
                    txtStateName.Focus();
                    #endregion
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
                lblMessage.Attributes.Add("class", "text-danger");
            }
            finally
            {
                if(conn.State==System.Data.ConnectionState.Open)
                    conn.Close();
            }
        }
        #endregion

        #region FillStateControls
        private void FillControls(SqlInt32 StateID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            if (conn.State != System.Data.ConnectionState.Open)
                conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "[PR_State_SelectByPK]";
            cmd.Parameters.AddWithValue("@StateID", StateID.ToString().Trim());
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    if (!sdr["CountryID"].Equals(DBNull.Value))
                    {
                        ddlCountryID.SelectedValue = sdr["CountryID"].ToString().Trim();
                    }
                    if (!sdr["StateName"].Equals(DBNull.Value))
                    {
                        txtStateName.Text = sdr["StateName"].ToString().Trim();
                    }
                    break;
                }
            }
        }
        #endregion

        #region BtnCancel
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminPanel/Country/CountryList.aspx");
        }
        #endregion
    }
}