using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace AddressBook
{
    public static class CommonDropDownListMethods
    {
        public static void FillCountryDropDown(DropDownList ddlCountryID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "[PR_Country_SelectForDropDownList]";
            //cmd.Parameters.Add("@UserID", Session["UserID"].ToString().Trim());

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

        public static void FillStateDropDown(DropDownList ddlStateID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "[PR_State_SelectForDropDownList]";

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
    }
}