using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;
using iTextSharp.tool.xml;

namespace New_Chief_Medical_Agency.Webpages
{
    public partial class Admin_Stock : System.Web.UI.Page
    {
        SqlConnection cn;
        protected void Page_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection("Data Source =.; Initial Catalog = NCMA; Integrated Security = True");
        }

        private void BindGrid()
        {
            cn.Open();
            string query = "select * from Stock_tbl where ProductId like '" + txtsearch.Text + "%'";
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
            Response.Redirect("~/Webpages/Admin_Home.aspx");
        }

        protected void btnstocks_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Webpages/Admin_Stock.aspx");
        }

        protected void btnorders_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Webpages/Admin_Order.aspx");
        }

        protected void btngenstockrepo_Click(object sender, EventArgs e)
        {
            GetPdf();
        }

        
        public void GetPdf()
        {

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    GridStocks.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=Stock_Report.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }

        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}