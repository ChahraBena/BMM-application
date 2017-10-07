using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page lastpage = (Page)Context.Handler;
        Label1.Text= ((TextBox)lastpage.FindControl("TextBoxUser")).Text;
    }
}