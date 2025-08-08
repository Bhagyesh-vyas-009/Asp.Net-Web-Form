<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBook.Master" AutoEventWireup="true" CodeBehind="ContactAddEdit.aspx.cs" Inherits="AddressBook.AdminPanel.Contact.ContactAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">

    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Contact Add Edit Page</h5>

            <asp:Label ID="lblMessage" runat="server" EnableViewState="false" />

            <div class="col-md-6">
                <label class="form-label" asp-for="ContactName">Contact Name<span class="text-danger">*</span></label>
                <asp:TextBox ID="txtContactName" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label class="form-label" asp-for="ContactPhotoPath">Contact Photo<span class="text-danger">*</span></label>
                <br />
                <asp:FileUpload ID="fuContactPhotoPath" runat="server" />
            </div>
            <br />
            <div class="col-md-6">
                <asp:Button ID="btnSave" runat="server" Text="Save" SkinID="btnSave" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" SkinID="btnDelete" OnClick="btnCancel_Click" />
            </div>
</asp:Content>
