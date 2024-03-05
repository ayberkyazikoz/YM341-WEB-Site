<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OylarCEO.aspx.cs" Inherits="OylarCEO" %>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Anket Sonuçları</title>
    <link rel="stylesheet" href="/Media/results.css">
    <link href="/Media/bootstrap.min.css" rel="stylesheet" />
  <%--  <link href="Media/style.css" rel="stylesheet" />--%>
</head>
<body>

    <header>
        <h1>Anket Sonuçları</h1>
    </header>
      <form id="votingForm" runat="server">
    <div class="container">
        <h2>CEO tarafından Görüntülenen Sonuçlar</h2>

        <table>
            <tr>
                <th>Toplantı No</th>
                <th>Toplantı Adı</th>
              <%--  <th>Oy Veren Çalışan</th>--%>
                <th>Toplantı Tarihi</th>
                <th>Sil</th>
            </tr>
            <!-- Toplantı 1 Sonuçları -->
            <asp:ListView ID="lvwToplanti" runat="server">
                <ItemTemplate>
            <tr>
                <td><%# Eval("IcerikID") %></td>
                <td><%# Eval("ToplantiAdi") %></td>
              
           <%--     <td><%# Eval("OyVeren") %></td>--%>
                <td><%# Eval("OlusturulmaTarihi") %></td> <!-- Örneğin, 3 aciliyet seviyesi -->
                <td>
                    <%--<asp:LinkButton ID="lnkSil" CssClass="btn btn-danger" OnCl1ick="lnkSil_Click" runat="server">Sil</asp:LinkButton>--%>
                     <a type="button" class="btn btn-danger" data-toggle="tooltip" href="<%# "ToplantiSil.aspx?ID=" +  Eval("IcerikID")  %>" data-container="body" title="" data-original-title="Toplantı Sil">Sil</a>

                </td>
            </tr>
               </ItemTemplate>
            </asp:ListView>
        </table>

        <!-- Yeni Eklenen Div -->
        <div class="voting-summary">
            <!-- Derecelendirme -->
            <h3>Toplantı Oylama Özeti</h3>
            <asp:ListView ID="lvwToplantiOylama" runat="server">
                <ItemTemplate>
            
                    <label>
                        <asp:CheckBox ID="chk" AutoPostBack="true" runat="server" />
                       <asp:HiddenField ID="hfdTestID" runat="server" Value='<%# Eval("IcerikID") %>' />
                        <%# Eval("ToplantiAdi") %> (<%# Eval("OlusturulmaTarihi") %>) Oy Veren Kişi Sayısı:
                    <asp:Literal ID="ltlOyVeren" runat="server"></asp:Literal></label>
                    <br />
                    
                     </ItemTemplate>
            </asp:ListView>
          <%--  <label><input type="radio" name="urgency" value="2">Toplantı 2 (2023-12-21 16:00): 30 oy</label><br>--%>
            
        </div>

        
        <asp:Button ID="btnKesinlestir" type="button" runat="server" CssClass="submit-button" OnClick="btnKesinlestir_Click" Text="Toplantıyı Kesinleştir" />
        <br />
        <br />
          <asp:Button ID="btnToplantilariGoruntule" type="button" runat="server" CssClass="btn btn-success" OnClick="btnToplantilariGoruntule_Click" Text="Toplantıları Görüntüle" />
    </div>
          </form>

</body>
</html>

