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
           string query = "SELECT * FROM User_tbl WHERE UserId='" + TxtuserId.Text +"' AND Password = '" + TxtPassword.Text +"' AND UserRole = '" +radiouserrole.SelectedValue +"'";
           SqlCommand cmd = new SqlCommand(query, cn);
            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if(dr[4].ToString().Equals("Admin"))
                    {
                        Response.Redirect("~/Webpages/Admin_Home.aspx");
                    }
                    else if(dr[4].ToString().Equals("Stock Manager"))
                    {
                        Response.Redirect("~/Webpages/Stock_Product.aspx");
                    }
                    else if(dr[4].ToString().Equals("Order Clerk"))
                    {
                        Response.Redirect("~/Webpages/OrderClerkHomePage.aspx");
                    }

                }
                else
                {
                    RequiredFieldValidator1.ErrorMessage = "UserId & Password Is not correct Try again..!!" ;
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