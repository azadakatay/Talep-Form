using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace talepformu
{
    public partial class talep : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["Baglanti"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtTarih.Text = DateTime.Now.ToString("yyyy-MM-dd");
                lblBugun.Text = "Bugün: " + DateTime.Now.ToString("dd MMMM yyyy");
            }
        }

        protected void btnTopluEkle_Click(object sender, EventArgs e)
        {
            lblHata.Text = "";
            int kayitSayisi = 0;

            string istekYapan = txtIstekYapan.Text.Trim();
            string sapNo = txtSapNumarasi.Text.Trim();
            string bolum = txtBolum.Text.Trim();
            string bolumMuduru = txtBolumMuduru.Text.Trim();
            DateTime tarih;

            if (!DateTime.TryParse(txtTarih.Text.Trim(), out tarih))
                tarih = DateTime.Now;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                for (int i = 1; i <= 12; i++)
                {
                    TextBox txtMalzeme = (TextBox)form1.FindControl("txtMalzeme" + i);
                    TextBox txtKgAdet = (TextBox)form1.FindControl("txtKgAdet" + i);
                    
                    TextBox txtKullanim = (TextBox)form1.FindControl("txtKullanim" + i);

                    if (txtMalzeme != null && !string.IsNullOrWhiteSpace(txtMalzeme.Text))
                    {
                        string malzeme = txtMalzeme.Text.Trim();
                        string kgAdet = txtKgAdet != null ? txtKgAdet.Text.Trim() : "";
                        string kullanimYeri = txtKullanim != null ? txtKullanim.Text.Trim() : "";

                        string sql = @"INSERT INTO Tbl_Talepler 
                               (Malzeme, KgAdet, KullanimYeri, IstekYapan, Bolum, SapNumarasi, BolumMuduru, Tarih)
                               VALUES 
                               (@Malzeme, @KgAdet, @KullanimYeri, @IstekYapan, @Bolum, @SapNumarasi, @BolumMuduru, @Tarih)";

                        using (SqlCommand cmd = new SqlCommand(sql, con))
                        {
                            cmd.Parameters.AddWithValue("@Malzeme", malzeme);
                            cmd.Parameters.AddWithValue("@KgAdet", kgAdet);
                            cmd.Parameters.AddWithValue("@KullanimYeri", kullanimYeri);
                            cmd.Parameters.AddWithValue("@IstekYapan", istekYapan);
                            cmd.Parameters.AddWithValue("@Bolum", bolum);
                            cmd.Parameters.AddWithValue("@SapNumarasi", sapNo);
                            cmd.Parameters.AddWithValue("@BolumMuduru", bolumMuduru);
                            cmd.Parameters.AddWithValue("@Tarih", tarih);

                            kayitSayisi += cmd.ExecuteNonQuery();
                        }
                    }
                }

                con.Close();
            }

            if (kayitSayisi > 0)
            {
                lblHata.ForeColor = System.Drawing.Color.Green;
                lblHata.Text = $"{kayitSayisi} kayıt başarıyla eklendi.";
            }
            else
            {
                lblHata.ForeColor = System.Drawing.Color.Red;
                lblHata.Text = "Lütfen en az bir malzeme giriniz.";
            }
        }


        protected void btnListeyiGoster_Click(object sender, EventArgs e)
        {
            Response.Redirect("talepListele.aspx");
        }
    }
}
