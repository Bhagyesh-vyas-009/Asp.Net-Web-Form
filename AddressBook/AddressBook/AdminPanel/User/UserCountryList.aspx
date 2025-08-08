<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBook.Master" AutoEventWireup="true" CodeBehind="UserCountryList.aspx.cs" Inherits="AddressBook.AdminPanel.User.UserCountry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <h2>Country List of User</h2>
    <asp:Label ID="lblMessageCountry" runat="server"></asp:Label>
    <div class="float-end">
        <asp:HyperLink ID="hlCountryAdd" runat="server" NavigateUrl="~/AdminPanel/Country/CountryAddEdit.aspx" class="btn btn-primary mb-3">Add Country</asp:HyperLink>
    </div>
    <asp:GridView ID="gvCountry" runat="server" OnRowCommand="gvCountry_RowCommand" AutoGenerateColumns="false">
        <columns>
            <asp:BoundField DataField="CountryID" HeaderText="ID" />
            <asp:BoundField DataField="CountryName" HeaderText="Name" />
            <asp:BoundField DataField="DisplayName" HeaderText="Added By" />
            <asp:TemplateField>
                <itemtemplate>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete"
                        CommandName="DeleteCommand" CommandArgument='<%# Eval("CountryID").ToString().Trim() %>' SkinID="btnDelete"
                        OnClientClick="return confirm('Are you sure? Want to Delete this!!!!!!!!!')" />
                    <asp:HyperLink ID="hlEdit" runat="server" Text="Edit" CssClass="btn btn-warning btn-sm"
                        NavigateUrl='<%# "~/AdminPanel/Country/CountryAddEdit.aspx?CountryID="+Eval("CountryID").ToString().Trim() %>' />
                </itemtemplate>
            </asp:TemplateField>
        </columns>
    </asp:GridView>
</asp:Content>
