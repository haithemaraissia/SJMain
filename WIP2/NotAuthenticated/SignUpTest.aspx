<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SignUpTest.aspx.vb" Inherits="NotAuthenticated_SignUpTest" Culture="auto:en-US" UICulture="auto:en-US" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainLowerButtons.ascx" %>
<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <script type="text/javascript" src="../scripts/jquery-1.5.2.js"></script>
    <link rel="stylesheet" href="../_assets/css/TemplateStyleSheet.css" type="text/css"
        media="screen" />
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
    <script type="text/javascript">
        $(function ($) {
            $(document).ready(function () {

                $("#SignUpCreateWizard_CreateUserStepContainer_ProfessionalLinkButton").hover(
  function () {
      $('#SignUpCreateWizard_CreateUserStepContainer_professionalcolumn').css("background-color", "#003366");
  },
  function () {
      $('#SignUpCreateWizard_CreateUserStepContainer_professionalcolumn').css("background-color", "#FFFFFF");
  }
  );


                $("#SignUpCreateWizard_CreateUserStepContainer_CustomerLinkButton").hover(
  function () {
      $('#SignUpCreateWizard_CreateUserStepContainer_customercolumn').css("background-color", "#800000");
  },
  function () {
      $('#SignUpCreateWizard_CreateUserStepContainer_customercolumn').css("background-color", "#FFFFFF");
  }
  );


            });

        })(jQuery);
    </script>
     <link rel="stylesheet" href="../_assets/css/HomeStyleSheet.css" type="text/css" media="screen" />
  <link type="text/css" href="../_assets/css/fg.menu.css" media="screen" rel="stylesheet" />
    <script language="javascript" type="text/javascript">
        function Overflow() {
            document.getElementById('ProfessionalPanel').style.visibility = 'visible';
            $find('ProfessionalPanelModalPopupExtender').show();
            document.body.style.overflow = 'visible';
        }

        function fireanimation() {
            document.getElementById('LoadingDiv').style.visibility = 'visible';
            document.getElementById('LoadingDiv').style.display = 'block';
            $find('DelayModalPopUpExtender').show();
            document.body.style.overflow = 'visible';
        }
    </script>
    <style type="text/css">
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
        .RightText
        {
            text-align: right;
        }
    </style>   
    

