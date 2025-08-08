<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBook.Master" AutoEventWireup="true" CodeBehind="CountryAddEdit.aspx.cs" Inherits="AddressBook.AdminPanel.Country.CountryAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">

    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Country Add Edit Page</h5>

            <asp:Label ID="lblMessage" runat="server" EnableViewState="false" />

            <div class="col-md-6">
                <label class="form-label" asp-for="CountryName">Country Name<span class="text-danger">*</span></label>
                <asp:TextBox ID="txtCountryName" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <asp:Button ID="btnSave" runat="server" Text="Save" SkinID="btnSave" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" SkinID="btnDelete" OnClick="btnCancel_Click" />
            </div>
</asp:Content>
