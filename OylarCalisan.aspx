<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OylarCalisan.aspx.cs" Inherits="Pages_OylarCalisan" %>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Anket Sonuçları</title>
    <link rel="stylesheet" href="/Media/results.css">
    <link href="../Media/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

    <header>
        <h1>Anket Sonuçları</h1>
    </header>
      <form id="surveyForm" runat="server">
    <div class="container">
        <h2>Kesinleşen Toplantı:</h2>
         <asp:LinkButton ID="lnkCikisYap" CssClass="btn btn-danger" OnClick="lnkCikisYap_Click" runat="server">Çıkış Yap</asp:LinkButton>

        <table>
            <tr>
                <th>Toplantı No</th>
                <th>Toplantı Adı</th>
                <th>Kesinleşen Tarih</th>
            </tr>
            <!--Kesinleşen Toplantı-->
            <asp:ListView ID="lvwToplantilar" runat="server">
                <ItemTemplate>
            <tr>
                <td><%# Eval("IcerikID") %></td>
                <td><%# Eval("ToplantiAdi") %></td>
                <td><%# Eval("OlusturulmaTarihi") %></td> 
            </tr>
             </ItemTemplate>
            </asp:ListView>
        </table>

        

        
    </div>
          </form>

</body>
</html>