</head>
<body>
    <form id="SignUpForm" runat="server">
    
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    
 </UpperNavigationButtons:NavigationButtons>
    <asp:AjaxScriptManager ID="ScriptManager1" runat="server">
        
 </asp:AjaxScriptManager>
    <div id="wrapper" style="padding-top: 25px; padding-bottom:18px">
    <table align="center">
        <tr>
            <td>
                <div style="z-index: 101;">
                    <asp:CreateUserWizard ID="SignUpCreateWizard" runat="server" DisplayCancelButton="True"
                        Height="438px" Width="809px" CancelDestinationPageUrl="Index.aspx" 
                        BackColor="White">
                        <WizardSteps>
                            <asp:CreateUserWizardStep ID="SignUpCreateWizardStep1" runat="server">
                                <ContentTemplate>
                                    <table border="0" style="font-size: 100%; width: 928px; height: 481px">
                                        <tr>
                                            <td align="center" colspan="7" style="text-align: center">
                                                &nbsp; &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="3" style="height: 8px; text-align: left;">
                                                <div id="GrettingPanel" style=" width: 338px;
                                                    height: 94px">
                                                    <asp:Label ID="WelcomeGreetingLabel" runat="server" Text="<%$ Resources:Resource, WelcomeGreeting%>"></asp:Label>&nbsp;
                                                    <asp:Label ID="YourSideJobLabel" runat="server" Font-Size="X-Large" ForeColor="#660000"
                                                        Text="Your Side Job"></asp:Label><br />
                                                    <asp:Label ID="ThankyouGreetingLabel" runat="server" Height="72px" Text="<%$ Resources:Resource, ThankyouGreeting%>"
                                                        Width="378px"></asp:Label><br />
                                                </div>
                                            </td>
                                            <td align="center" colspan="1" style="width: 137px; height: 8px;">
                                            </td>
                                            <td align="center" colspan="3" style="text-align: right; height: 8px;">
                                                <div align="right">
                                                    <table style="vertical-align: top">
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td class="RightText">
                                                                <asp:HyperLink ID="HomeHyperLink" runat="server" Font-Size="11pt" NavigateUrl="~/NotAuthenticated/Index.aspx"
                                                                    TabIndex="27" Text="<%$ Resources:Resource, Home %>" 
                                                                    Font-Underline="False"></asp:HyperLink>&nbsp;&nbsp;
                                                                <asp:HyperLink ID="HelpHyperLink" runat="server" Font-Size="11pt" NavigateUrl="~/NotAuthenticated/Help.aspx"
                                                                    ToolTip="<%$ Resources:Resource, HelpToolTip %>" TabIndex="26" 
                                                                    Text="<%$ Resources:Resource, Help %>" Font-Underline="False"></asp:HyperLink>
                                                            </td>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td class="RightText">
                                                                    <asp:Label ID="MemberLabel" runat="server" TabIndex="25" Text="<%$ Resources:Resource, MemberLabel %>"
                                                                        Width="173px"></asp:Label>&nbsp;&nbsp;&nbsp;
                                                                    <asp:Button ID="SignInButton" runat="server" Font-Size="11pt" Text="<%$ Resources:Resource, SignInButton %>"
                                                                        Width="123px" OnClick="SignInButton_Click" TabIndex="24" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                </td>
                                                                <td class="RightText">
                                                                    <asp:HyperLink ID="UserRecoveryHyperLink" runat="server" Font-Size="11pt" NavigateUrl="~/NotAuthenticated/PasswordRecovery.aspx"
                                                                        TabIndex="28" Width="246px" 
                                                                        Text="<%$ Resources:Resource, ForgotUsername %>" Font-Underline="False"></asp:HyperLink>
                                                                </td>
                                                            </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="7" style="height: 1px">
                                                <asp:Label ID="SignUpLabel" runat="server" Font-Bold="True" ForeColor="Black" TabIndex="100"
                                                    Text="<%$ Resources:Resource, SignUpAs %>"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="7" style="height: 1px">
                                                <asp:UpdatePanel ID="RoleUpdatePanel" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <table style="width: 100%; height: 73px; text-align: center; background-color: White">
                                                            <tr>
                                                                <td id="customercolumn"  runat="server" bgcolor="Maroon">
                                                                    <asp:LinkButton ID="CustomerLinkButton" runat="server" BackColor="Maroon" BorderColor="Maroon"
                                                                        BorderStyle="Outset" BorderWidth="3px" Font-Bold="True" Font-Underline="False"
                                                                        ForeColor="White" TabIndex="22" Width="170px" 
                                                                        Text="<%$ Resources:Resource, Customer %>"></asp:LinkButton>
                                                                </td>
                                                                <td id="professionalcolumn"  runat="server">
                                                                    <asp:LinkButton ID="ProfessionalLinkButton" runat="server" BackColor="#003366" BorderColor="#003366"
                                                                        BorderStyle="Outset" CausesValidation="False" Font-Underline="False" ForeColor="White"
                                                                        OnClientClick="Overflow();" TabIndex="23" Width="170px" 
                                                                        Text="<%$ Resources:Resource, professional %>" BorderWidth="3px"></asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:Label ID="RoleLabel" runat="server" Style="position: relative" TabIndex="99"
                                                            Text="<%$ Resources:Resource, Customer %>" Font-Bold="True" 
                                                            ForeColor="Maroon"></asp:Label>
                                                        &nbsp;
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="SaveSkillsButton" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="3" style="height: 21px; text-align: left">
                                                <span style="font-size: 11pt; color: #660000"><strong>
                                                    <asp:Label ID="Step1Label" runat="server" Style="position: relative; font-family: Andy; font-size: 13pt;" 
                                                    Text="<%$ Resources:Resource, Step1Label %>" ForeColor="Black"></asp:Label></strong></span>
                                            </td>
                                            <td align="center" colspan="1" style="width: 77px; height: 21px;">
                                            </td>
                                            <td align="center" colspan="1" style="width: 474px; height: 21px;">
                                            </td>
                                            <td align="center" colspan="1" style="width: 5915px; height: 21px;">
                                            </td>
                                            <td align="center" colspan="1" style="width: 5335px; height: 21px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="height: 1px; text-align: left">
                                            </td>
                                            <td align="center" colspan="5" style="height: 1px; background-color: #E0E0E0" 
                                                id="step1Column" runat="server">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 14524px; height: 31px; text-align: center">
                                                <span style="font-size: 11pt"></span>
                                            </td>
                                            <td align="right" style="width: 7156px; height: 31px; text-align: center">
                                                <span style="font-size: 11pt">
                                                    <asp:Label ID="FirstNameLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, FirstNameLabel %>"></asp:Label></span>
                                            </td>
                                            <td style="width: 1790px; height: 31px;">
                                                <asp:TextBox ID="FirstNameTextBox" runat="server" Font-Size="11pt" MaxLength="10"
                                                    TabIndex="1"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" runat="server" ControlToValidate="FirstNameTextBox"
                                                    ErrorMessage="<%$ Resources:Resource, FirstNameValidator %>" ToolTip="<%$ Resources:Resource, FirstNameToolTip %>"
                                                    ValidationGroup="SignUpCreateWizard" Font-Size="11pt" Display="None" SetFocusOnError="True">*</asp:RequiredFieldValidator>&nbsp;
                                            </td>
                                            <td style="width: 77px; height: 31px; text-align: center;">
                                                <span style="font-size: 11pt"></span>
                                            </td>
                                            <td style="width: 474px; height: 31px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 5915px; height: 31px; text-align: center;">
                                                <span style="font-size: 11pt">
                                                    <asp:Label ID="LastNameLabel" runat="server" Style="left: 0px; position: relative"
                                                        Text="<%$ Resources:Resource, LastNameLabel %>" Width="48px"></asp:Label></span>
                                            </td>
                                            <td style="width: 5335px; height: 31px;">
                                                <asp:TextBox ID="LastNameTextBox" runat="server" MaxLength="20" TabIndex="1"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" runat="server" ControlToValidate="LastNameTextBox"
                                                    ErrorMessage="<%$ Resources:Resource, LastNameRequiredFieldValidator %>" ToolTip="<%$ Resources:Resource, LastNameToolTip %>"
                                                    ValidationGroup="SignUpCreateWizard" Display="None" SetFocusOnError="True">*</asp:RequiredFieldValidator>&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 14524px; text-align: center; height: 60px;">
                                                <span style="font-size: 11pt"></span>
                                            </td>
                                            <td align="right" style="width: 7156px; text-align: center; height: 60px;">
                                                <span style="font-size: 11pt; vertical-align: super;">
                                                    <asp:Label ID="AddressLabel" runat="server" Style="left: 0px; position: relative"
                                                        Text="<%$ Resources:Resource, AddressLabel %>"></asp:Label></span>
                                            </td>
                                            <td colspan="3" valign="top" style="height: 60px">
                                                <br />
                                                <asp:TextBox ID="AddressTextBox" runat="server" Width="422px" Font-Size="11pt" MaxLength="60"
                                                    TabIndex="2"></asp:TextBox>
                                                <br />
                                                <asp:RequiredFieldValidator ID="AddressRequiredFieldValidator" runat="server" ControlToValidate="AddressTextBox"
                                                    ErrorMessage="<%$ Resources:Resource, AddressRequiredFieldValidator %>" ToolTip="<%$ Resources:Resource, AddressRequiredFieldValidator %>"
                                                    ValidationGroup="SignUpCreateWizard" Display="None" SetFocusOnError="True" Font-Size="Medium"
                                                    Style="position: relative">*</asp:RequiredFieldValidator>
                                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                            </td>
                                            <td style="width: 5915px; text-align: center; height: 60px;">
                                                <span style="font-size: 11pt; vertical-align: super;">
                                                    <asp:Label ID="ZipcodeLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, ZipcodeLabel %>"></asp:Label></span>
                                            </td>
                                            <td style="width: 5335px; height: 60px;" rowspan="1">
                                                <br />
                                                &nbsp;<asp:TextBox ID="ZipcodeTextBox" runat="server" Width="106px" TabIndex="3"></asp:TextBox>
                                                &nbsp;&nbsp;
                                                <br />
                                                <asp:Label ID="OnlyUSCanadaLabel" runat="server" ForeColor="Maroon" Style="position: relative"
                                                    Text="<%$ Resources:Resource, OnlyUSCanadaLabel %>"></asp:Label><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="7" style="height: 45px">
                                                <asp:Panel ID="LocationPanel" runat="server" Height="113px" Style="left: 55px; position: relative;
                                                    top: 0px" Width="808px">
                                                    <asp:Table ID="LocationTable" runat="server" Height="100%" Style="position: relative;
                                                        left: 56px;" Width="100%" HorizontalAlign="Center">
                                                        <asp:TableRow ID="CountryTableRow" runat="server" HorizontalAlign="Center" VerticalAlign="Middle"
                                                            Width="100%">
                                                            <asp:TableCell ID="CountryTableCell" runat="server" HorizontalAlign="Center" VerticalAlign="Middle"
                                                                Width="33%">
                                                                <asp:Label ID="CountryLabel" runat="server" Text="<%$ Resources:Resource, CountryLabel %>"></asp:Label>
                                                                &nbsp;&nbsp;&nbsp;
                                                                <asp:DropDownList ID="CountryDropDownList" runat="server" AutoPostBack="True" DataSourceID="CountriesDataSource"
                                                                    DataTextField="Title" DataValueField="CountryId" Font-Size="Small" Width="120px"
                                                                    OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged1" OnChange="fireanimation();">
                                                                </asp:DropDownList>
                                                                <asp:ObjectDataSource ID="CountriesDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                    SelectMethod="GetCountries" TypeName="LocationDataSetTableAdapters.CountriesUpdateTableAdapter">
                                                                </asp:ObjectDataSource>
                                                            </asp:TableCell>
                                                            <asp:TableCell ID="RegionTableCell" runat="server" HorizontalAlign="Center" VerticalAlign="Middle"
                                                                Width="33%">
                                                                <asp:UpdatePanel ID="RegionUpdatePanel" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <asp:Label ID="RegionLabel" runat="server" Text="<%$ Resources:Resource, RegionName2 %>"></asp:Label>
                                                                        &nbsp;&nbsp;
                                                                        <asp:DropDownList ID="RegionsDropDownList" runat="server" AutoPostBack="True" DataSourceID="RegionDataSource"
                                                                            DataTextField="Region" DataValueField="RegionId" Font-Size="Small" Width="120px"
                                                                           OnSelectedIndexChanged="RegionDropDownList_SelectedIndexChanged1"  OnChange="fireanimation();">
                                                                        </asp:DropDownList>
                                                                        <asp:ObjectDataSource ID="RegionDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                            SelectMethod="GetRegion" TypeName="LocationDataSetTableAdapters.regionsUpdateTableAdapter">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="CountryDropDownList" Name="CountryId" PropertyName="SelectedValue"
                                                                                    Type="Int32" />
                                                                            </SelectParameters>
                                                                        </asp:ObjectDataSource>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="CountryDropDownList" EventName="SelectedIndexChanged" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </asp:TableCell>
                                                            <asp:TableCell ID="CityTableCell" runat="server" HorizontalAlign="Center" VerticalAlign="Middle"
                                                                Width="33%" ColumnSpan="2">
                                                                <asp:UpdatePanel ID="CityUpdatePanel" runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:Label ID="CityLabel" runat="server" Text="<%$ Resources:Resource, CityLabel %>"></asp:Label>
                                                                        &nbsp;&nbsp;
                                                                        <asp:DropDownList ID="CitiesDropDownList" runat="server" AutoPostBack="True" DataSourceID="CitiesObjectDataSource"
                                                                            DataTextField="City" DataValueField="CityId" Width="150px">
                                                                        </asp:DropDownList>
                                                                        <asp:ObjectDataSource ID="CitiesObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                            SelectMethod="GetCities" TypeName="LocationDataSetTableAdapters.CitiesUpdateByRegionTableAdapter">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="RegionsDropDownList" Name="RegionId" PropertyName="SelectedValue"
                                                                                    Type="Int32" />
                                                                            </SelectParameters>
                                                                        </asp:ObjectDataSource>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 14524px; height: 45px">
                                            </td>
                                            <td align="right" style="width: 7156px; height: 45px; text-align: center;">
                                                <asp:Label ID="AgeLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, AgeLabel %>"></asp:Label>
                                            </td>
                                            <td style="width: 1790px; height: 45px">
                                                <span style="font-size: 10pt"><span style="vertical-align: text-bottom; color: #0066cc">
                                                    <asp:TextBox ID="AgeTextBox" runat="server" MaxLength="3" Width="35px" Style="position: relative"
                                                        TabIndex="6" Text="<%$ Resources:Resource, Eighteen %>"></asp:TextBox>
                                                    <asp:RangeValidator ID="AgeRangeValidator" runat="server" ControlToValidate="AgeTextBox"
                                                        Display="Dynamic" ErrorMessage="<%$ Resources:Resource, AgeRequiredFieldValidator %>"
                                                        Font-Size="11pt" MaximumValue="105" MinimumValue="18" SetFocusOnError="True"
                                                        ToolTip="<%$ Resources:Resource, AgeLimitation %>" Type="Integer" ValidationGroup="SignUpCreateWizard"
                                                        Style="position: relative">*</asp:RangeValidator>
                                                    <asp:RequiredFieldValidator ID="AgeRequiredFieldValidator" runat="server" ControlToValidate="AgeTextBox"
                                                        Display="Dynamic" ErrorMessage="<%$ Resources:Resource, AgeRequiredFieldValidator %>"
                                                        Font-Size="11pt" SetFocusOnError="True" ToolTip="<%$ Resources:Resource, AgeRequiredFieldValidator %>"
                                                        ValidationGroup="SignUpCreateWizard" Style="position: relative">*</asp:RequiredFieldValidator></span></span>
                                            </td>
                                            <td style="width: 77px; height: 45px; text-align: center;">
                                                <span style="font-size: 11pt"></span>
                                            </td>
                                            <td style="width: 474px; height: 45px; text-align: left;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 5915px; height: 45px; text-align: center;">
                                                <span style="font-size: 11pt">
                                                    <asp:Label ID="GenderLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, GenderLabel %>"></asp:Label></span>
                                            </td>
                                            <td style="width: 5335px; height: 45px">
                                                <asp:DropDownList ID="GenderDropDownList" runat="server" Font-Size="11pt" TabIndex="7">
                                                    <asp:ListItem Value="1" Text="<%$ Resources:Resource, Male %>"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="<%$ Resources:Resource, Female %>"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 14524px; height: 36px; text-align: center;">
                                                <span style="font-size: 11pt"></span>
                                            </td>
                                            <td align="right" style="width: 7156px; height: 36px; text-align: center">
                                                <span style="font-size: 11pt">
                                                    <asp:Label ID="HomeTelephoneLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, HomeTelephoneLabel %>"></asp:Label></span>
                                            </td>
                                            <td style="width: 1790px; height: 36px;">
                                                <asp:TextBox ID="HomeTelephoneTextBox" runat="server" Font-Size="11pt" MaxLength="24"
                                                    TabIndex="8"></asp:TextBox>&nbsp;
                                                <asp:RequiredFieldValidator ID="HomeTelephoneRequiredFieldValidator" runat="server"
                                                    ControlToValidate="HomeTelephoneTextBox" ErrorMessage="<%$ Resources:Resource, HomeTelephoneRequiredFieldValidator %>"
                                                    ToolTip="<%$ Resources:Resource, HomeTelephoneToolTip %>" ValidationGroup="SignUpCreateWizard"
                                                    Display="None" Font-Size="11pt" SetFocusOnError="True">*</asp:RequiredFieldValidator>&nbsp;
                                                <asp:RegularExpressionValidator ID="HomeTelephoneRegularExpressionValidator" runat="server"
                                                    ControlToValidate="HomeTelephoneTextBox" Display="None" ErrorMessage="<%$ Resources:Resource, HomeTelephoneRegularExpressionValidator %>"
                                                    Font-Size="11pt" SetFocusOnError="True" ToolTip="<%$ Resources:Resource, HomeTelephoneRegularExpressionValidator %>"
                                                    ValidationExpression="^\d{8,24}$" ValidationGroup="SignUpCreateWizard">*</asp:RegularExpressionValidator>
                                            </td>
                                            <td colspan="2" style="height: 36px">
                                                <span style="font-size: 10pt"><span style="color: #0066cc"></span></span>
                                            </td>
                                            <td style="width: 5915px; height: 36px; text-align: center;">
                                                <span style="font-size: 11pt">
                                                    <asp:Label ID="MobileTelephoneLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, MobileTelephoneLabel %>"></asp:Label></span>
                                            </td>
                                            <td style="width: 5335px; height: 36px;">
                                                <asp:TextBox ID="MobilePhoneTextBox" runat="server" Font-Size="11pt" MaxLength="24"
                                                    TabIndex="9"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="MobilePhoneRegularExpressionValidator" runat="server"
                                                    ControlToValidate="MobilePhoneTextBox" Display="None" ErrorMessage="<%$ Resources:Resource, MobilePhoneRegularExpressionValidator %>"
                                                    Font-Size="11pt" SetFocusOnError="True" ToolTip="<%$ Resources:Resource, MobilePhoneToolTip %>"
                                                    ValidationExpression="^\d{8,24}$" ValidationGroup="SignUpCreateWizard">*</asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="1" style="height: 1px; text-align: left; width: 14524px;">
                                            </td>
                                            <td align="center" colspan="6" style="height: 1px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <span style="font-size: 11pt; color: #660000"><strong>
                                                    <asp:Label ID="Step2Label" runat="server" Style="position: relative; font-family: Andy; font-size: 13pt;" 
                                                    Text="<%$ Resources:Resource, Step2Label %>" ForeColor="Black"></asp:Label></strong></span>
                                            </td>
                                            <td style="width: 137px">
                                            </td>
                                            <td style="width: 531px">
                                            </td>
                                            <td style="width: 5915px">
                                            </td>
                                            <td style="width: 5335px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="height: 1px; text-align: left">
                                            </td>
                                            <td align="center" colspan="5" style="height: 1px; background-color: #E0E0E0" id="step2Column" runat="server">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 14524px; height: 61px; text-align: center">
                                            </td>
                                            <td align="right" style="width: 7156px; height: 61px; text-align: center">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Width="476px"
                                                    Font-Size="11pt" Text="<%$ Resources:Resource, UserName1 %>"></asp:Label>
                                            </td>
                                            <td style="width: 4289px; height: 61px;">
                                                <asp:TextBox ID="UserName" runat="server" Font-Size="11pt" TabIndex="11"></asp:TextBox>&nbsp;
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                    ErrorMessage="<%$ Resources:Resource, UserNameRequiredFieldValidator %>" ToolTip="<%$ Resources:Resource, UserNameRequiredFieldValidator %>"
                                                    ValidationGroup="SignUpCreateWizard" Display="None" Font-Size="11pt">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td style="width: 137px; height: 61px; text-align: center;">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Width="72px"
                                                    Font-Size="11pt" Text="<%$ Resources:Resource, Password %>"></asp:Label>
                                            </td>
                                            <td style="width: 531px; height: 61px;">
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password" Font-Size="11pt" Width="128px"
                                                    TabIndex="12"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                    ErrorMessage="<%$ Resources:Resource, PasswordRequiredValidator %>" ToolTip="<%$ Resources:Resource, PasswordRequiredValidator %>"
                                                    ValidationGroup="SignUpCreateWizard" Font-Size="11pt" Display="None">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td style="width: 515px; height: 61px; text-align: center;">
                                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword"
                                                    Font-Size="11pt" Height="83px" Width="197px" Text="<%$ Resources:Resource, ConfirmNewPassword %>"></asp:Label>
                                            </td>
                                            <td style="width: 535px; height: 61px;">
                                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" Font-Size="11pt"
                                                    Width="128px" TabIndex="13"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                                    ErrorMessage="<%$ Resources:Resource, ConfirmNewPasswordRequiredValidator %>"
                                                    ToolTip="<%$ Resources:Resource, ConfirmNewPasswordRequiredValidator %>" ValidationGroup="SignUpCreateWizard"
                                                    Font-Size="11pt" Display="None">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 524px; height: 54px; text-align: center">
                                            </td>
                                            <td align="right" style="width: 7156px; height: 54px; text-align: center">
                                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" Width="65px"
                                                    Font-Size="11pt" Text="<%$ Resources:Resource, EmailAddress %>"></asp:Label>
                                            </td>
                                            <td style="width: 4289px; height: 54px;">
                                                <asp:TextBox ID="Email" runat="server" TabIndex="14"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                                    ErrorMessage="<%$ Resources:Resource, EmailAddressRequiredFieldValidator %>"
                                                    ToolTip="<%$ Resources:Resource, EmailAddressToolTip %>" ValidationGroup="SignUpCreateWizard"
                                                    Font-Size="11pt" Display="None">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="EmailAddressRegularExpressionValidator" runat="server" ControlToValidate="Email"
                                                    ErrorMessage="<%$ Resources:Resource, ValidEmail %>"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                    Display="None">*</asp:RegularExpressionValidator>
                                            </td>
                                            <td style="width: 137px; height: 54px; text-align: center;">
                                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question" Width="252px"
                                                    Font-Size="11pt" Text="<%$ Resources:Resource, SecurityQuestionLabel %>"></asp:Label>
                                            </td>
                                            <td style="width: 531px; height: 54px;">
                                                <asp:TextBox ID="Question" runat="server" TabIndex="15"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                                    ErrorMessage="<%$ Resources:Resource, SecurityQuestionRequired %>" ToolTip="<%$ Resources:Resource, SecurityQuestionRequired %>"
                                                    ValidationGroup="SignUpCreateWizard" Font-Size="11pt" Display="None">*</asp:RequiredFieldValidator>
                                            </td>
                                            <td style="width: 5915px; height: 54px; text-align: center;">
                                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" Width="137px"
                                                    Font-Size="11pt" Text="<%$ Resources:Resource, SecurityAnswer %>"></asp:Label>
                                            </td>
                                            <td style="width: 5335px; height: 54px;">
                                                <asp:TextBox ID="Answer" runat="server" TabIndex="16"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                                    ErrorMessage="<%$ Resources:Resource, SecurityAnswerRequired %>" ToolTip="<%$ Resources:Resource, SecurityAnswerToolTip %>"
                                                    ValidationGroup="SignUpCreateWizard" Font-Size="11pt" Display="None">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="width: 14524px; height: 6px;">
                                            </td>
                                            <td align="right" style="width: 7156px; height: 6px">
                                            </td>
                                            <td style="width: 4289px; height: 6px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 137px; height: 6px;">
                                            </td>
                                            <td style="width: 531px; height: 6px;">
                                            </td>
                                            <td style="width: 5915px; height: 6px;">
                                            </td>
                                            <td style="width: 5335px; height: 6px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="height: 13px">
                                                    <strong><span style="font-size: 11pt; color: #660000">
                                                    <asp:Label ID="Step3Label" runat="server" Style="position: relative; font-family: Andy; font-size: 13pt;" 
                                                        Text="<%$ Resources:Resource, Step3label %>" ForeColor="Black"></asp:Label></span></strong>
                                            </td>
                                            <td style="width: 137px; height: 13px;">
                                            </td>
                                            <td style="width: 531px; height: 13px;">
                                            </td>
                                            <td style="width: 5915px; height: 13px;">
                                            </td>
                                            <td style="width: 5335px; height: 13px;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="height: 1px; text-align: left">
                                            
                                            </td>
                                            <td align="center" colspan="5" style="height: 1px; background-color: #E0E0E0" id="step3Column" runat="server">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="height: 1px; text-align: left">
                                                &nbsp;
                                            </td>
                                            <td align="center" colspan="5" style="height: 1px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="7" style="height: 49px; text-align: right">
                                                <asp:Label ID="ServiceAgreementLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, ServiceAgreement %>"></asp:Label>
                                                   &nbsp;<asp:HyperLink ID="YourSideJobHyperLink" runat="server" 
                                                    Font-Bold="True" NavigateUrl="~/NotAuthenticated/Index.aspx" 
                                                    Font-Underline="False">YourSideJob.com</asp:HyperLink>
                                               
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="7">
                                                &nbsp;<asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                                    ControlToValidate="ConfirmPassword" Display="None" ErrorMessage="<%$ Resources:Resource, PasswordMatchMessage %>"
                                                    ValidationGroup="SignUpCreateWizard" Font-Size="11pt"></asp:CompareValidator>
                                                <cc1:ValidatorCalloutExtender ID="PasswordMatchValidatorCalloutExtender" runat="server"
                                                    TargetControlID="PasswordCompare" HighlightCssClass="customCalloutStyle">
                                                </cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="7" style="color: red; height: 23px;">
                                                &nbsp;<asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="7" style="color: red; text-align: center;">
                                              <cc1:ValidatorCalloutExtender ID="FirstNameValidatorCalloutExtender" runat="server"
                                                    TargetControlID="FirstNameRequiredFieldValidator" HighlightCssClass="customCalloutStyle">
                                                </cc1:ValidatorCalloutExtender>
                                                <cc1:ValidatorCalloutExtender ID="LastNameValidatorCalloutExtender" runat="server"
                                                    TargetControlID="LastNameRequiredFieldValidator" HighlightCssClass="customCalloutStyle">
                                                </cc1:ValidatorCalloutExtender>
                                                <cc1:ValidatorCalloutExtender ID="AddressValidatorCalloutExtender" runat="server"
                                                    TargetControlID="AddressRequiredFieldValidator" HighlightCssClass="customCalloutStyle">
                                                </cc1:ValidatorCalloutExtender>
                                                <cc1:ValidatorCalloutExtender ID="UserNameValidatorCalloutExtender" runat="server"
                                                    TargetControlID="UserNameRequired">
                                                </cc1:ValidatorCalloutExtender>
                                                <cc1:ValidatorCalloutExtender ID="ConfirmPasswordValidatorCalloutExtender" runat="server"
                                                    TargetControlID="ConfirmPasswordRequired">
                                                </cc1:ValidatorCalloutExtender>
                                                <cc1:ValidatorCalloutExtender ID="QuestionRequiredValidatorCalloutExtender" runat="server"
                                                    TargetControlID="QuestionRequired">
                                                </cc1:ValidatorCalloutExtender> 
                                                <cc1:ValidatorCalloutExtender ID="HomeTelephoneValidatorCalloutExtender" runat="server"
                                                    TargetControlID="HomeTelephoneRequiredFieldValidator" HighlightCssClass="customCalloutStyle">
                                                </cc1:ValidatorCalloutExtender>
                                                <cc1:ValidatorCalloutExtender ID="HomeTelephoneRegularExpressionValidatorCalloutExtender"
                                                    runat="server" TargetControlID="HomeTelephoneRegularExpressionValidator" HighlightCssClass="customCalloutStyle">
                                                </cc1:ValidatorCalloutExtender>
                                                <cc1:ValidatorCalloutExtender ID="MobilePhoneValidatorCalloutExtender" runat="server"
                                                    TargetControlID="MobilePhoneRegularExpressionValidator" HighlightCssClass="customCalloutStyle">
                                                </cc1:ValidatorCalloutExtender>
                                                <cc1:ValidatorCalloutExtender ID="PasswordValidatorCalloutExtender" runat="server"
                                                    TargetControlID="PasswordRequired">
                                                </cc1:ValidatorCalloutExtender>
                                                <cc1:ValidatorCalloutExtender ID="EmailValidatorCalloutExtender" runat="server" TargetControlID="EmailRequired">
                                                </cc1:ValidatorCalloutExtender>
                                               <cc1:ValidatorCalloutExtender ID="EmailExpressionValidatorExtender" runat="server" TargetControlID="EmailAddressRegularExpressionValidator">
                                                </cc1:ValidatorCalloutExtender>
                                                <cc1:ValidatorCalloutExtender ID="AnswerValidatorCalloutExtender" runat="server"
                                                    TargetControlID="AnswerRequired">
                                                </cc1:ValidatorCalloutExtender>
                                                </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <CustomNavigationTemplate>
                                    <table border="0" cellspacing="5" style="width: 100%; height: 100%">
                                        <tr align="right">
                                            <td align="right" colspan="0" style="width: 826px; text-align: right;">
                                                <asp:Button ID="CreateUserButton" runat="server" CommandName="MoveNext" Text="<%$ Resources:Resource, CreateUser %>"
                                                    ValidationGroup="SignUpCreateWizard" TabIndex="20" />
                                            </td>
                                            <td align="right" colspan="0" style="width: 67px; text-align: center">
                                                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                    Text="<%$ Resources:Resource, Cancel %>" ValidationGroup="SignUpCreateWizard"
                                                    TabIndex="21" />
                                            </td>
                                        </tr>
                                    </table>
                                </CustomNavigationTemplate>
                            </asp:CreateUserWizardStep>
                            <asp:CompleteWizardStep ID="SignUPCompleteWizard" runat="server">
                                <ContentTemplate>
                                    <table border="0" style="font-size: 100%; width: 928px; height: 438px">
                                        <tr>
                                            <td align="center" style="vertical-align: baseline; background-color: White">
                                                <br />
                                                <br />
                                                <asp:Label ID="CongratulationLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, Congratulation %>"
                                                    Font-Bold="True"></asp:Label><br />
                                                <br />
                                                <br />
                                                &nbsp;<asp:Label ID="GongratulationMessage" runat="server" Style="position: relative"
                                                    Text="<%$ Resources:Resource, ProfileSucess %>"></asp:Label><br />
                                                <br />
                                                <br />
                                                <br />
                                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue"
                                                    Text="<%$ Resources:Resource, Continue %>" ValidationGroup="SignUpCreateWizard"
                                                    OnClientClick="fireanimation();" OnClick="ContinueButton_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                    </asp:CreateUserWizard>
                    <asp:Panel ID="ProfessionalPanel" runat="server" Style="display: none; position: absolute;
                        left: -25px; top: 1684px; overflow:scroll;" Height="672px" Width="931px" BackColor="White">
                        <asp:Panel ID="IndustyPanel" runat="server" Height="56px" Style="left: 3px; position: absolute;
                            top: 17px" Width="505px" BackColor="White">
                            <asp:Label ID="IndustryLabel" runat="server" Style="position: absolute" Text="<%$ Resources:Resource, IndustryLabel2 %>"
                                Font-Bold="True" ForeColor="Maroon"></asp:Label>
                            <asp:DropDownList ID="IndustryDropDownList" runat="server" Style="left: 153px; position: absolute;
                                top: 18px" Width="240px" DataSourceID="CategoryDataSource" DataTextField="CategoryName"
                                DataValueField="CategoryID" AutoPostBack="True" 
                                OnChange="fireanimation();" 
                                OnSelectedIndexChanged="Industry_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="CategoryDataSource" runat="server" SelectMethod="GetCategoryEnglish"
                                TypeName="PostProjectTableAdapters.CategoriesTableAdapter"></asp:ObjectDataSource>
                            <cc1:RoundedCornersExtender ID="IndustryRoundedCornersExtender2" runat="server" BorderColor="64, 0, 0"
                                Enabled="True" TargetControlID="IndustyPanel"></cc1:RoundedCornersExtender>
                        </asp:Panel>
                        <asp:UpdatePanel ID="SpecialtyUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Panel ID="SpecialtyPanel" runat="server" Height="308px" Style="left: 1px; position: absolute;
                                    top: 87px" Width="507px" BorderColor="Maroon" BorderWidth="0px" Wrap="False"
                                    BackColor="White" BackImageUrl="~/Images/whitebackground.bmp">
                                    <cc1:RoundedCornersExtender ID="SpecialtyRoundedCornersExtender" runat="server" Enabled="True"
                                        TargetControlID="SpecialtyPanel" BorderColor="64, 0, 0"></cc1:RoundedCornersExtender>
                                    <asp:Label ID="SpecialisationLabel" runat="server" Style="left: 4px; position: absolute;
                                        top: 1px" Text="<%$ Resources:Resource, SpecializationLabel2 %>" Font-Bold="True"
                                        ForeColor="Maroon"></asp:Label>
                                    <asp:ListBox ID="SpecialtyListBox1" runat="server" Height="270px" Style="left: 6px;
                                        position: absolute; top: 25px" Width="155px" DataSourceID="SpecialityJobs1DataSource"
                                        DataTextField="JobTitle" DataValueField="JobID" SelectionMode="Multiple" 
                                        Font-Size="9pt">
                                    </asp:ListBox>
                                    &nbsp;
                                    <asp:ListBox ID="SpecialtyListBox3" runat="server" Height="270px" Style="left: 340px;
                                        position: absolute; top: 25px" Width="155px" DataSourceID="SpecialityJobs3DataSource"
                                        DataTextField="JobTitle" DataValueField="JobID" SelectionMode="Multiple" 
                                        Font-Size="9pt">
                                    </asp:ListBox>
                                    &nbsp;
                                    <asp:ListBox ID="SpecialtyListBox2" runat="server" Height="270px" Style="left: 173px;
                                        position: absolute; top: 25px" Width="155px" DataSourceID="SpecialityJobs2DataSource"
                                        DataTextField="JobTitle" DataValueField="JobID" SelectionMode="Multiple" 
                                        Font-Size="9pt">
                                    </asp:ListBox>
                                    &nbsp;
                                    <asp:ObjectDataSource ID="SpecialityJobs1DataSource" runat="server" SelectMethod="GetSpecialityJob1English"
                                        TypeName="PostProjectTableAdapters.Jobs1TableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="IndustryDropDownList" DefaultValue="1" Name="JobCategory"
                                                PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:ObjectDataSource ID="SpecialityJobs2DataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetSpecialityJob2English" TypeName="PostProjectTableAdapters.Jobs2TableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="IndustryDropDownList" DefaultValue="1" Name="JobCategory"
                                                PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:ObjectDataSource ID="SpecialityJobs3DataSource" runat="server" SelectMethod="GetSpecialityJob3English"
                                        TypeName="PostProjectTableAdapters.Jobs3TableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="IndustryDropDownList" DefaultValue="1" Name="JobCategory"
                                                PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </asp:Panel>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="IndustryDropDownList" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="ClearSkillsButton" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:Panel ID="RequirementPanel" runat="server" Height="226px" Style="left: 2px;
                            position: absolute; top: 410px" Width="506px" BackColor="White">
                            <asp:Label ID="requirementLabel" runat="server" Style="position: absolute" Text="<%$ Resources:Resource, Requirementlabel %>"
                                Font-Bold="True" ForeColor="Maroon"></asp:Label>
                            &nbsp;
                            <cc1:RoundedCornersExtender ID="RequirementPanelRoundedCornersExtender" runat="server"
                                BorderColor="64, 0, 0" TargetControlID="RequirementPanel"></cc1:RoundedCornersExtender>
                            <asp:ObjectDataSource ID="ExperienceDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetExperience" TypeName="PostProjectTableAdapters.ExperienceTableAdapter">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="Language" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="RelocationDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetRelocation" TypeName="PostProjectTableAdapters.RelocationTableAdapter">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="Language" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="CrewNumberDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetCrewNumber" TypeName="PostProjectTableAdapters.CrewNumberTableAdapter">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="Language" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="LicensedDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetLicensed" TypeName="PostProjectTableAdapters.LicensedTableAdapter">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="Language" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="InsuredDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetInsured" TypeName="PostProjectTableAdapters.InsuredTableAdapter">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="Language" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:Table ID="RequirementTable" runat="server" Style="position: absolute; left: 117px;
                                top: 33px;" Width="287px" CellPadding="4" CellSpacing="4" BorderColor="Gray"
                                BorderStyle="Inset" BorderWidth="2px">
                                <asp:TableRow ID="ExperienceTableRow" runat="server">
                                    <asp:TableCell ID="ExperienceTableCell" runat="server" HorizontalAlign="Center">
                                        <asp:Label ID="ExperienceLabel" runat="server" Text="<%$ Resources:Resource, ExperienceLabel %>"></asp:Label></asp:TableCell>
                                    <asp:TableCell ID="ExperienceTableCell1" runat="server" HorizontalAlign="Center">
                                        <asp:DropDownList ID="ExperienceDropDownList" runat="server" DataSourceID="ExperienceDataSource"
                                            DataTextField="ExperienceValue" DataValueField="ExperienceID">
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="CrewNumberTableRow" runat="server">
                                    <asp:TableCell ID="CrewNumberTableCell" runat="server" HorizontalAlign="Center">
                                        <asp:Label ID="CrewNumberLabel" runat="server" Text="<%$ Resources:Resource, CrewNumber %>"></asp:Label></asp:TableCell>
                                    <asp:TableCell ID="CrewNumberTableCell1" runat="server" HorizontalAlign="Center">
                                        <asp:DropDownList ID="CrewNumberDropDownList" runat="server" DataSourceID="CrewNumberDataSource"
                                            DataTextField="crewnumberValue" DataValueField="crewnumberID">
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="LicensedTableRow" runat="server">
                                    <asp:TableCell ID="LicensedTableCell" runat="server" HorizontalAlign="Center">
                                        <asp:Label ID="LicensedLabel" runat="server" Text="<%$ Resources:Resource, LicensedLabel %>"></asp:Label></asp:TableCell>
                                    <asp:TableCell ID="LicensedTableCell1" runat="server" HorizontalAlign="Center">
                                        <asp:DropDownList ID="LicensedDropDownList" runat="server" DataSourceID="LicensedDataSource"
                                            DataTextField="LicensedValue" DataValueField="LicensedID">
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="InsuredTableRow" runat="server">
                                    <asp:TableCell ID="InsuredTableCell" runat="server" HorizontalAlign="Center">
                                        <asp:Label ID="InsuredLabel" runat="server" Text="<%$ Resources:Resource, InsuredLabel %>"></asp:Label></asp:TableCell>
                                    <asp:TableCell ID="InsuredTableCell1" runat="server" HorizontalAlign="Center">
                                        <asp:DropDownList ID="InsuredDropDownList" runat="server" DataSourceID="InsuredDataSource"
                                            DataTextField="InsuredValue" DataValueField="InsuredID">
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="RelocationTableRow" runat="server">
                                    <asp:TableCell ID="RelocationTableCell" runat="server" HorizontalAlign="Center">
                                        <asp:Label ID="RelocationLabel" runat="server" Text="<%$ Resources:Resource, RelocationLabel %>"></asp:Label></asp:TableCell>
                                    <asp:TableCell ID="RelocationTableCell1" runat="server" HorizontalAlign="Center">
                                        <asp:DropDownList ID="RelocationDropDownList" runat="server" DataSourceID="RelocationDataSource"
                                            DataTextField="RelocationValue" DataValueField="RelocationID">
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:Panel>
                        <asp:Button ID="AddSkillsButton" runat="server" BackColor="LightGray" BorderColor="#400000"
                            BorderStyle="Groove" BorderWidth="2px" Font-Bold="True" ForeColor="#400000" Style="left: 536px;
                            position: relative; top: 146px" Text="<%$ Resources:Resource, AddSkill %>" Width="100px" /><br />
                        <br />
                        <asp:Button ID="ClearSkillsButton" runat="server" Style="left: 536px; position: relative;
                            top: 146px" Text="<%$ Resources:Resource, Clear %>" BackColor="LightGray" BorderColor="#400000"
                            BorderStyle="Groove" BorderWidth="2px" Font-Bold="True" ForeColor="#400000" Width="100px" />
                        <asp:Panel ID="ListSkillPanel" runat="server" Height="263px" Style="left: 672px;
                            position: relative; top: 7px" Width="227px">
                            <asp:Label ID="ListSkillLabel" runat="server" Style="position: absolute; left: 72px;
                                top: 0px;" Text="<%$ Resources:Resource, ListSkills %>" BackColor="LightGray"
                                BorderColor="#400000" BorderStyle="Ridge" BorderWidth="2px" Font-Bold="True"
                                ForeColor="Black"></asp:Label>
                            <br />
                            <br />
                            <asp:UpdatePanel ID="CityUpdatePanel" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table style="width: 100%; position: relative; height: 100%">
                                        <tr>
                                            <td bgcolor="#660000" style="width: 19px; text-align: center;">
                                                <asp:Label ID="Skill1HeadingLabel" runat="server" Style="position: relative; left: 4px;"
                                                    Text="1" Font-Bold="True" ForeColor="White"></asp:Label>
                                            </td>
                                            <td style="text-align: center;" align="left" bgcolor="lightgrey">
                                                <asp:Label ID="Skill1Label" runat="server" Style="position: relative; left: 0px;"
                                                    ForeColor="Black" Font-Bold="True" Width="100%"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td bgcolor="#660000" style="width: 19px; text-align: center;">
                                                <asp:Label ID="Skill2HeadingLabel" runat="server" Style="position: relative; left: 4px;"
                                                    Text="2" Font-Bold="True" ForeColor="White"></asp:Label>
                                            </td>
                                            <td style="text-align: center;" align="left" bgcolor="lightgrey">
                                                <asp:Label ID="Skill2Label" runat="server" Style="position: relative; left: 1px;"
                                                    ForeColor="Black" Font-Bold="True" Width="100%"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td bgcolor="#660000" style="width: 19px; text-align: center;">
                                                <asp:Label ID="Skill3HeadingLabel" runat="server" Style="position: relative; left: 5px;"
                                                    Text="3" Font-Bold="True" ForeColor="White"></asp:Label>
                                            </td>
                                            <td style="text-align: center;" align="left" bgcolor="lightgrey">
                                                <asp:Label ID="Skill3Label" runat="server" Style="position: relative; left: 0px;"
                                                    ForeColor="Black" Font-Bold="True" Width="100%"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td bgcolor="#660000" style="width: 19px; text-align: center;">
                                                <asp:Label ID="Skill4HeadingLabel" runat="server" Style="position: relative; left: 4px;"
                                                    Text="4" Font-Bold="True" ForeColor="White"></asp:Label>
                                            </td>
                                            <td style="text-align: center;" align="left" bgcolor="lightgrey">
                                                <asp:Label ID="Skill4Label" runat="server" Style="position: relative; left: 1px;"
                                                    ForeColor="Black" Font-Bold="True" Width="100%"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="AddSkillsButton" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="ClearSkillsButton" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="CancelSkillsButton" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </asp:Panel>
                        <asp:Button ID="CancelSkillsButton" runat="server" Style="left: 837px; position: relative;
                            top: 281px" Text="<%$ Resources:Resource, Cancel %>" BorderColor="#400000" BorderStyle="Outset"
                            BorderWidth="1px" />
                        <asp:Button ID="SaveSkillsButton" runat="server" Style="left: 691px; position: relative;
                            top: 281px" Text="<%$ Resources:Resource, Save %>" BorderColor="#400000" BorderStyle="Outset"
                            BorderWidth="1px" />
                    </asp:Panel>
                    <cc1:ModalPopupExtender ID="ProfessionalPanelModalPopupExtender" runat="server" TargetControlID="ListSkillPanel"
                        PopupControlID="ProfessionalPanel" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                </div>
                <cc1:RoundedCornersExtender ID="SignUpCreateWizardRoundedCornersExtender" runat="server"
                    TargetControlID="SignUpCreateWizard" BorderColor="#707070" Radius="5" 
                    Color="#707070">
                </cc1:RoundedCornersExtender>
            </td>
        </tr>
    </table>
    </div>
    <div id="LoadingDiv" style="width: 100px; height: 100px; z-index: 200; display:none">
        <asp:UpdatePanel ID="DelayUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <cc1:ModalPopupExtender ID="DelayModalPopUpExtender" runat="server" BackgroundCssClass="modalBackground"
                    PopupControlID="LoadingPanel" TargetControlID="LoadingPanel" RepositionMode="RepositionOnWindowResize">
                </cc1:ModalPopupExtender>
                <asp:Panel ID="LoadingPanel" runat="server" Height="45px" Style="display: none; z-index: 200;"
                    Width="186px" BackColor="Silver">
                    <asp:Label ID="LoadingLabel" runat="server" Font-Bold="True" ForeColor="Black" Style="left: 63px;
                        position: absolute; top: 25px" Text="<%$ Resources:Resource, Loading %>"></asp:Label>
                    <img src="../_assets/img/uploading.gif" alt="uploadingimages" style="left: 0px; position: relative;
                        top: -9px" />
                </asp:Panel>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
      <div class="cleaner">
    </div>
    <LowerNavigationButtons:NavigationButtons ID="MainLowerNavigationButtons" runat="server" />
    </form>
</body>
</html>
