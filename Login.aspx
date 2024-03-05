<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Giriş Yap</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/Media/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/Media/dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="/Media/plugins/iCheck/square/blue.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="smPage" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="uplLogin" runat="server">
            <ContentTemplate>
                <asp:ValidationSummary ID="vsmForm" DisplayMode="BulletList" ShowMessageBox="true"
                    ShowSummary="false" ValidationGroup="Form" runat="server" />
                <div class="login-box">
                    <div class="login-logo">
<%--                        <img src="/Media/media/logo.png" class="pngfix" alt="Logo" />--%>
                        <h2>MacroTech</h2>
                    </div>
                    <!-- /.login-logo -->
                    <div class="login-box-body">
                        <p class="login-box-msg">oturum açmak için giriş yapın.</p>
                        <div>
                            <asp:PlaceHolder ID="plhKontrol" Visible="false" runat="server">
                            <div class="form-group has-feedback">
                                <asp:TextBox ID="txtEPostaAdresi" runat="server" CssClass="form-control" placeholder="Email" />
                                <asp:RequiredFieldValidator ID="rfvEPostaAdresi" ErrorMessage="E-Posta adresinizi giriniz."
                                    ControlToValidate="txtEPostaAdresi" Display="None" ValidationGroup="Form" runat="server" />
                                <asp:RegularExpressionValidator ID="revEPostaAdresi" runat="server" ErrorMessage="Lütfen geçerli bir e-posta adresi giriniz."
                                    ControlToValidate="txtEPostaAdresi" Display="None" ValidationGroup="Form" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>

                            </div>
                            <div class="form-group has-feedback">
                                <asp:TextBox ID="txtSifre" runat="server" class="form-control" placeholder="Password" TextMode="Password" />
                                <asp:RequiredFieldValidator ID="rfvSifre" ErrorMessage="Şifrenizi giriniz." ControlToValidate="txtSifre"
                                    Display="None" ValidationGroup="Form" runat="server" />
                                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            </div>
                            </asp:PlaceHolder>
                           
                            <div class="row">
                                <div class="col-xs-12">
                                  
                                    <asp:Button ID="btnCeoGiris" ValidationGroup="Form" Text="Ceo Oturum Aç" runat="server" class="btn btn-primary btn-block btn-flat" OnClick="btnCeoGiris_Click" />
                                     <asp:Button ID="btnCalisanGiris" ValidationGroup="Form" Text="Çalışan Oturum Aç" runat="server" class="btn btn-primary btn-block btn-flat" OnClick="btnCalisanGiris_Click" />
                                      <asp:Button ID="btnGiris" ValidationGroup="Form" Visible="false" Text="Oturum Aç" runat="server" class="btn btn-primary btn-block btn-flat" OnClick="btnGiris_Click" />
                                    <asp:Button ID="btnGiris2" ValidationGroup="Form" Visible="false" Text="Oturum Aç" runat="server" class="btn btn-primary btn-block btn-flat" OnClick
                                        ="btnGiris2_Click"/>
                                </div>
                                <!-- /.col -->
                            </div>
                        </div>

                     
                    </div>
                    <!-- /.login-box-body -->
                </div>
                <!-- /.login-box -->

                <!-- jQuery 2.2.3 -->
                <script src="/Media/plugins/jQuery/jquery-2.2.3.min.js"></script>
                <!-- Bootstrap 3.3.7 -->
                <script src="/Media/bootstrap/js/bootstrap.min.js"></script>
                <!-- iCheck -->
                <script src="/Media/plugins/iCheck/icheck.min.js"></script>
                <script>
                    $(function () {
                        $('input').iCheck({
                            checkboxClass: 'icheckbox_square-blue',
                            radioClass: 'iradio_square-blue',
                            increaseArea: '20%' // optional
                        });
                    });
                </script>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
