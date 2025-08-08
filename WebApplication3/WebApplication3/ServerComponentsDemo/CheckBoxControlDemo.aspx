<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckBoxControlDemo.aspx.cs" Inherits="WebApplication3.ServerComponentsDemo.CheckBoxControlDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="~/Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="~/Content/css/bootstrap.theme.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <asp:CheckBox ID="chkSelectAll" runat="server" Text="SelectAll" AutoPostBack="True" OnCheckedChanged="chkSelectAll_CheckedChanged" /><br />
                    <asp:CheckBox ID="chkCricket" runat="server" Text="Cricket" /><br />
                    <asp:CheckBox ID="chkReading" runat="server" Text="Reading" /><br />
                    <asp:CheckBox ID="chkDrawing" runat="server" Text="Drawing" /><br />
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnDisplay" runat="server" Text="Display" OnClick="btnDisplay_Click"></asp:Button>
                </div>
                <div class="col-md-3">
                    <asp:Label ID="lblMessage" runat="server" ViewStateMode="Disabled" ForeColor="Black"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
