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

namespace AddressBook.AdminPanel.State
{
    public partial class StateList : System.Web.UI.Page
    {
        #region PageLoad
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
                Response.Redirect("~/AdminPanel/Login.aspx");
            if (!Page.IsPostBack) { 
                FillGridView();
            }
            else
            {
                FillGridView();
            }
        }
        #endregion

        #region FillStateGrid
        private void FillGridView()
        {
            SqlConnection conn = new SqlConnection("Data Source=DESKTOP-MABULQ9\\SQLEXPRESS; initial catalog=AddressBook; integrated security=true;");

            try
            {
                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString().Trim());
                cmd.CommandText = "PR_State_SelectByUserID";
                //cmd.CommandText = "PR_State_SelectAll";

                SqlDataReader sdr = cmd.ExecuteReader();
                if (!sdr.HasRows)
                {
                    lblMessageState.Text = "No States Found";
                    lblMessageState.Attributes.Add("class", "text-info");
                }
                gvState.DataSource = sdr;
                gvState.DataBind();
                
                conn.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
                lblMessage.Attributes.Add("class", "text-danger fw-3");
            }
            finally
            {
                if(conn.State==System.Data.ConnectionState.Open)
                        conn.Close() ;
            }
        }
        #endregion

        #region StateRowCommandDelete_Edit
        protected void gvState_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRecord")
            {
                if (e.CommandArgument.ToString() != "")
                    DeleteState(Convert.ToInt32(e.CommandArgument.ToString().Trim()));
            }
        }
        #endregion

        private void DeleteState(SqlInt32 StateID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString.Trim());
            try
            {
                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "[PR_State_DeleteByPK]";

                cmd.Parameters.AddWithValue("@StateID", StateID.ToString());
                cmd.ExecuteNonQuery();

                lblMessage.Attributes.Add("class", "text-success");
                lblMessageState.Text = "Data Deleted";
            }
            catch (Exception ex) {
                lblMessageState.Text = ex.Message;
                lblMessage.Attributes.Add("class", "text-danger");
            }
            finally
            {
                Response.Redirect("~/AdminPanel/State/StateList.aspx");
                if (conn.State == System.Data.ConnectionState.Open)
                    conn.Close();
            }
        }
    }
}