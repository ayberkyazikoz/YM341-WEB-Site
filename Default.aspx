<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Anket Oluşturma</title>
    <link rel="stylesheet" href="/Media/style.css">
</head>
<body>
    
    <div class="container">
        <h1>Anket Oluştur</h1>
        <form id="surveyForm" runat="server">

            <div class="form-group">
                <label for="meetingTitle">Toplantılar:</label>
                <asp:DropDownList ID="ddlToplantilar" OnSelectedIndexChanged="drpToplantilar_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="meetingTitle">Toplantı Adı:</label>
                <asp:TextBox ID="txtToplantiAdi" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="meetingTopic">Toplantı Konusu:</label>
                <asp:TextBox ID="txtToplanti" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="datetime">Uygun Zamanı Seçiniz:</label>
               <%-- <input type="datetime-local" id="datetime" name="datetime" class="form-control" min="2024-01-09T00:00">--%>
               <asp:TextBox ID="txtTarih" type="datetime-local" name="datetime" class="form-control"  TextMode="DateTimeLocal" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="urgency">Aciliyet Durumunu Seçiniz:</label>
                <%--<select id="urgency" name="urgency" class="form-control">
                    <option value="low">Düşük</option>
                    <option value="medium">Orta</option>
                    <option value="high">Yüksek</option>
                </select>--%>
                <asp:DropDownList ID="ddlDurum" CssClass="form-control" runat="server">
                </asp:DropDownList>
            </div>

        <%--    <button type="submit" class="submit-button">Gönder</button>--%>
            <asp:Button ID="btnGonder" CssClass="submit-button" OnClick="btnGonder_Click" runat="server" Text="Gönder" />
            <div class="top-right">
       <%-- <button id="showOldSurveys" class="old-surveys-button">Anket Sonuçlarını Göster</button>--%>
                <asp:Button ID="btnAnketSonuclariGoster" OnClick="btnAnketSonuclariGoster_Click" CssClass="old-surveys-button" runat="server" Text="Anket Sonuçlarını Göster" />
    </div>
        </form>
    </div>
     <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Sayfa yüklendiğinde çağrılan fonksiyon
            setMinimumDatetime();
        });

        function setMinimumDatetime() {
            const datetimeInput = document.getElementById("txtTarih");

            // Anlık olarak local saat ve tarih alınıyor
            const now = new Date();
            const year = now.getFullYear();
            const month = (now.getMonth() + 1).toString().padStart(2, "0");
            const day = now.getDate().toString().padStart(2, "0");
            const hours = now.getHours().toString().padStart(2, "0");
            const minutes = now.getMinutes().toString().padStart(2, "0");

            // Minimum tarih set ediliyor
            const minDatetime = `${year}-${month}-${day}T${hours}:${minutes}`;
            datetimeInput.min = minDatetime;
        }
     </script>
</body>
