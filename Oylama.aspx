<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Oylama.aspx.cs" Inherits="Oylama" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oylama Sayfası</title>
    <link rel="stylesheet" href="/Media/style.css">
    <link href="../Media/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1>Tarih ve Aciliyet Dereceli Oylaması</h1>
        <form id="votingForm" runat="server">
            <div class="dates-list">
                <!-- Tarih Seçimi -->
                <div class="group-box">
                    <h2>Tarih Seçimi</h2>
                    <!-- Örnek Tarih Seçenekleri -->
                  <%--  <asp:ListView ID="lvwOylama" runat="server">
                        <ItemTemplate>--%>
                             <div class="date-item">
                        <%--<input id="radiotarih" type="radio" name="selectedDate" value='<%# Eval("IcerikID") %>' runat="server">--%>
                          
                            <asp:CheckBoxList ID="chk" runat="server" CssClass="custom-control-input" RepeatDirection="Horizontal"></asp:CheckBoxList>
                               <asp:HiddenField ID="hfdTestID" runat="server" Value='<%# Eval("IcerikID") %>' />
                                 <asp:ListView ID="lvwToplantilar" runat="server">
                                    <ItemTemplate>
                                        <%# Eval("ToplantiAdi") %>
                                    </ItemTemplate>
                                 </asp:ListView>
                            
                              
                    </div>
                              <%--</ItemTemplate>
                    </asp:ListView>--%>
                   
                </div>

            </div>
            <asp:Button ID="btnOylariGonder" CssClass="submit-button" OnClick="btnOylariGonder_Click" runat="server" Text="Oyları Gönder" />
        <asp:Button ID="btnOylariGoruntule" CssClass="view-results-button" OnClick="btnOylariGoruntule_Click" runat="server" Text="Oyları Görüntüle" />
            <br /> <br />
            <asp:LinkButton ID="lnkCikisYap" CssClass="btn btn-danger" OnClick="lnkCikisYap_Click" runat="server">Çıkış Yap</asp:LinkButton>

        </form>

    </div>

    <script>
        function openResults() {
            // Sonuç anketini yeni bir pencerede veya sekmede aç
            window.open('results.html', '_blank');
        }
    </script>
</body>
</html>

