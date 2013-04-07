<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EditProfile.aspx.vb" Inherits="Authoniticated_Professional_EditProfile"
    Culture="auto:en-US" UICulture="auto" %>

<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../../common/CustomerTemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../../common/TemplateMainLowerButtons.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../themes/BlueMenublockStyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="../ValidatorCalloutStyleSheet.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../../_assets/css/TemplateStyleSheet.css" type="text/css"
        media="screen" />
    <title id="Title1" runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:AjaxScriptManager ID="ScriptManager1" runat="server">
    </asp:AjaxScriptManager>
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
    <asp:ObjectDataSource ID="ProfessionalProfileObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetProfessionalProfile" TypeName="ProfessionalProfileDataSetTableAdapters.ProfessionalGeneralTableAdapter"
        UpdateMethod="UpdateProfessionalProfile">
        <UpdateParameters>
            <asp:Parameter Name="ProID" Type="Int32" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="CountryID" Type="Int32" />
            <asp:Parameter Name="CountryName" Type="String" />
            <asp:Parameter Name="RegionID" Type="Int32" />
            <asp:Parameter Name="RegionName" Type="String" />
            <asp:Parameter Name="CityID" Type="Int32" />
            <asp:Parameter Name="Zipcode" Type="String" />
            <asp:Parameter Name="HomePhoneNumber" Type="String" />
            <asp:Parameter Name="MobilePhoneNumber" Type="String" />
            <asp:Parameter Name="Age" Type="Int32" />
            <asp:Parameter Name="Gender" Type="Int32" />
            <asp:Parameter Name="EmailAddress" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <div id="wrapper" style="padding: 25px">
        <table align="center" id="TemplateGlobalTable">
            <tr>
                <td>
                    <table align="center">
                        <tr>
                            <td style="width: 115px">
                            </td>
                            <td>
                                <asp:Panel ID="EditProfileLayer" runat="server" Style="z-index: 102; width: 696px;
                                    position: relative; height: 427px; background-color: white;">
                                    <asp:FormView ID="ProfileFormView" runat="server" DataKeyNames="ProID" DataSourceID="ProfessionalProfileObjectDataSource"
                                        Style="position: relative; width: 690px; z-index: 1; height: 411px;" DefaultMode="Edit"
                                        Font-Size="Small" Font-Names="Times New Roman" EnableModelValidation="True">
                                        <EditItemTemplate>
                                            <table border="0" style="font-size: 100%; z-index: 1; left: 4px; width: 673px; position: absolute;
                                                top: 4px; height: 415px">
                                                <tr>
                                                    <td align="center" colspan="3" style="height: 21px; text-align: left">
                                                        <span style="font-size: 11pt; color: #660000">
                                                            <asp:Label ID="Step1Label" runat="server" Style="position: relative" Text="<%$ Resources:Resource, Step1Label%>"
                                                                Font-Bold="True"></asp:Label></span>
                                                    </td>
                                                    <td align="center" colspan="3" style="width: 77px; height: 1px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2" style="text-align: left; height: 1px">
                                                    </td>
                                                    <td align="center" colspan="5" style="height: 1px">
                                                        <hr style="background-color: #800000; color: #800000;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 564px; height: 31px; text-align: center">
                                                        <span style="font-size: 11pt"></span>
                                                    </td>
                                                    <td align="right" style="width: 7156px; height: 31px; text-align: center">
                                                        <span style="font-size: 11pt">
                                                            <asp:Label ID="FirstNameLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, FirstNameLabel%>"
                                                                Font-Names="Times New Roman" Font-Size="Small"></asp:Label></span>
                                                    </td>
                                                    <td style="width: 1790px; height: 31px">
                                                        <asp:TextBox ID="FirstNameTextBox" runat="server" Font-Size="Small" MaxLength="10"
                                                            TabIndex="1" Text='<%# Bind("FirstName", "{0}") %>'></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" runat="server" ControlToValidate="FirstNameTextBox"
                                                            Display="None" ErrorMessage="<%$ Resources:Resource, FirstNameValidator %>" Font-Size="11pt"
                                                            SetFocusOnError="True" ToolTip="<%$ Resources:Resource, FirstNameToolTip%>" ValidationGroup="UpdateprofessionalWizard">*</asp:RequiredFieldValidator>&nbsp;
                                                    </td>
                                                    <td style="width: 77px; height: 31px; text-align: center">
                                                        <span style="font-size: 11pt"></span>
                                                    </td>
                                                    <td style="width: 296px; height: 31px">
                                                        &nbsp;
                                                    </td>
                                                    <td style="width: 5915px; height: 31px; text-align: center">
                                                        <span style="font-size: 11pt">
                                                            <asp:Label ID="LastNameLabel" runat="server" Style="left: 0px; position: relative"
                                                                Text="<%$ Resources:Resource, LastNameLabel %>" Width="48px" Font-Names="Times New Roman"
                                                                Font-Size="Small"></asp:Label></span>
                                                    </td>
                                                    <td style="width: 5335px; height: 31px">
                                                        <asp:TextBox ID="LastNameTextBox" runat="server" MaxLength="20" TabIndex="1" Text='<%# Bind("LastName", "{0}") %>'
                                                            Font-Size="Small"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" runat="server" ControlToValidate="LastNameTextBox"
                                                            Display="None" ErrorMessage="<%$ Resources:Resource, LastNameRequiredFieldValidator%>"
                                                            SetFocusOnError="True" ToolTip="<%$ Resources:Resource, LastNameToolTip%>" ValidationGroup="UpdateprofessionalWizard">*</asp:RequiredFieldValidator>&nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 564px; height: 60px; text-align: center">
                                                        <span style="font-size: 11pt"></span>
                                                    </td>
                                                    <td align="right" style="width: 7156px; height: 60px; text-align: center">
                                                        <span style="font-size: 11pt; vertical-align: super">
                                                            <asp:Label ID="AddressLabel" runat="server" Style="left: 0px; position: relative"
                                                                Text="<%$ Resources:Resource, AddressLabel %>" Font-Names="Times New Roman" Font-Size="Small"></asp:Label></span>
                                                    </td>
                                                    <td colspan="3" style="height: 60px" valign="top">
                                                        <br />
                                                        <asp:TextBox ID="AddressTextBox" runat="server" Font-Size="Small" Height="53px" MaxLength="35"
                                                            TabIndex="2" Width="340px" Text='<%# Bind("Address", "{0}") %>'></asp:TextBox>
                                                        <br />
                                                        <asp:RequiredFieldValidator ID="AddressRequiredFieldValidator" runat="server" ControlToValidate="AddressTextBox"
                                                            Display="None" ErrorMessage="<%$ Resources:Resource, AddressRequiredFieldValidator%>"
                                                            Font-Size="Medium" SetFocusOnError="True" Style="position: relative" ToolTip="<%$ Resources:Resource, AddressRequiredFieldValidator%>"
                                                            ValidationGroup="UpdateprofessionalWizard">*</asp:RequiredFieldValidator>
                                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                    </td>
                                                    <td style="width: 5915px; height: 60px; text-align: center">
                                                        <span style="font-size: 11pt; vertical-align: super">
                                                            <asp:Label ID="ZipcodeLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, ZipcodeLabel %>"
                                                                Font-Names="Times New Roman" Font-Size="Small"></asp:Label></span>
                                                    </td>
                                                    <td rowspan="1" style="width: 5335px; height: 60px">
                                                        <br />
                                                        &nbsp;<asp:TextBox ID="ZipcodeTextBox" runat="server" TabIndex="3" Width="106px"
                                                            Text='<%# Bind("Zipcode", "{0}") %>' Font-Size="Small" MaxLength="10"></asp:TextBox>
                                                        &nbsp;&nbsp;
                                                        <br />
                                                        <asp:Label ID="OnlyUSandCanadaLabel" runat="server" ForeColor="Maroon" Style="position: relative"
                                                            Text="<%$ Resources:Resource, OnlyUSCanadaLabel %>"></asp:Label><br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="7" style="height: 39px" align="left">
                                                        <asp:Panel ID="LocationPanel" runat="server" Style="left: -15px; position: relative;
                                                            top: -11px" Width="99%">
                                                            <table style="width: 99%; position: relative; height: 100%">
                                                                <tr>
                                                                    <td align="center" style="width: 33%" valign="middle">
                                                                        <asp:Label ID="CountryLabel" runat="server" Text="<%$ Resources:Resource, CountryLabel%>"
                                                                            Style="z-index: 1; left: 36px; top: 16px; position: absolute"></asp:Label>
                                                                        &nbsp;&nbsp;&nbsp;
                                                                        <asp:DropDownList ID="CountryDropDownList" runat="server" AutoPostBack="True" DataSourceID="CountriesDataSource"
                                                                            DataTextField="Title" DataValueField="CountryId" Font-Size="Small" Width="120px"
                                                                            SelectedValue='<%# Eval("CountryID","{0}")%>' Style="z-index: 1; left: 96px;
                                                                            top: 12px; position: absolute" OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                        <asp:ObjectDataSource ID="CountriesDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                            SelectMethod="GetCountries" TypeName="LocationDataSetTableAdapters.CountriesUpdateTableAdapter">
                                                                        </asp:ObjectDataSource>
                                                                    </td>
                                                                    <td align="center" valign="middle" style="width: 46%">
                                                                        <asp:UpdatePanel ID="RegionUpdatePanel" runat="server" UpdateMode="Conditional">
                                                                            <ContentTemplate>
                                                                                <asp:Label ID="RegionLabel" runat="server" Text="<%$ Resources:Resource, StateLabel%>"
                                                                                    Style="z-index: 1; left: 245px; top: 16px; position: absolute"></asp:Label>
                                                                                &nbsp;&nbsp;
                                                                                <asp:DropDownList ID="RegionsDropDownList" runat="server" AutoPostBack="True" DataSourceID="RegionDataSource"
                                                                                    DataTextField="Region" DataValueField="RegionId" Font-Size="Small" Width="120px"
                                                                                    Style="z-index: 1; left: 320px; top: 11px; position: absolute">
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
                                                                    </td>
                                                                    <td align="center" style="width: 33%" valign="middle">
                                                                        <asp:Label ID="CityLabel" runat="server" Text="<%$ Resources:Resource, CityLabel%>"
                                                                            Style="left: 469px; top: 16px; position: absolute; z-index: 1;" Width="20px"></asp:Label>
                                                                        <asp:UpdatePanel ID="CityUpdatePanel" runat="server">
                                                                            <ContentTemplate>
                                                                                <asp:DetailsView ID="CityDetailView" runat="server" AutoGenerateRows="False" DataKeyNames="CityId"
                                                                                    DataSourceID="CitiesObjectDataSource" GridLines="None" Style="top: 8px; position: absolute;
                                                                                    left: 516px; width: 90px; z-index: 2; height: 27px;">
                                                                                    <Fields>
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <asp:DropDownList ID="CitiesDropDownList" runat="server" AutoPostBack="True" DataSourceID="CitiesObjectDataSource"
                                                                                                    DataTextField="City" DataValueField="CityId" Width="120px" SelectedValue='<%# Eval("CityID") %>'>
                                                                                                </asp:DropDownList>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                    </Fields>
                                                                                    <EmptyDataTemplate>
                                                                                        <asp:Label ID="NotApplicableLabel" runat="server" Style="position: relative; top: 1px;"
                                                                                            Text="<%$ Resources:Resource, NotApplicableLabel%>" BackColor="White" ForeColor="Black"></asp:Label>
                                                                                    </EmptyDataTemplate>
                                                                                </asp:DetailsView>
                                                                                <asp:ObjectDataSource ID="CitiesObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                                    SelectMethod="GetCities" TypeName="LocationDataSetTableAdapters.CitiesUpdateByRegionTableAdapter">
                                                                                    <SelectParameters>
                                                                                        <asp:ControlParameter ControlID="RegionsDropDownList" Name="RegionId" PropertyName="SelectedValue"
                                                                                            Type="Int32" />
                                                                                    </SelectParameters>
                                                                                </asp:ObjectDataSource>
                                                                            </ContentTemplate>
                                                                        </asp:UpdatePanel>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 564px; height: 45px">
                                                    </td>
                                                    <td align="right" style="width: 7156px; height: 45px; text-align: center">
                                                        <asp:Label ID="AgeLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, AgeLabel%>"
                                                            Font-Names="Times New Roman" Font-Size="Small"></asp:Label>
                                                    </td>
                                                    <td style="width: 1790px; height: 45px">
                                                        <span style="font-size: 10pt"><span style="vertical-align: text-bottom; color: #0066cc">
                                                            <asp:TextBox ID="AgeTextBox" runat="server" MaxLength="3" Style="position: relative"
                                                                TabIndex="6" Width="35px" Text='<%# Bind("Age", "{0}") %>' Font-Size="Small"></asp:TextBox>
                                                            <asp:RangeValidator ID="AgeRangeValidator" runat="server" ControlToValidate="AgeTextBox"
                                                                Display="Dynamic" ErrorMessage="<%$ Resources:Resource, AgeRangeValidator%>"
                                                                Font-Size="11pt" MaximumValue="105" MinimumValue="18" SetFocusOnError="True"
                                                                Style="position: relative" ToolTip="<%$ Resources:Resource, AgeToolTip%>" Type="Integer"
                                                                ValidationGroup="UpdateprofessionalWizard">*</asp:RangeValidator>
                                                            <asp:RequiredFieldValidator ID="AgeRequiredFieldValidator" runat="server" ControlToValidate="AgeTextBox"
                                                                Display="Dynamic" ErrorMessage="<%$ Resources:Resource, AgeRequiredFieldValidator%>"
                                                                Font-Size="11pt" SetFocusOnError="True" Style="position: relative" ToolTip="<%$ Resources:Resource, AgeRequiredFieldValidator%>"
                                                                ValidationGroup="UpdateprofessionalWizard">*</asp:RequiredFieldValidator></span></span>
                                                    </td>
                                                    <td style="width: 77px; height: 45px; text-align: center">
                                                        <span style="font-size: 11pt"></span>
                                                    </td>
                                                    <td style="width: 296px; height: 45px; text-align: left">
                                                        &nbsp;
                                                    </td>
                                                    <td style="width: 5915px; height: 45px; text-align: center">
                                                        <span style="font-size: 11pt">
                                                            <asp:Label ID="GenderLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, GenderLabel %>"
                                                                Font-Names="Times New Roman" Font-Size="Small"></asp:Label></span>
                                                    </td>
                                                    <td style="width: 5335px; height: 45px">
                                                        <asp:DropDownList ID="GenderDropDownList" runat="server" Font-Size="Small" TabIndex="7"
                                                            Font-Names="Times New Roman" SelectedValue='<%# Bind("Gender", "{0}") %>'>
                                                            <asp:ListItem Value="1" Selected="True">M</asp:ListItem>
                                                            <asp:ListItem Value="2">F</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 564px; height: 36px; text-align: center">
                                                        <span style="font-size: 11pt"></span>
                                                    </td>
                                                    <td align="right" style="width: 7156px; height: 36px; text-align: center">
                                                        <span style="font-size: 11pt">
                                                            <asp:Label ID="HomeTelephoneLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, HomeTelephoneLabel%>"
                                                                Font-Names="Times New Roman" Font-Size="Small"></asp:Label></span>
                                                    </td>
                                                    <td style="width: 1790px; height: 36px">
                                                        <asp:TextBox ID="HomeTelephoneTextBox" runat="server" Font-Size="Small" MaxLength="24"
                                                            TabIndex="8" Text='<%# Bind("HomePhoneNumber", "{0}") %>'></asp:TextBox>&nbsp;
                                                        <asp:RequiredFieldValidator ID="HomeTelephoneRequiredFieldValidator" runat="server"
                                                            ControlToValidate="HomeTelephoneTextBox" Display="None" ErrorMessage="<%$ Resources:Resource, HomeTelephoneRequiredFieldValidator%>"
                                                            Font-Size="11pt" SetFocusOnError="True" ToolTip="<%$ Resources:Resource, HomeTelephoneToolTip%>"
                                                            ValidationGroup="UpdateprofessionalWizard">*</asp:RequiredFieldValidator>&nbsp;
                                                        <asp:RegularExpressionValidator ID="HomeTelephoneRegularExpressionValidator" runat="server"
                                                            ControlToValidate="HomeTelephoneTextBox" Display="None" ErrorMessage="<%$ Resources:Resource, HomeTelephoneRegularExpressionValidator%>"
                                                            Font-Size="11pt" SetFocusOnError="True" ToolTip="<%$ Resources:Resource, HomeTelephoneToolTip%>"
                                                            ValidationExpression="^\d{8,24}$" ValidationGroup="UpdateprofessionalWizard">*</asp:RegularExpressionValidator>
                                                    </td>
                                                    <td colspan="2" style="height: 36px">
                                                        <span style="font-size: 10pt"><span style="color: #0066cc"></span></span>
                                                    </td>
                                                    <td style="width: 5915px; height: 36px; text-align: center">
                                                        <span style="font-size: 11pt">
                                                            <asp:Label ID="MobileTelephoneLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, MobileTelephoneLabel%>"
                                                                Font-Names="Times New Roman" Font-Size="Small"></asp:Label></span>
                                                    </td>
                                                    <td style="width: 5335px; height: 36px">
                                                        <asp:TextBox ID="MobilePhoneTextBox" runat="server" Font-Size="Small" MaxLength="24"
                                                            TabIndex="9" Text='<%# Bind("MobilePhoneNumber", "{0}") %>'></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="MobilePhoneRegularExpressionValidator" runat="server"
                                                            ControlToValidate="MobilePhoneTextBox" Display="None" ErrorMessage="<%$ Resources:Resource, MobilePhoneRegularExpressionValidator%>"
                                                            Font-Size="11pt" SetFocusOnError="True" ToolTip="<%$ Resources:Resource, MobilePhoneToolTip%>"
                                                            ValidationExpression="^\d{8,24}$" ValidationGroup="UpdateprofessionalWizard">*</asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="width: 564px; height: 36px; text-align: center">
                                                    </td>
                                                    <td align="right" style="width: 7156px; height: 36px; text-align: center">
                                                        <asp:Label ID="EmailAddressLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, EmailAddressLabel%>"
                                                            Font-Names="Times New Roman" Font-Size="Small"></asp:Label>
                                                    </td>
                                                    <td style="width: 1790px; height: 36px">
                                                        <asp:TextBox ID="EmailAddressTextBox" runat="server" Style="position: relative" Text='<%# Bind("EmailAddress") %>'
                                                            Font-Size="Small" MaxLength="30"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="EmailAddressRegularExpressionValidator" runat="server"
                                                            ControlToValidate="EmailAddressTextBox" Display="None" ErrorMessage="<%$ Resources:Resource, EmailAddressRegularExpressionValidator%>"
                                                            Font-Size="11pt" SetFocusOnError="True" Style="position: relative" ToolTip="<%$ Resources:Resource, EmailAddressToolTip%>"
                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="UpdateprofessionalWizard">*</asp:RegularExpressionValidator>
                                                        <asp:RequiredFieldValidator ID="EmailAddressRequiredFieldValidator" runat="server"
                                                            ControlToValidate="EmailAddressTextBox" Display="None" ErrorMessage="<%$ Resources:Resource, EmailAddressRequiredFieldValidator%>"
                                                            Font-Size="11pt" SetFocusOnError="True" Style="position: relative" ToolTip="<%$ Resources:Resource, EmailAddressToolTip%>"
                                                            ValidationGroup="UpdateprofessionalWizard">*</asp:RequiredFieldValidator>
                                                    </td>
                                                    <td colspan="2" style="height: 36px">
                                                    </td>
                                                    <td style="width: 5915px; height: 36px; text-align: center">
                                                    </td>
                                                    <td style="width: 5335px; height: 36px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="7" style="height: 36px">
                                                        <cc1:ValidatorCalloutExtender ID="FirstNameValidatorCalloutExtender" runat="server"
                                                            HighlightCssClass="customCalloutStyle" TargetControlID="FirstNameRequiredFieldValidator">
                                                        </cc1:ValidatorCalloutExtender>
                                                        <asp:LinkButton ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                            Text="<%$ Resources:Resource, Cancel%>" Style="left: 620px; position: absolute;
                                                            top: 372px" PostBackUrl="ProfessionalProfile.aspx" Font-Bold="True" ForeColor="Blue" CssClass="UnderlineLink" >
                                                        </asp:LinkButton>
                                                        <cc1:ValidatorCalloutExtender ID="AddressRequiredValidatorCalloutExtender" runat="server"
                                                            HighlightCssClass="customCalloutStyle" TargetControlID="AddressRequiredFieldValidator">
                                                        </cc1:ValidatorCalloutExtender>
                                                        <cc1:ValidatorCalloutExtender ID="LastNameValidatorCalloutExtender" runat="server"
                                                            HighlightCssClass="customCalloutStyle" TargetControlID="LastNameRequiredFieldValidator">
                                                        </cc1:ValidatorCalloutExtender>
                                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                                            Text="<%$ Resources:Resource, Update%>" OnClick="UpdateButton_Click" Font-Bold="True"
                                                            ForeColor="Blue" Style="left: 528px; position: absolute; top: 372px;" CssClass="UnderlineLink" ></asp:LinkButton>
                                                        <cc1:ValidatorCalloutExtender ID="HomeTelephoneRequiredValidatorCalloutExtender"
                                                            runat="server" HighlightCssClass="customCalloutStyle" TargetControlID="HomeTelephoneRequiredFieldValidator">
                                                        </cc1:ValidatorCalloutExtender>
                                                        <cc1:ValidatorCalloutExtender ID="HomeTelephoneRegularExpressionValidatorCalloutExtender"
                                                            runat="server" HighlightCssClass="customCalloutStyle" TargetControlID="HomeTelephoneRegularExpressionValidator">
                                                        </cc1:ValidatorCalloutExtender>
                                                        <cc1:ValidatorCalloutExtender ID="MobilePhoneRegularExpressionValidatorCalloutExtender"
                                                            runat="server" HighlightCssClass="customCalloutStyle" TargetControlID="MobilePhoneRegularExpressionValidator">
                                                        </cc1:ValidatorCalloutExtender>
                                                        <cc1:ValidatorCalloutExtender ID="EmailAddressRequiredFieldValidatorCalloutExtender"
                                                            runat="server" TargetControlID="EmailAddressRequiredFieldValidator">
                                                        </cc1:ValidatorCalloutExtender>
                                                        <cc1:ValidatorCalloutExtender ID="EmailAddressRegularExpressionValidatorCalloutExtender"
                                                            runat="server" TargetControlID="EmailAddressRegularExpressionValidator">
                                                        </cc1:ValidatorCalloutExtender>
                                                        <cc1:ValidatorCalloutExtender ID="AgeRangeValidatorCalloutExtender" runat="server"
                                                            HighlightCssClass="customCalloutStyle" TargetControlID="AgeRangeValidator">
                                                        </cc1:ValidatorCalloutExtender>
                                                        <cc1:ValidatorCalloutExtender ID="AgeRequiredFieldValidatorCalloutExtender" runat="server"
                                                            HighlightCssClass="customCalloutStyle" TargetControlID="AgeRequiredFieldValidator">
                                                        </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                        </EditItemTemplate>
                                    </asp:FormView>
                                </asp:Panel>
                                <cc1:RoundedCornersExtender ID="EditProfileLayer_RoundedCornersExtender" runat="server"
                                    BorderColor="#003366" Color="#003366" Enabled="true" TargetControlID="EditProfileLayer">
                                </cc1:RoundedCornersExtender>
                            </td>
                            <td valign="top">
                                <asp:Panel ID="BackToProfilePanel" runat="server" CssClass="BlueMenublock" Height="64px"
                                    Style="z-index: 0; left: 23px; position: relative; top: 0px; width: 107px;">
                                    <ul>
                                        <li>
                                            <asp:LinkButton ID="BackToProfile" runat="server" PostBackUrl="ProfessionalProfile.aspx"
                                                Text="<%$ Resources:Resource, BackToProfileLinkButton%>"></asp:LinkButton></li>
                                    </ul>
                                </asp:Panel>
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
