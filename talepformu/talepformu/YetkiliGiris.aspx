<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YetkiliGiris.aspx.cs" Inherits="talepformu.YetkiliGiris" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yetkili Girişi</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 400px;
            margin: 100px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: 600;
            color: #444;
        }

        input[type=text],
        input[type=password] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            margin-bottom: 15px;
        }

        .btn {
            width: 100%;
            padding: 11px;
            background-color: #0078D4;
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #005ea6;
        }

        .msg {
            margin-top: 10px;
            font-weight: bold;
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Yetkili Girişi</h2>

            <asp:Label ID="lblMesaj" runat="server" CssClass="msg" />

            <label for="txtKullanici">Kullanıcı Adı</label>
            <asp:TextBox ID="txtKullanici" runat="server" />

            <label for="txtSifre">Şifre</label>
            <asp:TextBox ID="txtSifre" runat="server" TextMode="Password" />

            <asp:Button ID="btnGiris" runat="server" Text="Giriş Yap" CssClass="btn" OnClick="btnGiris_Click" />
        </div>
    </form>
</body>
</html>
