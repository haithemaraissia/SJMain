<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewProject.aspx.vb" Inherits="Authenticated_Professional_PostProject"
    Culture="auto:en-US" UICulture="auto" %>

<%--<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
--%>
<%@ Register Namespace="CommentAjaxControl2" TagPrefix="CustomEditor2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainLowerButtons.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <script type="text/javascript" src="../scripts/jquery-1.5.2.js"></script>
    <link rel="stylesheet" href="../_assets/css/TemplateStyleSheet.css" type="text/css"
        media="screen" />
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
    <script language="javascript" type="text/javascript">
        function fireanimation() {
            document.getElementById('LoadingPanel').style.visibility = 'visible';
            $find('DelayModalPopUpExtender').show();
            document.body.style.overflow = 'visible';

        }
    </script>
    <script type="text/javascript" src="../scripts/jquery-1.5.2.js"></script>
    <script type="text/javascript">
        $(function ($) {
            $(document).ready(function () {
                //Add to Favorite Button
                $("#AddtoWatchListButton").hover(function () {
                    $(this).css("background", "#0099CC");
                    $(this).css("cursor", "pointer");
                }, function () {
                    $(this).css("background", "#003366");
                });
            });
        })(jQuery);
    </script>
    <link href="themes/BlueMenublockStyleSheet.css" rel="stylesheet" type="text/css" />
      <link href="../Authenticated/themes/opera/tabs2.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
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
        .Picture:hover
        {
            border-width: 3px;
            border-color: #999966;
            border-bottom-style: solid;
            background-color: #999966;
            color: White;
        }
        .Picture
        {
            border-width: 0px;
        }
        
        .Full
        {
            width: 100%;
            height: 100%;
        }
        
        .RightSpace
        {
            width: 300px;
        }
        .LeftSpace
        {
            width: 300px;
        }
        .SecondRightSpace
        {
            width: 400px;
        }
        .SecondLeftSpace
        {
            width: 121px;
        }
               /*
            Set the Style for parent CSS Class
            of Calendar control
            Parent [CssClass] = myCalendar
        */
        .myCalendar
        {
            background-color: #efefef;
            width: 200px;
        }
        
        /*
            Common style declaration for hyper linked text
        */
        .myCalendar a
        {
            text-decoration: none;
        }
        
        /*
            Styles declaration for top title
            [TitleStyle] [CssClass] = myCalendarTitle
        */
        .myCalendar .myCalendarTitle
        {
            font-weight: bold;
        }
        
        /*
            Styles declaration for date cells
            [DayStyle] [CssClass] = myCalendarDay
        */
        .myCalendar td.myCalendarDay
        {
            border: solid 2px #fff;
            border-left: 0;
            border-top: 0;
        }
        
        /*
            Styles declaration for next/previous month links
            [NextPrevStyle] [CssClass] = myCalendarNextPrev
        */
        .myCalendar .myCalendarNextPrev
        {
            text-align: center;
        }
        
        /*
            Styles declaration for Week/Month selector links cells
            [SelectorStyle] [CssClass] = myCalendarSelector
        */
        .myCalendar td.myCalendarSelector
        {
            background-color: #dddddd;
        }
        
        .myCalendar .myCalendarDay a, .myCalendar .myCalendarSelector a, .myCalendar .myCalendarNextPrev a
        {
            display: block;
            line-height: 18px;
        }
        
        .myCalendar .myCalendarDay a:hover, .myCalendar .myCalendarSelector a:hover
        {
            background-color: #cccccc;
        }
        
        .myCalendar .myCalendarNextPrev a:hover
        {
            background-color: #fff;
        }
    </style>
