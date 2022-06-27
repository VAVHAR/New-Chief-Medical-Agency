using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace New_Chief_Medical_Agency.Webpages
{
    public partial class Admin_Home : System.Web.UI.Page
    {
        SqlConnection cn;

        protected void Page_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection("Data Source =.; Initial Catalog = NCMA; Integrated Security = True");
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

            string query = "INSERT INTO User_tbl (FirstName,LastName,EmailId,MobileNo,UserRole,UserId,Password) VALUES('" + Txtfirstname.Text + "','" + TxtLastName.Text + "' ,'" + TxtEmail.Text + "','" + TxtPno.Text + "','" + RadioButtonList1.SelectedValue + "','" + TxtUsername.Text + "','" + Txtpswd.Text + "');" + "INSERT INTO Login (UserId,Password,UserRole) VALUES ('" + TxtUsername.Text + "' , '" + Txtpswd.Text + "' , '" + RadioButtonList1.SelectedValue + "')";
            SqlCommand command = new SqlCommand(query, cn);
            try
            {
                cn.Open();
                command.ExecuteNonQuery();
                MessageBox.Show("Records Inserted Successfully");
                Response.Redirect("~/Webpages/Admin_Home.aspx");
            }
            catch (SqlException s)
            {
                MessageBox.Show("Something wents wrong");
            }
            finally
            {
                cn.Close();
            }
        }
        private void BindGrid()
        {
            cn.Open();
            string query = "select * from User_tbl where UserId like '" + txtsearch.Text + "%'";
            SqlDataAdapter da = new SqlDataAdapter(query, cn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            gridusers.DataSource = ds;
            if (ds.Tables[0].Rows.Count == 0)
            {

                gridusers.DataBind();
                MessageBox.Show("No records found");


            }
            else
            {
                gridusers.DataSourceID = null;
                gridusers.DataSource = ds.Tables[0];
                gridusers.DataBind();
                txtsearch.Text = "";
            }
        }
        protected void buttonlogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Webpages/Login.aspx");
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            BindGrid();


        }
    }
}
