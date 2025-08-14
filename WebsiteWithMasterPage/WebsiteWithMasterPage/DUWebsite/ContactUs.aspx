<%@ Page Title="" Language="C#" MasterPageFile="~/Content/DUMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="WebsiteWithMasterPage.DUWebsite.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <p class="g-color-gray-dark-v5 g-mb-0 g-font-size-12">
    <i>Fill up the form and hit the "Send Message". Our representatives will get back to you as soon as possible.</i>
</p>


<form class="border border-info " action="/contact-us/form-submit" data-ajax="true" data-ajax-method="Post" data-ajax-mode="replace" data-ajax-update="#divContactUsForm" id="formContactUs" method="post"><input name="__RequestVerificationToken" type="hidden" value="ByBtLTxPwBOZYjkskMHpv5Z4P_EEq-t2YUyXx3rqXJ-A_kGJ9VowPw4WWh7dvNm2nZ-FCgpiK7z37iWgrPvU0PyLEVfKBgIW_ZmDxc8sicQ1" />                                
    <div class="row g-mt-15 p-5">
                                    <div class="col-md-12">

                                        <div class="form-group row g-mb-5">
                                            <label class="col-sm-3 col-form-label g-mb-10 g-font-weight-600">Name</label>
                                            <div class="col-sm-9">
                                                <asp:TextBox ID="txtContName" runat="server" placeholder="Enter your name"/>
                                                <span class="field-validation-valid text-danger" data-valmsg-for="Name" data-valmsg-replace="true"></span>
                                            </div>
                                        </div>

                                        <div class="form-group row g-mb-5">
                                            <label class="col-sm-3 col-form-label g-mb-10 g-font-weight-600">Email</label>
                                            <div class="col-sm-9">
                                                <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter your email"/>
                                                <span class="field-validation-valid text-danger" data-valmsg-for="Email" data-valmsg-replace="true"></span>
                                            </div>
                                        </div>

                                        <div class="form-group row g-mb-5">
                                            <label class="col-sm-3 col-form-label g-mb-10 g-font-weight-600">Mobile No. <small>(optional)</small></label>
                                            <div class="col-sm-9">
                                                <input class="form-control g-color-main g-brd-gray-light-v4 g-brd-primary--focus g-bg-white rounded g-py-8 g-px-10" data-val="true" data-val-length="Please enter valid 10 digit Mobile No." data-val-length-max="10" data-val-length-min="10" id="MobileNo" name="MobileNo" placeholder="Enter your mobile no." step="1" type="number" value="" />
                                                <span class="field-validation-valid text-danger" data-valmsg-for="MobileNo" data-valmsg-replace="true"></span>
                                            </div>
                                        </div>

                                        

                                        <div class="form-group row g-mb-5">
                                            <label class="col-sm-3 col-form-label g-mb-10 g-font-weight-600">Subject</label>
                                            <div class="col-sm-9">
                                                <input class="form-control g-color-main g-brd-gray-light-v4 g-brd-primary--focus g-bg-white rounded g-py-8 g-px-10" data-val="true" data-val-required="Please enter Subject." id="Subject" name="Subject" placeholder="Enter Subject" type="text" value="" />
                                                <span class="field-validation-valid text-danger" data-valmsg-for="Subject" data-valmsg-replace="true"></span>
                                            </div>
                                        </div>

                                        <div class="form-group row g-mb-5">
                                            <label class="col-sm-3 col-form-label g-mb-10 g-font-weight-600">Message</label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control g-color-main g-brd-gray-light-v4 g-brd-primary--focus rounded g-py-8 g-px-10" cols="20" data-val="true" data-val-required="Please enter Message." id="Message" name="Message" placeholder="Type your message here" rows="3">
</textarea>
                                                <span class="field-validation-valid text-danger" data-valmsg-for="Message" data-valmsg-replace="true"></span>
                                            </div>
                                        </div>

                                        <div class="form-group row g-mb-5">
                                            <label class="col-sm-3 col-form-label g-mb-10 g-font-weight-600"></label>
                                            <div class="col-sm-9">
                                                <div id="html_element"></div>
                                                <div id="validation-message-rechaptcha" class="text-danger" style="display: none;">Please verify this.</div>
                                            </div>
                                        </div>

                                        <div class="form-group row g-mb-5 g-pt-15">
                                            <label class="col-sm-3 col-form-label g-mb-10 g-font-weight-600"></label>
                                            <div class="col-sm-9">
                                                <button class="btn u-btn-primary g-font-weight-600 g-font-size-13 text-uppercase rounded-3 g-py-6 g-px-20" type="button" id="btnSubmitContactUsForm">Send Message</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
     <asp:Image ID="imgDULogo" runat="server" SkinID="SkinimgDULogo"/>

</form>
                                    
</asp:Content>
