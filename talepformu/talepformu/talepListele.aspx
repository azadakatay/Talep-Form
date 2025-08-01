<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="talepListele.aspx.cs" Inherits="talepformu.talepListele" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tüm Talep Listesi</title>
    <style>
        
        html, body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            font-size: 12px;
            background-color: #f5f6fa;
        }

        .container {
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #444;
        }

        .filter-bar {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .filter-bar label {
            font-weight: bold;
        }

        .filter-bar input,
        .filter-bar select {
            padding: 6px 10px;
            font-size: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .filter-bar asp\:Button {
            padding: 6px 12px;
            background-color: #E0E0E0;
            color: black;
            border: none;
            border-radius: 4px;
            font-size: 12px;
            cursor: pointer;
        }

        asp\:GridView {
            width: 100%;
            border-collapse: collapse;
        }

        .grid th {
            background-color: #E0E0E0;
            color: black;
            padding: 8px;
            text-align: left;
        }

        .grid td {
            background-color: white;
            padding: 8px;
            border: 1px solid #ddd;
        }

        .grid tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .grid tr:hover {
            background-color: #f1f1f1;
        }

        .back-button {
            background-color: #ff7e5f;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
        }

        .back-button:hover {
            background-color: #e86650;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Tüm Talep Listesi</h2>

            <div class="filter-bar">
                <asp:Button ID="btnGeri" runat="server" Text="← Geri" CssClass="back-button" OnClick="btnGeri_Click" />
                <label for="txtSap">SAP No:</label>
                <asp:TextBox ID="txtSap" runat="server" />
                <input list="saplar" id="txtSapList" runat="server" style="display:none;" />

                <datalist id="saplar">
                    <% 
                    string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["Baglanti"].ConnectionString;
                    using (var conn = new System.Data.SqlClient.SqlConnection(connStr))
                    {
                        conn.Open();
                        var cmd = new System.Data.SqlClient.SqlCommand("SELECT DISTINCT SapNumarasi FROM Tbl_Talepler WHERE SapNumarasi IS NOT NULL", conn);
                        var dr = cmd.ExecuteReader();
                        while(dr.Read())
                        {
                            string sap = dr["SapNumarasi"].ToString();
                    %>
                        <option value="<%= sap %>"></option>
                    <% 
                        }
                        dr.Close();
                    }
                    %>
                </datalist>

                <label for="ddlKisi">İstek Yapan:</label>
                <asp:DropDownList ID="ddlKisi" runat="server" />
                <asp:Button ID="btnFiltrele" runat="server" Text="Filtrele" OnClick="btnFiltrele_Click" />
            </div>

            <asp:GridView ID="gridTalepler" runat="server" AutoGenerateColumns="false" DataKeyNames="Id" CssClass="grid">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Id" HeaderText="ID" Visible="false" />
                    <asp:BoundField DataField="Malzeme" HeaderText="Malzeme Kısa Metni" />
                    <asp:BoundField DataField="Kg/Adet" HeaderText="Kg/Adet" />
                    <asp:BoundField DataField="KullanimYeri" HeaderText="Açıklama" />
                    <asp:BoundField DataField="IstekYapan" HeaderText="İstek Yapan" />
                    <asp:BoundField DataField="Bolum" HeaderText="Bölüm" />
                    <asp:BoundField DataField="SapNumarasi" HeaderText="SAP No" />
                    <asp:BoundField DataField="BolumMuduru" HeaderText="Bölüm Müdürü" />
                    <asp:BoundField DataField="Tarih" HeaderText="Tarih" DataFormatString="{0:yyyy-MM-dd}" />
                </Columns>
            </asp:GridView>

            <asp:Button ID="btnSecilenleriSil" runat="server" Text="Seçilenleri Sil" OnClick="btnSecilenleriSil_Click" CssClass="back-button" Style="margin-top:10px;" />

        </div>
    </form>
</body>
</html>
