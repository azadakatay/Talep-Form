<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminGiris.aspx.cs" Inherits="talepformu.AdminGiris" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Giriş</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 420px;
            margin: 80px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        label {
            margin-top: 15px;
            display: block;
            font-weight: 600;
            color: #333;
        }

        input[type=text],
        input[type=password],
        input[type=number],
        .aspNet-Textbox {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .btn,
        input[type=submit],
        .aspNet-Button {
            width: 100%;
            padding: 11px;
            background-color: #0078D4;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 8px;
        }

        .btn:hover {
            background-color: #005ea6;
        }

        .message {
            color: red;
            text-align: center;
            font-weight: 600;
            margin-bottom: 15px;
        }

        #pnlYetkilendirme {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Admin Giriş</h2>

            <asp:Label ID="lblMesaj" runat="server" CssClass="message" />

            <label for="txtAdminKullanici">Kullanıcı Adı</label>
            <asp:TextBox ID="txtAdminKullanici" runat="server" />

            <label for="txtAdminSifre">Şifre</label>
            <asp:TextBox ID="txtAdminSifre" runat="server" TextMode="Password" />

            <asp:Button ID="btnGiris" runat="server" Text="Giriş Yap" CssClass="btn" OnClick="btnGiris_Click" />

            <asp:Button ID="btnYetkilendirmeAc" runat="server" Text="Yetkilendirme Panelini Aç" CssClass="btn" OnClick="btnYetkilendirmeAc_Click" />

            <asp:Panel ID="pnlYetkilendirme" runat="server" Visible="false">

                <label for="txtGeciciKullanici">Geçici Kullanıcı Adı</label>
                <asp:TextBox ID="txtGeciciKullanici" runat="server" />

                <label for="txtGeciciSifre">Geçici Şifre</label>
                <asp:TextBox ID="txtGeciciSifre" runat="server" TextMode="Password" />

                <label for="txtGecerlilik">Geçerlilik Süresi (Gün)</label>
                <asp:TextBox ID="txtGecerlilik" runat="server" TextMode="Number" />
                <script>
                 
                 window.onload = function () {
                 var txt = document.getElementById('<%= txtGecerlilik.ClientID %>');
                 if (txt) {
                 txt.setAttribute("min", "1");
                  }
                 };
                </script>

                <asp:Button ID="btnYetkilendir" runat="server" Text="Yetkilendir" CssClass="btn" OnClick="btnYetkilendir_Click" />
            </asp:Panel>

            <asp:Button ID="btnYetkiliGirisiSayfasinaGit" runat="server" Text="Yetkili Girişi Sayfasına Git" CssClass="btn" OnClick="btnYetkiliGirisiSayfasinaGit_Click" />
           <asp:Button ID="btnYetkiliListesineGit" runat="server" Text="Yetkili Listesi" OnClick="btnYetkiliListesineGit_Click" CssClass="btn" />


        </div>
    </form>
</body>
</html>
