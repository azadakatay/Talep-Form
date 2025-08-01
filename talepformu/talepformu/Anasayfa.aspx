<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="talepformu.Anasayfa" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Anasayfa</title>
    <style>
        body {
            font-family: Arial;
            text-align: center;
            padding-top: 100px;
            background-color: #f0f2f5;
        }

        h2 {
            margin-bottom: 40px;
        }

        .button-container {
            display: inline-block;
        }

        .button-container input[type="submit"] {
            padding: 15px 30px;
            font-size: 18px;
            margin: 15px;
            cursor: pointer;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
        }

        .button-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Giriş Seçiniz</h2>
        <div class="button-container">
            <asp:Button ID="btnAdmin" runat="server" Text="Admin Girişi" OnClick="btnAdmin_Click" />
            <asp:Button ID="btnYetkili" runat="server" Text="Yetkili Girişi" OnClick="btnYetkili_Click" />
        </div>
    </form>
</body>
</html>
