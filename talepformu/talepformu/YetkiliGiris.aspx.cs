using System;
using System.Data.SqlClient;
using System.Configuration;

namespace talepformu
{
    public partial class YetkiliGiris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMesaj.Text = "";
        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            string kullanici = txtKullanici.Text.Trim();
            string sifre = txtSifre.Text.Trim();

            if (string.IsNullOrEmpty(kullanici) || string.IsNullOrEmpty(sifre))
            {
                lblMesaj.Text = "Kullanıcı adı ve şifre boş olamaz.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["Baglanti"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = @"SELECT COUNT(*) FROM Tbl_GeciciYetkili 
                               WHERE KullaniciAdi = @kullanici 
                               AND Sifre = @sifre 
                               AND GecerlilikTarihi >= @bugun";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@kullanici", kullanici);
                cmd.Parameters.AddWithValue("@sifre", sifre);
                cmd.Parameters.AddWithValue("@bugun", DateTime.Now);

                conn.Open();
                int count = (int)cmd.ExecuteScalar();

                if (count > 0)
                {
                    
                    Response.Redirect("talep.aspx");
                }
                else
                {
                    lblMesaj.Text = "Kullanıcı adı veya şifre yanlış ya da yetkilendirme süresi dolmuş.";
                }
            }
        }
    }
}
