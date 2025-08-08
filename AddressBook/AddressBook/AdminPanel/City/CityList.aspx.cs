using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AddressBook.AdminPanel.City
{
    public partial class CityList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
                Response.Redirect("~/AdminPanel/Login.aspx");
            if (!Page.IsPostBack)
            {
                FillGridView();
            }
            else
            {
                FillGridView();
            }
        }

        private void FillGridView()
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;
            conn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "[PR_City_SelectByUserID]";
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString().Trim());

            SqlDataReader sdr = cmd.ExecuteReader();
            if (!sdr.HasRows)
            {
                lblMessageCity.Text = "No City Found";
                lblMessageCity.Attributes.Add("class", "text-info");
            }
            gvCity.DataSource = sdr;
            gvCity.DataBind();
            conn.Close();
        }
        protected void gvCity_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteCommand")
            {
                if (e.CommandArgument.ToString() != "")
                {
                    DeleteCity(Convert.ToInt32(e.CommandArgument.ToString().Trim()));
                }
            }
        }

        private void DeleteCity(SqlInt32 CityID)
        {
           
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString.Trim());
            try
            {

                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "[PR_City_DeleteByPK]";

                cmd.Parameters.AddWithValue("@CityID", CityID.ToString());
                cmd.ExecuteNonQuery();
                lblMessageCity.Text = "Data Deleted";
                lblMessage.Attributes.Add("class", "text-success");
                FillGridView();
            }
            catch (Exception ex) { 
                lblMessage.Text = ex.Message;
                lblMessage.Attributes.Add("class", "text-danger");
            }
            finally
            {
                Response.Redirect("~/AdminPanel/City/CityList.aspx");
                if (conn.State == System.Data.ConnectionState.Open)
                    conn.Close();
            }
        }
    }
}