<%@ Page Language="VB" AutoEventWireup="false" CodeFile="JobSearchResult.aspx.vb"
    Inherits="NotAuthenticated_JobSearchResult" %>

<%@ Register Namespace="CommentAjaxControl" TagPrefix="CustomEditor" %>
<%@ OutputCache Duration="30" VaryByParam="*" SqlDependency="CommandNotification" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainLowerButtons.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="refresh" content="300">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title id="Title1" runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <script type="text/javascript" src="../scripts/jquery-1.5.2.js"></script>
    <link rel="stylesheet" href="../_assets/css/TemplateStyleSheet.css" type="text/css"
        media="screen" />
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />

    <link href="../Authenticated/themes/BlueMenublockStyleSheet.css" rel="stylesheet"
        type="text/css" />
    <script language="javascript" type="text/javascript">
        function fireanimation() {
            document.getElementById('LoadingPanel').style.visibility = 'visible';
            $find('LoadingPanelModalPopupExtender').show();
            document.body.style.overflow = 'visible';
        }
        function MoreProjectFireAnimation() {
            $find('LoadingPanelModalPopupExtender').show();
            $find('MoreProjectModalPopupExtender').hide();
        }


        function disableBackButton() {
            window.history.forward();
        }
        setTimeout("disableBackButton()", 0);
    </script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        $(function ($) {
            $(document).ready(function () {
                $("#ToggleButton").toggle(
      function () {
          $("#AdvancedFilter").slideToggle("slow");
          $('#ToggleButton').attr('value', '+');

      },
      function () {
          $("#AdvancedFilter").slideToggle("slow");
          $('#ToggleButton').attr('value', '-');
      }
        );

                //Add to Favorite Button
                $("#UpdateAllButton").hover(function () {
                    $(this).css("background", "#0099CC");
                    $(this).css("cursor", "pointer");
                }, function () {
                    $(this).css("background", "");
                });

            });
        })(jQuery);
    </script>
    <style type="text/css">
        TR.updated TD
        {
            background-color: yellow;
        }
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.9;
            z-index: 200;
        }
        .updateProgress
        {
            border-width: 1px;
            border-style: solid;
            background-color: #FFFFFF;
            position: absolute;
            width: 130px;
            height: 50px;
        }
        .updateProgressMessage
        {
            margin: 3px;
            font-family: Trebuchet MS;
            font-size: small;
            vertical-align: middle;
        }
        .bothsides
        {
            width: 121px;
            text-align: center;
        }
        .custommiddle
        {
            width: 219px;
        }
        .SmallSize
        {
            font-size: x-small;
        }
        .Update
        {
            border: solid 5px #002142;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            border-radius: 6px;
            font-size: x-small;
        }
        .dir
        {
            margin: 3px;
            padding: 3px;
            background: white;
            font-size: small;
        }
        .dir:hover
        {
            margin: 3px;
            padding: 3px;
            background: rgb(80%,100%,80%);
            cursor: pointer;
        }
    </style>
