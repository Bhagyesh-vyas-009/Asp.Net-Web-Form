<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBook.Master" AutoEventWireup="true" CodeBehind="ContactList.aspx.cs" Inherits="AddressBook.AdminPanel.Contact.ContactList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <h2>Contact List</h2>
   <asp:Label ID="lblMessageContact" runat="server"></asp:Label>
   <div class="float-end">
       <asp:HyperLink ID="hlContactAdd" runat="server" NavigateUrl="~/AdminPanel/Contact/Add" class="btn btn-primary mb-3">Add Contact</asp:HyperLink>
   </div>
   <asp:GridView ID="gvContact" runat="server" OnRowCommand="gvContact_RowCommand" AutoGenerateColumns="false">
       <Columns>
           <asp:BoundField DataField="ContactID" HeaderText="ID" />
           <asp:BoundField DataField="ContactName" HeaderText="Name" />
           <asp:BoundField DataField="Gender" HeaderText="Gender" />
           <asp:BoundField DataField="BirthDate" HeaderText="Birth Date" />
           <asp:BoundField DataField="Age" HeaderText="Age" />
           <asp:BoundField DataField="MobileNo" HeaderText="Mobile No" />
           <asp:BoundField DataField="WhatsAppNo" HeaderText="WhatsApp No" />
           <asp:BoundField DataField="Email" HeaderText="Email" />
           <asp:BoundField DataField="CountryName" HeaderText="Country" />
           <asp:BoundField DataField="StateName" HeaderText="State" />
           <asp:BoundField DataField="CityName" HeaderText="City" />
           <asp:BoundField DataField="BloodGroup" HeaderText="Blood Group" ItemStyle-CssClass="badge text-bg-warning"/>
           <asp:TemplateField HeaderText="Image">
               <ItemTemplate>
                    <asp:Image ID="imgContactPhoto" runat="server" ImageUrl='<%# Eval("ContactPhotoPath") %>' Height="50px"></asp:Image>
               </ItemTemplate>
           </asp:TemplateField>
           <asp:TemplateField HeaderText="Actions">
               <ItemTemplate>
             <%--      <asp:Image ID="imgContactPhoto" runat="server" ImageUrl='<%# Eval("ContactPhotoPath") %>' Height="50px"></asp:Image>--%>
                   <asp:Button ID="btnDelete" runat="server" Text="Delete"
                       CommandName="DeleteCommand" CommandArgument='<%# Eval("ContactID").ToString().Trim() %>' SkinID="btnDelete"
                       OnClientClick="return confirm('Are you sure? Want to Delete this!!!!!!!!!')" />
                   <asp:HyperLink ID="hlEdit" runat="server" Text="Edit" CssClass="btn btn-warning btn-sm"
                       NavigateUrl='<%# "~/AdminPanel/Contact/Edit/" +  AddressBook.UrlEncryptor.Encrypt(Eval("ContactID").ToString().Trim()) %>' />
                  <%-- <asp:Label ID="lblSize" runat="server" Text='<%# Contac %>'/>--%>
               </ItemTemplate>
           </asp:TemplateField>
       </Columns>
   </asp:GridView>
</asp:Content>
