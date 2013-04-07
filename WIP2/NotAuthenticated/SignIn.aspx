<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SignIn.aspx.vb" Inherits="NotAuthenticated.SignIn" %>
<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainLowerButtons.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <script type="text/javascript" src="../scripts/jquery-1.5.2.js"></script>
    <link rel="stylesheet" href="../_assets/css/TemplateStyleSheet.css" type="text/css" media="screen" />
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
    <script type="text/javascript">
        function fireanimation() {
            document.getElementById('LoadingPanel').style.visibility = 'visible';
            window.$find('LoadingModalPopupExtender').show();
            document.body.style.overflow = 'visible';
        }
    </script>
    <style type="text/css">
        .fiftyPercent
        {
            width: 50%;
        }
    </style>
</head>
<body>
    <form id="SignInForm" runat="server">
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
    <asp:AjaxScriptManager ID="ScriptManager1" runat="server">
    </asp:AjaxScriptManager>
    <div id="wrapper" style="padding: 25px">
        <table align="center" id="TemplateGlobalTable">
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <asp:Login ID="Login1" runat="server" Width="100%" BackColor="#F7F7DE" BorderColor="#CCCC99"
                        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" RememberMeSet="True"
                        DestinationPageUrl="">
                        <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <LayoutTemplate>
                            <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;
                                width: 100%; text-align: center">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0" style="width: 100%">
                                            <tr>
                                                <td align="center" colspan="2" style="font-weight: bold; color: white; background-color: #6b696b">
                                                    <h2>
                                                        <asp:Label ID="LogInLabel" runat="server" Text="<%$ Resources:Resource, LogIn %>"></asp:Label>
                                                    </h2>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="fiftyPercent" style="text-align: right; padding: 5px">
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Text="<%$ Resources:Resource, UserName1 %>"></asp:Label>
                                                </td>
                                                <td style="text-align: left; padding: 5px">
                                                    <asp:TextBox ID="UserName" runat="server" Width="160px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                        ErrorMessage="<%$ Resources:Resource, UserNameRequiredFieldValidator %>" ToolTip="<%$ Resources:Resource, UserNameRequiredFieldValidator %>"
                                                        ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="fiftyPercent" style="text-align: right; padding: 5px">
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Text="<%$ Resources:Resource, Password1 %>"></asp:Label>
                                                </td>
                                                <td style="text-align: left; padding: 5px">
                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="160px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                        ErrorMessage="<%$ Resources:Resource, PasswordRequiredValidator %>" ToolTip="<%$ Resources:Resource, PasswordRequiredValidator %>"
                                                        ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="fiftyPercent" style="text-align: right; padding: 5px">
                                                    <asp:Label ID="RoleLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, Role %>"></asp:Label>
                                                </td>
                                                <td style="text-align: left; padding: 5px">
                                                    <asp:UpdatePanel ID="RoleUpdatePanel" runat="server">
                                                        <ContentTemplate>
                                                            <asp:DropDownList ID="RoleDropDownList" runat="server" AutoPostBack="True" Style="position: relative;
                                                                top: 0px; left: 0px; width: 170px;">
                                                                <asp:ListItem Selected="True" Text="<%$ Resources:Resource, Customer %>"></asp:ListItem>
                                                                <asp:ListItem Text="<%$ Resources:Resource, Professional %>"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:CheckBox ID="RememberMe" runat="server" Checked="True" Text="<%$ Resources:Resource, RememberMeNextTime %>" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color: red">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" OnClick="LoginButtonClick"
                                                        Text="<%$ Resources:Resource, LogIn %>" ValidationGroup="LoginUserValidationGroup" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:Login>
                </td>
            </tr>
        </table>
    </div>
    <div class="cleaner">
    </div>
    <LowerNavigationButtons:NavigationButtons ID="MainLowerNavigationButtons" runat="server" />
    <div id="LoadingDiv" style="left: 255px; width: 100px; position: absolute; top: 416px;
        height: 100px">
        <asp:UpdatePanel ID="LoadingUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <cc1:ModalPopupExtender ID="LoadingModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                    PopupControlID="LoadingPanel" TargetControlID="LoadingPanel" RepositionMode="RepositionOnWindowResize">
                </cc1:ModalPopupExtender>
                &nbsp; &nbsp;
                <asp:Panel ID="LoadingPanel" runat="server" Height="45px" Style="display: none; left: 36px;
                    position: absolute; top: 48px" Width="196px">
                    &nbsp;
                    <asp:Label ID="LoadingLabel" runat="server" Font-Bold="True" ForeColor="White" Style="left: 63px;
                        position: absolute; top: 25px" Text="<%$ Resources:Resource, Loading %>"></asp:Label>
                    <img src="../_assets/img/uploading.gif" style="left: 0px; position: relative; top: -9px"
                        alt="loading image" />
                </asp:Panel>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
