<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AddressBook.Master" AutoEventWireup="true" CodeBehind="ContactAddEdit.aspx.cs" Inherits="AddressBook.AdminPanel.Contact.ContactAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Contact Add Edit Page</h5>

            <asp:Label ID="lblMessage" runat="server" EnableViewState="false" />
            <div class="row">
                <div class="col-md-8">
                    <div class="col-md-6">
                        <label class="form-label" asp-for="ContactName">Contact Name<span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtContactName" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" asp-for="Gender">Gender<span class="text-danger">*</span></label><br />
                        <asp:RadioButtonList ID="rbtnlGender" runat="server">
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:RadioButtonList>
                       <%-- <asp:RadioButton ID="rbtnMale" runat="server" Text="Male" GroupName="Gender" />
                        <asp:RadioButton ID="rbtnFemale" runat="server" Text="Female" GroupName="Gender" />
                        <asp:RadioButton ID="rbtnOther" runat="server" Text="Other" GroupName="Gender" />--%>
                        <%--<asp:TextBox ID="txtGender" runat="server"></asp:TextBox>--%>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col">
                            <label class="form-label" asp-for="ContactName">Mobile No<span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtMobileNo" runat="server"></asp:TextBox>
                        </div>
                        <div class="col">
                            <label class="form-label" asp-for="ContactName">WhatsApp No<span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtWhatsAppNo" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label class="form-label" asp-for="ContactName">Email<span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtEmail" runat="server" Placeholder="example@gmail.com"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col">
                            <label class="form-label" asp-for="CountryID">Country <span class="text-danger">*</span></label><br />
                            <asp:DropDownList ID="ddlCountryID" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCountryID_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col">
                            <label class="form-label" asp-for="StateID">State<span class="text-danger">*</span></label><br />
                            <asp:DropDownList ID="ddlStateID" runat="server" AutoPostBack="true" Enabled="false" OnSelectedIndexChanged="ddlStateID_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col">
                            <label class="form-label" asp-for="CityID">City<span class="text-danger">*</span></label><br />
                            <asp:DropDownList ID="ddlCityID" runat="server" AutoPostBack="true" Enabled="false"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                    </div>
                        <div class="col">
                            <label class="form-label" asp-for="Address">Address<span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                        </div>

                    <div class="row">
                        <div class="col">
                            <label class="form-label" asp-for="BirthDate">Birth Date<span class="text-danger" >*</span></label>
                            <asp:TextBox ID="txtBirthDate" runat="server" TextMode="DateTime" PlaceHolder="yyyy-mm-dd"></asp:TextBox>
                        </div>
                        <div class="col">
                            <label class="form-label" asp-for="Age">Age<span class="text-danger">*</span></label>
                            <asp:TextBox ID="txtAge" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" asp-for="BloodGroup">Blood Group<span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtBloodGroup" runat="server"></asp:TextBox>
                    </div>
                    <br />
                    <div class="col-md-6">
                        <asp:Button ID="btnSave" runat="server" Text="Save" SkinID="btnSave" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" SkinID="btnDelete" OnClick="btnCancel_Click" />
                    </div>
                </div>
                <div class="col-md-4">
                    <h5>Contact Category</h5>
                    <asp:CheckBoxList ID="cblContactCategoryID" runat="server" />
                </div>
            </div>
</asp:Content>
