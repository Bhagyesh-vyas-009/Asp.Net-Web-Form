<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBook.Master" AutoEventWireup="true" CodeBehind="ContactList.aspx.cs" Inherits="AddressBook.AdminPanel.Contact.ContactList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
       <h2>Contact List</h2>
   <asp:Label ID="lblMessageContact" runat="server"></asp:Label>
   <div class="float-end">
       <asp:HyperLink ID="hlContactAdd" runat="server" NavigateUrl="~/AdminPanel/Contact/ContactAddEdit.aspx" class="btn btn-primary mb-3">Add Contact</asp:HyperLink>
   </div>
   <asp:GridView ID="gvContact" runat="server" OnRowCommand="gvContact_RowCommand" AutoGenerateColumns="false">
       <Columns>
           <asp:BoundField DataField="ContactID" HeaderText="ID" />
           <asp:BoundField DataField="ContactName" HeaderText="Name" />
           <asp:TemplateField>
               <ItemTemplate>
                   <asp:Image ID="imgContactPhoto" runat="server" ImageUrl='<%# Eval("ContactPhotoPath") %>' Height="50px"></asp:Image>
                   <asp:Button ID="btnDelete" runat="server" Text="Delete"
                       CommandName="DeleteCommand" CommandArgument='<%# Eval("ContactID").ToString().Trim() %>' SkinID="btnDelete"
                       OnClientClick="return confirm('Are you sure? Want to Delete this!!!!!!!!!')" />
                   <asp:HyperLink ID="hlEdit" runat="server" Text="Edit" CssClass="btn btn-warning btn-sm"
                       NavigateUrl='<%# "~/AdminPanel/Contact/ContactAddEdit.aspx?ContactID="+Eval("ContactID").ToString().Trim() %>' />
                  <%-- <asp:Label ID="lblSize" runat="server" Text='<%# Contac %>'/>--%>
               </ItemTemplate>
           </asp:TemplateField>
       </Columns>
   </asp:GridView>
</asp:Content>
