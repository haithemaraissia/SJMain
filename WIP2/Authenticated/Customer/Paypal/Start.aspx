<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Start.aspx.cs" Inherits="Paypal_Start" %>

<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../../../common/CustomerTemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../../../common/TemplateMainLowerButtons.ascx" %>
<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <script type="text/javascript" src="../../../scripts/jquery-1.5.2.js"></script>
    <link rel="stylesheet" href="../../../_assets/css/TemplateStyleSheet.css" type="text/css"
        media="screen" />
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
</head>
<body>
    <form id="form1" runat="server">
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
    <asp:AjaxScriptManager ID="ScriptManager1" runat="server">
    </asp:AjaxScriptManager>
    <div id="wrapper" style="padding: 25px; vertical-align: middle">
        <div align="center">
            <h2 id="H2HowDoesitWork" style="width: 960px">
                <asp:Label ID="HowDoesitWorkLabel" runat="server" Text="<%$ Resources:Resource, PaymentProcess %>"
                    Font-Bold="True" Font-Size="Large"></asp:Label></h2>
        </div>
        <table align="center" id="TemplateGlobalTable" style="vertical-align: middle">
            <tr align="center">
                <td style="padding-bottom: 15px">
                    <asp:Panel ID="PaypalPayment" runat="server" Height="160px" Width="400px" Style="text-align: right;
                        padding: 10px" BackColor="#CCCCCC">
                        <div id="Paypal" runat="server" style="background-color: White; height: 158px; width: 398px">
                            <asp:UpdatePanel ID="PayPalUpdatePanel" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table cellpadding="5px" cellspacing="5px">
                                        <tr>
                                            <td colspan="4">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="CurrencyLabel" runat="server" Text="<%$ Resources:Resource, CurrencyLabel %>"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="CurrencyDropDownList" runat="server" OnSelectedIndexChanged="Currency_SelectedIndexChanged"
                                                    AutoPostBack="True">
                                                    <asp:ListItem Value="AUD" Text="<%$ Resources:Resource, AustralianDollar %>"></asp:ListItem>
                                                    <asp:ListItem Value="CAD" Text="<%$ Resources:Resource, CanadianDollar %>"></asp:ListItem>
                                                    <asp:ListItem Value="EUR" Text="<%$ Resources:Resource, Euro %>"></asp:ListItem>
                                                    <asp:ListItem Value="GBP" Text="<%$ Resources:Resource, BritishPound %>"></asp:ListItem>
                                                    <asp:ListItem Value="JPY" Text="<%$ Resources:Resource, JapaneseYen %>"></asp:ListItem>
                                                    <asp:ListItem Value="USD" Text="<%$ Resources:Resource, USDollar %>" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Value="NZD" Text="<%$ Resources:Resource, NewZealandDollar %>"></asp:ListItem>
                                                    <asp:ListItem Value="CHF" Text="<%$ Resources:Resource, SwissFranc %>"></asp:ListItem>
                                                    <asp:ListItem Value="HKD" Text="<%$ Resources:Resource, HongKongDollar %>"></asp:ListItem>
                                                    <asp:ListItem Value="SGD" Text="<%$ Resources:Resource, SingaporeDollar %>"></asp:ListItem>
                                                    <asp:ListItem Value="SEK" Text="<%$ Resources:Resource, SwedishKrona %>"></asp:ListItem>
                                                    <asp:ListItem Value="DKK" Text="<%$ Resources:Resource, DanishKrone %>"></asp:ListItem>
                                                    <asp:ListItem Value="PLN" Text="<%$ Resources:Resource, PolishZłoty %>"></asp:ListItem>
                                                    <asp:ListItem Value="NOK" Text="<%$ Resources:Resource, NorwegianKrone %>"></asp:ListItem>
                                                    <asp:ListItem Value="HUF" Text="<%$ Resources:Resource, HungarianForint %>"></asp:ListItem>
                                                    <asp:ListItem Value="CZK" Text="<%$ Resources:Resource, CzechKoruna %>"></asp:ListItem>
                                                    <asp:ListItem Value="ILS" Text="<%$ Resources:Resource, IsraeliNewShekel %>"></asp:ListItem>
                                                    <asp:ListItem Value="MXN" Text="<%$ Resources:Resource, MexicanPeso %>"></asp:ListItem>
                                                    <asp:ListItem Value="PHP" Text="<%$ Resources:Resource, PhilippinePeso %>"></asp:ListItem>
                                                    <asp:ListItem Value="TWD" Text="<%$ Resources:Resource, NewTaiwanDollar %>"></asp:ListItem>
                                                    <asp:ListItem Value="THB" Text="<%$ Resources:Resource, ThaiBaht %>"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:Label ID="FeesLabel" runat="server" Text="<%$ Resources:Resource, Fees %>"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label runat="server" ID="Amount" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Label ID="HiddenLabel" runat="server" Text=""></asp:Label>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="CurrencyDropDownList" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:ImageButton ID="PayPalImageButton" runat="server" ImageUrl="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif"
                                OnClick="PayPalImageButton_Click" />
                        </div>
                    </asp:Panel>
                    <cc1:RoundedCornersExtender ID="PaypalPayment_RoundedCornersExtender" runat="server"
                        BorderColor="Gray" Color="Gray" Enabled="True" Radius="20" TargetControlID="PaypalPayment">
                    </cc1:RoundedCornersExtender>
                </td>
            </tr>
            <tr>
                <td style="padding-bottom: 15px">
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
