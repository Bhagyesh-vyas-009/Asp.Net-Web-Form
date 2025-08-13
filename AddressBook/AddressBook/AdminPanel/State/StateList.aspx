<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBook.Master" AutoEventWireup="true" CodeBehind="StateList.aspx.cs" Inherits="AddressBook.AdminPanel.State.StateList" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <h2>State List</h2>
    <asp:Label ID="lblMessageState" runat="server"></asp:Label>
    <div class="float-end">
        <asp:HyperLink ID="hlStateAdd" runat="server" NavigateUrl="~/AdminPanel/State/StateAddEdit.aspx" class="btn btn-primary mb-3">Add State</asp:HyperLink>
    </div>
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <asp:GridView ID="gvState" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="false" OnRowCommand="gvState_RowCommand">
        <Columns>
            <asp:BoundField DataField="StateID" HeaderText="ID" />
            <asp:BoundField DataField="StateName" HeaderText="State" />
            <asp:BoundField DataField="CountryName" HeaderText="Country" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm"
                        CommandName="DeleteRecord" CommandArgument='<%# Eval("StateID").ToString().Trim() %>' OnClientClick='return confirm("are You sure want to delete!!!!!!")' />
                    <asp:HyperLink ID="hlEdit" runat="server" Text="Edit RouteData" CssClass="btn btn-warning btn-sm"
                        NavigateUrl='<%# "~/AdminPanel/State/Edit/"+AddressBook.UrlEncryptor.Encrypt(Eval("StateID").ToString().Trim()) %>' />

                      <asp:HyperLink ID="hlEdit1" runat="server" Text="Edit QueryString" CssClass="btn btn-warning btn-sm"
                        NavigateUrl='<%# "~/AdminPanel/State/StateAddEdit.aspx?StateID="+ AddressBook.UrlEncryptor.Encrypt(Eval("StateID").ToString().Trim()) %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
