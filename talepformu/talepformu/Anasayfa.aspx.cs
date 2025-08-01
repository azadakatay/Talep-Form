using System;

namespace talepformu
{
    public partial class Anasayfa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminGiris.aspx");
        }

        protected void btnYetkili_Click(object sender, EventArgs e)
        {
            Response.Redirect("YetkiliGiris.aspx");
        }
    }
}
