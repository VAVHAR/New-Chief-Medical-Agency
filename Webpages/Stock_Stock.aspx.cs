using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace New_Chief_Medical_Agency.Webpages
{
    public partial class Stock_Stock : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection("Data Source =.; Initial Catalog = NCMA; Integrated Security = True");
        }

        private void BindGrid()
        {
            cn.Open();
            string query = "select * from Product_tbl where ProductId like '" + txtsearch.Text + "%'";
            SqlDataAdapter da = new SqlDataAdapter(query, cn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridStocks.DataSource = ds;
            if (ds.Tables[0].Rows.Count == 0)
            {

                GridStocks.DataBind();
                MessageBox.Show("No records found");


            }
            else
            {
                GridStocks.DataSourceID = null;
                GridStocks.DataSource = ds.Tables[0];
                GridStocks.DataBind();
                txtsearch.Text = "";
            }
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            BindGrid();
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