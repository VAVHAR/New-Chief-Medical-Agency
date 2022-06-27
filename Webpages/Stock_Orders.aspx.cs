using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_Chief_Medical_Agency.Webpages
{
    public partial class Stock_Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buttonlogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Webpages/Login.aspx");
        }

        protected void btnusers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Webpages/Stock_Product.aspx");
        }

        protected void btnstocks_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Webpages/Stock_Stock.aspx");
        }

        protected void btnorders_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Webpages/Stock_Orders.aspx");
        }
    }
}