using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace talepformu
{
    public partial class YetkiliListesi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListeleYetkililer();
            }
        }

        private void ListeleYetkililer()
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Baglanti"].ConnectionString))
            {
                string query = @"
                    SELECT 
                        ID, 
                        KullaniciAdi, 
                        Sifre, 
                        GecerlilikTarihi
                    FROM Tbl_GeciciYetkili";

                using (SqlDataAdapter da = new SqlDataAdapter(query, conn))
                {
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DateTime gecerlilikTarihi = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "GecerlilikTarihi"));
                if (DateTime.Now > gecerlilikTarihi)
                {
                    e.Row.CssClass = "expired";
                }
            }
        }

        protected void btnSilSuresiDolmuslari_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Baglanti"].ConnectionString))
            {
                string query = @"DELETE FROM Tbl_GeciciYetkili
                                 WHERE GecerlilikTarihi < GETDATE()";

                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            ListeleYetkililer(); 
        }

        protected void btnAdminGiris_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminGiris.aspx");
        }
    }
}
