<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TextBoxDemo1.aspx.cs" Inherits="WebApplication3.ServerComponentsDemo.TextBoxDemo1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="~/Content/css/bootstrap.theme.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <asp:TextBox ID="txtNo1" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnCopy" runat="server" Text="Copy" OnClick="btnCopy_Click" />
                </div>
                <div class="col-md-4">
                   <asp:TextBox ID="txtNo2" runat="server"></asp:TextBox>
                </div>
            </div>
    </form>
</body>
</html>
