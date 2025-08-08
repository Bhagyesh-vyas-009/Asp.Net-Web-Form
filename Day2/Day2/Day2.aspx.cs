using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Day2
{
    public partial class Day2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hl1.NavigateUrl = "https://darshanums.in/Login.aspx";
            hl1.ToolTip = "Darshan University";
            imgDU1.ImageUrl = "~/Images/DU1.jpg";
            if (!IsPostBack) // Ensure this runs only on the initial page load
            {
                DIETdeptlist.Visible = false;
                DIETDSdeptlist.Visible = false;
            }
            //if (rbDIETcomp.Checked == true)
            //    Response.Redirect("https://www.darshan.ac.in/program/btech-computer");
        }

        protected void btnSelectCourse_Click(object sender, EventArgs e)
        {
            if (rbDIET.Checked == true)
            {
                DIETdeptlist.Visible = true;
                DIETDSdeptlist.Visible = false;
            }
            else if (rbDIETDS.Checked)
            {
                DIETDSdeptlist.Visible = true;
                DIETdeptlist.Visible = false;
            }
            else
                lblMessage.Text = "Kindly Select one of them";
        }
    }
}