</head>
<body onload="disableBackButton()">
    <form id="form1" runat="server" defaultbutton="PlaceBidButton">
    <div>
        <UpperNavigationButtons:NavigationButtons ID="MainNavigationButtons" runat="server">
        </UpperNavigationButtons:NavigationButtons>
        <asp:AjaxScriptManager ID="ScriptManager1" runat="server">
        </asp:AjaxScriptManager>
        <table align="center" style="position: relative; padding-top: 35px; padding-bottom:20px">
            <tr>
                <td id="FilterResults" style="width: 119px; padding: 5px; vertical-align: top">
                    <asp:Panel ID="FilterResultsPanel" runat="server" BackColor="White" Style="width: 119px;">
                        <asp:Label ID="RequirementLabel" runat="server" Font-Bold="True" Style="position: absolute;"
                            Text="<%$ Resources:Resource, RequirementLabel2 %>" Width="119px" BackColor="#5D7B9D"
                            ForeColor="White"></asp:Label>
                        <br />
                        <asp:UpdatePanel ID="RequirementUpdatePanel" runat="server">
                            <ContentTemplate>
                                <table id="RequirementTable" width="119px" style="text-align: center;" cellpadding="5px"
                                    cellspacing="2px">
                                    <tr>
                                        <td>
                                            <asp:Label ID="CrewNumberLabel2" runat="server" Text="<%$ Resources:Resource, CrewNumber %>"></asp:Label><br />
                                            &nbsp;
                                            <asp:DropDownList ID="CrewNumberDropDownList" runat="server" DataSourceID="CrewObjectDataSource"
                                                DataTextField="crewnumberValue" DataValueField="crewnumberID" >
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="ExperienceLabel2" runat="server" Text="<%$ Resources:Resource, ExperienceLabel %>"
                                                ></asp:Label>
                                            <br />
                                            &nbsp;<asp:DropDownList ID="ExperienceDropDownList" runat="server" DataSourceID="ExperienceObjectDataSource"
                                                DataTextField="ExperienceValue" DataValueField="ExperienceID" >
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LicensedLabel2" runat="server" Text="<%$ Resources:Resource, LicensedLabel %>"></asp:Label><br />
                                            &nbsp;
                                            <asp:DropDownList ID="LicensedDropDownList" runat="server" DataSourceID="LicensedObjectDataSource"
                                                DataTextField="LicensedValue" DataValueField="LicensedID" >
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="InsuredLabel2" runat="server" Text="<%$ Resources:Resource, InsuredLabel %>"></asp:Label><br />
                                            &nbsp;
                                            <asp:DropDownList ID="InsuredDropDownList" runat="server" DataSourceID="InsuredObjectDataSource"
                                                DataTextField="InsuredValue" DataValueField="InsuredID" >
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="RelocationLabel2" runat="server" Text="<%$ Resources:Resource, RelocationLabel %>"></asp:Label>
                                            <br />
                                            &nbsp;
                                            <asp:DropDownList ID="RelocationDropDownList" runat="server" DataSourceID="RelocationObjectDataSource"
                                                DataTextField="RelocationValue" DataValueField="RelocationID" >
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                <asp:ObjectDataSource ID="ExperienceObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetExperience" TypeName="RequirementDataSetTableAdapters.ExperienceTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:ObjectDataSource ID="CrewObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetCrew" TypeName="RequirementDataSetTableAdapters.CrewNumberTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:ObjectDataSource ID="LicensedObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetLicensed" TypeName="RequirementDataSetTableAdapters.LicensedTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:ObjectDataSource ID="InsuredObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetInsured" TypeName="RequirementDataSetTableAdapters.InsuredTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:ObjectDataSource ID="RelocationObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetRelocation" TypeName="RequirementDataSetTableAdapters.RelocationTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <cc1:RoundedCornersExtender ID="FilterResultsPanelRoundedCornersExtender" runat="server"
                            BorderColor="0, 33, 66" Color="0, 33, 66" Enabled="True" TargetControlID="FilterResultsPanel">
                        </cc1:RoundedCornersExtender>
                    </asp:Panel>
                    <asp:Panel ID="TimeFramePanel" runat="server" Style="position: relative; top: 32px;
                        background-color: #ffffff; overflow: hidden" Width="119px">
                        <br />
                        <asp:Label ID="TimeFrameLabel" runat="server" Font-Bold="True" BackColor="#5D7B9D"
                            ForeColor="White" Style="position: absolute; top: 0px" Text="<%$ Resources:Resource, TimeFrame %>"
                            Width="119px"></asp:Label>
                        <asp:UpdatePanel ID="TimeFrameUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table style="left: 0px; vertical-align: middle; width: 119px; position: relative;
                                    top: 0px; height: 80%; text-align: center">
                                    <tr>
                                        <td style="width: 100px; height: 18px">
                                            <asp:Label ID="TimeFrameMustHaveLabel" runat="server" Style="position: relative"
                                                Text="<%$ Resources:Resource, MustHave %>" Font-Bold="True" ForeColor="#C00000"></asp:Label>
                                            &nbsp;
                                            <asp:DropDownList ID="TimeFrameMustHaveDropDownList" runat="server" Style="position: relative">
                                                <asp:ListItem Value="0">&lt;</asp:ListItem>
                                                <asp:ListItem Value="1">&gt;</asp:ListItem>
                                                <asp:ListItem Value="2">=</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                            <asp:Label ID="MonthsLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, Months %>"
                                                Font-Bold="True" ForeColor="#000040"></asp:Label>&nbsp;<asp:TextBox ID="MonthTextBox"
                                                    runat="server" Style="position: relative" Width="30px"></asp:TextBox>&nbsp;<asp:TextBox
                                                        ID="MonthSilderTargetedTextBox" runat="server" Style="position: relative"></asp:TextBox>
                                            <cc1:SliderExtender ID="MonthSliderExtender" runat="server" BoundControlID="MonthTextBox"
                                                Enabled="True" EnableHandleAnimation="True" Maximum="12" Minimum="0" TargetControlID="MonthSilderTargetedTextBox"
                                                Length="100">
                                            </cc1:SliderExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                            <asp:Label ID="DaysLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, Days %>"
                                                Font-Bold="True" ForeColor="#000040"></asp:Label>&nbsp;<asp:TextBox ID="DaySilderTextBox"
                                                    runat="server" Style="position: relative" Width="30px"></asp:TextBox>&nbsp;<asp:TextBox
                                                        ID="DaySilderTargetedTextBox" runat="server" Style="position: relative"></asp:TextBox>
                                            <cc1:SliderExtender ID="DaySliderExtender" runat="server" BoundControlID="DaySilderTextBox"
                                                Enabled="True" EnableHandleAnimation="True" Maximum="31" Minimum="0" TargetControlID="DaySilderTargetedTextBox"
                                                Length="100">
                                            </cc1:SliderExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                            <asp:Label ID="HoursLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, Hours %>"
                                                Font-Bold="True" ForeColor="#000040"></asp:Label>&nbsp;<asp:TextBox ID="HoursTextBox"
                                                    runat="server" Style="position: relative" Width="30px"></asp:TextBox>&nbsp;<asp:TextBox
                                                        ID="HoursSilderTargetedTextBox" runat="server" Style="position: relative"></asp:TextBox>
                                            <cc1:SliderExtender ID="HoursSliderExtender" runat="server" BoundControlID="HoursTextBox"
                                                Enabled="True" EnableHandleAnimation="True" Maximum="24" Minimum="0" TargetControlID="HoursSilderTargetedTextBox"
                                                Length="100">
                                            </cc1:SliderExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                            <asp:Label ID="MinutesLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, Minutes %>"
                                                Font-Bold="True" ForeColor="#000040"></asp:Label>&nbsp;<asp:TextBox ID="MinutesTextBox"
                                                    runat="server" Style="position: relative" Width="30px"></asp:TextBox>&nbsp;<asp:TextBox
                                                        ID="MinutesSilderTargetedTextBox" runat="server" Style="position: relative"></asp:TextBox>
                                            <cc1:SliderExtender ID="MinutesSliderExtender" runat="server" BoundControlID="MinutesTextBox"
                                                Enabled="True" EnableHandleAnimation="True" Maximum="60" Minimum="0" TargetControlID="MinutesSilderTargetedTextBox"
                                                Length="100">
                                            </cc1:SliderExtender>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <cc1:RoundedCornersExtender ID="TimeFramePanelRoundedCornersExtender" runat="server"
                            BorderColor="0, 33, 66" Color="0, 33, 66" Enabled="True" TargetControlID="TimeFramePanel">
                        </cc1:RoundedCornersExtender>
                    </asp:Panel>
                    <asp:Panel ID="CurrencyPanel" runat="server" Style="position: relative; top: 61px;
                        background-color: #ffffff; overflow: hidden" Width="119px">
                        <br />
                        <asp:Label ID="CurrencyTitleLabel" runat="server" Font-Bold="True" BackColor="#5D7B9D"
                            ForeColor="White" Style="position: absolute; top: 0px" Width="119px" Text="<%$ Resources:Resource, Currency %>"></asp:Label>
                        <asp:UpdatePanel ID="CurrencyUpdatePanel" runat="server">
                            <ContentTemplate>
                                <table style="left: 0px; vertical-align: middle; width: 119px; position: relative;
                                    top: 0px; height: 80%; text-align: center">
                                    <tr>
                                        <td style="width: 100px; height: 18px">
                                            <asp:Label ID="CurrencyMustHaveLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, MustHave %>"
                                                Font-Bold="True" ForeColor="#C00000"></asp:Label>
                                            &nbsp;<br />
                                            <asp:DropDownList ID="CurrencyMustHaveDropDownList" runat="server" Style="position: relative">
                                                <asp:ListItem Value="0">&lt;</asp:ListItem>
                                                <asp:ListItem Value="1">&gt;</asp:ListItem>
                                                <asp:ListItem Value="2">=</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px;">
                                            <asp:Label ID="AmountOfferedLabel" runat="server" Font-Bold="True" ForeColor="#000040"
                                                Style="position: relative;" Text="<%$ Resources:Resource, AmountLabel %>"></asp:Label>&nbsp;<asp:TextBox
                                                    ID="AmountOfferedTextBox" runat="server" Style="position: relative; top: 0px; text-align:center;
                                                    left: 0px; width: 95px;" Text="<%$ Resources:Resource, NoMoney %>"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px;">
                                            <asp:Label ID="CurrencyLabel2" runat="server" Font-Bold="True" ForeColor="#000040"
                                                Style="position: relative;" Text="<%$ Resources:Resource, Currency %>"></asp:Label>
                                            &nbsp;<br />
                                            <asp:DropDownList ID="CurrencyDropDownList2" runat="server" DataSourceID="CurrencyObjectDataSource"
                                                DataTextField="CurrencyValue" DataValueField="CurrencyID" Style="position: relative">
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="CurrencyObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetCurrency" TypeName="JobSearchResultTableAdapters.CurrencyTableAdapter">
                                            </asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <cc1:RoundedCornersExtender ID="CurrencyPanelRoundedCornersExtender" runat="server"
                            BorderColor="0, 33, 66" Color="0, 33, 66" Enabled="True" TargetControlID="CurrencyPanel">
                        </cc1:RoundedCornersExtender>
                    </asp:Panel>
                    <br />
                    <br />
                    <asp:Panel ID="ActionsPanel" runat="server" Style="position: relative; top: 39px;
                        overflow: hidden; text-align: center" Width="119px" BackColor="Transparent">
                        <asp:Button ID="UpdateAllButton" runat="server" Text="<%$ Resources:Resource, Update %>"
                            CssClass="Update" Style="float: right" OnClientClick="fireanimation();" Width="119px" />
                    </asp:Panel>
                </td>
                <td valign="top" style="width: 736px">
                    <div align="center">
                        <div id="GlobalAdvancedSearch">
                            <div>
                                <span style="float: right">
                                    <input id="ToggleButton" type="button" value="-" style="font-weight: bold" />
                                </span>
                            </div>
                            <div id="JobFilter" style="text-align: center">
                                <asp:UpdatePanel ID="AdvancedFilterUpdatePanel" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                        <asp:Panel ID="AdvancedFilter" runat="server" Style="background-color: #9AADC2; padding: 5px">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <table>
                                                            <tr>
                                                                <td style="width: 46%">
                                                                    <asp:Label ID="IndustryJobCountLabel" runat="server" Text="<%$ Resources:Resource, IndustryLabel2 %>"
                                                                        Font-Bold="true"></asp:Label>
                                                                    <br />
                                                                    <asp:ListBox ID="IndustryListBox" runat="server" Height="85px" Style="padding: 10px"
                                                                        DataTextField="CustomJobCount" DataValueField="CategoryID" Font-Size="Small"
                                                                        AutoPostBack="true" onclick="fireanimation();"></asp:ListBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td>
                                                        <table>
                                                            <tr>
                                                                <td style="width: 22%">
                                                                    <asp:Label ID="CityJobCountLabel" runat="server" Text="<%$ Resources:Resource, CityLabel %>"
                                                                        Font-Bold="true"></asp:Label>
                                                                    <br />
                                                                    <asp:ListBox ID="CityListBox" runat="server" Height="85px" Style="padding: 10px"
                                                                        DataTextField="CustomJobCustomRegionCount" DataValueField="RegionID" Font-Size="Small"
                                                                        AutoPostBack="true" onclick="fireanimation();"></asp:ListBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td>
                                                        <table>
                                                            <tr>
                                                                <td style="width: 22%">
                                                                    <asp:Label ID="StateCountLabel" runat="server" Text="<%$ Resources:Resource, RegionName2 %>"
                                                                        Font-Bold="true"></asp:Label>
                                                                    <asp:ListBox ID="StateListBox" runat="server" Height="85px" Style="padding: 10px"
                                                                        DataTextField="CustomJobCustomCountryCount" DataValueField="CountryID" Font-Size="Small"
                                                                        AutoPostBack="true" onclick="fireanimation();"></asp:ListBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <asp:UpdatePanel ID="ProfessionalResultUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div id="ProfessionalGrid">
                                    <asp:Panel ID="ProfessionalResultPanel" Width="736px" runat="server" Style="overflow: hidden">
                                        <div style="background-color: rgb(0, 33, 66); margin-left: 7px; margin-right: 5px;
                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(0, 33, 66);
                                            border-right: 1px solid rgb(0, 33, 66);">
                                        </div>
                                        <div style="background-color: rgb(0, 33, 66); margin-left: 3px; margin-right: 1px;
                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 4px solid rgb(0, 33, 66);
                                            border-right: 4px solid rgb(0, 33, 66);">
                                        </div>
                                        <div style="background-color: rgb(0, 33, 66); margin-left: 2px; margin-right: 0px;
                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(0, 33, 66);
                                            border-right: 1px solid rgb(0, 33, 66);">
                                        </div>
                                        <div style="background-color: rgb(0, 33, 66); margin-left: 1px; margin-right: -1px;
                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(0, 33, 66);
                                            border-right: 1px solid rgb(0, 33, 66);">
                                        </div>
                                        <div style="background-color: rgb(0, 33, 66); margin-left: 1px; margin-right: -1px;
                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(0, 33, 66);
                                            border-right: 1px solid rgb(0, 33, 66);">
                                        </div>
                                        <div style="background-color: rgb(0, 33, 66); margin-left: 0px; margin-right: -2px;
                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(0, 33, 66);
                                            border-right: 1px solid rgb(0, 33, 66);">
                                        </div>
                                        <div style="background-color: rgb(0, 33, 66); margin-left: 0px; margin-right: -2px;
                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(0, 33, 66);
                                            border-right: 1px solid rgb(0, 33, 66);">
                                        </div>
                                        <asp:GridView ID="JobResultGridView" runat="server" AutoGenerateColumns="False" DataSourceID="JobResultSqlDataSource"
                                            GridLines="None" OnSelectedIndexChanged="JobResultGridView_SelectedIndexChanged"
                                            AllowPaging="True" AllowSorting="True" CellPadding="2" Font-Size="10pt" Width="736px"
                                            ForeColor="#333333" OnRowCommand="JobResultGridView_RowCommand" DataKeyNames="ProjectID,StatusInt"
                                            EnableModelValidation="True" CssClass="gridHeader" ShowFooter="True">
                                            <Columns>
                                                <asp:BoundField DataField="ProjectID" HeaderText="<%$ Resources:Resource, ID %>"
                                                    SortExpression="ProjectID">
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:BoundField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div style="background-color: rgb(64, 0, 0); margin-left: 5px; margin-right: 3px;
                                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(64, 0, 0);
                                                            border-right: 1px solid rgb(64, 0, 0);">
                                                        </div>
                                                        <div style="background-color: rgb(64, 0, 0); margin-left: 2px; margin-right: 0px;
                                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 3px solid rgb(64, 0, 0);
                                                            border-right: 3px solid rgb(64, 0, 0);">
                                                        </div>
                                                        <div style="background-color: rgb(64, 0, 0); margin-left: 1px; margin-right: -1px;
                                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(64, 0, 0);
                                                            border-right: 1px solid rgb(64, 0, 0);">
                                                        </div>
                                                        <div style="background-color: rgb(64, 0, 0); margin-left: 0px; margin-right: -2px;
                                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(64, 0, 0);
                                                            border-right: 1px solid rgb(64, 0, 0);">
                                                        </div>
                                                        <div style="background-color: rgb(64, 0, 0); margin-left: 0px; margin-right: -2px;
                                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(64, 0, 0);
                                                            border-right: 1px solid rgb(64, 0, 0);">
                                                        </div>
                                                        <div style="left: 0px; top: -7px; overflow: auto; border-style: none solid; border-left: 1px solid rgb(64, 0, 0);
                                                            border-right: 1px solid rgb(64, 0, 0);" id="">
                                                            <table style="position: relative; left: 0px; top: 0px;">
                                                                <tr>
                                                                    <td style="width: 80px; height: 112px">
                                                                        <asp:Image ID="ProjectPhoto" runat="server" Height="74px" ImageUrl='<%# Eval("PhotoPath", "{0}") %>'
                                                                            Style="position: relative" Width="64px" />
                                                                    </td>
                                                                    <td style="width: 90px; height: 112px">
                                                                        <asp:TextBox ID="DescriptionTextBox" runat="server" Height="65px" Style="position: relative;
                                                                            top: 8px;" Text='<%# Eval("Description", "{0}") %>' TextMode="MultiLine" ReadOnly="True"
                                                                            Rows="5" Width="90px"></asp:TextBox><br />
                                                                        <asp:LinkButton ID="GlobalProjectPanelDescriptionLinkButton" runat="server" CausesValidation="False"
                                                                            ForeColor="#000040" Style="left: 42px; position: relative; top: 11px" Font-Bold="True"
                                                                            CommandName="select" OnClick="GlobalProjectPanelDescriptionLinkButton_Click"
                                                                            Text="<%$ Resources:Resource, More %>" OnClientClick="MoreProjectFireAnimation();"></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div style="background-color: rgb(64, 0, 0); margin-left: 0px; margin-right: -2px;
                                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(64, 0, 0);
                                                            border-right: 1px solid rgb(64, 0, 0);">
                                                        </div>
                                                        <div style="background-color: rgb(64, 0, 0); margin-left: 0px; margin-right: -2px;
                                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(64, 0, 0);
                                                            border-right: 1px solid rgb(64, 0, 0);">
                                                        </div>
                                                        <div style="background-color: rgb(64, 0, 0); margin-left: 1px; margin-right: -1px;
                                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(64, 0, 0);
                                                            border-right: 1px solid rgb(64, 0, 0);">
                                                        </div>
                                                        <div style="background-color: rgb(64, 0, 0); margin-left: 2px; margin-right: 0px;
                                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 3px solid rgb(64, 0, 0);
                                                            border-right: 3px solid rgb(64, 0, 0);">
                                                        </div>
                                                        <div style="background-color: rgb(64, 0, 0); margin-left: 5px; margin-right: 3px;
                                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(64, 0, 0);
                                                            border-right: 1px solid rgb(64, 0, 0);">
                                                        </div>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="170px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="AmountOffered" HeaderText="<%$ Resources:Resource, CurrencySymbol %>"
                                                    SortExpression="AmountOffered">
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="true" ForeColor="Maroon" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="<%$ Resources:Resource, TimeLeft %>" SortExpression="TimeLeft">
                                                    <ItemTemplate>
                                                        <asp:Label ID="BoundedTimeLeft" runat="server" Text='<%# Bind("TimeLeft") %>' Width="70px"
                                                            Font-Size="10pt"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="70px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="<%$ Resources:Resource, Status %>" SortExpression="Posted">
                                                    <ItemTemplate>
                                                        <asp:Image ID="OpenProjectImage" runat="server" ImageUrl="../Images/OpenFolder.png"
                                                            Visible='<%# Eval("StatusInt") = 0 %>' />
                                                        <asp:Image ID="ClosedProjectImage" runat="server" ImageUrl="../Images/RedFolder.png"
                                                            Visible='<%# Eval("StatusInt") > 0 %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="<%$ Resources:Resource, LocationLabel %>" SortExpression="CountryName">
                                                    <ItemTemplate>
                                                        <table style="width: 50px; position: relative;">
                                                            <tr>
                                                                <td style="width: 50px; text-align: center">
                                                                    <asp:Label ID="CountryBoundedLabel" runat="server" Style="position: relative" Text='<%# Bind("CountryName", "{0}") %>'
                                                                        ></asp:Label><br />
                                                                    <asp:Image ID="CountryFlag" runat="server" ImageUrl='<%# Eval("CountryFlag") %>'
                                                                        Width="30px" Height="18px" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div style="background-color: Gray; margin-left: 5px; margin-right: 3px; height: 1px;
                                                            font-size: 1px; overflow: hidden; border-left: 1px solid Gray; border-right: 1px solid Gray;">
                                                        </div>
                                                        <div style="background-color: Gray; margin-left: 2px; margin-right: 0px; height: 1px;
                                                            font-size: 1px; overflow: hidden; border-left: 3px solid Gray; border-right: 3px solid Gray;">
                                                        </div>
                                                        <div style="background-color: Gray; margin-left: 1px; margin-right: -1px; height: 1px;
                                                            font-size: 1px; overflow: hidden; border-left: 1px solid Gray; border-right: 1px solid Gray;">
                                                        </div>
                                                        <div style="background-color: Gray; margin-left: 0px; margin-right: -2px; height: 1px;
                                                            font-size: 1px; overflow: hidden; border-left: 1px solid Gray; border-right: 1px solid Gray;">
                                                        </div>
                                                        <div style="background-color: Gray; margin-left: 0px; margin-right: -2px; height: 1px;
                                                            font-size: 1px; overflow: hidden; border-left: 1px solid Gray; border-right: 1px solid Gray;">
                                                        </div>
                                                        <div id="BriefProjectBidPanel" style="left: 1px; top: -8px; overflow: auto; border-style: none solid;
                                                            border-left: 1px solid Gray; border-right: 1px solid Gray;">
                                                            <table border="0" cellpadding="0" width="200px">
                                                                <tr>
                                                                    <td rowspan="2" style="width: 69px; height: 90px;">
                                                                        <asp:Label ID="HighestBidLabel" runat="server" Style="position: relative; left: 2px;
                                                                            top: -8px;" Text="<%$ Resources:Resource, HighestBidLabel %>" Font-Bold="True"
                                                                            ForeColor="Maroon"></asp:Label><br />
                                                                        <br />
                                                                        <asp:Label ID="BidderLabel" runat="server" Style="position: relative; left: 2px;
                                                                            top: -8px;" Text="<%$ Resources:Resource, Bidder %>" Font-Bold="True" ForeColor="Maroon"></asp:Label><br />
                                                                        <br />
                                                                        <asp:Label ID="BidsLabel" runat="server" Style="position: relative; left: 2px; top: -8px;"
                                                                            Text="<%$ Resources:Resource, BidLabel %>" Width="99px" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                    </td>
                                                                    <td rowspan="2" style="width: 80px; text-align: center; height: 90px;">
                                                                        <asp:Label ID="BoundedHighestBidLabel" runat="server" Style="position: relative;
                                                                            top: -4px; left: -3px;" Text='<%# Bind("HighestBid", "{0}") %>' Font-Size="10pt"></asp:Label><br />
                                                                        <br />
                                                                        <asp:Label ID="BoundedHighestBidUsername" runat="server" Style="position: relative;
                                                                            top: -4px; left: -3px;" Text='<%# Bind("HighestBidUsername", "{0}") %>' Font-Size="10pt"></asp:Label><br />
                                                                        <br />
                                                                        <asp:Label ID="BoundedNumberofBids" runat="server" Style="position: relative; top: -4px;
                                                                            left: -3px;" Text='<%# Bind("NumberofBids", "{0}") %>' Font-Size="10pt"></asp:Label><br />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:LinkButton ID="MoreBriefProjectBidLinkButton" runat="server" ForeColor="#000040"
                                                                Style="position: relative; left: 78px; top: -2px;" CausesValidation="False" Font-Bold="True"
                                                                CommandName="select" OnClick="MoreBriefProjectBidLinkButton_Click" Text="<%$ Resources:Resource, More %>"
                                                                OnClientClick="MoreProjectFireAnimation();"></asp:LinkButton>
                                                        </div>
                                                        <div style="background-color: Gray; margin-left: 0px; margin-right: -2px; height: 1px;
                                                            font-size: 1px; overflow: hidden; border-left: 1px solid Gray; border-right: 1px solid Gray;">
                                                        </div>
                                                        <div style="background-color: Gray; margin-left: 0px; margin-right: -2px; height: 1px;
                                                            font-size: 1px; overflow: hidden; border-left: 1px solid Gray; border-right: 1px solid Gray;">
                                                        </div>
                                                        <div style="background-color: Gray; margin-left: 1px; margin-right: -1px; height: 1px;
                                                            font-size: 1px; overflow: hidden; border-left: 1px solid Gray; border-right: 1px solid Gray;">
                                                        </div>
                                                        <div style="background-color: Gray; margin-left: 2px; margin-right: 0px; height: 1px;
                                                            font-size: 1px; overflow: hidden; border-left: 3px solid Gray; border-right: 3px solid Gray;">
                                                        </div>
                                                        <div style="background-color: Gray; margin-left: 5px; margin-right: 3px; height: 1px;
                                                            font-size: 1px; overflow: hidden; border-left: 1px solid Gray; border-right: 1px solid Gray;">
                                                        </div>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom" Width="170px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="BidLinkButton" runat="server" BorderColor="White" BorderStyle="Solid"
                                                            BorderWidth="2px" CausesValidation="False" Font-Bold="True" ForeColor="White"
                                                            Style="left: 0px; position: relative" Width="85px" CommandName="select" OnClick="BidLinkButton_Click"
                                                            OnClientClick="fireanimation();" Text="<%$ Resources:Resource, BidLabel %>"></asp:LinkButton>
                                                        <br />
                                                        <br />
                                                        <asp:LinkButton ID="WatchListLinkButton" runat="server" BorderColor="White" BorderStyle="Solid"
                                                            BorderWidth="2px" CausesValidation="False" Font-Bold="True" ForeColor="White"
                                                            Style="position: relative" Width="86px" CommandName="select" OnClick="WatchListLinkButton_Click"
                                                            OnClientClick="fireanimation();" Text="<%$ Resources:Resource, WatchListLabel %>"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ControlStyle BackColor="#284775" BorderColor="White" BorderStyle="Solid" BorderWidth="2px" />
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="White" Width="100px"
                                                BackColor="#5D7B9D" Font-Bold="True" />
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <PagerSettings Mode="Numeric" />
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" Font-Bold="True"  CssClass="pager" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                            <EditRowStyle BackColor="#999999" />
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <EmptyDataRowStyle BackColor="#5D7B9D" />
                                            <EmptyDataTemplate>
                                                <asp:Label ID="EmptyProjectLabel" runat="server" Font-Bold="True" ForeColor="White"
                                                    Style="position: relative" Text="<%$ Resources:Resource, EmptyProjectResult %>"
                                                    Width="191px"></asp:Label>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                        <div style="background-color: rgb(0, 33, 66); margin-left: 0px; margin-right: -2px;
                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(0, 33, 66);
                                            border-right: 1px solid rgb(0, 33, 66);">
                                        </div>
                                        <div style="background-color: rgb(0, 33, 66); margin-left: 0px; margin-right: -2px;
                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(0, 33, 66);
                                            border-right: 1px solid rgb(0, 33, 66);">
                                        </div>
                                        <div style="background-color: rgb(0, 33, 66); margin-left: 1px; margin-right: -1px;
                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(0, 33, 66);
                                            border-right: 1px solid rgb(0, 33, 66);">
                                        </div>
                                        <div style="background-color: rgb(0, 33, 66); margin-left: 1px; margin-right: -1px;
                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(0, 33, 66);
                                            border-right: 1px solid rgb(0, 33, 66);">
                                        </div>
                                        <div style="background-color: rgb(0, 33, 66); margin-left: 2px; margin-right: 0px;
                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(0, 33, 66);
                                            border-right: 1px solid rgb(0, 33, 66);">
                                        </div>
                                        <div style="background-color: rgb(0, 33, 66); margin-left: 3px; margin-right: 1px;
                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 4px solid rgb(0, 33, 66);
                                            border-right: 4px solid rgb(0, 33, 66);">
                                        </div>
                                        <div style="background-color: rgb(0, 33, 66); margin-left: 7px; margin-right: 5px;
                                            height: 1px; font-size: 1px; overflow: hidden; border-left: 1px solid rgb(0, 33, 66);
                                            border-right: 1px solid rgb(0, 33, 66);">
                                        </div>
                                    </asp:Panel>
                                    <asp:SqlDataSource ID="JobResultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                        
                                        SelectCommand="SELECT ProjectRequirements.ProjectID, ProjectRequirements.CategoryName, ProjectRequirements.AmountOffered, ProjectRequirements.Description, ProjectRequirements.CountryName, (SELECT Path FROM CountriesUpdate WHERE (CountryId = ProjectRequirements.CountryID)) AS CountryFlag, ProjectRequirements.RegionName, ProjectPhoto.PhotoID, ProjectPhoto.PhotoPath, Projects.Status, Projects.StatusInt, Projects.HighestBid, Projects.HighestBidderID, Projects.HighestBidUsername, Projects.NumberofBids, ProjectRequirements.TimeLeft FROM ProjectRequirements INNER JOIN Projects ON ProjectRequirements.ProjectID = Projects.ProjectID INNER JOIN ProjectPhoto ON ProjectRequirements.ProjectID = ProjectPhoto.ProjectID">
                                    </asp:SqlDataSource>
                                </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </td>
                <td style="width: 119px; padding: 5px; vertical-align: top">
                    <asp:Panel ID="UserGreetingPanel" runat="server" Style="text-align: center">
                        <asp:LoginView ID="ProfileLoginView" runat="server">
                            <LoggedInTemplate>
                                <asp:Literal ID="WelcomeLiteral" runat="server" Text="<%$ Resources:Resource, Welcome %>"></asp:Literal>
                                <asp:LoginName ID="ProfileLoginName" runat="server" Font-Bold="true" ForeColor="Red"
                                    Style="position: relative" />
                                <br />
                                <asp:LinkButton ID="GoToProfileLinkButton" runat="server" Font-Bold="True" ForeColor="#000066"
                                    OnClick="GoToProfileLinkButton_Click" OnClientClick="fireanimation();" Text="<%$ Resources:Resource, GoToProfile %>"
                                    CausesValidation="false" CssClass="UnderlineLink"></asp:LinkButton>
                                     <div>
                                         <br />
                                     </div>
                            </LoggedInTemplate>
                            <AnonymousTemplate>
                                <asp:LoginName ID="ProfileLoginName" runat="server" Style="position: relative" />
                            </AnonymousTemplate>
                        </asp:LoginView>
                    </asp:Panel>
                    <asp:Panel ID="BackToSearchPanel" runat="server" CssClass="BlueMenublock" Height="14px" 
                        Width="150px">
                        <ul>
                            <li>
                                <asp:LinkButton ID="BackToSearchLinkButton" runat="server" PostBackUrl="~/NotAuthenticated/FindJob.aspx"
                                    CausesValidation="False" Width="119px" Text="<%$ Resources:Resource, BackToSearch %>"></asp:LinkButton></li>
                        </ul>
                        <br />
                        <asp:Panel ID="FilterLocationPanel" runat="server" Style="position: relative; top: 92px;
                            background-color: #ffffff; overflow: hidden" Width="119px">
                            <br />
                            <asp:Label ID="LocationHeaderLabel" runat="server" Font-Bold="True" BackColor="#5D7B9D"
                                ForeColor="White" Style="position: absolute; top: 0px" Text="<%$ Resources:Resource, LocationLabel %>"
                               Width="119px"></asp:Label>
                            <asp:UpdatePanel ID="LocationUpdatePanel" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table style="left: 0px; vertical-align: middle; width: 119px; position: relative;
                                        top: 0px; height: 80%; text-align: center">
                                        <tr>
                                            <td style="width: 100px; height: 18px">
                                                <asp:Label ID="LocationPanelMustBeLabel" runat="server" Style="position: relative"
                                                    Text="<%$ Resources:Resource, MustBe %>"  Font-Bold="True"
                                                    ForeColor="#C00000"></asp:Label>
                                                &nbsp;
                                                <asp:DropDownList ID="LocationDropDownList" runat="server" Style="position: relative"
                                                    >
                                                    <asp:ListItem Value="0">&lt;</asp:ListItem>
                                                    <asp:ListItem Value="1">&gt;</asp:ListItem>
                                                    <asp:ListItem Value="2">=</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr align="center">
                                            <td style="width: 100px; text-align: center;">
                                                <table align="center" width="100px">
                                                    <tr align="center">
                                                        <td align="center">
                                                            <asp:TextBox ID="LocationTextBox" runat="server" Style="position: relative" Width="30px">
                                                            </asp:TextBox>
                                                            <asp:TextBox ID="LocationSliderTargetedTextBox" runat="server" Style="position: relative"></asp:TextBox>
                                                            <cc1:SliderExtender ID="LocationSliderExtender" runat="server" Enabled="True" Maximum="250"
                                                                Minimum="0" BoundControlID="LocationTextBox" EnableHandleAnimation="True" TargetControlID="LocationSliderTargetedTextBox"
                                                                Length="250" Orientation="vertical">
                                                            </cc1:SliderExtender>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="FromLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, From %>"
                                                    ></asp:Label>
                                                <asp:TextBox ID="FromTextBox" runat="server" Style="position: relative; top: 0px;
                                                    left: 0px; height: 20px; width: 58px;" ReadOnly="True" BackColor="#E5E5E5"></asp:TextBox>&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <cc1:RoundedCornersExtender ID="LocationPanelRoundedCornersExtender" runat="server"
                                BorderColor="0, 33, 66" Color="0, 33, 66" Enabled="True" TargetControlID="FilterLocationPanel">
                            </cc1:RoundedCornersExtender>
                        </asp:Panel>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="BidPanel" runat="server" Height="392px" Style="display: none; z-index: 102;"
                        Width="612px">
                        <asp:UpdatePanel ID="BidUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <cc1:ModalPopupExtender ID="BidPanelModalPopupExtender" runat="server" TargetControlID="BidPanelModalPopupExtenderTargetedLabel"
                                    PopupControlID="BidPanel" BackgroundCssClass="modalBackground">
                                </cc1:ModalPopupExtender>
                                <asp:Panel ID="NewBidPanel" runat="server" Style="position: relative; left: 2px;
                                    top: 20px;" Height="99%" Width="99%">
                                    <asp:ObjectDataSource ID="NewBidObjectDataSource" runat="server" DeleteMethod="DeleteProject"
                                        InsertMethod="InsertProject" OldValuesParameterFormatString="original_{0}" SelectMethod="GetProject"
                                        TypeName="JobSearchResultTableAdapters.ProjectsTableAdapter" UpdateMethod="UpdateProject">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_ProjectID" Type="Int32" />
                                            <asp:Parameter Name="original_HighestBid" Type="Double" />
                                            <asp:Parameter Name="original_HighestBidderID" Type="Int32" />
                                            <asp:Parameter Name="original_HighestBidUsername" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="HighestBid" Type="Double" />
                                            <asp:Parameter Name="HighestBidderID" Type="Int32" />
                                            <asp:Parameter Name="HighestBidUsername" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="JobResultGridView" Name="ProjectID" PropertyName="SelectedValue"
                                                Type="Int32" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="HighestBid" Type="Double" />
                                            <asp:Parameter Name="HighestBidderID" Type="Int32" />
                                            <asp:Parameter Name="HighestBidUsername" Type="String" />
                                            <asp:Parameter Name="original_ProjectID" Type="Int32" />
                                            <asp:Parameter Name="original_HighestBid" Type="Double" />
                                            <asp:Parameter Name="original_HighestBidderID" Type="Int32" />
                                            <asp:Parameter Name="original_HighestBidUsername" Type="String" />
                                        </UpdateParameters>
                                    </asp:ObjectDataSource>
                                    <table style="left: 1px; width: 100%; position: relative; top: 0px; height: 100%;
                                        background-color: #ffffff">
                                        <tr>
                                            <td style="width: 50%; height: 13px; text-align: center; background-color: #5d7b9d;">
                                                <asp:Label ID="TimeLeftLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, TimeLeftLabel %>"
                                                    Font-Bold="True" ForeColor="White"></asp:Label>
                                            </td>
                                            <td style="width: 234px; height: 13px; text-align: center;">
                                                <asp:Label ID="FormatedTimeLeftLabel" runat="server" Height="26px" Style="position: relative"
                                                    Width="100%" BackColor="Maroon" Font-Bold="True" ForeColor="White"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 50%; text-align: center;">
                                                <asp:Image ID="ProjectImage" runat="server" Style="position: relative; top: 11px;"
                                                    Width="146px" Height="166px" />
                                            </td>
                                            <td style="width: 234px; text-align: center; vertical-align: middle;">
                                                <asp:GridView ID="NewBidGridView" runat="server" DataSourceID="NewBidObjectDataSource"
                                                    Style="position: relative; vertical-align: middle; text-align: center;" AutoGenerateColumns="False"
                                                    ShowHeader="False" GridLines="None" Width="50%" CssClass="gridHeader" >
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <table style="width: 80%; position: relative; height: 113%; left: 0px; vertical-align: middle;
                                                                    top: 4px; text-align: center;" cellspacing="0">
                                                                    <tr>
                                                                        <td style="width: 25%; background-color: #5d7b9d; height: 26px;">
                                                                            <asp:Label ID="ProjectIDLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, ID %>"
                                                                                Font-Bold="True" ForeColor="White"></asp:Label>
                                                                        </td>
                                                                        <td style="width: 83px; height: 26px">
                                                                            &nbsp;
                                                                            <asp:Label ID="BoundedProjectIDLabel" runat="server" Style="position: relative; top: -6px;
                                                                                left: 31px;" Text='<%# Bind("ProjectID", "{0}") %>' Height="19px" Width="53px"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="background-color: #5d7b9d; width: 25%;">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td style="background-color: #ffffff; width: 83px;">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 25%; background-color: #5d7b9d;">
                                                                            <asp:Label ID="BidderLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, Bidder %>"
                                                                                Font-Bold="True" ForeColor="White"></asp:Label>
                                                                        </td>
                                                                        <td style="width: 83px">
                                                                            &nbsp;
                                                                            <asp:Label ID="BoundedHighestBidUserNameLabel" runat="server" Style="position: relative;
                                                                                top: -5px; left: 30px;" Text='<%# Bind("HighestBidUsername", "{0}") %>' Height="19px"
                                                                                Width="53px"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 25%; background-color: #5d7b9d">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td style="background-color: #ffffff; width: 83px;">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 25%; background-color: #5d7b9d; height: 35px;">
                                                                            <asp:Label ID="HighestBidLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, HighestBidLabel %>"
                                                                                Font-Bold="True" ForeColor="White" Width="98px"></asp:Label>
                                                                        </td>
                                                                        <td style="width: 83px; height: 35px">
                                                                            &nbsp;
                                                                            <asp:Label ID="BoundedHighestBidLabel" runat="server" Style="position: relative;
                                                                                top: -3px; left: 34px;" Text='<%# Bind("HighestBid", "{0}") %>' Height="19px"
                                                                                Width="61px"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 136px; height: 21px">
                                            </td>
                                            <td style="width: 234px; height: 21px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 136px; height: 21px; text-align: center; background-color: #5d7b9d;">
                                                <asp:Label ID="CurrencyLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, CurrencyLabel %>"
                                                    Font-Bold="True" ForeColor="White"></asp:Label>
                                            </td>
                                            <td style="width: 234px; height: 21px; text-align: center; background-color: #5d7b9d;">
                                                <asp:Label ID="AmountLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, Amount %>"
                                                    Font-Bold="True" ForeColor="White"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 136px; height: 21px; text-align: center;">
                                                <asp:DropDownList ID="CurrencyDropDownList" runat="server" Style="position: relative"
                                                    DataSourceID="CurrencyObjectDataSource" DataTextField="CurrencyValue" DataValueField="CurrencyID"
                                                    Width="100px">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 234px; height: 21px; text-align: center;">
                                                <asp:TextBox ID="NewAmountTextBox" runat="server" Style="position: relative">  </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 136px; height: 21px; text-align: center">
                                                <cc1:ValidatorCalloutExtender ID="NewBidValidatorCalloutExtender" runat="server"
                                                    TargetControlID="NewBidRequiredFieldValidator">
                                                </cc1:ValidatorCalloutExtender>
                                            </td>
                                            <td style="width: 234px; height: 21px; text-align: center">
                                                <asp:RequiredFieldValidator ID="NewBidRequiredFieldValidator" runat="server" ControlToValidate="NewAmountTextBox"
                                                    Display="None" ErrorMessage="<%$ Resources:Resource, NewBidRequiredValidator %>"
                                                    Style="position: relative"></asp:RequiredFieldValidator>&nbsp;
                                                <asp:CustomValidator ID="NewBidCustomValidator" runat="server" ErrorMessage="*" OnServerValidate="NewBidCustomValidator_ServerValidate"
                                                    Style="position: relative" SetFocusOnError="True"></asp:CustomValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 136px; height: 21px">
                                                &nbsp;
                                            </td>
                                            <td style="width: 234px; height: 21px; text-align: right;">
                                                <div id="ItemTemplateDiv" onmouseout="document.getElementById('PlaceBidButton').style.background='#5D7B9D'; document.getElementById('PlaceBidButton').style.cursor = 'pointer';" 
                                                                onmouseover="document.getElementById('PlaceBidButton').style.background='#0099CC';" 
                                                                >
                                                <asp:Button ID="PlaceBidButton" runat="server" Style="position: relative" Text="<%$ Resources:Resource, Bid %>"
                                                    BackColor="#5D7B9D" BorderColor="#400000" Font-Bold="True" ForeColor="White"
                                                    OnClick="PlaceBidButton_Click" />
                                                    </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 136px; height: 21px">
                                            </td>
                                            <td style="width: 234px; height: 21px; text-align: right">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 136px; height: 21px">
                                            </td>
                                            <td style="width: 234px; height: 21px; text-align: right">
                                                <asp:Button ID="CancelNewBidButton" runat="server" Style="position: relative" Text="<%$ Resources:Resource, Cancel %>"
                                                    OnClick="CancelNewBid_Click" CausesValidation="False" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Label ID="BidPanelModalPopupExtenderTargetedLabel" runat="server" Style="position: relative"
                                    Width="153px"></asp:Label>
                                &nbsp;
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                    <asp:Panel ID="ClosedProjectPanel" runat="server" Height="218px" Style="display: none;
                        left: 48px; position: relative; top: 1418px; z-index: 105;" Width="440px" BackColor="Silver"
                        BorderColor="MidnightBlue" BorderStyle="Solid" BorderWidth="3px">
                        <asp:UpdatePanel ID="ClosedProjectUpdatePanel" runat="server">
                            <ContentTemplate>
                                <cc1:ModalPopupExtender ID="ClosedProjectModalPopupExtender" runat="server" TargetControlID="ClosedProjectModalPopupExtenderTargetedLabel"
                                    PopupControlID="ClosedProjectPanel" BackgroundCssClass="modalBackground">
                                </cc1:ModalPopupExtender>
                                <table style="width: 440px; height: 218px">
                                    <tr>
                                        <td class="bothsides">
                                        </td>
                                        <td class="custommiddle">
                                        </td>
                                        <td class="bothsides">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bothsides">
                                        </td>
                                        <td class="custommiddle">
                                            <img width="50px" height="50px" src="../Images/warning-sign.jpg" alt="warning" />
                                            <asp:Label ID="ClosedProjectModalPopupExtenderTargetedLabel" runat="server" Font-Bold="True"
                                                ForeColor="Black" Text="<%$ Resources:Resource, ProjectClosedLabel %>"></asp:Label>
                                        </td>
                                        <td class="bothsides">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="bothsides">
                                        </td>
                                        <td class="custommiddle">
                                        </td>
                                        <td class="bothsides">
                                            <asp:Button ID="CloseProjectClosedButton" runat="server" Text="<%$ Resources:Resource, OkButton %>"
                                                OnClick="CloseProjectClosedButton_Click" Width="55px" CausesValidation="False" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:Panel ID="HistoryBidPanel" runat="server" Height="348px" Style="display: none;
            position: relative; z-index: 103;" Width="450px">
            <asp:UpdatePanel ID="HistoryBidUpdatePanel" runat="server">
                <ContentTemplate>
                    <cc1:ModalPopupExtender ID="HistoryBidModalPopupExtender" runat="server" TargetControlID="HistoryBidModalPopupExtenderTargetedLabel"
                        PopupControlID="HistoryBidPanel" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                    <cc1:RoundedCornersExtender ID="HistoryBidRoundedCornersExtender" runat="server"
                        BorderColor="Gray" Color="Gray" Enabled="True" TargetControlID="HistoryBidGridView">
                    </cc1:RoundedCornersExtender>
                    <br />
                    <asp:Label ID="HistoryBidModalPopupExtenderTargetedLabel" runat="server" Style="position: relative"
                        Width="153px"></asp:Label>
                    <asp:GridView ID="HistoryBidGridView" runat="server" AutoGenerateColumns="False"
                        DataSourceID="BidsHistoryObjectDataSource" Style="position: relative;" CellPadding="4"
                        HorizontalAlign="Center" AllowPaging="True" PageSize="7" OnPageIndexChanging="HistoryBidGridView_PageIndexChanging"
                        EnableModelValidation="True" GridLines="None" AllowSorting="True" ForeColor="#333333" CssClass="gridHeader">
                        <AlternatingRowStyle BackColor="White" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="AmountOffered" HeaderText="<%$ Resources:Resource, AmountOfferedLabel %>"
                                SortExpression="AmountOffered" />
                            <asp:BoundField DataField="Currency" HeaderText="<%$ Resources:Resource, CurrencyLabel %>"
                                SortExpression="Currency" />
                            <asp:BoundField DataField="BidDate" HeaderText="<%$ Resources:Resource, Date %>"
                                SortExpression="BidDate" />
                            <asp:BoundField DataField="BidderUserName" HeaderText="<%$ Resources:Resource, Bidder %>"
                                SortExpression="BidderUserName" />
                        </Columns>
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    &nbsp;<br />
                    <asp:Button ID="HistoryBidButton" runat="server" CausesValidation="False" Text="<%$ Resources:Resource, OkButton %>"
                        Width="63px" OnClick="HistoryBidButton_Click" Style="left: 371px; position: relative;
                        top: 0px" />
                    <asp:ObjectDataSource ID="BidsHistoryObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetBidHistory" TypeName="JobSearchResultTableAdapters.BidsHistoryTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="JobResultGridView" Name="ProjectID" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="HistoryBidGridView" EventName="PageIndexChanging" />
                    <asp:AsyncPostBackTrigger ControlID="HistoryBidGridView" EventName="Sorting" />
                </Triggers>
            </asp:UpdatePanel>
        </asp:Panel>
        <asp:Panel ID="MoreProject" runat="server" Height="510px" Style="display: none; left: 48px;
            position: relative; top: 1218px; z-index: 103;" Width="940px" BackColor="White"
            BorderColor="Maroon" BorderStyle="Solid" BorderWidth="3px">
            <asp:UpdatePanel ID="MoreProjectUpdatePanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <cc1:ModalPopupExtender ID="MoreProjectModalPopupExtender" runat="server" TargetControlID="TargetLabel"
                        PopupControlID="MoreProject" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                    <asp:Label ID="TargetLabel" runat="server" Style="position: relative" Width="153px"></asp:Label>
                    <asp:Panel ID="GlobalPanel" runat="server" Height="370px" Style="left: 5px; position: absolute;
                        top: 9px; z-index: 101;" Width="87%" BackColor="White">
                        <asp:Panel ID="RequirementPanel" runat="server" Height="212px" Style="left: 264px;
                            overflow: hidden; position: absolute; top: 256px" Width="274px" Font-Size="10pt">
                            <table style="left: 0px; width: 100%; position: relative; top: 5px; height: 100%">
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="ProjectRequirementLabel" runat="server" Font-Bold="True" ForeColor="Maroon"
                                            Style="position: relative" Text="<%$ Resources:Resource, ProjectRequirementLabel %>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="ExperienceLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, ExperienceLabel %>"></asp:Label>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:Label ID="ExperienceView" runat="server" Style="position: relative" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="NumberofCrewsLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, NumberofCrewsLabel %>"></asp:Label>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:Label ID="CrewNumberView" runat="server" Style="position: relative" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="LicensedLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, ProjectRequirementLabel %>"></asp:Label>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:Label ID="LicensedView" runat="server" Style="position: relative" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="InsuredLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, InsuredLabel %>"></asp:Label>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:Label ID="InsuredView" runat="server" Style="position: relative" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="RelocationLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, RelocationLabel %>"></asp:Label>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:Label ID="RelocationView" runat="server" Style="position: relative" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="ProjectSpecificationPanel" runat="server" Height="212px" Style="left: 264px;
                            overflow: hidden; position: absolute; top: 11px" Width="274px">
                            <table style="left: 0px; width: 100%; position: relative; top: 2px; height: 100%">
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="ProjectSpecificationLabel" runat="server" Font-Bold="True" Font-Size="10pt"
                                            ForeColor="Maroon" Style="position: relative" Text="<%$ Resources:Resource, ProjectSpecificationLabel %>"
                                            Width="141px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="ProjectIDLabel" runat="server" Font-Size="10pt" Style="position: relative"
                                            Text="<%$ Resources:Resource, ProjectIDLabel %>"></asp:Label>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:Label ID="ProjectIDView" runat="server" Font-Size="10pt" Style="position: relative"
                                            Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="TitleLabel" runat="server" Font-Size="10pt" Style="position: relative"
                                            Text="<%$ Resources:Resource, TitleLabel %>"></asp:Label>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:Label ID="TitleView" runat="server" Font-Size="10pt" Style="position: relative"
                                            Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="IndustryLabel" runat="server" Font-Size="10pt" Style="position: relative"
                                            Text="<%$ Resources:Resource, IndustryLabel %>"></asp:Label>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:Label ID="IndustryView" runat="server" Font-Size="10pt" Style="position: relative"
                                            Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="SpecializationLabel" runat="server" Font-Size="10pt" Style="position: relative"
                                            Text="<%$ Resources:Resource, SpecializationLabel %>"></asp:Label>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:Label ID="SpecializationView" runat="server" Font-Size="10pt" Style="position: relative"
                                            Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="Label1" runat="server" Font-Size="10pt" Style="position: relative"
                                            Text="<%$ Resources:Resource, TimeLeftLabel %>"></asp:Label>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:Label ID="TimeLeftView" runat="server" Font-Size="10pt" Style="position: relative"
                                            Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="HighestBidLabel" runat="server" Font-Size="10pt" Style="position: relative"
                                            Text="<%$ Resources:Resource, HighestBidLabel %>"></asp:Label>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:Label ID="HighestBidView" runat="server" Font-Size="10pt" Style="position: relative"
                                            Text="Label"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:UpdatePanel ID="ProjectPhotoUpdatePanel" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="ProjectPhotoPanel" runat="server" Height="270px" Style="left: 15px;
                                    overflow: hidden; position: absolute; top: 10px" Width="227px">
                                    <cc1:RoundedCornersExtender ID="ProjectPhotoRoundedCornersExtender" runat="server"
                                        TargetControlID="ProjectPhotoPanel" BorderColor="64, 0, 0" Enabled="True" Color="Maroon">
                                    </cc1:RoundedCornersExtender>
                                    <asp:FormView ID="ProjectPhotoFormView" runat="server" AllowPaging="True" DataSourceID="ProjectPhotoObjectDataSource"
                                        ForeColor="Maroon" Height="490px" HorizontalAlign="Center" Style="position: absolute;"
                                        Width="100%" EnableModelValidation="True">
                                        <PagerSettings FirstPageText="First   " LastPageText="    Last" NextPageText="&gt;"
                                            PreviousPageText="&lt;" />
                                        <ItemTemplate>
                                            <br />
                                            <table style="width: 227px; height: 200px">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="PhotoCaptionLabel" runat="server" Style="left: 74px; position: absolute;
                                                            top: 235px" Height="20px" Text='<%# Bind("Caption") %>'></asp:Label>
                                                        <asp:Image ID="Image2" runat="server" Height="220px" ImageAlign="Middle" ImageUrl='<%# Bind("PhotoPath", "{0}") %>'
                                                            Style="left: 14px; position: absolute; top: 15px" Width="199px" />
                                                        <br />
                                                    </td>
                                                </tr>
                                        </ItemTemplate>
                                        <PagerStyle Font-Bold="True" ForeColor="Navy" HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:FormView>
                                    </table>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:Panel ID="DescriptionPanel" runat="server" Style="left: 558px; position: relative;
                            top: 13px" Height="457px" Width="358px">
                            <asp:Label ID="NotesLabel" runat="server" Style="left: 8px; position: absolute; top: 276px"
                                Text="<%$ Resources:Resource, NotesLabel %>" Font-Bold="True" Font-Size="10pt"
                                ForeColor="Maroon"></asp:Label>
                            <asp:TextBox ID="NotesView" runat="server" Height="132px" Style="left: 5px; position: absolute;
                                top: 300px" Width="334px" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                            <asp:Label ID="ProjectDescriptionLabel" runat="server" Style="left: 4px; position: absolute;
                                top: 3px" Text="<%$ Resources:Resource, ProjectDescriptionLabel %>" Font-Bold="True"
                                Font-Size="10pt" ForeColor="Maroon"></asp:Label>
                            <asp:Label ID="DescriptionLabel" runat="server" Style="left: 4px; position: absolute;
                                top: 28px" Text="<%$ Resources:Resource, DescriptionLabel %>" Font-Bold="True"
                                Font-Size="10pt" ForeColor="Maroon"></asp:Label>
                            <asp:Label ID="CustomDescriptionLabel" runat="server" Style="z-index: 100; left: 5px;
                                position: absolute; top: 50px;" Height="200px" Width="334px" BackColor="LightGray"></asp:Label>
                            &nbsp;</asp:Panel>
                        <cc1:RoundedCornersExtender ID="ProjectSpecificationRoundedCornersExtender" runat="server"
                            TargetControlID="ProjectSpecificationPanel" BorderColor="64, 0, 0" Enabled="True"
                            Color="Maroon">
                        </cc1:RoundedCornersExtender>
                        <cc1:RoundedCornersExtender ID="LocationRoundedCornersExtender" runat="server" TargetControlID="LocationPanel"
                            BorderColor="64, 0, 0" Enabled="True" Color="Maroon">
                        </cc1:RoundedCornersExtender>
                        <cc1:RoundedCornersExtender ID="DescriptionRoundedCornersExtender" runat="server"
                            TargetControlID="DescriptionPanel" BorderColor="64, 0, 0" Enabled="True" Color="Maroon">
                        </cc1:RoundedCornersExtender>
                        <cc1:RoundedCornersExtender ID="RequirementRoundedCornersExtender" runat="server"
                            TargetControlID="RequirementPanel" BorderColor="64, 0, 0" Enabled="True" Color="Maroon">
                        </cc1:RoundedCornersExtender>
                        <asp:Panel ID="LocationPanel" runat="server" Height="130px" Style="left: 15px; position: relative;
                            overflow: hidden; top: -128px" Width="227px">
                            &nbsp;<table style="left: 0px; width: 100%; padding-top: 1%; position: relative;
                                top: 0px; height: 70%">
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="LocationLabel" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="Maroon"
                                            Style="position: relative" Text="<%$ Resources:Resource, LocationLabel %>"></asp:Label>
                                    </td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="CountryLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, CountryLabel %>"
                                            Font-Size="10pt"></asp:Label>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:Label ID="CountryView" runat="server" Style="position: relative" Font-Size="10pt"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="StateLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, StateLabel %>"
                                            Font-Size="10pt"></asp:Label>
                                    </td>
                                    <td style="width: 100px">
                                        <asp:Label ID="StateView" runat="server" Style="position: relative" Font-Size="10pt"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <asp:HiddenField ID="MoreProjectHiddenFieldButton" runat="server" />
                        </asp:Panel>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Button ID="OkButton" runat="server" Text="<%$ Resources:Resource, OkButton %>"
                Style="left: 900px; position: relative; top: 522px; width: 40px" CausesValidation="False"
                OnClick="OkButton_Click" OnClientClick="MoreProjectFireAnimation();" />
            <asp:ObjectDataSource ID="ProjectPhotoObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetProjectPhoto" TypeName="ViewProjectDataSetTableAdapters.ProjectPhotoTableAdapter">
                <SelectParameters>
                    <asp:Parameter Name="ProjectID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </asp:Panel>
        <asp:Panel ID="LoadingPanel" runat="server" Height="218px" Style="display: none;
            left: 48px; position: relative; top: 1418px; z-index: 105;" Width="440px" BackColor="transparent">
            <asp:UpdatePanel ID="LoadingUpdatePanel" runat="server">
                <ContentTemplate>
                    <cc1:ModalPopupExtender ID="LoadingPanelModalPopupExtender" runat="server" TargetControlID="LoadingPanelModalPopupExtenderTargetedLabel"
                        PopupControlID="LoadingPanel" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                    <asp:Label ID="LoadingPanelModalPopupExtenderTargetedLabel" runat="server" Font-Bold="True"
                        ForeColor="Black" Style="left: 197px; position: absolute; top: 35%" Text="<%$ Resources:Resource, Loading %>"></asp:Label>
                    <img src="../_assets/img/uploading.gif" alt="uploading" style="left: 134px; position: absolute;
                        top: 45%" />
                    &nbsp;
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <asp:Panel ID="LoginPanel" runat="server" Height="218px" Style="display: none; left: 48px;
            position: relative; top: 1218px; z-index: 103;" Width="440px" BackColor="Transparent"
            BorderColor="MidnightBlue" BorderStyle="Solid" BorderWidth="0px">
            <asp:UpdatePanel ID="LogInUpdatePanel" runat="server">
                <ContentTemplate>
                    <cc1:ModalPopupExtender ID="ModalLoginUpdatePanel" runat="server" TargetControlID="ModalLoginTargetedLabel"
                        PopupControlID="LoginPanel" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                    <asp:Login ID="UserLogin" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8"
                        BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" DestinationPageUrl="~/NotAuthenticated/JobSearchResult.aspx"
                        Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="200px" Width="428px">
                        <TextBoxStyle Font-Size="0.8em" />
                        <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"
                            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                        <LayoutTemplate>
                            <table border="0" cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0" style="height: 200px; width: 428px;">
                                            <tr>
                                                <td align="center" colspan="2" style="color: White; background-color: #5D7B9D; font-size: 0.9em;
                                                    font-weight: bold;">
                                                    <asp:Literal ID="LogInLiteral" runat="server" Text="<%$ Resources:Resource, LogIn %>"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Text="<%$ Resources:Resource, UserName1 %>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                        ErrorMessage="<%$ Resources:Resource, UserNameRequiredFieldValidator %>" ToolTip="<%$ Resources:Resource, UserNameRequiredFieldValidator %>"
                                                        ValidationGroup="UserLogin">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Text="<%$ Resources:Resource, Password %>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                        ErrorMessage="<%$ Resources:Resource, PasswordRequiredValidator %>" ToolTip="<%$ Resources:Resource, PasswordRequiredValidator %>"
                                                        ValidationGroup="UserLogin">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:CheckBox ID="RememberMe" runat="server" Text="<%$ Resources:Resource, RememberMe %>" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color: Red;">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False" Text=" "></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <asp:Button ID="LoginButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC"
                                                        BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana"
                                                        Font-Size="0.8em" ForeColor="#284775" Text="<%$ Resources:Resource, LogIn %>"
                                                        ValidationGroup="UserLogin" OnClick="LoginButton_Click" />
                                                    &nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="CancelLoginButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC"
                                                        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
                                                        ForeColor="#284775" Text="<%$ Resources:Resource, Cancel %>" OnClick="CancelLoginButton_Click"
                                                        CausesValidation="false" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                    </asp:Login>
                    <asp:Label ID="ModalLoginTargetedLabel" runat="server" Style="position: relative"
                        Width="153px"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
          <div class="cleaner">
    </div>
    <LowerNavigationButtons:NavigationButtons ID="MainLowerNavigationButtons" runat="server" />
    </div>
    </form>
</body>
</html>
