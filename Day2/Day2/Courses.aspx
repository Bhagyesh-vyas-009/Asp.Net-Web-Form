<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Courses.Day2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <asp:RadioButton ID="rbDIET" runat="server" Text="DIET" GroupName="course" />
                        <br />
                        <asp:RadioButton ID="rbDIETDS" runat="server" Text="DIETDS" GroupName="course" />
                        <br />
                        <asp:Button ID="btnSelectCourse" runat="server" Text="Confirm" OnClick="btnSelectCourse_Click" />
                        <br />
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </div>
                    <div id="DIETdeptlist" runat="server">
                        <h3>Department of DIET</h3>
                        <asp:RadioButton ID="rbDIETcomp" runat="server" Text="B.Tech Computer Engineering" GroupName="DIETdept" />
                        <br />
                        <asp:RadioButton ID="rbDIETcivil" runat="server" Text="B.Tech Civil Engineering" GroupName="DIETdept" />
                    </div>
                    <div class="col-12" id="DIETDSdeptlist" runat="server">
                        <h3>Department of DIETDS</h3>
                        <asp:RadioButton ID="rbDIETDScomp" runat="server" Text="Computer Engineering" GroupName="DIETDSdept" />
                        <br />
                        <asp:RadioButton ID="rbDIETDScivil" runat="server" Text="Civil Engineering" GroupName="DIETDSdept" />
                    </div>
                </div>
            </div>
            <asp:HyperLink ID="hl1" runat="server">

                <asp:Image ID="imgDU1" runat="server" ToolTip="DU1" Width="300px" />
            </asp:HyperLink>
        </div>
    </form>
</body>
</html>
