<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YetkiliListesi.aspx.cs" Inherits="talepformu.YetkiliListesi" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yetkili Listesi</title>
    <style>
        body {
            font-family: Arial;
            background: #f0f0f0;
            padding: 30px;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
        }

        h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #ccc;
            text-align: left;
        }

        th {
            background-color: #1976d2;
            color: white;
        }

        .expired {
            background-color: #ffe6e6 !important;
        }

        .btn {
            background: #1976d2;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            margin-right: 10px;
        }

        .btn:hover {
            background: #125ea8;
        }

        .btn-danger {
            background-color: #e53935;
        }

        .btn-danger:hover {
            background-color: #c62828;
        }

        .button-group {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Geçici Yetkili Listesi</h2>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="KullaniciAdi" HeaderText="Kullanıcı Adı" />
                    <asp:BoundField DataField="GecerlilikTarihi" HeaderText="Geçerlilik Tarihi" DataFormatString="{0:dd.MM.yyyy}" />
                    <asp:TemplateField HeaderText="Durum">
                        <ItemTemplate>
                            <%# DateTime.Now > (DateTime)Eval("GecerlilikTarihi") ? "SÜRESİ DOLMUŞ" : "AKTİF" %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="button-group">
                <asp:Button ID="btnSilSuresiDolmuslari" runat="server" Text="Süresi Dolanları Sil" CssClass="btn btn-danger" OnClick="btnSilSuresiDolmuslari_Click" />
                <asp:Button ID="btnAdminGiris" runat="server" Text="Admin Giriş Sayfasına Dön" CssClass="btn" OnClick="btnAdminGiris_Click" />
            </div>
        </div>
    </form>
</body>
</html>
