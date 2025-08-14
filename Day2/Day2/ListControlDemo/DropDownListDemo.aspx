<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DropDownListDemo.aspx.cs" Inherits="Day2.ListControlDemo.DropDownListDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div id="DivDropDownList">
            <asp:DropDownList ID="ddlCountry" runat="server" EnableViewState="False">
                <asp:ListItem Value="">Select Country</asp:ListItem>
                <asp:ListItem Value="91">India</asp:ListItem>
                <asp:ListItem Value="93">Sri Lanka</asp:ListItem>
                <asp:ListItem Value="92">China</asp:ListItem>
                <asp:ListItem Value="96">Bhutan</asp:ListItem>
                <asp:ListItem Value="95">Nepal</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnSelect" runat="server" Text="Select" OnClick="btnSelect_Click" />
            <br />
            <asp:Label ID="lblCountry" runat="server" />
            <br />
        </div>
        <hr />
        <asp:HyperLink ID="hlListBox" runat="server">
        </asp:HyperLink>
            <asp:ListBox ID="lstbCountries1" runat="server" EnableViewState="False" SelectionMode="Multiple">
                <asp:ListItem Value="91">India</asp:ListItem>
                <asp:ListItem Value="93">Sri Lanka</asp:ListItem>
                <asp:ListItem Value="92">China</asp:ListItem>
                <asp:ListItem Value="96">Bhutan</asp:ListItem>
                <asp:ListItem Value="95">Nepal</asp:ListItem>
            </asp:ListBox>
            <asp:Button ID="btnmoveright" runat="server" Text=">" OnClick="btnmoveright_Click" /><br />
            <asp:Button ID="btnmoveandclearright" runat="server" Text=">>" OnClick="btnmoveandclearright_Click" /><br />
            <asp:Button ID="btnmoveleft" runat="server" Text="<" OnClick="btnmoveleft_Click" /><br />
            <asp:Button ID="btnmoveandclearleft" runat="server" Text="<<" OnClick="btnmoveandclearleft_Click" /><br />
            <asp:ListBox ID="lstbCountries2" runat="server" EnableViewState="False" SelectionMode="Multiple">
                
            </asp:ListBox>
        <br />
        <asp:Button ID="btndishobbies" runat="server" Text="Select" OnClick="btndishobbies_Click" />
        <br />
        <asp:Label ID="lblhobbies" runat="server" />
        <br />
        <hr />
        <asp:LinkButton ID="btnhome" runat="server" Text="Home" class="btn btn-warning" NavigateUrl="~/Day2.aspx" OnClick="btnhome_Click"></asp:LinkButton>
    </form>
</body>
</html>
