<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AddressBook.AdminPanel.Login_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="~/Content/assets/img/favicon.png" rel="icon">
    <link href="~/Content/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <!-- Vendor CSS Files -->
    <link href="~/Content/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="~/Content/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="~/Content/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="~/Content/assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="~/Content/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="~/Content/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="~/Content/assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="~/Content/assets/css/style.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                            <div class="d-flex justify-content-center py-4">
                                <a href="index.html" class="logo d-flex align-items-center w-auto">
                                    <img src="assets/img/logo.png" alt="">
                                    <span class="d-none d-lg-block">AddressBook</span>
                                </a>
                            </div>
                            <!-- End Logo -->

                            <div class="card mb-3">

                                <div class="card-body">

                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                                        <p class="text-center small">Enter your username & password to login</p>
                                    </div>

                                    <form class="row g-3 needs-validation" novalidate>
                                                    <asp:Label ID="lblMessage" runat="server" EnableViewState="false" />
                                                <div class="invalid-feedback">
                                                </div>
                                        <div class="col-12">
                                            <label for="yourUsername" class="form-label">Username<span class="text-danger">*</span></label>
                                            <div class="input-group has-validation">
                                                <asp:TextBox ID="txtLoginUserName" runat="server" Text="bhagyeshvyas"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourPassword" class="form-label">Password<span class="text-danger">*</span></label>
                                            <asp:TextBox ID="txtLoginPassword" runat="server" Text="Bh@gye09" ></asp:TextBox>
                                        </div>
                                        <div class="col-12">
                                            <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-primary w-100" OnClick="btnLogin_Click" />
                                        </div>
                                        <div class="col-12">
                                            <p class="small mb-0">Don't have account? <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/AdminPanel/Register.aspx" Text="Create an account"></asp:HyperLink></p>
                                        </div>
                                    </form>

                                </div>
                            </div>

                            <div class="credits">
                                <!-- All the links in the footer should remain intact. -->
                                <!-- You can delete the links only if you purchased the pro version. -->
                                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
                                Designed by <a href="https://bootstrapmade.com/">AddressBook</a>
                            </div>

                        </div>
                    </div>
                </div>

            </section>

        </div>

       <%-- <div class="card">
            <div class="card-body">
                <h5 class="card-title">Login To AddressBook</h5>

                <asp:Label ID="lblMessage" runat="server" EnableViewState="false" />

                <div class="col-md-6">
                    <label class="form-label">User Name<span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtLoginUserName" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Password<span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtLoginPassword" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" SkinID="btnSave" OnClick="btnLogin_Click"  />
                </div>--%>
                    <%--<asp:Button ID="btnCancel" runat="server" Text="Cancel" SkinID="btnDelete" OnClick="btnCancel_Click" />--%>
    </form>
</body>
</html>
