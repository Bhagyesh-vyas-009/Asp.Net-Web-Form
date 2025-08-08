<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AddressBook.AdminPanel.Register" %>

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
                                    <span class="d-none d-lg-block">NiceAdmin</span>
                                </a>
                            </div>
                            <!-- End Logo -->

                            <div class="card mb-3">

                                <div class="card-body">

                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">Create an Account</h5>
                                        <p class="text-center small">Enter your personal details to create account</p>
                                    </div>

                                    <form class="row g-3 needs-validation" novalidate>
                                          <asp:Label ID="lblMessage" runat="server" EnableViewState="false" />
                                        <div class="col-12">
                                            <label class="form-label">User Name</label>
                                            <asp:TextBox ID="txtUserName" runat="server" />
                                        </div>

                                        <div class="col-12">
                                            <label class="form-label">Password</label>
                                            <asp:TextBox ID="txtPassword" runat="server" />
                                        </div>

                                        <div class="col-12">
                                            <label class="form-label">Display Name</label>
                                            <asp:TextBox ID="txtDisplayName" runat="server" />
                                        </div>

                                        <div class="col-12">
                                            <label class="form-label">Mobile No</label>
                                            <asp:TextBox ID="txtMobileNo" runat="server" />
                                        </div>

                                        <div class="col-12">
                                            <label class="form-label">
                                                Email
                                            </label>
                                            <asp:TextBox ID="txtEmail" runat="server" />
                                        </div>

                                        <div class="col-12">
                                            <div class="form-check">
                                                <input class="form-check-input" name="terms" type="checkbox" value="" id="acceptTerms" required>
                                                <label class="form-check-label" for="acceptTerms">I agree and accept the <a href="#">terms and conditions</a></label>
                                                <div class="invalid-feedback">You must agree before submitting.</div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="btn"/>
                                        </div>
                                        <div class="col-12">
                                            <p class="small mb-0">Already have an account? <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/AdminPanel/Login.aspx" Text="Login"></asp:HyperLink></p>
                                        </div>
                                    </form>

                                </div>
                            </div>

                            <div class="credits">
                                <!-- All the links in the footer should remain intact. -->
                                <!-- You can delete the links only if you purchased the pro version. -->
                                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
                                Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                            </div>

                        </div>
                    </div>
                </div>

            </section>

        </div>
    </form>
</body>
</html>
