using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Day2.ListControlDemo
{
    public partial class DropDownListDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //ddlCountry.Items.Add("India");

                //ListItem liIndia = new ListItem();
                //liIndia.Text = "India";
                //liIndia.Value = "91";

                //ddlCountry.Items.Add(liIndia);
                //ddlCountry.Items.Add(new ListItem("China", "92"));
            }

        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Day2.aspx");
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            //lblCountry.Text=ddlCountry.SelectedValue+ddlCountry.SelectedItem.Text;
            //lblCountry.Text = ddlCountry.SelectedValue.Trim() +"--"+ ddlCountry.SelectedItem.Text.Trim()+ "--"+ddlCountry.SelectedIndex.ToString().Trim();


            foreach (ListItem li in ddlCountry.Items)
            {
                if (li.Selected == true)
                {
                    lblCountry.Text += "<strong>" + li.Value.Trim() + "-->" +
                                   li.Text.Trim() + "</strong><br/>";
                }
                else
                {
                    lblCountry.Text = li.Value.Trim() + "-->" +
                                        li.Text.Trim() + "<br/>";
                }
            }
        }

        protected void btndishobbies_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in lstbCountries1.Items)
            {
                if (li.Selected == true)
                {
                    lblhobbies.Text += "<strong>" + li.Value.Trim() + "-->" +
                                   li.Text.Trim() + "</strong><br/>";
                }
                else
                {
                    lblhobbies.Text += li.Value.Trim() + "-->" +
                                        li.Text.Trim() + "<br/>";
                }
            }
        }

        protected void btnmoveandclearright_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in lstbCountries1.Items)
            {
               lstbCountries2.Items.Add(li);
            }
               lstbCountries1.Items.Clear();
        }

        protected void btnmoveright_Click(object sender, EventArgs e)
        {
            lstbCountries2.Items.Add(new ListItem(lstbCountries1.SelectedItem.Text.Trim().ToString(), lstbCountries1.SelectedItem.Value.Trim().ToString()));
            lstbCountries1.Items.Remove(lstbCountries1.SelectedItem);
        }

        protected void btnmoveleft_Click(object sender, EventArgs e)
        {
            lstbCountries1.Items.Add(new ListItem(lstbCountries1.SelectedItem.Text.Trim().ToString(), lstbCountries1.SelectedItem.Value.Trim().ToString()));
            lstbCountries2.Items.Remove(lstbCountries1.SelectedItem);
        }

        protected void btnmoveandclearleft_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in lstbCountries2.Items)
            {
                lstbCountries1.Items.Add(li);
            }
                lstbCountries2.Items.Clear();
        }
    }
}