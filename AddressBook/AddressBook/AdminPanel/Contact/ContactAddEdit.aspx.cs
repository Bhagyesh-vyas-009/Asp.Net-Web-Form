using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Diagnostics.Eventing.Reader;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AddressBook.AdminPanel.Contact
{
    public partial class ContactAddEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("~/AdminPanel/Login");
                }
                FillDropDown();
                FillCBLContactCategoryID();
                if (Request.QueryString["ContactID"] == null)
                {
                    lblMessage.Text = "Add Mode";
                }
                else
                {
                    lblMessage.Text = "Edit Mode | ContactID=" + Request.QueryString["ContactID"];
                    FillControls(Convert.ToInt32(Request.QueryString["ContactID"]));
                    FillContactCategoryIDByContactID(Convert.ToInt32(Request.QueryString["ContactID"].ToString()));
                }
            }
        }

        #region FillCommonDropDown
        private void FillDropDown()
        {
            CommonDropDownListMethods.FillCountryDropDown(ddlCountryID);
            CommonDropDownListMethods.FillStateDropDownByCountryID(ddlStateID, ddlCountryID.SelectedValue);
            CommonDropDownListMethods.FillCityDropDownByStateID(ddlCityID, ddlStateID.SelectedValue);

            if (ddlCountryID.SelectedValue != "-1")
                ddlStateID.Enabled = true;

            if (ddlStateID.SelectedValue != "-1") 
                ddlCityID.Enabled = true;
        }
        #endregion

        #region ContactSave
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlString strContactName = SqlString.Null;

            SqlString strGender= SqlString.Null;
            SqlString strMobileNo = SqlString.Null;
            SqlString strWhatsAppNo= SqlString.Null;
            SqlString strEmail = SqlString.Null;
            SqlString strAddress= SqlString.Null;
            SqlString strBirthDate= SqlString.Null;
            SqlInt32  sqlAge= SqlInt32.Null;
            SqlString strBloodGroup = SqlString.Null;
            SqlString str = SqlString.Null;
            SqlString strCountryID= SqlString.Null;
            SqlString strStateID= SqlString.Null;
            SqlString strCityID= SqlString.Null;

            String errorMessage = "";
            String ContactPhotoPath = "";
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;
            try
            {
                if (txtContactName.Text.Trim() == "")
                    errorMessage += "Enter ContactName<br/>";
                if (txtMobileNo.Text.Trim() == "")
                    errorMessage += "Enter Mobile No <br/>";

                if (txtWhatsAppNo.Text.Trim() == "")
                    errorMessage += "Enter WhatsApp No <br/>";

                if (txtAddress.Text.Trim() == "")
                    errorMessage += "Enter Address<br/>";
                if (txtEmail.Text.Trim() == "")
                    errorMessage += "Enter Email<br/>";
                if (txtBirthDate.Text.Trim() == "")
                    errorMessage += "Enter BirthDate<br/>";
                if (txtAge.Text.Trim() == "")
                    errorMessage += "Enter Age <br/>";
                if (txtBloodGroup.Text.Trim() == "")
                    errorMessage += "Enter Blood Group  <br/>";
                if (rbtnlGender.SelectedValue == "")
                    errorMessage += "Select Gender<br/>";
                if (ddlCountryID.SelectedIndex == 0)
                    errorMessage += "Select Country<br/>";
                if (ddlStateID.SelectedIndex == 0)
                    errorMessage += "Select State<br/>";
                if (ddlCityID.SelectedIndex == 0)
                    errorMessage += "Select City<br/>";

                strGender =rbtnlGender.SelectedValue.Trim();
               
                if (errorMessage != "")
                {
                    lblMessage.Text = errorMessage;
                    lblMessage.Attributes.Add("class", "text-danger");
                    return;
                }

                if (txtContactName.Text.Trim() != "")
                    strContactName= txtContactName.Text.Trim();

                if (txtMobileNo.Text.Trim() != "")
                    strMobileNo= txtMobileNo.Text.Trim();

                if (txtWhatsAppNo.Text.Trim() != "")
                    strWhatsAppNo= txtWhatsAppNo.Text.Trim();

                if (txtAddress.Text.Trim() != "")
                    strAddress= txtAddress.Text.Trim();
                if (txtEmail.Text.Trim() != "")
                    strEmail= txtEmail.Text.Trim();
                if (txtBirthDate.Text.Trim() != "")
                    strBirthDate= txtBirthDate.Text.Trim();
                if (txtAge.Text.Trim() != "")
                    sqlAge=Convert.ToInt32(txtAge.Text.Trim());
                if (txtBloodGroup.Text.Trim() != "")
                    strBloodGroup = txtBloodGroup.Text.Trim();

                if (ddlCountryID.SelectedIndex > 0)
                    strCountryID = ddlCountryID.SelectedValue;
                if (ddlStateID.SelectedIndex > 0)
                    strStateID = ddlStateID.SelectedValue;
                if (ddlCityID.SelectedIndex > 0)
                    strCityID = ddlCityID.SelectedValue;

                str += strContactName + strGender + strEmail + strMobileNo + strWhatsAppNo + strAddress + strBirthDate + strBloodGroup;
                lblMessage.Text += str.ToString();
                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ContactName", strContactName);
                cmd.Parameters.AddWithValue("@Gender",strGender);
                cmd.Parameters.AddWithValue("@MobileNo", strMobileNo);
                cmd.Parameters.AddWithValue("@WhatsAppNo", strWhatsAppNo);
                cmd.Parameters.AddWithValue("@Email", strEmail);
                cmd.Parameters.AddWithValue("@Address", strAddress);
                cmd.Parameters.AddWithValue("@BirthDate", strBirthDate);
                cmd.Parameters.AddWithValue("@Age", sqlAge);
                cmd.Parameters.AddWithValue("@BloodGroup", strBloodGroup);
                cmd.Parameters.AddWithValue("@CountryID", strCountryID);
                cmd.Parameters.AddWithValue("@StateID", strStateID);
                cmd.Parameters.AddWithValue("@CityID", strCityID);

                if (Request.QueryString["ContactID"] != null)
                {
                    cmd.Parameters.AddWithValue("@ContactID", Request.QueryString["ContactID"].ToString().Trim());
                    cmd.CommandText = "PR_Contact_UpdateByPK";
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    cmd.Parameters.Add("@ContactID", System.Data.SqlDbType.Int, 4).Direction = System.Data.ParameterDirection.Output;
                    cmd.CommandText = "PR_Contact_Insert";
                    cmd.ExecuteNonQuery();
                    txtContactName.Text = "";
                    txtContactName.Focus();
                }


                SqlInt32 ContactID = 0;
                if (Request.QueryString["ContactID"] != null)
                    ContactID = Convert.ToInt32(Request.QueryString["ContactID"]);
                else
                    ContactID = Convert.ToInt32(cmd.Parameters["@ContactID"].Value);

                String xml = "<ContactWiseContactCategory>";
                SqlCommand objCmdContactCategory = conn.CreateCommand();
                objCmdContactCategory.CommandType = System.Data.CommandType.StoredProcedure;
                objCmdContactCategory.CommandText = "[PR_ContactWiseContactCategory_Insert]";
                objCmdContactCategory.Parameters.Add("@ContactID",System.Data.SqlDbType.Int).Value=ContactID;
                foreach(ListItem li in cblContactCategoryID.Items)
                {
                    if (li.Selected)
                    {

                        xml += "<ContactNode><ContactCategoryID>" + li.Value.ToString() + "</ContactCategoryID><ContactID>" + ContactID.ToString() + "</ContactID></ContactNode>";
                        //objCmdContactCategory.Parameters.AddWithValue("@ContactID",ContactID.ToString());
                        //objCmdContactCategory.Parameters.AddWithValue("@ContactCategoryID", li.Value.ToString());
                        //objCmdContactCategory.ExecuteNonQuery();
                    }
                }
                xml += "</ContactWiseContactCategory>";
                objCmdContactCategory.Parameters.AddWithValue("@xml", xml);
                objCmdContactCategory.ExecuteNonQuery();



                lblMessage.Text = "Data inserted with ContactID = "+ContactID.ToString()+xml;
                lblMessage.Attributes.Add("class", "text-success");
                Response.Redirect("~/AdminPanel/Contact/ContactList.aspx",false);
                //Response.Redirect("~/AdminPanel/Contact/ContactList.aspx");
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
                        rbtnlGender.SelectedValue = sdr["Gender"].ToString();
                        ddlCountryID.SelectedValue = sdr["CountryID"].ToString();
                        ddlStateID.SelectedValue = sdr["StateID"].ToString();
                        ddlCityID.SelectedValue = sdr["CityID"].ToString();

                        txtMobileNo.Text = sdr["MobileNo"].ToString();
                        txtWhatsAppNo.Text = sdr["WhatsAppNo"].ToString();
                        txtEmail.Text = sdr["Email"].ToString();
                        txtAddress.Text = sdr["Address"].ToString();
                        txtBirthDate.Text = sdr["BirthDate"].ToString();
                        txtAge.Text = sdr["Age"].ToString();
                        txtBloodGroup.Text = sdr["BloodGroup"].ToString();
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

        #region FillContactCategoryID By ContactID
        private void FillContactCategoryIDByContactID(SqlInt32 ContactID)
        {
            SqlConnection conn=new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);

            try
            {
                if (conn.State != System.Data.ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd=conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "[PR_ContactCategory_ContactWiseCategory_SelectByContactID]";
                cmd.Parameters.Add("@ContactID", ContactID);

                SqlDataReader sdr=cmd.ExecuteReader();
                cblContactCategoryID.Items.Clear();
                while (sdr.Read()) {
                    ListItem item = new ListItem
                    {
                        Text = sdr["ContactCategoryName"].ToString(),
                        Value = sdr["ContactCategoryID"].ToString(),
                        Selected = (Convert.ToInt32(sdr["IsSelected"]) == 1)
                    };
                    cblContactCategoryID.Items.Add(item);
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text += ex.Message;
                lblMessage.Attributes.Add("class", "text-danger");
            }
            finally {
                if (conn.State == System.Data.ConnectionState.Open)
                    conn.Close();
            }

        }
        #endregion

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminPanel/Contact/ContactList.aspx");
        }

        #region FillCBLContactCategoryID
        private void FillCBLContactCategoryID()
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
                cmd.CommandText = "[PR_ContactCategory_SelectForDropDownList]";
                SqlDataReader objSDR = cmd.ExecuteReader();
                if (objSDR.HasRows)
                {
                    cblContactCategoryID.DataSource = objSDR;
                    cblContactCategoryID.DataValueField = "ContactCategoryID";
                    cblContactCategoryID.DataTextField = "ContactCategoryName";
                    cblContactCategoryID.DataBind();
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
        #endregion

        protected void ddlCountryID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCountryID.SelectedIndex > 0) {
                ddlStateID.Enabled = true;
                CommonDropDownListMethods.FillStateDropDownByCountryID(ddlStateID, ddlCountryID.SelectedValue);
            }
            else
            {
                ddlStateID.Enabled=false;
            }
        }

        protected void ddlStateID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlStateID.SelectedIndex > 0)
            {
                ddlCityID.Enabled = true;
                ddlCityID.Items.Clear();
                CommonDropDownListMethods.FillCityDropDownByStateID(ddlCityID, ddlStateID.SelectedValue);
            }
            else
            {
                ddlCityID.Enabled = false;
            }
        }
    }
}