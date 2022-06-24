using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace New_Chief_Medical_Agency.Webpages
{
    
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection("Data Source =.; Initial Catalog = NCMA; Integrated Security = True");
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
           string query = "SELECT * FROM Login WHERE UserId='" + TxtuserId.Text +"' AND Password = '" + TxtPassword.Text +"' AND UserRole = '" +radiouserrole.SelectedValue +"'";
           SqlCommand cmd = new SqlCommand(query, cn);
            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if(dr[2].ToString().Equals("Admin"))
                    {
                        Response.Redirect("~/Webpages/Admin_Home.aspx");
                    }
                    else if(dr[2].ToString().Equals("Stock Manager"))
                    {
                        Response.Redirect("~/Webpages/StockManagerHomePage.aspx");
                    }
                    else if(dr[2].ToString().Equals("Order Clerk"))
                    {
                        Response.Redirect("~/Webpages/OrderClerkHomePage.aspx");
                    }

                }
            }catch (Exception s)
            {
                Console.WriteLine("Please select valid User Role");
            }
            finally
            {
                cn.Close();
            }
        }
    }
}