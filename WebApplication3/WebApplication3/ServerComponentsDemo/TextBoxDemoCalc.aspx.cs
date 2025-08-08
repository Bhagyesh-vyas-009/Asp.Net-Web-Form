using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3.ServerComponentsDemo
{
    public partial class TextBoxDemoCalc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            lblAnwer.Text = Convert.ToString(Convert.ToInt32(txtNo1.Text) + Convert.ToInt32(txtNo2.Text));
        }
    }
}