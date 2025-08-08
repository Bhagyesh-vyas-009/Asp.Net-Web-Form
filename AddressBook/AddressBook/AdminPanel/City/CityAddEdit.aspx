<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBook.Master" AutoEventWireup="true" CodeBehind="CityAddEdit.aspx.cs" Inherits="AddressBook.AdminPanel.City.CityAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <h2>City Add Edit Page</h2>
    <div class="container-fluid">
        <div class="row">
            <asp:Label ID="lblMessage" runat="server" class="alert text-sucess" EnableViewState="false" />
        </div>
        <div class="row">
            <div class="col-3">
                Country Name :
            </div>
            <div class="col">
                <asp:DropDownList ID="ddlCountryID" runat="server" CssClass="form-select"></asp:DropDownList>
                <%--<asp:RequiredFieldValidator ID="rfvCountryID" runat="server" ControlToValidate="ddlCountryID" ErrorMessage="Please Select Country" ForeColor="#FF3300" InitialValue="-1"></asp:RequiredFieldValidator>--%>
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                State Name :
            </div>
            <div class="col">
                <asp:DropDownList ID="ddlStateID" runat="server" CssClass="form-select"></asp:DropDownList>
                <%--<asp:RequiredFieldValidator ID="rfvStateID" runat="server" ControlToValidate="ddlStateID" ErrorMessage="Please Select State" ForeColor="#FF3300" InitialValue="-1"></asp:RequiredFieldValidator>--%>
            </div>
        </div>
        <div class="row">
            <div class="col-3">
                City Name :
            </div>
            <div class="col">
                <asp:TextBox ID="txtCityName" runat="server"></asp:TextBox>
            </div>
        </div>

        <div class="col-md-6">
            <asp:Button ID="btnSave" runat="server" Text="Save" SkinId="btnSave" OnClick="btnSave_Click"  />
             <asp:Button ID="btnCancel" runat="server" Text="Cancel" SkinID="btnDelete" OnClick="btnCancel_Click" />
        </div>
    </div>
</asp:Content>

