<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            UserName : <asp:TextBox ID="txtUserName" runat="server" BorderStyle="Solid" BorderWidth="5px" ForeColor="#FF9900" BorderColor="Red"></asp:TextBox>
            Password :&nbsp; 
             Address :
        </div>
        <p>
            <asp:TextBox ID="txtPassword" runat="server" BorderStyle="Solid" BorderWidth="5px" ForeColor="#FF9900" BorderColor="Red"></asp:TextBox>
             </p>
        <p>
            <asp:TextBox ID="txtAddress" runat="server" BorderStyle="Solid" BorderWidth="5px" ForeColor="#FF9900" BorderColor="Red"></asp:TextBox>
        </p>
    </form>
</body>
</html>
