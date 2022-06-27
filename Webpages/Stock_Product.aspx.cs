using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_Chief_Medical_Agency.Webpages
{
    public partial class Stock_Product : System.Web.UI.Page
    {
        string connStr;
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            connStr = ConfigurationManager.ConnectionStrings["NCMAConnectionString"].ConnectionString;
            cn = new SqlConnection(connStr);
        }

        protected void btnsaveproduct_Click(object sender, EventArgs e)
        {

        }

        protected void btnsaveproduct_Click1(object sender, EventArgs e)
        {
            string query = "INSERT INTO Product_tbl (ProductId,ProductName,ProductPrice,ProductType,SupplierName,ProductQuantity) VALUES ('" +Txtproid.Text+"'," +
                "'" +Txtproname.Text +"'," +
                "'" +Txtproprice.Text +"'," +
                "'" +Txtprotype.Text +"'," +
                "'" +Txtprosup.Text +"'," +
                "'" +Txtproquan.Text+"')";
            SqlCommand cmd = new SqlCommand(query,cn);
            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
                Console.WriteLine("Records Inserted Successfully");
            }
            catch (SqlException s)
            {
                Console.WriteLine("Error Generated. Details: " + s.ToString());
            }
            finally
            {
                cn.Close();
            }
        }

        protected void buttonlogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Webpages/Login.aspx");
        }

        protected void btnproduct_Click(object sender, EventArgs e)
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