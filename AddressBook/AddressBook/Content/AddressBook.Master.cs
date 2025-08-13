using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AddressBook.Content
{
    public partial class AddressBook : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UserID"] == null)
            //{
            //    Response.Redirect("~/AdminPanel/Login.aspx");
            //}

            if (!Page.IsPostBack)
            {
                plLoginRegister.Visible = false;
                plUserDataFromSession.Visible = false;
                if (Session["UserID"] != null)
                {
                    plUserDataFromSession.Visible = true;
                    if (Session["DisplayName"] != null)
                        lblMessage.Text = Session["DisplayName"].ToString().Trim();
                }
                else
                {
                    plLoginRegister.Visible=true;
                }
            }
        }

        protected void btn_LogOutClick(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/AdminPanel/Default.aspx");
        }
    }
}