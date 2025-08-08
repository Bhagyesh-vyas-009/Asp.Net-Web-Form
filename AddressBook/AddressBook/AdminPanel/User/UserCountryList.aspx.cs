using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AddressBook.AdminPanel.User
{
    public partial class UserCountry : System.Web.UI.Page
    {
        #region PageLoad
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
                Response.Redirect("~/AdminPanel/Login.aspx");
            if (!Page.IsPostBack)
            {
                FillCountryGrid();
            }

        }
        #endregion

        protected void gvCountry_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteCommand")
            {
                if (e.CommandArgument.ToString() != "")
                {
                    DeleteCountry(Convert.ToInt32(e.CommandArgument.ToString().Trim()));
                }
            }
        }

        #region FillCountryGrid
        private void FillCountryGrid()
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
                cmd.CommandText = "[PR_Country_SelectByUserID]";

                if(Session["UserID"]!=null)
                    cmd.Parameters.Add("@UserID", Session["UserID"]);   

                SqlDataReader objSDR = cmd.ExecuteReader();
                if (!objSDR.HasRows)
                {
                    lblMessageCountry.Text = "No Data Found";
                    lblMessageCountry.Attributes.Add("class", "text-info");
                }
                gvCountry.DataSource = objSDR;
                gvCountry.DataBind();
            }
            catch (Exception ex)
            {
                lblMessageCountry.Text = ex.Message;
                lblMessageCountry.Attributes.Add("class", "text-danger");
            }
            finally
            {
                if (conn.State == System.Data.ConnectionState.Open)
                    conn.Close();
            }
        }
        #endregion

        #region DeleteCountry
        private void DeleteCountry(SqlInt32 CountryID)
        {

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;
            try
            {
                conn.Open();

                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "[PR_Country_DeleteByPK]";
                cmd.Parameters.AddWithValue("@CountryID", CountryID.ToString().Trim());
                cmd.ExecuteNonQuery();

                lblMessageCountry.Text = "Data Deleted";
                lblMessageCountry.Attributes.Add("class", "text-success");
                FillCountryGrid();
                conn.Close();
            }
            catch (Exception ex)
            {
                lblMessageCountry.Text = ex.Message;
                lblMessageCountry.Attributes.Add("class", " text-danger");
            }
            finally
            {
                conn.Close();
            }
        }
        #endregion
    }
}