<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RadioButtonControlDemo.aspx.cs" Inherits="WebApplication3.ServerComponentsDemo.RadioBoxControlDemo" %>

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
                    <asp:RadioButton ID="rbtnMale" runat="server" Text="Male" GroupName="gender"/>
                    <asp:RadioButton ID="rbtnFemale" runat="server" Text="Female" GroupName="gender"/>
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnDisplay" runat="server" Text="Display" OnClick="btnDisplay_Click" ToolTip="Gender"></asp:Button>
                </div>x
                <div class="col-md-3">
                    <asp:Label ID="lblGender" runat="server" ViewStateMode="Disabled" ForeColor="Black"></asp:Label>
                </div>
            </div>
        </div>
        <asp:HyperLink ID="hlDarshan" runat="server" NavigateUrl="~/ServerComponentsDemo/CheckBoxControlDemo.aspx" Target="_self">Darshan</asp:HyperLink>
        </br>
        <asp:LinkButton ID="lb1" runat="server" Text="TextBoxDemo" OnClick="lb1_Click"></asp:LinkButton>
        </br>
        <asp:ImageMap ID="Darshan" runat="server" ImageUrl="~/Images/Screenshot 2025-07-30 122807.png"></asp:ImageMap>
    </form>
</body>
</html>