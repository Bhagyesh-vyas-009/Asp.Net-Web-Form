<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentEnrollmentForm.aspx.cs" Inherits="Day2.ValidationControl.StudentEnrollmentForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
    
    <style type="text/css">
        .auto-style1 {
            height: 35px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="text-center">Login For Already Registred Students</h1>
            <table>
                <tr>
                    <td>UserName<span class="text-danger">*</span></td>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtUserNameLogin" runat="server" class="form-control"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvUserNameLogin" runat="server" ControlToValidate="txtUserNameLogin" ErrorMessage="UserName is required" ForeColor="Red" Display="Dynamic" ValidationGroup="Login"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Password<span class="text-danger">*</span></td>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtPasswordLogin" runat="server" class="form-control" TextMode="Password"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvPasswordLogin" runat="server" ControlToValidate="txtPasswordLogin" ErrorMessage="Password is required" ForeColor="Red" Display="Dynamic" ValidationGroup="Login"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-success" ValidationGroup="Login" />
                    </td>
                </tr>
            </table>
            <h1 class="text-center">Student Enrollment Form</h1>
            <table cellpadding="5px">
                <tr>
                    <td></td>
                    <td></td>
                    <td colspan="2">
                        <asp:Label ID="lblMessage" runat="server" EnableViewState="false" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td colspan="2">
                        <asp:ValidationSummary ID="vsEnrollmentForm" runat="server" BackColor="Yellow" BorderColor="Red" BorderStyle="Dotted" ForeColor="Red" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr class="mb-3">
                    <td>Name<span class="text-danger">*</span></td>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr class="mb-3">
                    <td>Enrollment No<span class="text-danger">*</span></td>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtEnrNo" runat="server" class="form-control"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvEnrno" runat="server" ControlToValidate="txtEnrNo" Display="None" ErrorMessage="Enrollment No is required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEnrNo" runat="server" ControlToValidate="txtEnrNo" Display="None" ErrorMessage="Enter Valid Enrollment No" ForeColor="Red" ValidationExpression="[1-9]{2}054[1-9]{7}"></asp:RegularExpressionValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr class="mb-3">
                    <td class="auto-style1">Institute<span class="text-danger">*</span></td>
                    <td class="auto-style1">:</td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlInstitute" runat="server" class="form-control">
                            <asp:ListItem Value="-1">Select Institute</asp:ListItem>
                            <asp:ListItem Value="DIET">Darshan Institute of Engineering and Technology</asp:ListItem>
                            <asp:ListItem Value="DIETDS">Darshan Institute of Engineering and Technology for Diploma Studies</asp:ListItem>
                            <asp:ListItem Value="SOE">School of Engineering - Darshan Institute of Engineering and Technology</asp:ListItem>
                            <asp:ListItem Value="DIET">Darshan University</asp:ListItem>
                        </asp:DropDownList>
                        <td class="auto-style1">
                            <asp:RequiredFieldValidator ID="rfvInstitute" runat="server" ControlToValidate="ddlInstitute" Display="None" ErrorMessage="Select Institute" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
                        </td>
                        <td class="auto-style1"></td>
                </tr>
                <tr class="mb-3">
                    <td>Department<span class="text-danger">*</span></td>
                    <td>:</td>
                    <td>
                        <asp:DropDownList ID="ddlDepartment" runat="server" class="form-control">
                            <asp:ListItem Value="-1">Select Department</asp:ListItem>
                            <asp:ListItem Value="CE">Computer Engineering</asp:ListItem>
                            <asp:ListItem Value="ME">Mechnical Engineerings</asp:ListItem>
                            <asp:ListItem Value="CI">Civil Engineering</asp:ListItem>
                            <asp:ListItem Value="EE">ElectricalEngineering</asp:ListItem>
                        </asp:DropDownList>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvDepartment" runat="server" ControlToValidate="ddlDepartment" Display="None" ErrorMessage="Select Department" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;</td>
                </tr>
                <tr class="mb-3">
                    <td>BirthDate<span class="text-danger">*</span></td>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtBirthDate" runat="server" class="form-control"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvBirthDate" runat="server" ControlToValidate="txtBirthDate" Display="None" EnableTheming="False" ErrorMessage="BirthDate is required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvBirthDate" runat="server" ControlToValidate="txtBirthDate" Display="None" ErrorMessage="Enter Valid Date" ForeColor="Red" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr class="mb-3">
                    <td>Semester<span class="text-danger">*</span></td>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtSemester" runat="server" class="form-control"></asp:TextBox></td>
                    <td>
                        <asp:RangeValidator ID="rvSemester" runat="server" ControlToValidate="txtSemester" Display="None" ErrorMessage="Enter valid Semester between (1 to 8)" ForeColor="Red" MaximumValue="8" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr class="mb-3">
                    <td>Email<span class="text-danger">*</span></td>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox></td>
                    <td>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" Display="None" ErrorMessage="Enter Valid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr class="mb-3">
                    <td>Mobile No<span class="text-danger">*</span></td>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtMobileNo" runat="server" class="form-control"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvMobileNo" runat="server" ControlToValidate="txtMobileNo" Display="None" ErrorMessage="Mobile No is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr class="mb-3">
                    <td class="auto-style1">Password<span class="text-danger">*</span></td>
                    <td class="auto-style1">:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" MaxLength="8"></asp:TextBox></td>
                    <td class="auto-style1">
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" Display="None" ErrorMessage="Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr class="mb-3">
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">
                        <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword" Display="None" ErrorMessage="Enter strong Password" ForeColor="Red" ValidationExpression="^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&amp;])[A-Za-z\d@$!%?&amp;]{8,}$"></asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr class="mb-3">
                    <td>Confirm Password<span class="text-danger">*</span></td>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" class="form-control" TextMode="Password" MaxLength="8"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" Display="None" ErrorMessage="Confirm Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr class="mb-3">
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" Display="None" ErrorMessage="Confirm Password must be same as Password" ForeColor="Red"></asp:CompareValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td colspan="2">
                        <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-success" OnClick="btnSave_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
