using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3.ServerComponentsDemo
{
    public partial class CheckBoxControlDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDisplay_Click(object sender, EventArgs e)
        {
            if (chkCricket.Checked)
                lblMessage.Text += "Cricket, ";
            if (chkDrawing.Checked)
                lblMessage.Text += "Drawing, ";
            if (chkReading.Checked)
                lblMessage.Text += "Reading, ";
        }

        protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            if (chkSelectAll.Checked)
            {
                chkCricket.Checked = true;
                chkDrawing.Checked = true;
                chkReading.Checked = true;
            }
            else
            {
                chkCricket.Checked = false;
                chkDrawing.Checked = false;
                chkReading.Checked = false;
            }
        }
    }
}