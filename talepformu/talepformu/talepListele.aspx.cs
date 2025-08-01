using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace talepformu
{
    public partial class talepListele : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["Baglanti"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KisiDropDownDoldur();
                VerileriGetir(); 

                txtSap.Attributes["list"] = "saplar";
            }
        }

        private void KisiDropDownDoldur()
        {
            ddlKisi.Items.Clear();
            ddlKisi.Items.Add("Tüm Kişiler");

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string sql = "SELECT DISTINCT IstekYapan FROM Tbl_Talepler WHERE IstekYapan IS NOT NULL ORDER BY IstekYapan";
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    string kisi = dr["IstekYapan"].ToString();
                    ddlKisi.Items.Add(kisi);
                }

                dr.Close();
            }
        }

        private void VerileriGetir(string sapNo = null, string kisi = null)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
               
                string sql = "SELECT Id, Malzeme, KgAdet AS [Kg/Adet], KullanimYeri, IstekYapan, Bolum, SapNumarasi, BolumMuduru, Tarih FROM Tbl_Talepler WHERE 1=1";
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                if (!string.IsNullOrWhiteSpace(sapNo))
                {
                    sql += " AND SapNumarasi = @sap";
                    cmd.Parameters.AddWithValue("@sap", sapNo);
                }

                if (!string.IsNullOrWhiteSpace(kisi) && kisi != "Tüm Kişiler")
                {
                    sql += " AND IstekYapan = @kisi";
                    cmd.Parameters.AddWithValue("@kisi", kisi);
                }

                sql += " ORDER BY Id DESC";
                cmd.CommandText = sql;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gridTalepler.DataSource = dt;
                gridTalepler.DataBind();
            }
        }

        protected void btnGeri_Click(object sender, EventArgs e)
        {
            Response.Redirect("talep.aspx");
        }

        protected void btnFiltrele_Click(object sender, EventArgs e)
        {
            string sap = string.IsNullOrWhiteSpace(txtSap.Text) ? null : txtSap.Text.Trim();
            string kisi = ddlKisi.SelectedValue;

            VerileriGetir(sap, kisi);
        }

        protected void btnSecilenleriSil_Click(object sender, EventArgs e)
        {
            var idList = new System.Collections.Generic.List<int>();

            foreach (GridViewRow row in gridTalepler.Rows)
            {
                CheckBox chk = (CheckBox)row.FindControl("chkSelect");
                if (chk != null && chk.Checked)
                {
                    int id = Convert.ToInt32(gridTalepler.DataKeys[row.RowIndex].Value);
                    idList.Add(id);
                }
            }

            if (idList.Count > 0)
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    foreach (var id in idList)
                    {
                        string sql = "DELETE FROM Tbl_Talepler WHERE Id = @Id";
                        using (SqlCommand cmd = new SqlCommand(sql, conn))
                        {
                            cmd.Parameters.AddWithValue("@Id", id);
                            cmd.ExecuteNonQuery();
                        }
                    }
                }

                VerileriGetir(txtSap.Text.Trim(), ddlKisi.SelectedValue);
            }
        }

       
        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkAll = (CheckBox)sender;

            foreach (GridViewRow row in gridTalepler.Rows)
            {
                CheckBox chk = (CheckBox)row.FindControl("chkSelect");
                if (chk != null)
                    chk.Checked = chkAll.Checked;
            }
        }

    }
}
