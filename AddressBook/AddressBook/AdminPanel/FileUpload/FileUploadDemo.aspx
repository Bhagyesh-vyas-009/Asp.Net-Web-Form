<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBook.Master" AutoEventWireup="true" CodeBehind="FileUploadDemo.aspx.cs" Inherits="AddressBook.AdminPanel.FileUpload.FileUploadDemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <div>
        <asp:FileUpload ID="fuFile" runat="server"></asp:FileUpload>
        <br />
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server" EnableViewState="False" />
        <br />
        <asp:Button ID="btnDeleteFile" runat="server" Text="Delete File" OnClick="btnDeleteFile_Click"/>
        <br />
    </div>
</asp:Content>
