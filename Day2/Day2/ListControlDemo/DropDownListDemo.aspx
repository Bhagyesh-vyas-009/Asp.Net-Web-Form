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
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server">
                 <asp:ListItem Value="">Select Country</asp:ListItem>
                <asp:ListItem Value="91">India</asp:ListItem>
                <asp:ListItem Value="93">Sri Lanka</asp:ListItem>
                <asp:ListItem Value="92">China</asp:ListItem>
                <asp:ListItem Value="96">Bhutan</asp:ListItem>
                <asp:ListItem Value="95">Nepal</asp:ListItem>
            </asp:DropDownList>
            <br/>
            <asp:LinkButton ID="btnhome" runat="server" Text="Home" class="btn btn-warning" NavigateUrl="~/Day2.aspx" OnClick="btnhome_Click"></asp:LinkButton>
        </div>
    </form>
</body>
</html>
