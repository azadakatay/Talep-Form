using System;
using System.Data.SqlClient;
using System.Configuration;

namespace talepformu
{
    public partial class AdminGiris : System.Web.UI.Page
    {
        // Sabit admin kullanıcı adı ve şifresi
        private readonly string AdminKullaniciAdi = "admin";
        private readonly string AdminSifre = "123456";

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMesaj.Text = "";
        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            string kullanici = txtAdminKullanici.Text.Trim();
            string sifre = txtAdminSifre.Text.Trim();

            if (kullanici == AdminKullaniciAdi && sifre == AdminSifre)
            {
                
                Response.Redirect("talep.aspx");
            }
            else
            {
                lblMesaj.Text = "Hatalı admin kullanıcı adı veya şifre!";
            }
        }

        protected void btnYetkilendirmeAc_Click(object sender, EventArgs e)
        {
            string kullanici = txtAdminKullanici.Text.Trim();
            string sifre = txtAdminSifre.Text.Trim();

            if (kullanici == AdminKullaniciAdi && sifre == AdminSifre)
            {
                pnlYetkilendirme.Visible = true;
                lblMesaj.Text = "";
            }
            else
            {
                pnlYetkilendirme.Visible = false;
                lblMesaj.Text = "Yetkilendirme panelini açmak için geçerli admin kullanıcı adı ve şifresi gereklidir!";
            }
        }

        protected void btnYetkilendir_Click(object sender, EventArgs e)
        {
            string geciciKullanici = txtGeciciKullanici.Text.Trim();
            string geciciSifre = txtGeciciSifre.Text.Trim();
            string gecerlilikGunStr = txtGecerlilik.Text.Trim();

            if (string.IsNullOrEmpty(geciciKullanici) || string.IsNullOrEmpty(geciciSifre) || string.IsNullOrEmpty(gecerlilikGunStr))
            {
                lblMesaj.Text = "Lütfen geçici kullanıcı adı, şifre ve geçerlilik süresini eksiksiz doldurun.";
                return;
            }

            if (!int.TryParse(gecerlilikGunStr, out int gecerlilikGun) || gecerlilikGun <= 0)
            {
                lblMesaj.Text = "Geçerlilik süresi geçerli pozitif bir sayı olmalıdır.";
                return;
            }

            DateTime gecerlilikTarihi = DateTime.Now.AddDays(gecerlilikGun);

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["Baglanti"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    string sql = "INSERT INTO Tbl_GeciciYetkili (KullaniciAdi, Sifre, GecerlilikTarihi) VALUES (@kullanici, @sifre, @tarih)";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@kullanici", geciciKullanici);
                    cmd.Parameters.AddWithValue("@sifre", geciciSifre);
                    cmd.Parameters.AddWithValue("@tarih", gecerlilikTarihi);

                    cmd.ExecuteNonQuery();
                }

                lblMesaj.Text = "Geçici yetkilendirme başarıyla oluşturuldu.";
         
                txtGeciciKullanici.Text = "";
                txtGeciciSifre.Text = "";
                txtGecerlilik.Text = "";
            }
            catch (Exception ex)
            {
                lblMesaj.Text = "Yetkilendirme sırasında hata oluştu: " + ex.Message;
            }
        }

        protected void btnYetkiliGirisiSayfasinaGit_Click(object sender, EventArgs e)
        {
            Response.Redirect("YetkiliGiris.aspx");
        }

        protected void btnYetkiliListesineGit_Click(object sender, EventArgs e)
        {
            string kullaniciAdi = txtAdminKullanici.Text.Trim();
            string sifre = txtAdminSifre.Text.Trim();

            if (kullaniciAdi == "admin" && sifre == "123456")
            {
                Response.Redirect("YetkiliListesi.aspx");
            }
            else
            {
                lblMesaj.Text = "Sadece admin kullanıcı bu sayfaya erişebilir.";
            }
        }
    }
}