</head>
<body>
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
    <form id="form1" runat="server">
        <div id="wrapper" style="padding: 25px">
    <table align="center" id="TemplateGlobalTable">
        <tr>
            <td style="width: 160px; vertical-align: middle; padding-right: 5px">
                <asp:Panel ID="ProjectMenu" runat="server" Style="z-index: 101; text-align: center;
                    height: 30px; width: 170px; position: relative; " BackColor="White"
                    Visible="false">
                    <asp:Button ID="AddtoWatchListButton" runat="server" Text="<%$ Resources:Resource, WatchList %>"
                        CausesValidation="False" BorderColor="#000066" BorderStyle="Groove" BorderWidth="2px"
                        BackColor="#003366" Font-Bold="False" ForeColor="White" Style="top: 3px; position: relative"
                        OnClientClick="fireanimation();" />
                </asp:Panel>
                <cc1:RoundedCornersExtender ID="ProjectMenu_RoundedCornersExtender" runat="server"
                    Color="#003366" BorderColor="#003366" Enabled="True" Radius="8" TargetControlID="ProjectMenu">
                </cc1:RoundedCornersExtender>
            </td>
            <td>
                <div>
                    <%--        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>--%>
                    <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
                    </cc1:ToolkitScriptManager>
                    <div style="z-index: 105; width: 532px;">
                        <cc1:TabContainer ID="PostProjectTabContainer" runat="server" ActiveTabIndex="0"
                            Height="540px" Font-Size="10pt" BackColor="White" Width="595px" CssClass="opera">
                            <cc1:TabPanel ID="ProjectSpecificationTabPanel" runat="server" HeaderText="<%$ Resources:Resource, ProjectSpecificationTabPanel %>">
                                <ContentTemplate>
                                    &nbsp;&nbsp;
                                    <asp:Panel ID="IndustyPanel" runat="server" BackColor="White" Height="56px" Style="left: 43px;
                                        position: relative; top: -18px" Width="487px">
                                        <asp:Label ID="IndustryLabel" runat="server" Font-Bold="True" ForeColor="Maroon"
                                            Style="position: absolute" Text="<%$ Resources:Resource, IndustryLabel2 %>" Font-Size="9pt"></asp:Label>
                                        <asp:TextBox ID="IndustryTextBox" runat="server" ReadOnly="True" Width="220px" Style="z-index: 1;
                                            position: absolute; top: 25px; left: 174px; width: 220px; height: 19px"></asp:TextBox>
                                        <cc1:RoundedCornersExtender ID="IndustryRoundedCornersExtender2" runat="server" BorderColor="64, 0, 0"
                                            Enabled="True" Color="Maroon" TargetControlID="IndustyPanel">
                                        </cc1:RoundedCornersExtender>
                                    </asp:Panel>
                                    <asp:Panel ID="SpecialityPanel" runat="server" BackColor="White" BorderColor="Maroon"
                                        BorderWidth="0px" Height="56px" Style="left: 43px; position: relative; top: -13px"
                                        Width="487px" Wrap="False">
                                        <cc1:RoundedCornersExtender ID="SpecialityRoundedCornersExtender" runat="server"
                                            BorderColor="64, 0, 0" Enabled="True" Color="Maroon" TargetControlID="SpecialityPanel">
                                        </cc1:RoundedCornersExtender>
                                        <asp:Label ID="SpecialisationLabelID" runat="server" Font-Bold="True" ForeColor="Maroon"
                                            Style="left: 4px; position: absolute; top: 4px" Text="<%$ Resources:Resource, SpecializationLabel2 %>"
                                            Font-Size="9pt"></asp:Label>
                                        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                                        <br />
                                        <asp:TextBox ID="SpecialisationTextBox" runat="server" ReadOnly="True" Width="70px"
                                            Style="z-index: 1; position: absolute; top: 25px; left: 174px; width: 129px;
                                            height: 19px"></asp:TextBox>
                                    </asp:Panel>
                                    <br />
                                    <asp:Panel ID="RequirementPanel" runat="server" BackColor="White" Height="196px"
                                        Style="left: 45px; position: relative; top: -26px" Width="486px">
                                        <asp:Label ID="RequirementLabel" runat="server" Font-Bold="True" ForeColor="Maroon"
                                            Style="position: absolute" Text="<%$ Resources:Resource, RequirementLabel %>"
                                            Font-Size="9pt"></asp:Label>
                                        &#160;&nbsp;<cc1:RoundedCornersExtender ID="RequirementRoundedCornersExtender" runat="server"
                                            BorderColor="64, 0, 0" Enabled="True" Color="Maroon" TargetControlID="RequirementPanel">
                                        </cc1:RoundedCornersExtender>
                                        <asp:Table ID="RequirementTable" runat="server" BorderColor="Gray" BorderStyle="Inset"
                                            BorderWidth="2px" CellPadding="4" CellSpacing="4" Style="left: 117px; position: absolute;
                                            top: 12px" Width="287px" Height="166px" Font-Size="9pt">
                                            <asp:TableRow ID="ExperienceTableRow" runat="server">
                                                <asp:TableCell ID="ExperienceTableCell1" runat="server" HorizontalAlign="Center"><asp:Label ID="ExperienceLabel" runat="server" Text="<%$ Resources:Resource, ExperienceLabel %>"></asp:Label>
