<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PasswordRecovery.aspx.vb"
    Inherits="NotAuthenticated.PasswordRecovery" %>

<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainLowerButtons.ascx" %>
<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, RecoverYourPassword %>">
    </title>
    <script type="text/javascript" src="../scripts/jquery-1.5.2.js"></script>
    <link rel="stylesheet" href="../_assets/css/TemplateStyleSheet.css" type="text/css"
        media="screen" />
    <meta property="og:url" content="https://www.my-side.job.com" />
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
                <td runat="server" align="center">
                    <asp:Panel ID="OuterLayer" runat="server" Width="750px">
                        <h2>
                            <asp:Label ID="ForgotPasswordLabel" runat="server" Text="<%$ Resources:Resource, ForgotPassword %>"
                                BackColor="Maroon" ForeColor="White" Width="100%"></asp:Label>
                        </h2>
                        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" BorderColor="#E6E2D8"
                            BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Size="Large" Width="750px"
                            Height="400px" OnSendingMail="PasswordRecovery1SendingMail">
                            <MailDefinition From="postmaster@my-side-job.com" Subject="<%$ Resources:Resource, ForgotPassword %>"
                                Priority="High" BodyFileName="../EmailTemplates/PasswordRecovery.aspx" IsBodyHtml="true">
                            </MailDefinition>
                            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                            <SuccessTextStyle Font-Bold="True" ForeColor="#5D7B9D" />
                            <TextBoxStyle Font-Size="Medium" />
                            <UserNameTemplate>
                                <span style="text-align: center">
                                    <h2>
                                        <asp:Label ID="ForgotPasswordLabel" runat="server" Text="<%$ Resources:Resource, ForgotPassword %>"></asp:Label>
                                    </h2>
                                    <fieldset class="login">
                                        <p>
                                            &nbsp;</p>
                                        <asp:Label ID="UserNameLabel" runat="server" Text="<%$ Resources:Resource, Username1 %>"
                                            CssClass="label" Font-Size="Large"></asp:Label>&nbsp;
                                        <asp:TextBox ID="UserName" runat="server" Width="236px"></asp:TextBox>&nbsp;<asp:Button
                                            ID="SubmitButton" runat="server" Text="<%$ Resources:Resource, Send %>" CommandName="Submit"
                                            Width="103px" />
                                        <br />
                                        <br />
                                        <span style="color: #FF0000; font-size: large">
                                            <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                                        </span>
                                </span>&nbsp;&nbsp;</fieldset>
                                <br />
                                <br />
                            </UserNameTemplate>
                            <QuestionTemplate>
                                <h2>
                                    <asp:Label ID="ForgotPasswordLabel2" runat="server" Text="<%$ Resources:Resource, ForgotPassword %>"></asp:Label></h2>
                                <asp:Literal ID="UserName2" runat="server"></asp:Literal><br />
                                <asp:Label ID="AnswerPasswordQuestionLabel" runat="server" Text="<%$ Resources:Resource, AnswerPasswordQuestion %>"></asp:Label>
                                <br />
                                <br />
                                <asp:Literal ID="Question" runat="server"></asp:Literal>
                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox><br />
                                <br />
                                <asp:Button ID="SubmitButton2" runat="server" Text="<%$ Resources:Resource, SendAnswerByMail %>"
                                    CommandName="Submit" /><br />
                                <asp:Literal ID="FailureText2" runat="server"></asp:Literal>
                            </QuestionTemplate>
                            <SuccessTemplate>
                                <asp:Label ID="PasswordSentLabel" runat="server" Text="<%$ Resources:Resource, PasswordSent %>"></asp:Label>
                                <asp:Label ID="EmailLabel" runat="server"></asp:Label>
                            </SuccessTemplate>
                            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                            <SubmitButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
                                BorderWidth="1px" Font-Size="0.8em" ForeColor="#284775" />
                        </asp:PasswordRecovery>
                        <asp:Label ID="LoginErrorDetails" runat="server" Height="104px" Style="position: relative;"
                            Text="" Width="298px"></asp:Label>
                    </asp:Panel>
                    <cc1:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" BorderColor="Maroon"
                        Color="Maroon" TargetControlID="PasswordRecovery1">
                    </cc1:RoundedCornersExtender>
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
