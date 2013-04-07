<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUS.aspx.cs" Inherits="NotAuthenticated_ContactUS" Culture="auto:en-us" UICulture="auto:en-us" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainLowerButtons.ascx" %>
<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <script type="text/javascript" src="../scripts/jquery-1.5.2.js"></script>
    <link rel="stylesheet" href="../_assets/css/TemplateStyleSheet.css" type="text/css"
        media="screen" />
    <link href="../_assets/css/TemplateMo.css" rel="stylesheet" type="text/css" />
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
</head>
<body>
    <form id="form1" runat="server">
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
    <asp:AjaxScriptManager ID="ScriptManager1" runat="server">
    </asp:AjaxScriptManager>

    <div id="wrapper" style="padding: 25px">
        <table align="center" id="TemplateGlobalTable">
            <tr>
                <td>

                        <table cellpadding="0px" cellspacing="0px" style="width: 960px">
                            <tr style="background-color: #39414A">
                                <td>
                                    <br />
                                    <br>
                                </td>
                            </tr>
                            <tr style="background-color: White">
                                <td>
                                    <table align="center" cellpadding="0px" cellspacing="0px" style="width: 580px">
                                        <tr>
                                            <td>
                                                <div id="templatemo_main1" align="left">
                                                    <h2>
                                                        Contact Me</h2>
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <div class="col_w630 float_l">
                                                                <div id="contact_form form">
                                                                    <h4>
                                                                        For serious projects/positions:</h4>
                                                                    <label for="author" class="contact_label">
                                                                        Name:</label>
                                                                    <asp:TextBox ID="NameTextBox" class="contact_input_field" runat="server"></asp:TextBox>
                                                                    <br />
                                                                    <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ControlToValidate="NameTextBox"
                                                                        Display="Dynamic" ErrorMessage="Name is Required" Font-Size="14px">Name is Required</asp:RequiredFieldValidator>
                                                                    <div class="cleaner h10">
                                                                    </div>
                                                                    <label for="email" class="contact_label">
                                                                        Email:</label>
                                                                    <asp:TextBox ID="EmailTextBox" class="contact_input_field" runat="server"></asp:TextBox>
                                                                    <br />
                                                                    <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" ControlToValidate="EmailTextBox"
                                                                        Display="Dynamic" ErrorMessage="Email address is Required" SetFocusOnError="True"
                                                                        Font-Size="14px">Email address is Required</asp:RequiredFieldValidator>
                                                                    <br />
                                                                    <asp:RegularExpressionValidator ID="EmailAddressRegularExpressionValidator" runat="server"
                                                                        ErrorMessage="Please enter a valid email address." ControlToValidate="EmailTextBox"
                                                                        Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                        Font-Size="14px">Please enter a valid email address.</asp:RegularExpressionValidator>
                                                                    <br />
                                                                    <label for="text" class="contact_label2">
                                                                        Message:</label>
                                                                    <div class="cleaner h10">
                                                                        <cc1:Editor ID="Editor1" runat="server" Width="450px" Height="210px" />
                                                                    </div>
                                                                    <div id="spacing" style="width: 428px; height: 210px; padding: 10px; color: red;
                                                                        border: 1px solid #CCC; background: #e8e8e8;">
                                                                    </div>
                                                                    <br />
                                                                    <br />
                                                                    <table width="470px" style="border-bottom-color: #A3A3A3; border-bottom-width: 1px;
                                                                        border-bottom-style: solid; border-top-color: #A3A3A3; border-top-width: 1px;
                                                                        border-top-style: solid">
                                                                        <tr>
                                                                            <td>
                                                                                <img src="JpegImage.aspx" alt="" />
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;&nbsp;
                                                                                <asp:TextBox ID="txtCapText" runat="server" Width="140px" Height="19px"></asp:TextBox>&nbsp;&nbsp;
                                                                                <asp:Button ID="ValidateButton" runat="server" Style="color: #003366; font-weight: 700"
                                                                                    Text="Validate" OnClick="ValidateButton_Click" />
                                                                                <br />
                                                                                <asp:CustomValidator ID="CustomCaptchaValidator" runat="server" ErrorMessage="CustomValidator"
                                                                                    OnServerValidate="CustomCaptchaValidator_ServerValidate" ControlToValidate="txtCapText"
                                                                                    SetFocusOnError="True">*</asp:CustomValidator>
                                                                                <asp:RequiredFieldValidator ID="CapRequiredFieldValidator" runat="server" ControlToValidate="txtCapText"
                                                                                    Display="Dynamic" ErrorMessage="No Match">*</asp:RequiredFieldValidator>
                                                                                <asp:Label ID="CaptchLabel" runat="server" ForeColor="Red" Visible="true">*</asp:Label>
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <br />
                                                                    <asp:Button ID="SubmitButton" runat="server" class="contact_submit_btn float_l" Text="Send"
                                                                        OnClick="SubmitButton_Click" />
                                                                    <asp:Button ID="ResetButton" runat="server" class="contact_submit_btn float_r" Text="Reset"
                                                                        OnClick="ResetButton_Click" />
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:PostBackTrigger ControlID="ValidateButton" />
                                                            <asp:PostBackTrigger ControlID="SubmitButton" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                   
                                                </div>
                                                <div class="col_w300 float_r">
                                                    <div class="col_fw">
                                                        <h3 style="text-align: center" class="MoneyStyle">
                                                            Time = Money</h3>
                                                        <a id="Salary" href="http://www.indeed.com/salary?q1=Solutions+Architect&l1=United+States&q2=Senior+Net+Developer&l2=United+States&q3=Senior+Web+Developer&l3=United+States"
                                                            target="_blank">
                                                            <img alt="Custom" id="SalaryImage" class="Custom" src="http://www.haithem-araissia.com/CSS/images/Contact/businessman.jpg" /><br />
                                                        </a>
                                                        <br />
                                                        <h3 style="text-align: center">
                                                            Value Your <span class="Maroon">Time</span></h3>
                                                    </div>
                                                </div>
                                                <div class="cleaner">
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>









                </td>
            </tr>
        </table>
    </div>
    <div class="cleaner">
    </div>
    <LowerNavigationButtons:NavigationButtons ID="MainLowerNavigationButtons" runat="server" />
    </form>
</body>
</html>
