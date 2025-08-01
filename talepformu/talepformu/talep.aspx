<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="talep.aspx.cs" Inherits="talepformu.talep" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Satın Alma Talep Formu</title>
    <style>
        
        html, body { margin:0; padding:0; height:100%; overflow:hidden; font-family:'Segoe UI', sans-serif; font-size:11px; background-color:#f2f4f8; }
        .header { background:linear-gradient(to right, #E0E0E0); color:black; padding:8px; font-size:16px; font-weight:bold; text-align:center; }
        .main { padding:10px; display:flex; flex-direction:column; height:calc(100vh - 40px); box-sizing:border-box; }
        table { width:100%; border-collapse:separate; border-spacing:0 3px; table-layout:fixed; flex:1; }
        th, td { text-align:center; padding:4px; }
        th { background-color:#E0E0E0; color:black; font-weight:600; border-radius:3px; }
        td { background-color:white; border-radius:3px; }
        input[type="text"], input[type="date"] { width:100%; box-sizing:border-box; padding:3px 4px; font-size:10px; border:1px solid #ccc; border-radius:3px; }
        .footer { margin-top:8px; display:flex; gap:8px; }
        .footer > div { flex:1; }
        .button-bar { margin-top:6px; }
        .button-bar asp\:Button { padding:6px 12px; background-color:#E0E0E0; color:black; border:none; border-radius:4px; font-weight:bold; font-size:11px; cursor:pointer; }
        .info-label { font-size:10px; color:#666; margin-top:4px; }
        .button-bar {
        display: flex;
        gap: 20px;
        border-radius:7px;
        margin-top: 20px;
    }

    .button-bar input[type="submit"] {
        padding: 20px 40px;
        font-size: 18px; 
        border-radius: 8px;
        background-color: #666;
        color: black;
        border: none;
        cursor: pointer;
        min-width: 200px; 
        text-align: center;
        box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.2);
        transition: background-color 0.3s ease;
    }

    .button-bar input[type="submit"]:hover {
        background-color: #ff0000;
    }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">Satın Alma Talep Formu</div>
        <div class="main">
            <div style="border: 2px solid #404040; border-radius: 8px; padding: 10px; background-color: #fff; max-width: 75%; overflow-x: auto; box-shadow: 0 6px 14px rgba(0,0,0,0.2); font-weight: 500;">

            <table>
                <thead>
                    <tr>
                        <th style="width:4%;">#</th>
                        <th style="width:28%;">Malzeme Kısa Metni</th>
                        <th style="width:15%;">Kg/Adet</th>
                        <th style="width:53%;">Açıklama</th>
                    </tr>
                </thead>
<tbody>
    <tr>
        <td>1</td>
        <td><asp:TextBox ID="txtMalzeme1" runat="server" /></td>
        <td><asp:TextBox ID="txtKgAdet1" runat="server" /></td>
        <td><asp:TextBox ID="txtKullanim1" runat="server" /></td>
    </tr>
    <tr>
        <td>2</td>
        <td><asp:TextBox ID="txtMalzeme2" runat="server" /></td>
        <td><asp:TextBox ID="txtKgAdet2" runat="server" /></td>
        <td><asp:TextBox ID="txtKullanim2" runat="server" /></td>
    </tr>
    <tr>
        <td>3</td>
        <td><asp:TextBox ID="txtMalzeme3" runat="server" /></td>
        <td><asp:TextBox ID="txtKgAdet3" runat="server" /></td>
        <td><asp:TextBox ID="txtKullanim3" runat="server" /></td>
    </tr>
    <tr>
        <td>4</td>
        <td><asp:TextBox ID="txtMalzeme4" runat="server" /></td>
        <td><asp:TextBox ID="txtKgAdet4" runat="server" /></td>
        <td><asp:TextBox ID="txtKullanim4" runat="server" /></td>
    </tr>
    <tr>
        <td>5</td>
        <td><asp:TextBox ID="txtMalzeme5" runat="server" /></td>
        <td><asp:TextBox ID="txtKgAdet5" runat="server" /></td>
        <td><asp:TextBox ID="txtKullanim5" runat="server" /></td>
    </tr>
    <tr>
        <td>6</td>
        <td><asp:TextBox ID="txtMalzeme6" runat="server" /></td>
        <td><asp:TextBox ID="txtKgAdet6" runat="server" /></td>
        <td><asp:TextBox ID="txtKullanim6" runat="server" /></td>
    </tr>
    <tr>
        <td>7</td>
        <td><asp:TextBox ID="txtMalzeme7" runat="server" /></td>
        <td><asp:TextBox ID="txtKgAdet7" runat="server" /></td>
        <td><asp:TextBox ID="txtKullanim7" runat="server" /></td>
    </tr>
    <tr>
        <td>8</td>
        <td><asp:TextBox ID="txtMalzeme8" runat="server" /></td>
        <td><asp:TextBox ID="txtKgAdet8" runat="server" /></td>
        <td><asp:TextBox ID="txtKullanim8" runat="server" /></td>
    </tr>
    <tr>
        <td>9</td>
        <td><asp:TextBox ID="txtMalzeme9" runat="server" /></td>
        <td><asp:TextBox ID="txtKgAdet9" runat="server" /></td>
        <td><asp:TextBox ID="txtKullanim9" runat="server" /></td>
    </tr>
    <tr>
        <td>10</td>
        <td><asp:TextBox ID="txtMalzeme10" runat="server" /></td>
        <td><asp:TextBox ID="txtKgAdet10" runat="server" /></td>
        <td><asp:TextBox ID="txtKullanim10" runat="server" /></td>
    </tr>
    <tr>
        <td>11</td>
        <td><asp:TextBox ID="txtMalzeme11" runat="server" /></td>
        <td><asp:TextBox ID="txtKgAdet11" runat="server" /></td>
        <td><asp:TextBox ID="txtKullanim11" runat="server" /></td>
    </tr>
    <tr>
        <td>12</td>
        <td><asp:TextBox ID="txtMalzeme12" runat="server" /></td>
        <td><asp:TextBox ID="txtKgAdet12" runat="server" /></td>
        <td><asp:TextBox ID="txtKullanim12" runat="server" /></td>
    </tr>
    <tr>
        <td>13</td>
        <td><asp:TextBox ID="txtMalzeme13" runat="server" /></td>
        <td><asp:TextBox ID="txtKgAdet13" runat="server" /></td>
        <td><asp:TextBox ID="txtKullanim13" runat="server" /></td>
    </tr>
    <tr>
        <td>14</td>
        <td><asp:TextBox ID="txtMalzeme14" runat="server" /></td>
        <td><asp:TextBox ID="txtKgAdet14" runat="server" /></td>
        <td><asp:TextBox ID="txtKullanim14" runat="server" /></td>
    </tr>
    <tr>
        <td>15</td>
        <td><asp:TextBox ID="txtMalzeme15" runat="server" /></td>
        <td><asp:TextBox ID="txtKgAdet15" runat="server" /></td>
        <td><asp:TextBox ID="txtKullanim15" runat="server" /></td>
    </tr>

</tbody>

            </table>
                </div>
<div style="position:absolute; top:50px; right:15px; width:220px;">
    <div style="margin-bottom:8px; font-size:20px; ">
        <label>İstek Yapan</label><br />
        <asp:TextBox ID="txtIstekYapan" runat="server" Width="100%" Style="height: 33px;"  />
    </div>
    <div style="margin-bottom:8px; font-size:20px;">
        <label>Bölüm</label><br />
        <asp:TextBox ID="txtBolum" runat="server" Width="100%" Style="height: 33px;"  />
    </div>
    <div style="margin-bottom:8px; font-size:20px;">
        <label>SAP No</label><br />
        <asp:TextBox ID="txtSapNumarasi" runat="server" Width="100%" Style="height: 33px;"  />
    </div>
    <div style="margin-bottom:8px; font-size:20px;">
        <label>Bölüm Müdürü</label><br />
        <asp:TextBox ID="txtBolumMuduru" runat="server" Width="100%" Style="height: 33px;"  />
    </div>
    <div style="margin-bottom:8px; font-size:20px;">
        <label>Tarih</label><br />
        <asp:TextBox ID="txtTarih" runat="server" TextMode="Date" Width="100%" 
    Style="height: 33px;" />

    </div>

    <div class="button-bar">
    <div style="margin-top:20px;">
        <asp:Button ID="btnTopluEkle" runat="server" Text="Kaydet" OnClick="btnTopluEkle_Click" Width="100%" 
            Style="height: 45px; font-weight:bold; font-size:15px; margin-bottom:10px; border-radius:9px; background-color:lightgray; border: 2px solid #404040" />
        <asp:Button ID="btnListeyiGoster" runat="server" Text="Listeyi Görüntüle" OnClick="btnListeyiGoster_Click" Width="100%" 
            Style="height: 45px; font-weight:bold; font-size:15px; border-radius:9px; background-color:lightgray; border: 2px solid #404040" />
    </div>
    </div>
</div>


            <asp:Label ID="lblBugun" runat="server" CssClass="info-label" />
            <asp:Label ID="lblHata" runat="server" ForeColor="Red" />
        </div>
    </form>
</body>
</html>
