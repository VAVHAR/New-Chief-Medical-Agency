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
    public partial class Admin_Home : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
                       
        }

        protected void btnstocks_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Webpages/Admin_Stock.aspx");
        }

        protected void btnorders_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Webpages/Admin_Order.aspx");
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source =.; Initial Catalog = NCMA; Integrated Security = True";
            SqlConnection connection = new SqlConnection(@connectionString);
            string query = "INSERT INTO User_tbl (FirstName,LastName,EmailId,MobileNo,UserRole,UserId,Password) VALUES('" + Txtfirstname.Text + "','" + TxtLastName.Text + "' ,'" + TxtEmail.Text + "','" + TxtPno.Text + "','" + RadioButtonList1.SelectedValue + "','" + TxtUsername.Text + "','" + Txtpswd.Text + "');" + "INSERT INTO Login (UserId,Password,UserRole) VALUES ('" + TxtUsername.Text + "' , '" + Txtpswd.Text + "' , '" + RadioButtonList1.SelectedValue + "')";
            SqlCommand command = new SqlCommand(query, connection);
            try
            {
                connection.Open();
                command.ExecuteNonQuery();
                Console.WriteLine("Records Inserted Successfully");
            }
            catch (SqlException s)
            {
                Console.WriteLine("Error Generated. Details: " + s.ToString());
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