</asp:TableCell><asp:TableCell ID="ExperienceTableCell2" runat="server" HorizontalAlign="Center"><asp:TextBox ID="ExperienceTextBox" runat="server" ReadOnly="True" Width="70px"></asp:TextBox>
</asp:TableCell></asp:TableRow>
                                            <asp:TableRow ID="CrewNumberTableRow" runat="server">
                                                <asp:TableCell ID="CrewNumberTableCell1" runat="server" HorizontalAlign="Center"><asp:Label ID="CrewNumberLabel" runat="server" Text="<%$ Resources:Resource, NumberofCrewsLabel %>"></asp:Label>
</asp:TableCell><asp:TableCell ID="CrewNumberTableCell2" runat="server" HorizontalAlign="Center"><asp:TextBox ID="CrewNumberTextBox" runat="server" ReadOnly="True" Width="70px"></asp:TextBox>
</asp:TableCell></asp:TableRow>
                                            <asp:TableRow ID="LicensedTableRow" runat="server">
                                                <asp:TableCell ID="LicensedTableCell1" runat="server" HorizontalAlign="Center"><asp:Label ID="LicensedLabel" runat="server" Text="<%$ Resources:Resource, LicensedLabel %>"></asp:Label>
</asp:TableCell><asp:TableCell ID="LicensedTableCell2" runat="server" HorizontalAlign="Center"><asp:TextBox ID="LicensedTextBox" runat="server" ReadOnly="True" Width="70px"></asp:TextBox>
</asp:TableCell></asp:TableRow>
                                            <asp:TableRow ID="InsuredTableRow" runat="server">
                                                <asp:TableCell ID="InsuredTableCell1" runat="server" HorizontalAlign="Center"><asp:Label ID="InsuredLabel" runat="server" Text="<%$ Resources:Resource, InsuredLabel %>"></asp:Label>
</asp:TableCell><asp:TableCell ID="InsuredTableCell2" runat="server" HorizontalAlign="Center"><asp:TextBox ID="InsuredTextBox" runat="server" ReadOnly="True" Width="70px"></asp:TextBox>
</asp:TableCell></asp:TableRow>
                                            <asp:TableRow ID="RelocationTableRow" runat="server">
                                                <asp:TableCell ID="RelocationTableCell1" runat="server" HorizontalAlign="Center"><asp:Label ID="RelocationLabel" runat="server" Text="<%$ Resources:Resource, RelocationLabel %>"></asp:Label>
</asp:TableCell><asp:TableCell ID="RelocationTableCell2" runat="server" HorizontalAlign="Center"><asp:TextBox ID="RelocationTextBox" runat="server" ReadOnly="True" Width="70px"></asp:TextBox>
</asp:TableCell></asp:TableRow>
                                        </asp:Table>
                                    </asp:Panel>
                                    <asp:Panel ID="StatusPanel" runat="server" BackColor="White" Height="189px" Style="left: 43px;
                                        position: relative; top: -22px" Width="486px">
                                        <asp:Label ID="StatusLabel" runat="server" Font-Bold="True" ForeColor="Maroon" Style="position: absolute"
                                            Text="<%$ Resources:Resource, Status2 %>" Font-Size="9pt"></asp:Label>
                                        <asp:Table ID="StatusTable" runat="server" BorderColor="Gray" BorderStyle="Inset"
                                            BorderWidth="2px" CellPadding="4" CellSpacing="4" Style="left: 117px; position: absolute;
                                            top: 12px" Width="284px" Height="166px" Font-Size="9pt">
                                            <asp:TableRow ID="PosterTableRow" runat="server">
                                                <asp:TableCell ID="PosterCell1" runat="server" HorizontalAlign="Center"><asp:Label ID="PosterIDLabel" runat="server" Text="<%$ Resources:Resource, PostedBy %>"></asp:Label>
</asp:TableCell>
                                                <asp:TableCell ID="PosterCell2" runat="server" HorizontalAlign="Center"><asp:HyperLink ID="PosterHyperlink" runat="server" Target="_blank" Font-Bold="True"
                                                        ForeColor="#003366" CssClass="UnderlineLink"></asp:HyperLink>
</asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow ID="HighestBidTableRow" runat="server">
                                                <asp:TableCell ID="HighestBidTableCell1" runat="server" HorizontalAlign="Center"><asp:Label ID="HighestBidLabelID" runat="server" Text="<%$ Resources:Resource, HighestBidLabel %>"></asp:Label>
</asp:TableCell>
                                                <asp:TableCell ID="HighestBidTableCell2" runat="server" HorizontalAlign="Center"><asp:TextBox ID="HighestBidTextBox" runat="server" ReadOnly="True" Width="70px"></asp:TextBox>
</asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow ID="HighestBidderTableRow" runat="server">
                                                <asp:TableCell ID="HighestBidderTableCell1" runat="server" HorizontalAlign="Center"><asp:Label ID="HighestBidderLabelID" runat="server" Text="<%$ Resources:Resource, BidderUsername %>"></asp:Label>
</asp:TableCell>
                                                <asp:TableCell ID="HighestBidderTableCell2" runat="server" HorizontalAlign="Center"><asp:HyperLink ID="HighestBidderHyperLink" runat="server" Target="_blank" ForeColor="#003366"
                                                        Font-Bold="True" CssClass="UnderlineLink"></asp:HyperLink>
</asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow ID="NumberOfBidsTableRow" runat="server">
                                                <asp:TableCell ID="NumberOfBidsTableCell1" runat="server" HorizontalAlign="Center"><asp:Label ID="NumberOfBidsIDLabel" runat="server" Text="<%$ Resources:Resource, NumberofBids %>"></asp:Label>
</asp:TableCell>
                                                <asp:TableCell ID="NumberOfBidsTableCell2" runat="server" HorizontalAlign="Center"><asp:TextBox ID="NumberOfBidsTextBox" runat="server" ReadOnly="True" Width="70px"></asp:TextBox>
</asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow ID="StatusTableRow" runat="server">
                                                <asp:TableCell ID="StatusTableCell1" runat="server" HorizontalAlign="Center"><asp:Label ID="StatusIDLabel" runat="server" Text="<%$ Resources:Resource, Status %>"></asp:Label>
</asp:TableCell>
                                                <asp:TableCell ID="StatusTableCell2" runat="server" HorizontalAlign="Center"><asp:TextBox ID="StatusTextBox" runat="server" ReadOnly="True" Width="70px"></asp:TextBox>
</asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                        <cc1:RoundedCornersExtender ID="LocationRoundedCornersExtender" runat="server" BorderColor="64, 0, 0"
                                            Enabled="True" Color="Maroon" TargetControlID="StatusPanel">
                                        </cc1:RoundedCornersExtender>
                                    </asp:Panel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="ProjectRequirementTabPanel" runat="server" HeaderText="<%$ Resources:Resource, ProjectRequirementTabPanel %>">
                                <ContentTemplate>
                                    <asp:Panel ID="ProjectTitlePanel" runat="server" Height="62px" Style="left: 43px;
                                        position: relative; top: 8px" Width="487px">
                                        <asp:Label ID="ProjectTitleLabel" runat="server" Style="left: 4px; position: absolute;
                                            top: 8px" Text="<%$ Resources:Resource, ProjectTitleLabel %>" Font-Bold="True"
                                            ForeColor="Maroon" Font-Size="9pt"></asp:Label>
                                        <asp:UpdatePanel ID="ProjectTitleUpdatePanel" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="TitleTextBox" runat="server" Style="left: 141px; position: absolute;
                                                    top: 25px" AutoPostBack="True" CausesValidation="True" MaxLength="25" ReadOnly="True"
                                                    Width="220px"></asp:TextBox>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <cc1:RoundedCornersExtender ID="ProjectTitleRoundedCornersExtender" runat="server"
                                            BorderColor="64, 0, 0" Enabled="True" Color="Maroon" TargetControlID="ProjectTitlePanel">
                                        </cc1:RoundedCornersExtender>
                                    </asp:Panel>
                                    <cc1:RoundedCornersExtender ID="TimeFrameRoundedCornersExtender" runat="server" BorderColor="64, 0, 0"
                                        Enabled="True" Color="Maroon" TargetControlID="TimeFramePanel">
                                    </cc1:RoundedCornersExtender>
                                    <asp:Panel ID="TimeFramePanel" runat="server" Height="260px" Style="left: 43px; position: relative;
                                        top: 19px" Width="487px">
                                        <asp:UpdatePanel ID="TimeFrameUpdatePanel" runat="server">
                                            <ContentTemplate>
                                                <asp:Label ID="TimeFrameLabel" runat="server" Style="left: 4px; position: absolute;
                                                    top: 4px" Text="<%$ Resources:Resource, TimeFrameLabel %>" Font-Bold="True" ForeColor="Maroon"
                                                    Font-Size="9pt"></asp:Label>
                                                <asp:Label ID="StartDateLabel" runat="server" Style="left: 7px; position: absolute;
                                                    top: 29px" Text="<%$ Resources:Resource, StartDateLabel %>" Font-Bold="True"
                                                    ForeColor="Red" Font-Size="9pt"></asp:Label>
                                                <asp:Label ID="EndDateLabel" runat="server" Style="left: 266px; position: absolute;
                                                    top: 28px" Text="<%$ Resources:Resource, EndDateLabel %>" Font-Bold="True" ForeColor="Red"
                                                    Font-Size="9pt"></asp:Label>
                                                <asp:Calendar ID="EndDateCalendar" runat="server" Height="90px" Style="left: 266px;
                                                    position: absolute; top: 50px; width: 200px"  Width="200px" DayNameFormat="FirstTwoLetters" DayStyle-CssClass="UnderlineLink"  CssClass="myCalendar">
                                                                    <NextPrevStyle CssClass="myCalendarNextPrev" />
                                                                    <SelectedDayStyle CssClass="myCalendarSelector" />
                                                                    <SelectorStyle CssClass="myCalendarSelector" />
                                                                    <DayStyle CssClass="myCalendarDay" />
                                                                    <DayHeaderStyle Width="10px" CssClass="myCalendarDay" />
                                                                    <TitleStyle Font-Bold="True" Font-Underline="False" CssClass="myCalendarTitle" />
                                                </asp:Calendar>
                                                <asp:Calendar ID="StartDateCalendar" runat="server" Height="90px" Style="left: 10px;
                                                    position: absolute; top: 50px; width: 200px" Width="200px" DayNameFormat="FirstTwoLetters" CssClass="myCalendar">
                                                                    <NextPrevStyle CssClass="myCalendarNextPrev" />
                                                                    <SelectedDayStyle CssClass="myCalendarSelector" />
                                                                    <SelectorStyle CssClass="myCalendarSelector" />
                                                                    <DayStyle CssClass="myCalendarDay" />
                                                                    <DayHeaderStyle Width="10px" CssClass="myCalendarDay" />
                                                                    <TitleStyle Font-Bold="True" Font-Underline="False" CssClass="myCalendarTitle" />
                                                </asp:Calendar>
                                                &nbsp; &nbsp; &nbsp; &nbsp;</ContentTemplate>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                    <asp:Panel ID="CurrencyPanel" runat="server" Height="156px" Style="left: 43px; position: relative;
                                        top: 31px" Width="487px">
                                        <asp:Label ID="CurrencyHeaderLabel" runat="server" Text="<%$ Resources:Resource, CurrencyLabel %>"
                                            Font-Bold="True" ForeColor="Maroon" Style="left: 4px; position: absolute; top: 4px"
                                            Font-Size="9pt"></asp:Label>
                                        <asp:Label ID="CurrencyLabel" runat="server" Text="<%$ Resources:Resource, CurrencyLabel %>"
                                            Font-Bold="True" ForeColor="Red" Style="z-index: 1; position: absolute; top: 42px;
                                            left: 266px" Font-Size="9pt"></asp:Label>
                                        <asp:TextBox ID="AmountOfferedTextBox" runat="server" Text="<%$ Resources:Resource, AmountOfferedTextBox %>"
                                            ReadOnly="True" Width="120px" Style="left: 85px; position: absolute; top: 74px"></asp:TextBox>
                                        <asp:Label ID="AmountOfferedLabel" runat="server" Text="<%$ Resources:Resource, AmountOfferedLabel %>"
                                            Font-Bold="True" ForeColor="Red" Style="z-index: 1; position: absolute; top: 42px;
                                            left: 10px" Font-Size="9pt"></asp:Label>
                                        <asp:TextBox ID="CurrencyTextBox" runat="server" ReadOnly="True" Width="120px" Style="left: 340px;
                                            position: absolute; top: 70px"></asp:TextBox>
                                        <cc1:RoundedCornersExtender ID="CurrencyPanelRoundedCornersExtender" runat="server"
                                            BorderColor="64, 0, 0" Enabled="True" Color="Maroon" TargetControlID="CurrencyPanel">
                                        </cc1:RoundedCornersExtender>
                                    </asp:Panel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="ProjectDescriptionTabPanel" runat="server" HeaderText="<%$ Resources:Resource, ProjectDescriptionTabPanel %>">
                                <ContentTemplate>
                                    <asp:Label ID="DescriptionLabel" runat="server" Font-Bold="True" Style="left: 10px;
                                        position: relative; top: 10px" Text="<%$ Resources:Resource, DescriptionLabel2 %>"
                                        ForeColor="Maroon" Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                    <asp:Panel ID="DescriptionPanel" runat="server" Style="left: 9px; position: relative;
                                        top: 14px" Height="380px" Width="557px">
                                        <cc1:RoundedCornersExtender ID="DescriptionPanelRoundedCornersExtender" runat="server"
                                            BorderColor="64, 0, 0" Enabled="True" Color="Maroon" TargetControlID="DescriptionPanel">
                                        </cc1:RoundedCornersExtender>
                                        <CustomEditor2:CustomEditor2 ID="CustomDescriptionTextBox" Style="z-index: 100; left: 2px;
                                            position: absolute; top: 5px;" runat="server" Height="350px" Width="555px" />
                                    </asp:Panel>
                                    <asp:Panel ID="SpecialNotesPanel" runat="server" Height="92px" Width="557px" Style="left: 9px;
                                        position: relative; top: 25px">
                                        <cc1:RoundedCornersExtender ID="SpecialNotesRoundedCornersExtender" runat="server"
                                            BorderColor="64, 0, 0" Color="Maroon" Enabled="True" TargetControlID="SpecialNotesPanel">
                                        </cc1:RoundedCornersExtender>
                                        <asp:Label ID="SpecialNotesLabel" runat="server" Text="<%$ Resources:Resource, SpecialNotesLabel %>"
                                            ForeColor="Maroon" Width="136px" Style="position: absolute; top: 5px; left: 1px"
                                            Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="SpecialNotesTextBox" runat="server" Height="62px" MaxLength="1000"
                                            ReadOnly="True" Style="z-index: 100; left: 1px; position: absolute; top: 24px"
                                            TextMode="MultiLine" Width="550px"></asp:TextBox>
                                    </asp:Panel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="ProjectPictureTabPanel" runat="server" HeaderText="<%$ Resources:Resource, PictureTabPanel %>">
                                <ContentTemplate>
                                    <asp:ListView ID="ProjectPictureListView" runat="server" DataKeyNames="PhotoID" DataSourceID="ProjectPhotoObjectDataSource"
                                        GroupItemCount="3">
                                        <ItemTemplate>
                                            <td runat="server" style="width: 180px" class="Picture">
                                                <asp:ImageButton ID="ProjectImageButton" ImageUrl='<%# Eval("PhotoPath") %>' Width="140px"
                                                    Height="140px" runat="server" CommandName="select" />
                                                <br />
                                                <asp:Label ID="CaptionLabel" runat="server" Text='<%# Eval("Caption") %>' />
                                            </td>
                                        </ItemTemplate>
                                        <GroupTemplate>
                                            <tr id="itemPlaceholderContainer" runat="server">
                                                <td id="itemPlaceholder" runat="server">
                                                </td>
                                            </tr>
                                        </GroupTemplate>
                                        <LayoutTemplate>
                                            <asp:Panel ID="ProjectPicture" runat="server" HorizontalAlign="Center" Style="position: relative;
                                                height: 535px;">
                                                <table id="groupPlaceholderContainer" runat="server" cellspacing="9" cellpadding="4"
                                                    style="background-color: Transparent; font-family: Verdana, Arial, Helvetica, sans-serif;
                                                    vertical-align: top">
                                                    <tr id="groupPlaceholder" runat="server" valign="top">
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            <cc1:RoundedCornersExtender ID="ProjectPictureRoundedCornersExtender" runat="server"
                                                TargetControlID="ProjectPicture" Color="#999966" BorderColor="#999966" Radius="5">
                                            </cc1:RoundedCornersExtender>
                                            <asp:Panel ID="DataPagerPanel" runat="server" Style="position: relative; height: 20px;
                                                top: -20px; text-align: center" BackColor="#999966" ForeColor="White" Font-Bold="True">
                                                <asp:DataPager ID="ProjectPictureListView" runat="server" PageSize="9">
                                                    <Fields>
                                                        <asp:NumericPagerField NumericButtonCssClass="UnderlineLink"   NextPreviousButtonCssClass="UnderLineLink" />
                                                    </Fields>
                                                </asp:DataPager>
                                            </asp:Panel>
                                        </LayoutTemplate>
                                    </asp:ListView>
                                    <asp:ObjectDataSource ID="ProjectPhotoObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetProjectPhoto" TypeName="ViewProjectDataSetTableAdapters.ProjectPhotoTableAdapter">
                                        <SelectParameters>
                                            <asp:QueryStringParameter DefaultValue="" Name="ProjectID" QueryStringField="PRID"
                                                Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="LocationTabPanel" runat="server" HeaderText="<%$ Resources:Resource, LocationTabPanel %>">
                                <ContentTemplate>
                                    <asp:Panel ID="GlobalLocationPanel" runat="server" Style="width: 575px; height: 530px;
                                        overflow: hidden;">
                                        <table>
                                            <tr style="vertical-align: top">
                                                <td>
                                                    <asp:FormView ID="LocationFormView" runat="server" DataKeyNames="ProjectID" DataSourceID="ProjectLocationDataSource"
                                                        DefaultMode="Edit" Font-Size="Small" Style="vertical-align: top" EnableModelValidation="True">
                                                        <EditItemTemplate>
                                                            <table class="Full">
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        <asp:Label ID="AddressLabel" runat="server" BackColor="Maroon" BorderColor="Maroon"
                                                                            BorderStyle="Inset" BorderWidth="2px" Font-Size="10pt" ForeColor="White" Text="<%$ Resources:Resource, AddressLabel %>"></asp:Label>
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        <asp:TextBox ID="AddressTextBox" runat="server" Font-Size="11pt" Height="92px" MaxLength="60"
                                                                            ReadOnly="True" TabIndex="2" Text='<%# Bind("Address", "{0}") %>' TextMode="MultiLine"
                                                                            Width="274px"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        <asp:Label ID="CountryLabel" runat="server" BackColor="Maroon" BorderColor="#990000"
                                                                            BorderStyle="Inset" BorderWidth="2px" Font-Bold="False" ForeColor="White" Text="<%$ Resources:Resource, CountryLabel %>"></asp:Label>
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        <asp:TextBox ID="CountryTextBox" runat="server" MaxLength="8" ReadOnly="True" TabIndex="3"
                                                                            Text='<%# Bind("CountryName", "{0}") %>' Width="150px"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        <asp:Label ID="RegionLabel" runat="server" BackColor="Maroon" BorderColor="#990000"
                                                                            BorderStyle="Inset" BorderWidth="2px" Font-Bold="False" ForeColor="White" Text="<%$ Resources:Resource, StateLabel %>"></asp:Label>
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        <asp:TextBox ID="RegionTextBox" runat="server" MaxLength="8" ReadOnly="True" TabIndex="3"
                                                                            Text='<%# Bind("RegionName", "{0}") %>' Width="120px"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        <asp:Label ID="CityLabel" runat="server" BackColor="Maroon" BorderColor="#990000"
                                                                            BorderStyle="Inset" BorderWidth="2px" Font-Bold="False" ForeColor="White" Text="<%$ Resources:Resource, CityLabel %>"></asp:Label>
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        <asp:TextBox ID="CityTextBox" runat="server" MaxLength="8" ReadOnly="True" TabIndex="3"
                                                                            Text='<%# Bind("CityName", "{0}") %>' Width="120px"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        <span style="font-size: 11pt; vertical-align: text-top">
                                                                            <asp:Label ID="ZipcodeLabel" runat="server" BackColor="Maroon" BorderColor="Maroon"
                                                                                BorderStyle="Inset" BorderWidth="2px" Font-Size="10pt" ForeColor="White" Text="<%$ Resources:Resource, ZipcodeLabel %>"></asp:Label>
                                                                        </span>
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        <asp:TextBox ID="ZipcodeTextBox" runat="server" MaxLength="8" ReadOnly="True" TabIndex="3"
                                                                            Text='<%# Bind("Zipcode", "{0}") %>' Width="50px"></asp:TextBox>
                                                                        &nbsp;&nbsp;&nbsp;
                                                                        <asp:Label ID="OnlyUSCanadaLabel" runat="server" ForeColor="Maroon" Height="24px"
                                                                            Text="<%$ Resources:Resource, OnlyUSCanadaLabel %>"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="LeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondLeftSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td class="SecondRightSpace">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <cc1:RoundedCornersExtender ID="GlobalLocationPanelRoundedCornersExtender" runat="server"
                                                                BorderColor="Maroon" TargetControlID="GlobalLocationPanel" Color="Maroon" Enabled="True">
                                                            </cc1:RoundedCornersExtender>
                                                        </EditItemTemplate>
                                                    </asp:FormView>
                                                </td>
                                            </tr>
                                        </table>
                                        </div>
                                    </asp:Panel>
                                    <asp:ObjectDataSource ID="ProjectLocationDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetProjectLocation" TypeName="PostProjectTableAdapters.ProjectLocationTableAdapter">
                                        <SelectParameters>
                                            <asp:QueryStringParameter DefaultValue="" Name="ProjectID" QueryStringField="PRID"
                                                Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                </div>
            </td>
            <td style="vertical-align: middle">
                <asp:Panel ID="BackToProfilePanel" runat="server" CssClass="BlueMenublock" Height="64px"
                    Style="z-index: 0; width: 107px; height: 64px; position: relative;"
                    Width="107px">
                    <ul>
                        <li>
                            <asp:LinkButton ID="BackToProfile" runat="server" CausesValidation="False" Width="100"
                                Text="<%$ Resources:Resource, BackToProfileLinkButton %>"></asp:LinkButton>
                        </li>
                    </ul>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <div id="LoadingDiv" style="left: 333px; width: 100px; position: absolute; top: 605px;
        height: 100px; z-index: 106;">
        <asp:UpdatePanel ID="DelayUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <cc1:ModalPopupExtender ID="DelayModalPopUpExtender" runat="server" BackgroundCssClass="modalBackground"
                    PopupControlID="LoadingPanel" TargetControlID="LoadingPanel" RepositionMode="RepositionOnWindowResize">
                </cc1:ModalPopupExtender>
                <asp:Panel ID="LoadingPanel" runat="server" Height="45px" Style="display: none; left: 36px;
                    position: absolute; top: 48px; z-index: 107;" Width="196px" BackColor="Silver">
                    <asp:Label ID="LoadingLabel" runat="server" Font-Bold="True" ForeColor="Black" Style="left: 63px;
                        position: absolute; top: 25px" Text="<%$ Resources:Resource, Loading %>"></asp:Label>
                    <img src="../_assets/img/uploading.gif" alt="uploadingimages" style="left: 0px; position: relative;
                        top: -9px" />
                </asp:Panel>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:Panel ID="ProjectPictureDetailPanel" runat="server" Style="display: none;">
        <cc1:ModalPopupExtender ID="ProjectPictureDetailModalPopupExtender" runat="server"
            BackgroundCssClass="modalBackground" PopupControlID="ProjectPictureDetailPanel"
            TargetControlID="TargetLabel" RepositionMode="RepositionOnWindowResize">
        </cc1:ModalPopupExtender>
        <asp:Panel ID="GlobalProjectDetailPanel" runat="server" Width="600px" Height="520px"
            HorizontalAlign="Center" BackColor="White">
            <asp:Image ID="ProjectPictureImage" runat="server" Width="600px" Height="500px" />
            <br />
            <asp:Label ID="ProjectPictureCaption" runat="server"></asp:Label>
        </asp:Panel>
        <cc1:RoundedCornersExtender ID="GlobalProjectDetailRoundedCornersExtender" runat="server"
            TargetControlID="GlobalProjectDetailPanel" Radius="8" Color="#999966" BorderColor="#999966">
        </cc1:RoundedCornersExtender>
        <asp:Label ID="TargetLabel" runat="server" Style="position: relative" Width="153px"></asp:Label>
        <asp:LinkButton ID="ExitProjectPictureDetailLinkButton" runat="server" Style="position: absolute;
            top: 5px; left: 620px" Font-Bold="true" Font-Size="Large" OnClientClick="Javascript:$find('ProjectPictureDetailModalPopupExtender').hide();">X</asp:LinkButton>
    </asp:Panel>
 </div>
  <div class="cleaner">
    </div>
    <LowerNavigationButtons:NavigationButtons ID="MainLowerNavigationButtons" runat="server" />
    </form>
</body>
</html>
