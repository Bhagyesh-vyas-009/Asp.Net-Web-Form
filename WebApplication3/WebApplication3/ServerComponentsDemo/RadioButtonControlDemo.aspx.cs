using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3.ServerComponentsDemo
{
    public partial class RadioBoxControlDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDisplay_Click(object sender, EventArgs e)
        {
            if (rbtnMale.Checked==true)
                lblGender.Text = "Male";
            else if (rbtnFemale.Checked)
                lblGender.Text = "Female";
            else
            {
                lblGender.Text = "Kindly Select Gender";
                lblGender.Style.Add("ForeColor","#FF3300");
            }
        }

        protected void lb1_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/ServerComponentsDemo/TextBoxDemo1.aspx");
            Server.Transfer("~/ServerComponentsDemo/TextBoxDemo1.aspx");
        }
    }
}