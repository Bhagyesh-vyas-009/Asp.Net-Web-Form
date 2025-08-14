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

        #region FillCountryDropDown
        public static void FillCountryDropDown(DropDownList ddlCountryID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "[PR_Country_SelectForDropDownList]";

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
        #endregion

        #region FillCountryDropDownByUserID
        public static void FillCountryDropDownByUserID(DropDownList ddlCountryID,String UserID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "[PR_Country_SelectForDropDownListByUserID]";
     
            cmd.Parameters.Add("@UserID", UserID);

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
        #endregion

        #region FillStateDropDown
        public static void FillStateDropDown(DropDownList ddlStateID,String UserID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "[PR_State_SelectForDropDownListByUserID]";
            cmd.Parameters.Add("@UserID", UserID);

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
        #endregion

        #region FillStateDropDownByUserIDCountryID
        public static void FillStateDropDownByUserIDCountryID(DropDownList ddlStateID, String CountryID,String UserID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "[PR_State_SelectForDropDownListByUserIDCountryID]";
            cmd.Parameters.Add("@CountryID", CountryID);
            cmd.Parameters.Add("@UserID", UserID);

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
        #endregion

        #region FillStateDropDownByCountryID
        public static void FillStateDropDownByCountryID(DropDownList ddlStateID, String CountryID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "[PR_State_SelectForDropDownListByCountryID]";
            cmd.Parameters.Add("@CountryID", CountryID);

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
        #endregion

        #region FillCityDropDown
        public static void FillCityDropDown(DropDownList ddlCityID, String UserID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "[PR_City_SelectForDropDownListByUserID]";
            //cmd.Parameters.Add("@UserID", UserID);

            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                ddlCityID.DataSource = sdr;
                ddlCityID.DataValueField = "CityID";
                ddlCityID.DataTextField = "CityName";
                ddlCityID.DataBind();
            }

            ddlCityID.Items.Insert(0, new ListItem("Select City", "-1"));
            conn.Close();
        }
        #endregion

        #region FillCityDropDownByStateID
        public static void FillCityDropDownByStateID(DropDownList ddlCityID, String StateID)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "[PR_City_SelectForDropDownListByStateID]";
            cmd.Parameters.Add("@StateID", StateID);

            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                ddlCityID.DataSource = sdr;
                ddlCityID.DataValueField = "CityID";
                ddlCityID.DataTextField = "CityName";
                ddlCityID.DataBind();
            }

            ddlCityID.Items.Insert(0, new ListItem("Select City", "-1"));
            conn.Close();
        }
        #endregion
    }
}