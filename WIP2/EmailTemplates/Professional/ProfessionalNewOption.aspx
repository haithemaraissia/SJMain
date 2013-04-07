<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProfessionalNewOption.aspx.cs"
    Inherits="EmailTemplates.Professional.EmailTemplatesProfessionalInsideWebsiteProfessionalNewOption" %>

<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="~/common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="~/common/TemplateMainLowerButtons.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script type="text/javascript" src="../../scripts/jquery-1.5.2.js"></script>
    <link rel="stylesheet" href="../../_assets/css/TemplateStyleSheet.css" type="text/css"
        media="screen" />
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
    <title id="Title1" runat="server" title="<%$ Resources:Resource, Notification %>">
    </title>
    <style type="text/css">
        .DarkRed
        {
            color: #800000;
        }
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div id="wrapper" style="padding: 25px">
        <table align="center" id="TemplateGlobalTable">
            <tr>
                <td>
    <div>
        <h2>
            <asp:Label ID="ProjectNotification" runat="server" Text=""></asp:Label>
        </h2>
        <p>
            <asp:Label ID="DearLabel" runat="server" Text="<%$ Resources:Resource, Dear%>"></asp:Label>
            <span class="DarkRed"><strong>
                <asp:Label ID="UsernameLabel" runat="server" Text=""></asp:Label></strong></span><asp:Label
                    ID="CommaLabel" runat="server" Text="<%$ Resources:Resource, Comma%>"></asp:Label>
        </p>
        <p>
            <asp:Label ID="OurRecordsIndicateLabel" runat="server" Text="<%$ Resources:Resource, OurRecordsIndicate%>"></asp:Label>
            <asp:Label ID="BidderLabel" runat="server" Text="<%$ Resources:Resource, Bidder%>"></asp:Label>
            <span class="DarkRed"><strong>
                <asp:Label ID="Bidder" runat="server" Text=""></asp:Label></strong></span>
            <asp:Label ID="HasSecondbidLabel" runat="server" Text="<%$ Resources:Resource, HasSecondbid%>"></asp:Label><asp:Label
                ID="TwoOlumn" runat="server" Text="<%$ Resources:Resource, TwoComma%>"></asp:Label>
            <span class="DarkRed"><strong>
                <asp:Label ID="NewBidAmount" runat="server" Text="" />
                <asp:Label ID="Currency" runat="server" Text=""></asp:Label></strong></span><br />
            <br />
            <asp:Label ID="WeOfferFollowingLabel" runat="server" Text="<%$ Resources:Resource, WeOfferFollowing%>"></asp:Label>
            <p>
                <asp:RadioButtonList ID="SelectionRadioButtonList" runat="server">
                    <asp:ListItem Text="<%$ Resources:Resource, NewAgreementProject%>" Value="1"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, ExtendProjectDuration%>" Value="2"></asp:ListItem>
                </asp:RadioButtonList>
            </p>
            <p>
                <asp:Button ID="ConfirmYourChoiceButton" runat="server" Text="<%$ Resources:Resource, PleaseConfirmYourChoice%>"
                    OnClick="ConfirmYourChoiceButtonClick"></asp:Button>
            </p>
            <p>
                <asp:Label ID="ThankYouLabel" runat="server" Text="<%$ Resources:Resource, ThankYou%>"></asp:Label><br />
            </p>
        </p>
        <p>
            <asp:Panel ID="ThankYouPanel" runat="server" Height="150px" Style="display: block;
                left: 91px; position: relative; top: 308px; z-index: 103; text-align: center;"
                Width="473px">
                <cc1:ModalPopupExtender ID="ThankYouPanelModalPopupExtender" runat="server" TargetControlID="ThankYouTargetedLabel"
                    PopupControlID="ThankYouPanel" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>
                <cc1:RoundedCornersExtender ID="ThankYouRoundedCornersExtender" runat="server" BorderColor="64, 0, 0"
                    Color="64, 0, 0" Enabled="True" TargetControlID="ThankYouMessage">
                </cc1:RoundedCornersExtender>
                <asp:Panel ID="ThankYouMessage" runat="server" BackColor="White">
                    <p>
                        <br />
                    </p>
                    <p>
                        <asp:Label ID="ThankYouTargetedLabel" runat="server" Style="position: relative" Width="153px"
                            Text="<%$ Resources:Resource, ThankyouForConfirmingYourSelection%>"></asp:Label>
                    </p>
                    <p>
                        <asp:Button ID="OkButton" runat="server" Text="<%$ Resources:Resource, OK%>" OnClick="OkButtonClick" />
                    </p>
                </asp:Panel>
            </asp:Panel>
        </p>
    </div>
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
