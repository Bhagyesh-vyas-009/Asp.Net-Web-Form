<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBook.Master" AutoEventWireup="true" CodeBehind="CityList.aspx.cs" Inherits="AddressBook.AdminPanel.City.CityList" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <%--<h2>City List</h2>
    <asp:Label ID="lblMessageCity" runat="server" CssClass="text-info"></asp:Label>
    <div class="float-end">
        <asp:HyperLink ID="hlCityAdd" runat="server" NavigateUrl="~/AdminPanel/City/CityAddEdit.aspx" class="btn btn-primary mb-3">Add City</asp:HyperLink>
        <asp:Label ID="lblMessage" runat="server" Text="dbjh" EnableViewCity="false"></asp:Label>
    </div>
    <div class="row">--%>

    <h2>City List</h2>
    <div class="float-end">
        <asp:HyperLink ID="hlCityAdd" runat="server" NavigateUrl="~/AdminPanel/City/CityAddEdit.aspx" class="btn btn-primary mb-3">Add City</asp:HyperLink>
    </div>
    <asp:Label ID="lblMessageCity" runat="server"></asp:Label>
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <asp:GridView ID="gvCity" runat="server" OnRowCommand="gvCity_RowCommand">
        <Columns>
            <asp:BoundField DataField="CityID" HeaderText="ID" />
            <asp:BoundField DataField="CountryName" HeaderText="Country" />
            <asp:BoundField DataField="StateName" HeaderText="State" />
            <asp:BoundField DataField="CityName" HeaderText="City" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm"
                        CommandName="DeleteCommand" CommandArgument='<%# Eval("CityID").ToString() %>'
                        OnClientClick="return confirm('Are you sure')" />
                   <asp:HyperLink ID="hlEdit" runat="server" Text="Edit RouteData" CssClass="btn btn-warning btn-sm"
                         NavigateUrl='<%# "~/AdminPanel/City/Edit/"+AddressBook.UrlEncryptor.Encrypt(Eval("CityID").ToString().Trim()) %>' />

                   <asp:HyperLink ID="hlEdit1" runat="server" Text="Edit QueryString" CssClass="btn btn-warning btn-sm"
                         NavigateUrl='<%# "~/AdminPanel/City/CityAddEdit.aspx?CityID="+ AddressBook.UrlEncryptor.Encrypt(Eval("CityID").ToString().Trim()) %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <%--</div>--%>
</asp:Content>
