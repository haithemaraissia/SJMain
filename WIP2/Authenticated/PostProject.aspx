<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PostProject.aspx.vb" Inherits="Authenticated_Professional_PostProject"
    Culture="auto:en-US" UICulture="auto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc2" %>
<%@ Register Namespace="CommentAjaxControl2" TagPrefix="CustomEditor2" %>
<%@ Register Namespace="CommentAjaxControl" TagPrefix="CustomEditor" %>
<%--<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
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
    <script type="text/javascript">

        function fireanimation2() {
            document.getElementById('LoadingPanel').style.visibility = 'visible';
            document.getElementById('LoadingDiv').style.display = 'block';
            $find('DelayModalPopUpExtender').show();
            document.body.style.overflow = 'visible';

        }

        function fireanimation3() {
            document.getElementById('LoadingPanel').style.visibility = 'visible';
            document.getElementById('LoadingDiv').style.display = 'block';
            $find('GlobalJobSelectionModalPopupExtender').hide();
            $find('DelayModalPopUpExtender').show();
            document.body.style.overflow = 'visible';
        }

        function fireanimation4() {
            document.getElementById('LoadingPanel').style.visibility = 'visible';
            document.getElementById('LoadingDiv').style.display = 'block';
            $find('EditDescriptionModalPopupExtender').hide();
            $find('DelayModalPopUpExtender').show();
            document.body.style.overflow = 'visible';
        }

        function fireanimation5() {
            document.getElementById('LoadingPanel').style.visibility = 'visible';
            document.getElementById('LoadingDiv').style.display = 'block';
            $find('PostProjectModalPopupExtender').hide();
            $find('DelayModalPopUpExtender').show();
            document.body.style.overflow = 'visible';
        }

        function fireanimation7() {
            document.getElementById('LoadingPanel').style.visibility = 'visible';
            document.getElementById('LoadingDiv').style.display = 'block';
            $find('ValidationModalPopupExtender').hide();
            $find('DelayModalPopUpExtender').show();
            document.body.style.overflow = 'visible';
        }

        function fireanimation10() {
            document.getElementById('LoadingJobsDiv').style.visibility = 'visible';
            document.getElementById('LoadingDiv').style.display = 'block';
            $find('ValidationModalPopupExtender').hide();
            $find('DelayModalPopUpExtender').show();
            document.body.style.overflow = 'visible';

        }

        function fireanimation11() {
            document.getElementById('LoadingJobsDiv').style.visibility = 'visible';
            document.getElementById('LocationDelayDiv').style.display = 'block';
            $find('DelayModalPopUpExtender').hide();
            $find('LocationDelayModalPopupExtender').show();
            document.body.style.overflow = 'visible';
        }

        function CountLeft(field, count, max, Result) {
            document.getElementById(Result).value = max - count;
            document.getElementById(Result).style.color = "#003366";

            if (max - count < 100) {
                document.getElementById(Result).style.color = "red";
            }
            if (max - count < 2) {
                document.getElementById(field).value = document.getElementById(field).value.substring(0, max);
            }

        }

        function disableBackButton() {
            window.history.forward();
        }
        setTimeout("disableBackButton()", 0);

    </script>
    <script type="text/javascript">
        $(function ($) {
            $(document).ready(function () {

                //Delete Button
                $("#DeleteButton").hover(function () {
                    $(this).css("background", "#0099CC");
                    $(this).css("cursor", "pointer");
                }, function () {
                    $(this).css("background", "#003366");
                });

                //Save Button
                $("#SaveButton").hover(function () {
                    $(this).css("background", "#0099CC");
                    $(this).css("cursor", "pointer");
                }, function () {
                    $(this).css("background", "#003366");
                });

                //Preview&Post Button
                $("#PreviewButton").hover(function () {
                    $(this).css("background", "#0099CC");
                    $(this).css("cursor", "pointer");
                }, function () {
                    $(this).css("background", "#003366");
                });

                $('#PostProjectTabContainer_ProjectRequirementTabPanel_StartDateCalendar a ').live('click', function () {
                    $find('LocationDelayModalPopupExtender').show();
                });
                $('#PostProjectTabContainer_ProjectRequirementTabPanel_EndDateCalendar a ').live('click', function () {
                    $find('LocationDelayModalPopupExtender').show();
                });

            });
        })(jQuery);
    </script>
    <link href="themes/opera/tabs3.css" rel="stylesheet" type="text/css" />
    <link href="themes/BlueMenublockStyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        TR.updated TD
        {
            background-color: yellow;
        }
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=20);
            opacity: 0.9;
            z-index: 200;
        }
        .customModalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=40);
            -moz-opacity: 0.4;
            -khtml-opacity: 0.4;
            opacity: 0.4;
            z-index: 200;
        }
        .JobLinkButton:hover
        {
            text-decoration: underline;
            color: Maroon;
        }
        .JobLinkButton
        {
            text-decoration: none;
        }
        .NumericStyle
        {
            color: White;
        }
        .ProjectMenuStyle
        {
            position: relative;
            top: 5px;
            left: 2px;
        }
        .SaveButtonStyle
        {
            position: relative;
            top: 5px;
            left: -4px;
        }
        .FormViewStyle
        {
            left: 15px;
            position: absolute;
            top: 5px;
        }
        .Content
        {
            width: 822px;
            padding: 13px;
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
<body onload="disableBackButton();">
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
    <form id="form1" runat="server">
    <div id="wrapper" style="padding: 25px">
        <table align="center" style="width: 1070px" id="TemplateGlobalTable">
            <tr>
                <td>
                    <asp:Panel ID="ProjectMenu" runat="server" Style="left: 24px; top: 140px; z-index: 101;
                        text-align: center; height: 77px; width: 160px;" BackColor="White">
                        <asp:Button ID="DeleteButton" runat="server" Text="<%$ Resources:Resource, Delete %>"
                            CausesValidation="False" BorderColor="#000066" BorderStyle="Groove" BorderWidth="2px"
                            BackColor="#003366" Font-Bold="False" ForeColor="White" CssClass="ProjectMenuStyle"
                            Font-Size="9pt" Width="70px" OnClientClick="fireanimation2();" />
                        &nbsp;&nbsp;
                        <asp:Button ID="SaveButton" runat="server" Text="<%$ Resources:Resource, Save %>"
                            CausesValidation="False" Width="70px" BorderColor="#000066" BorderStyle="Groove"
                            BorderWidth="2px" BackColor="#003366" Font-Bold="False" ForeColor="White" CssClass="SaveButtonStyle"
                            Font-Size="9pt" OnClientClick="fireanimation2();" /><br />
                        <br />
                        <asp:Button ID="PreviewButton" runat="server" Text="<%$ Resources:Resource, PreviewPost %>"
                            CausesValidation="False" BorderColor="#000066" BorderStyle="Groove" BorderWidth="2px"
                            BackColor="#003366" Font-Bold="False" ForeColor="White" Font-Size="9pt" Width="150px"
                            OnClientClick="fireanimation2();" />
                    </asp:Panel>
                    <cc1:RoundedCornersExtender ID="ProjectMenu_RoundedCornersExtender" runat="server"
                        Color="#003366" BorderColor="#003366" Enabled="True" Radius="8" TargetControlID="ProjectMenu">
                    </cc1:RoundedCornersExtender>
                </td>
                <td class="Content">
                    <div>
                        <%--        <asp:AjaxScriptManager ID="AjaxScriptManager1" runat="server">
        </asp:AjaxScriptManager>--%>
                        <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
                        </cc1:ToolkitScriptManager>
                        <div style="z-index: 105; left: 210px; width: 602px;">
                            <br />
                            <cc1:TabContainer ID="PostProjectTabContainer" runat="server" ActiveTabIndex="0"
                                Height="550px" Font-Size="Small" BackColor="White" Width="830px" CssClass="opera"
                                AutoPostBack="false">
                                <cc1:TabPanel ID="ProjectSpecificationTabPanel" runat="server" HeaderText="<%$ Resources:Resource, ProjectSpecificationTabPanel %>">
                                    <ContentTemplate>
                                        &nbsp;&nbsp;
                                        <asp:Panel ID="IndustyPanel" runat="server" BackColor="White" Height="56px" Style="left: 133px;
                                            position: relative; top: -13px" Width="487px">
                                            <asp:Label ID="IndustryLabel" runat="server" Font-Bold="True" ForeColor="Maroon"
                                                Font-Names="Times New Roman" Font-Size="Medium" Style="position: absolute" Text="<%$ Resources:Resource, IndustryLabel2 %>"></asp:Label>
                                            <asp:UpdatePanel ID="IndustryUpdatePanel" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="IndustryDropDownList" runat="server" AutoPostBack="True" DataSourceID="CategoryDataSource"
                                                        DataTextField="CategoryName" DataValueField="CategoryID" Style="left: 123px;
                                                        position: absolute; top: 18px" Width="270px" OnChange="fireanimation10();">
                                                    </asp:DropDownList>
                                                    <asp:ObjectDataSource ID="CategoryDataSource" runat="server" SelectMethod="GetCategoryEnglish"
                                                        TypeName="PostProjectTableAdapters.CategoriesTableAdapter"></asp:ObjectDataSource>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <cc1:RoundedCornersExtender ID="IndustryRoundedCornersExtender2" runat="server" BorderColor="64, 0, 0"
                                                Enabled="True" Color="Maroon" TargetControlID="IndustyPanel">
                                            </cc1:RoundedCornersExtender>
                                        </asp:Panel>
                                        <asp:Panel ID="SpecialityPanel" runat="server" BackColor="White" BorderColor="Maroon"
                                            BorderWidth="0px" Height="243px" Style="left: 18px; position: relative; top: -9px"
                                            Width="697px" Wrap="False">
                                            <cc1:RoundedCornersExtender ID="SpecialityRoundedCornersExtender" runat="server"
                                                BorderColor="64, 0, 0" Enabled="True" Color="Maroon" TargetControlID="SpecialityPanel">
                                            </cc1:RoundedCornersExtender>
                                            <asp:UpdatePanel ID="SpecialityUpdatePanel" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Label ID="SpecialisationLabel" runat="server" Font-Bold="True" ForeColor="Maroon"
                                                        Style="left: 4px; position: absolute; top: 4px" Text="<%$ Resources:Resource, SpecializationLabel2 %>"
                                                        Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                                    <asp:ListBox ID="SpecialtyListBox1" runat="server" DataSourceID="SpecialityJobs1DataSource"
                                                        DataTextField="JobTitle" DataValueField="JobID" Font-Size="9pt" Height="207px"
                                                        SelectionMode="Multiple" Width="215px" Style="position: absolute; top: 25px;
                                                        left: 5px"></asp:ListBox>
                                                    &#160;&nbsp;
                                                    <asp:ListBox ID="SpecialtyListBox3" runat="server" DataSourceID="SpecialityJobs3DataSource"
                                                        DataTextField="JobTitle" DataValueField="JobID" Font-Size="9pt" Height="207px"
                                                        SelectionMode="Multiple" Style="left: 477px; position: absolute; top: 25px" Width="215px">
                                                    </asp:ListBox>
                                                    &#160;&nbsp;
                                                    <asp:ListBox ID="SpecialtyListBox2" runat="server" DataSourceID="SpecialityJobs2DataSource"
                                                        DataTextField="JobTitle" DataValueField="JobID" Font-Size="9pt" Height="207px"
                                                        SelectionMode="Multiple" Style="left: 240px; position: absolute; top: 25px" Width="215px">
                                                    </asp:ListBox>
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
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="IndustryDropDownList" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                            <asp:LinkButton ID="AlphabeticJobsLinkButton" runat="server" Font-Bold="True" ForeColor="#003366"
                                                Style="left: 660px; position: absolute; top: 228px" CausesValidation="False"
                                                OnClientClick="fireanimation2();" Text="<%$ Resources:Resource, A-ZLabel %>"
                                                CssClass="UnderlineLink"></asp:LinkButton>
                                        </asp:Panel>
                                        <br />
                                        <asp:Panel ID="RequirementPanel" runat="server" BackColor="White" Height="196px"
                                            Style="left: 133px; position: relative; top: -23px" Width="486px">
                                            <asp:Label ID="RequirementLabel" runat="server" Font-Bold="True" ForeColor="Maroon"
                                                Font-Names="Times New Roman" Font-Size="Medium" Style="position: absolute" Text="<%$ Resources:Resource, RequirementLabel %>"></asp:Label>
                                            &#160;&nbsp;<cc1:RoundedCornersExtender ID="RequirementRoundedCornersExtender" runat="server"
                                                BorderColor="64, 0, 0" Enabled="True" Color="Maroon" TargetControlID="RequirementPanel">
                                            </cc1:RoundedCornersExtender>
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
                                            <asp:Table ID="RequirementTable" runat="server" BorderColor="Gray" BorderStyle="Inset"
                                                BorderWidth="2px" CellPadding="4" CellSpacing="4" Style="left: 117px; position: absolute;
                                                top: 12px" Width="287px" Height="166px" Font-Names="Times New Roman" Font-Size="Small">
                                                <asp:TableRow ID="ExperienceTableRow" runat="server">
                                                    <asp:TableCell ID="ExperienceTableCell1" runat="server" HorizontalAlign="Center">
                                                        <asp:Label ID="ExperienceLabel" runat="server" Text="<%$ Resources:Resource, ExperienceLabel %>"></asp:Label>
                                                    </asp:TableCell><asp:TableCell ID="ExperienceTableCell2" runat="server" HorizontalAlign="Center">
                                                        <asp:DropDownList ID="ExperienceDropDownList" runat="server" DataSourceID="ExperienceDataSource"
                                                            DataTextField="ExperienceValue" DataValueField="ExperienceID">
                                                        </asp:DropDownList>
                                                    </asp:TableCell></asp:TableRow>
                                                <asp:TableRow ID="CrewNumberTableRow" runat="server">
                                                    <asp:TableCell ID="CrewNumberTableCell1" runat="server" HorizontalAlign="Center">
                                                        <asp:Label ID="CrewNumberLabel" runat="server" Text="<%$ Resources:Resource, NumberofCrewsLabel %>"></asp:Label>
                                                    </asp:TableCell><asp:TableCell ID="CrewNumberTableCell2" runat="server" HorizontalAlign="Center">
                                                        <asp:DropDownList ID="CrewNumberDropDownList" runat="server" DataSourceID="CrewNumberDataSource"
                                                            DataTextField="crewnumberValue" DataValueField="crewnumberID">
                                                        </asp:DropDownList>
                                                    </asp:TableCell></asp:TableRow>
                                                <asp:TableRow ID="LicensedTableRow" runat="server">
                                                    <asp:TableCell ID="LicensedTableCell1" runat="server" HorizontalAlign="Center">
                                                        <asp:Label ID="LicensedLabel" runat="server" Text="<%$ Resources:Resource, LicensedLabel %>"></asp:Label>
                                                    </asp:TableCell><asp:TableCell ID="LicensedTableCell2" runat="server" HorizontalAlign="Center">
                                                        <asp:DropDownList ID="LicensedDropDownList" runat="server" DataSourceID="LicensedDataSource"
                                                            DataTextField="LicensedValue" DataValueField="LicensedID">
                                                        </asp:DropDownList>
                                                    </asp:TableCell></asp:TableRow>
                                                <asp:TableRow ID="InsuredTableRow" runat="server">
                                                    <asp:TableCell ID="InsuredTableCell1" runat="server" HorizontalAlign="Center">
                                                        <asp:Label ID="InsuredLabel" runat="server" Text="<%$ Resources:Resource, InsuredLabel %>"></asp:Label>
                                                    </asp:TableCell><asp:TableCell ID="InsuredTableCell2" runat="server" HorizontalAlign="Center">
                                                        <asp:DropDownList ID="InsuredDropDownList" runat="server" DataSourceID="InsuredDataSource"
                                                            DataTextField="InsuredValue" DataValueField="InsuredID">
                                                        </asp:DropDownList>
                                                    </asp:TableCell></asp:TableRow>
                                                <asp:TableRow ID="RelocationTableRow" runat="server">
                                                    <asp:TableCell ID="RelocationTableCell1" runat="server" HorizontalAlign="Center">
                                                        <asp:Label ID="RelocationLabel" runat="server" Text="<%$ Resources:Resource, RelocationLabel %>"></asp:Label>
                                                    </asp:TableCell><asp:TableCell ID="RelocationTableCell2" runat="server" HorizontalAlign="Center">
                                                        <asp:DropDownList ID="RelocationDropDownList" runat="server" DataSourceID="RelocationDataSource"
                                                            DataTextField="RelocationValue" DataValueField="RelocationID">
                                                        </asp:DropDownList>
                                                    </asp:TableCell></asp:TableRow>
                                            </asp:Table>
                                        </asp:Panel>
                                        &nbsp;&nbsp;<br />
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="ProjectRequirementTabPanel" runat="server" HeaderText="<%$ Resources:Resource, ProjectRequirementTabPanel %>">
                                    <ContentTemplate>
                                        <table width="830px">
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="ProjectTitlePanel" runat="server" Height="62px" Style="left: 128px;
                                                        position: relative; top: 8px" Width="487px">
                                                        <asp:Label ID="ProjectTitleLabel" runat="server" Style="left: 4px; position: absolute;
                                                            top: 8px" Text="<%$ Resources:Resource, ProjectTitleLabel %>" Font-Bold="True"
                                                            ForeColor="Maroon" Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                                        <asp:UpdatePanel ID="ProjectTitleUpdatePanel" runat="server">
                                                            <ContentTemplate>
                                                                <asp:TextBox ID="TitleTextBox" runat="server" Style="left: 141px; position: absolute;
                                                                    top: 25px" AutoPostBack="True" CausesValidation="True" MaxLength="25"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="ProjectTitleRequiredFieldValidator" runat="server"
                                                                    ControlToValidate="TitleTextBox" Display="Dynamic" ErrorMessage="<%$ Resources:Resource, ProjectTitleRequiredFieldValidator %>"
                                                                    Style="left: 300px; position: absolute; top: 26px" Width="179px" Font-Bold="True"
                                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="TitleFilteredTextBoxExtender" runat="server" InvalidChars="+-*/=)(*&amp;^%$#@!~`\|\]}[{&quot;':;?/&lt;&gt;"
                                                                    TargetControlID="TitleTextBox" FilterMode="InvalidChars" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                        <cc1:RoundedCornersExtender ID="ProjectTitleRoundedCornersExtender" runat="server"
                                                            BorderColor="64, 0, 0" Enabled="True" Color="Maroon" TargetControlID="ProjectTitlePanel">
                                                        </cc1:RoundedCornersExtender>
                                                    </asp:Panel>
                                                    <cc1:RoundedCornersExtender ID="TimeFrameRoundedCornersExtender" runat="server" BorderColor="64, 0, 0"
                                                        Enabled="True" Color="Maroon" TargetControlID="TimeFramePanel">
                                                    </cc1:RoundedCornersExtender>
                                                    <asp:Panel ID="TimeFramePanel" runat="server" Height="260px" Style="left: 128px;
                                                        position: relative; top: 19px" Width="487px">
                                                        <asp:UpdatePanel ID="TimeFrameUpdatePanel" runat="server">
                                                            <ContentTemplate>
                                                                <asp:Label ID="TimeFrameLabel" runat="server" Style="left: 4px; position: absolute;
                                                                    top: 4px" Text="<%$ Resources:Resource, TimeFrameLabel %>" Font-Bold="True" ForeColor="Maroon"
                                                                    Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                                                <asp:Label ID="StartDateLabel" runat="server" Style="left: 7px; position: absolute;
                                                                    top: 29px" Text="<%$ Resources:Resource, StartDateLabel %>" Font-Bold="True"
                                                                    Font-Names="Times New Roman" Font-Size="Medium" ForeColor="Red"></asp:Label>
                                                                <asp:Label ID="EndDateLabel" runat="server" Style="left: 266px; position: absolute;
                                                                    top: 28px" Text="<%$ Resources:Resource, EndDateLabel %>" Font-Bold="True" ForeColor="Red"
                                                                    Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                                                <asp:Calendar ID="EndDateCalendar" runat="server" Height="90px" Style="left: 266px;
                                                                    position: absolute; top: 50px; width: 200px" Width="200px" DayNameFormat="FirstTwoLetters"
                                                                     CssClass="myCalendar">
                                                                    <NextPrevStyle CssClass="myCalendarNextPrev" />
                                                                    <SelectedDayStyle CssClass="myCalendarSelector" />
                                                                    <SelectorStyle CssClass="myCalendarSelector" />
                                                                    <DayStyle CssClass="myCalendarDay" />
                                                                    <DayHeaderStyle Width="10px" CssClass="myCalendarDay" />
                                                                    <TitleStyle Font-Bold="True" Font-Underline="False" CssClass="myCalendarTitle" />
                                                                </asp:Calendar>
                                                                <asp:Calendar ID="StartDateCalendar" runat="server" Height="90px" Style="left: 10px;
                                                                    position: absolute; top: 50px; width: 200px" Width="200px" DayNameFormat="FirstTwoLetters"
                                                                    onchange="javascript:$find('LocationDelayModalPopupExtender').show();" onselecteddate="javascript:$find('LocationDelayModalPopupExtender').show();"
                                                                    CssClass="myCalendar">
                                                                    <NextPrevStyle CssClass="myCalendarNextPrev" />
                                                                    <SelectedDayStyle CssClass="myCalendarSelector" />
                                                                    <SelectorStyle CssClass="myCalendarSelector" />
                                                                    <DayStyle CssClass="myCalendarDay" />
                                                                    <DayHeaderStyle Width="10px" CssClass="myCalendarDay" />
                                                                    <TitleStyle Font-Bold="True" Font-Underline="False" CssClass="myCalendarTitle" />
                                                                </asp:Calendar>
                                                                &#160; &#160; &#160;
                                                                <asp:TextBox ID="DateErrorTextBox" runat="server" AutoPostBack="True" CausesValidation="True"
                                                                    ReadOnly="True" Style="left: 200px; position: absolute; top: 188px" Visible="False"></asp:TextBox>
                                                                <asp:CustomValidator ID="CalenderCustomValidator" runat="server" ControlToValidate="DateErrorTextBox"
                                                                    Display="Dynamic" ErrorMessage="<%$ Resources:Resource, CalenderCustomValidator %>"
                                                                    SetFocusOnError="True" Style="left: 10px; position: absolute; top: 240px" ValidateEmptyText="True"
                                                                    Font-Bold="True"></asp:CustomValidator>
                                                                &#160;</ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </asp:Panel>
                                                    <asp:Panel ID="CurrencyPanel" runat="server" Height="156px" Style="left: 128px; position: relative;
                                                        top: 31px" Width="487px">
                                                        <asp:Label ID="CurrencyHeaderLabel" runat="server" Text="<%$ Resources:Resource, CurrencyLabel %>"
                                                            Font-Bold="True" ForeColor="Maroon" Style="left: 4px; position: absolute; top: 4px"
                                                            Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                                        <asp:Label ID="CurrencyLabel" runat="server" Text="<%$ Resources:Resource, CurrencyLabel %>"
                                                            Font-Bold="True" ForeColor="Red" Style="z-index: 1; position: absolute; top: 42px;
                                                            left: 266px" Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                                        <asp:TextBox ID="AmountOfferedTextBox" runat="server" Style="left: 68px; position: absolute;
                                                            top: 74px" Text="<%$ Resources:Resource, AmountOfferedTextBox %>"></asp:TextBox>
                                                        <asp:Label ID="AmountOfferedLabel" runat="server" Text="<%$ Resources:Resource, AmountOfferedLabel %>"
                                                            Font-Bold="True" ForeColor="Red" Style="z-index: 1; position: absolute; top: 42px;
                                                            left: 10px" Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                                        <asp:DropDownList ID="CurrencyDropDownList" runat="server" DataSourceID="CurrencyDataSource"
                                                            DataTextField="CurrencyValue" DataValueField="CurrencyID" Style="left: 348px;
                                                            position: absolute; top: 74px">
                                                        </asp:DropDownList>
                                                        <asp:ObjectDataSource ID="CurrencyDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                            SelectMethod="GetCurrency" TypeName="PostProjectTableAdapters.CurrencyTableAdapter">
                                                        </asp:ObjectDataSource>
                                                        <asp:RequiredFieldValidator ID="AmountOfferedRequiredFieldValidator" runat="server"
                                                            ControlToValidate="AmountOfferedTextBox" Display="Dynamic" ErrorMessage="<%$ Resources:Resource, AmountOfferedRequiredFieldValidator %>"
                                                            Font-Bold="True" Style="position: absolute; top: 110px"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="AmountofferedCompareValidator" runat="server" ControlToValidate="AmountOfferedTextBox"
                                                            ErrorMessage="<%$ Resources:Resource, AmountofferedCompareValidator %>" Operator="GreaterThan"
                                                            Type="Currency" ValueToCompare="<%$ Resources:Resource, CurrencyComparison %>"
                                                            Font-Bold="True" Style="position: absolute; top: 125px; left: 0px;"></asp:CompareValidator>
                                                        <cc1:RoundedCornersExtender ID="CurrencyPanelRoundedCornersExtender" runat="server"
                                                            BorderColor="64, 0, 0" Enabled="True" Color="Maroon" TargetControlID="CurrencyPanel">
                                                        </cc1:RoundedCornersExtender>
                                                    </asp:Panel>
                                                </td>
                                                <td valign="middle">
                                                    <asp:Panel ID="TitleFilterationPanel" runat="server" Width="130px" Height="100px"
                                                        Style="text-align: center; overflow: hidden" BackColor="White">
                                                        <table cellspacing="1" style="width: 100%; height: 100%">
                                                            <tr>
                                                                <td style="background-color: Maroon">
                                                                    <asp:Label ID="TitleFilterationHeaderLabel" runat="server" Text="<%$ Resources:Resource, FilterationHeaderLabel %>"
                                                                        Font-Bold="True" Font-Size="Small" Font-Names="Times New Roman" ForeColor="White"
                                                                        Width="130px" Style="overflow: hidden"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="TitleFilterationContent" Font-Bold="True" Font-Names="Times New Roman"
                                                                        runat="server" Width="130px" Font-Size="Small" Style="overflow: hidden" Text="+-*/=)(*&^%$#@!~`\|\]}[{&quot;':;?/"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <cc1:RoundedCornersExtender ID="TitleFilterationRoundedCornersExtender" runat="server"
                                                            BorderColor="153, 0, 0" Color="153, 0, 0" Enabled="True" Radius="8" TargetControlID="TitleFilterationPanel">
                                                        </cc1:RoundedCornersExtender>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="ProjectDescriptionTabPanel" runat="server" HeaderText="<%$ Resources:Resource, ProjectDescriptionTabPanel %>">
                                    <ContentTemplate>
                                        <table width="850px">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="DescriptionLabel" runat="server" Font-Bold="True" Style="left: 100px;
                                                        position: relative; top: 2px" Text="<%$ Resources:Resource, DescriptionLabel2 %>"
                                                        ForeColor="Maroon" Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                                    <asp:Panel ID="DescriptionPanel" runat="server" Style="left: 99px; position: relative;
                                                        top: 5px" Height="370px" Width="557px">
                                                        <cc1:RoundedCornersExtender ID="DescriptionPanelRoundedCornersExtender" runat="server"
                                                            BorderColor="64, 0, 0" Enabled="True" Color="Maroon" TargetControlID="DescriptionPanel">
                                                        </cc1:RoundedCornersExtender>
                                                        <asp:Label ID="DescriptionContentLabel" runat="server" Style="z-index: 100; left: 2px;
                                                            position: absolute; top: 5px; overflow-y: scroll" Height="350px" Width="555px" />
                                                    </asp:Panel>
                                                    <asp:LinkButton ID="EditProjectDescriptionLinkButton" runat="server" Text="<%$ Resources:Resource, EditProjectLinkButton %>"
                                                        Style="z-index: 100; position: relative; left: 670px; top: 10px;" CausesValidation="False"
                                                        Font-Bold="True" Font-Size="Medium" ForeColor="#003366" OnClientClick="fireanimation2();"
                                                        CssClass="UnderlineLink"></asp:LinkButton>
                                                    <asp:Panel ID="SpecialNotesPanel" runat="server" Height="92px" Width="557px" Style="left: 99px;
                                                        position: relative; top: 5px">
                                                        <cc1:RoundedCornersExtender ID="SpecialNotesRoundedCornersExtender" runat="server"
                                                            BorderColor="64, 0, 0" Color="Maroon" Enabled="True" TargetControlID="SpecialNotesPanel">
                                                        </cc1:RoundedCornersExtender>
                                                        <asp:Label ID="SpecialNotesLabel" runat="server" Text="<%$ Resources:Resource, SpecialNotesLabel %>"
                                                            ForeColor="Maroon" Width="136px" Style="position: relative; top: 5px; left: 1px"
                                                            Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                                        <asp:TextBox ID="SpecialNotesTextBox" runat="server" Height="52px" MaxLength="1000"
                                                            onKeyDown="CountLeft(this.value,this.value.length,1000,'LeftAboutLabel');" onKeyUp="CountLeft(this.id,this.value.length,1000,'LeftAboutLabel');"
                                                            Style="z-index: 100; left: 1px; position: absolute; top: 28px" TextMode="MultiLine"
                                                            Width="550px"></asp:TextBox>
                                                        <asp:Panel ID="CharacterLeftAboutPanel" runat="server" Height="28px" Width="136px">
                                                            <input id="LeftAboutLabel" style="position: absolute; top: 105px; width: 35px; color: #000080;"
                                                                type="text" value="1000" />
                                                            <asp:Label ID="CharactersLeftAboutLabel" runat="server" ForeColor="#000066" Style="position: absolute;
                                                                top: 110px; left: 43px" Text="<%$ Resources:Resource, CharactersLeftLabel %>"
                                                                Width="200px"></asp:Label>
                                                        </asp:Panel>
                                                        &nbsp;<br />
                                                        <cc1:FilteredTextBoxExtender ID="SpecialNotesTextBoxFilteredExtender" runat="server"
                                                            Enabled="True" FilterMode="InvalidChars" InvalidChars="+-*/=)(*&amp;^%$#@!~`\|\]}[{&quot;':;?/&lt;&gt;"
                                                            TargetControlID="SpecialNotesTextBox">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </asp:Panel>
                                                </td>
                                                <td valign="middle">
                                                    <asp:Panel ID="FilterationPanel" runat="server" Width="130px" Height="100px" Style="overflow: hidden;
                                                        text-align: center;" BackColor="White">
                                                        <table cellspacing="1" style="width: 100%; height: 100%">
                                                            <tr>
                                                                <td style="background-color: Maroon">
                                                                    <asp:Label ID="FilterationHeaderLabel" runat="server" Text="<%$ Resources:Resource, FilterationHeaderLabel %>"
                                                                        Font-Bold="True" Font-Size="Small" ForeColor="White" Width="130px" Font-Names="Times New Roman"
                                                                        Style="overflow: hidden"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="FilterationContent" Font-Bold="True" Font-Size="Small" Font-Names="Times New Roman"
                                                                        runat="server" Style="overflow: hidden" Text="+-*/=)(*&^%$#@!~`\|\]}[{&quot;':;?/"
                                                                        Width="130px"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                    <cc1:RoundedCornersExtender ID="FilterationPanelRoundedCornersExtender" runat="server"
                                                        BorderColor="153, 0, 0" Enabled="True" Color="153, 0, 0" TargetControlID="FilterationPanel"
                                                        Radius="8">
                                                    </cc1:RoundedCornersExtender>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="PictureTabPanel" runat="server" HeaderText="<%$ Resources:Resource, PictureTabPanel %>">
                                    <ContentTemplate>
                                        <div align="center">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <iframe id="uploadFrame" frameborder="0" scrolling="no" src="ProjectUpload.aspx"
                                                            height="550" width="605"></iframe>
                                                        <asp:Panel ID="PictureRequirementPanel" runat="server" Width="160px" Height="140px"
                                                            Style="top: 156px; left: -186px; position: absolute; text-align: center;" BackColor="White">
                                                            <table cellspacing="1" style="width: 100%; height: 100%">
                                                                <tr>
                                                                    <td style="background-color: Gray">
                                                                        <asp:Label ID="ProjectPictureRequirementLabel" runat="server" Text="<%$ Resources:Resource, ProjectPictureRequirementLabel %>"
                                                                            Font-Bold="True" Font-Size="Small" ForeColor="White" Width="130px" Style="overflow: hidden"
                                                                            Font-Names="Times New Roman"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="ProjectRequirementContentTypeLabel" runat="server" Text="<%$ Resources:Resource, ProjectRequirementContentTypeLabel %>"
                                                                            Font-Bold="True" Font-Size="Small" ForeColor="Black" Width="130px" Style="overflow: hidden"
                                                                            Font-Names="Times New Roman"></asp:Label><hr />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="ProjectRequirementContentSizeLabel" runat="server" Text="<%$ Resources:Resource, ProjectRequirementContentSizeLabel %>"
                                                                            Font-Bold="True" Font-Size="Small" ForeColor="Black" Width="130px" Style="overflow: hidden"
                                                                            Font-Names="Times New Roman"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <cc1:RoundedCornersExtender ID="PictureRequirementPanelRoundedCornersExtender" runat="server"
                                                                BorderColor="Gray" Color="Gray" Enabled="True" Radius="8" TargetControlID="PictureRequirementPanel">
                                                            </cc1:RoundedCornersExtender>
                                                        </asp:Panel>
                                                    </td>
                                                    <td valign="middle">
                                                        <asp:Panel ID="TitleFilterationPanel2" runat="server" Width="130px" Height="100px"
                                                            Style="text-align: center; overflow: hidden" BackColor="White">
                                                            <table cellspacing="1" style="width: 100%; height: 100%">
                                                                <tr>
                                                                    <td style="background-color: Gray">
                                                                        <asp:Label ID="FilterationHeaderLabel2" runat="server" Text="<%$ Resources:Resource, FilterationHeaderLabel %>"
                                                                            Font-Bold="True" Font-Size="Small" ForeColor="White" Width="130px" Style="overflow: hidden"
                                                                            Font-Names="Times New Roman"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="FilterationContentLabel2" Font-Bold="True" runat="server" Width="130px"
                                                                            Style="overflow: hidden; z-index: 1;" Text="+-*/=)(*&^%$#@!~`\|\]}[{&quot;':;?/"
                                                                            Font-Names="Times New Roman" Font-Size="Small"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <cc1:RoundedCornersExtender ID="TitleFilterationPanel2RoundedCornersExtender" runat="server"
                                                                BorderColor="Gray" Color="Gray" Enabled="True" Radius="8" TargetControlID="TitleFilterationPanel2">
                                                            </cc1:RoundedCornersExtender>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="LocationTabPanel" runat="server" HeaderText="<%$ Resources:Resource, LocationTabPanel %>">
                                    <ContentTemplate>
                                        <asp:Panel ID="GlobalLocationPanel" runat="server" Style="width: 575px; height: 530px;
                                            overflow: hidden; position: relative; left: 120px">
                                            <asp:FormView ID="LocationFormView" runat="server" DataKeyNames="ProjectID" DataSourceID="ProjectLocationDataSource"
                                                DefaultMode="Edit" Height="230px" Font-Size="Small" EnableModelValidation="True">
                                                <EditItemTemplate>
                                                    <asp:Panel ID="AddressPanel" runat="server" Height="869px">
                                                        <asp:Label ID="AddressLabel" runat="server" BackColor="Maroon" BorderColor="Maroon"
                                                            BorderStyle="Inset" Font-Size="10pt" ForeColor="White" Style="left: 10px; top: 20px;
                                                            position: relative" Text="<%$ Resources:Resource, AddressLabel %>" BorderWidth="2px"></asp:Label>
                                                        <asp:TextBox ID="AddressTextBox" runat="server" Font-Size="11pt" Height="53px" MaxLength="60"
                                                            TabIndex="2" Text='<%# Bind("Address", "{0}") %>' TextMode="MultiLine" Width="320px"
                                                            Style="z-index: 1; position: relative; top: 39px; left: 80px;"></asp:TextBox>
                                                        <asp:TextBox ID="ZipcodeTextBox" runat="server" TabIndex="3" Text='<%# Bind("Zipcode", "{0}") %>'
                                                            Width="50px" Style="z-index: 1; position: relative; top: 68px; left: 520px" MaxLength="8"></asp:TextBox>
                                                        <span style="font-size: 11pt; vertical-align: text-top">
                                                            <asp:Label ID="ZipcodeLabel" runat="server" BackColor="Maroon" BorderColor="Maroon"
                                                                BorderStyle="Inset" Font-Size="10pt" ForeColor="White" Text="<%$ Resources:Resource, ZipcodeLabel %>"
                                                                BorderWidth="2px" Style="z-index: 1; position: relative; top: 68px; left: 415px"></asp:Label>
                                                        </span>
                                                        <br />
                                                        <asp:RequiredFieldValidator ID="AddressRequiredFieldValidator" runat="server" ControlToValidate="AddressTextBox"
                                                            Display="Dynamic" ErrorMessage="Address is Required" Font-Bold="True" Style="z-index: 1;
                                                            position: relative; left: 82px; top: 139px;" Text="<%$ Resources:Resource, AddressRequiredFieldValidator %>"></asp:RequiredFieldValidator>
                                                        <asp:Label ID="OnlyUSCanadaLabel" runat="server" ForeColor="Maroon" Height="24px"
                                                            Style="z-index: 1; top: 348px; left: 418px; position: relative" Text="<%$ Resources:Resource, OnlyUSCanadaLabel %>"></asp:Label>
                                                        <asp:Panel ID="LocationPanel" runat="server">
                                                            <asp:Label ID="CountryLabel" runat="server" BackColor="Maroon" BorderColor="#990000"
                                                                BorderStyle="Inset" BorderWidth="2px" Font-Bold="False" ForeColor="White" Text="<%$ Resources:Resource, CountryLabel %>"
                                                                Style="z-index: 1; position: relative; top: 70px; left: 12px;"></asp:Label>
                                                            <asp:DropDownList ID="CountryDropDownList" runat="server" AutoPostBack="True" DataSourceID="CountriesDataSource"
                                                                DataTextField="Title" DataValueField="CountryId" OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged1"
                                                                SelectedValue='<%# Eval("CountryID","{0}") %>' Font-Size="Small" Style="position: relative;
                                                                top: 73px; left: 120px" OnChange="fireanimation11();" Width="150px">
                                                            </asp:DropDownList>
                                                            <asp:ObjectDataSource ID="CountriesDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetCountries" TypeName="LocationDataSetTableAdapters.CountriesUpdateTableAdapter">
                                                            </asp:ObjectDataSource>
                                                            <asp:UpdatePanel ID="RegionUpdatePanel" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:Label ID="RegionLabel" runat="server" BackColor="Maroon" BorderColor="#990000"
                                                                        BorderStyle="Inset" BorderWidth="2px" Font-Bold="False" ForeColor="White" Text="<%$ Resources:Resource, StateLabel %>"
                                                                        Style="position: relative; top: 165px; left: 12px"></asp:Label>
                                                                    <asp:DropDownList ID="RegionsDropDownList" runat="server" AutoPostBack="True" DataSourceID="RegionDataSource"
                                                                        DataTextField="Region" DataValueField="RegionId" Font-Size="Small" Style="position: relative;
                                                                        top: 168px; left: 90px" OnChange="fireanimation11();" Width="150px">
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
                                                            <asp:Label ID="CityLabel" runat="server" BackColor="Maroon" BorderColor="#990000"
                                                                BorderStyle="Inset" BorderWidth="2px" Font-Bold="False" ForeColor="White" Style="left: 12px;
                                                                position: relative; top: 280px; z-index: 1;" Text="<%$ Resources:Resource, CityLabel %>"></asp:Label>
                                                            <asp:UpdatePanel ID="CityUpdatePanel" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:DropDownList ID="CitiesDropDownList" runat="server" AutoPostBack="True" DataSourceID="CitiesObjectDataSource"
                                                                        DataTextField="City" DataValueField="CityId" Style="z-index: 1; left: 180px;
                                                                        top: 260px; position: relative" Width="150px">
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
                                                        </asp:Panel>
                                                    </asp:Panel>
                                                    <cc1:RoundedCornersExtender ID="GlobalLocationPanelRoundedCornersExtender" runat="server"
                                                        BorderColor="Maroon" TargetControlID="GlobalLocationPanel" Color="Maroon" Enabled="True">
                                                    </cc1:RoundedCornersExtender>
                                                </EditItemTemplate>
                                            </asp:FormView>
                                        </asp:Panel>
                                        <asp:ObjectDataSource ID="ProjectLocationDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetProjectLocation" TypeName="PostProjectTableAdapters.ProjectLocationTableAdapter">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="ProjectID" SessionField="ProjectID" Type="Int32" DefaultValue="" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>
                        </div>
                    </div>
                </td>
                <td valign="top" style="padding-top: 22px; padding-right: 15px">
                    <asp:Panel ID="BackToProfilePanel" runat="server" CssClass="BlueMenublock" Height="64px"
                        Style="z-index: 108; top: 40px; width: 110px; height: 64px;" Width="107px">
                        <ul>
                            <li>
                                <asp:LinkButton ID="BackToProfile" runat="server" CausesValidation="False" Width="100"
                                    Text="<%$ Resources:Resource, BackToProfileLinkButton %>" Font-Size="10"></asp:LinkButton></li></ul>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <div id="LoadingJobsDiv" style="width: 100px; height: 100px; z-index: 200; display: none;">
            <asp:UpdatePanel ID="LoadingJobUpdatePanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <cc1:ModalPopupExtender ID="LoadingModalPopupExtender" runat="server" PopupControlID="LoadingJobPanel"
                        TargetControlID="LoadingJobPanel" BackgroundCssClass="customModalBackground">
                    </cc1:ModalPopupExtender>
                    <asp:Panel ID="LoadingJobPanel" runat="server" Height="213px" Style="display: none;
                        left: 10px; position: absolute; top: 198px; z-index: 200;" Width="486px" BackColor="Transparent">
                        <asp:Label ID="LoadingJobLabel" runat="server" Font-Bold="True" ForeColor="Black"
                            Style="left: 222px; position: absolute; top: 78px" Text="<%$ Resources:Resource, Loading %>"></asp:Label>
                        <img src="../_assets/img/uploading.gif" alt="uploadingimages" style="left: 170px;
                            position: relative; top: 100px" />
                    </asp:Panel>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:ObjectDataSource ID="SaveProjectObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="UpdateProjectRequirement" TypeName="SaveProjectDataSetTableAdapters.QueriesTableAdapter"
            UpdateMethod="UpdateProjectRequirement">
            <UpdateParameters>
                <asp:Parameter Name="ProjectID" Type="Int32" />
                <asp:Parameter Name="PosterID" Type="Int32" />
                <asp:Parameter Name="LCID" Type="Int32" />
                <asp:Parameter Name="JobID" Type="Int32" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="ExperienceID" Type="Int32" />
                <asp:Parameter Name="CrewnumberID" Type="Int32" />
                <asp:Parameter Name="LicensedID" Type="Int32" />
                <asp:Parameter Name="InsuredID" Type="Int32" />
                <asp:Parameter Name="RelocationID" Type="Int32" />
                <asp:Parameter Name="ProjectTitle" Type="String" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="AmountOffered" Type="Double" />
                <asp:Parameter Name="CurrencyID" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="SpecialNotes" Type="String" />
                <asp:Parameter Name="DatePosted" Type="DateTime" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="CountryID" Type="Int32" />
                <asp:Parameter Name="CountryName" Type="String" />
                <asp:Parameter Name="RegionID" Type="Int32" />
                <asp:Parameter Name="RegionName" Type="String" />
                <asp:Parameter Name="CityID" Type="Int32" />
                <asp:Parameter Name="Zipcode" Type="String" />
                <asp:Parameter Name="Posted" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:Parameter Name="ProjectID" Type="Int32" />
                <asp:Parameter Name="PosterID" Type="Int32" />
                <asp:Parameter Name="LCID" Type="Int32" />
                <asp:Parameter Name="JobID" Type="Int32" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="ExperienceID" Type="Int32" />
                <asp:Parameter Name="CrewnumberID" Type="Int32" />
                <asp:Parameter Name="LicensedID" Type="Int32" />
                <asp:Parameter Name="InsuredID" Type="Int32" />
                <asp:Parameter Name="RelocationID" Type="Int32" />
                <asp:Parameter Name="ProjectTitle" Type="String" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="AmountOffered" Type="Double" />
                <asp:Parameter Name="CurrencyID" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="SpecialNotes" Type="String" />
                <asp:Parameter Name="DatePosted" Type="DateTime" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="CountryID" Type="Int32" />
                <asp:Parameter Name="CountryName" Type="String" />
                <asp:Parameter Name="RegionID" Type="Int32" />
                <asp:Parameter Name="RegionName" Type="String" />
                <asp:Parameter Name="CityID" Type="Int32" />
                <asp:Parameter Name="Zipcode" Type="String" />
                <asp:Parameter Name="Posted" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:Panel ID="GlobalPreviewProjectPanel" runat="server" Style="display: none; left: 11px;
            position: relative; top: 886px; z-index: 101;" BackColor="White" BorderColor="#404040"
            BorderStyle="Solid" BorderWidth="3px" Height="494px" Width="1000px">
            <asp:UpdatePanel ID="GlobalPreviewProjectUpdatePanel" runat="server">
                <ContentTemplate>
                    <cc1:ModalPopupExtender ID="PostProjectModalPopupExtender" runat="server" TargetControlID="GlobalTargetedLabel"
                        PopupControlID="GlobalPreviewProjectPanel" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                    <asp:Label ID="GlobalTargetedLabel" runat="server" Style="position: relative; z-index: 100;"
                        Text=""></asp:Label>
                    <asp:Button ID="Cancel" runat="server" CausesValidation="False" OnClick="Cancel_Click"
                        Style="position: relative; z-index: 103; left: 826px; top: 503px;" Text="<%$ Resources:Resource, Cancel %>"
                        BackColor="Maroon" BorderColor="LightSlateGray" BorderStyle="Solid" BorderWidth="2px"
                        Font-Bold="True" ForeColor="White" Height="30px" OnClientClick="fireanimation5();" />
                    <asp:Button ID="PostButton" runat="server" Style="position: relative; z-index: 102;
                        left: 842px; top: 502px;" Text="<%$ Resources:Resource, Post %>" BackColor="Maroon"
                        BorderColor="LightSlateGray" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True"
                        ForeColor="White" Height="30px" Width="66px" OnClick="PostButton_Click" CausesValidation="false"
                        OnClientClick="fireanimation5();" />
                </ContentTemplate>
            </asp:UpdatePanel>
            &nbsp;
            <asp:Panel ID="GlobalProjectPanel" runat="server" Height="491px" Style="left: 0px;
                position: absolute; top: 2px; z-index: 101;" Width="99%" BackColor="White">
                <asp:Panel ID="GlobalSpecializationPanel" runat="server" Height="242px" Style="left: 291px;
                    position: absolute; top: 11px" Width="274px">
                    <asp:UpdatePanel ID="GlobalSpecializationUpdatePanel" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="ProjectSpecificationLabel" runat="server" Style="position: absolute"
                                Text="<%$ Resources:Resource, ProjectSpecificationLabel %>" Font-Size="10pt"
                                Font-Bold="True" ForeColor="Maroon"></asp:Label>
                            <asp:Label ID="ProjectSpecializationLabel" runat="server" Height="14px" Style="left: 13px;
                                position: absolute; top: 56px" Text="<%$ Resources:Resource, SpecializationLabel2 %>"></asp:Label>
                            &nbsp;
                            <asp:Label ID="LicensedSummary" runat="server" Style="left: 131px; position: absolute;
                                top: 157px" BackColor="White"></asp:Label>
                            <asp:Label ID="CrewNumberIDLabel" runat="server" Style="left: 12px; position: absolute;
                                top: 129px" Text="<%$ Resources:Resource, NumberofCrewsLabel2 %>"></asp:Label>
                            <asp:Label ID="RelocationIDLabel" runat="server" Style="left: 1px; position: relative;
                                top: 214px" Text="<%$ Resources:Resource, RelocationLabel2 %>"></asp:Label>
                            <asp:Label ID="ExperienceIDLabel" runat="server" Style="left: 13px; position: absolute;
                                top: 102px" Text="<%$ Resources:Resource, ExperienceLabel2 %>"></asp:Label>
                            <asp:Label ID="LicensedIDLabel" runat="server" Style="left: 13px; position: absolute;
                                top: 157px" Text="<%$ Resources:Resource, LicensedLabel2 %>"></asp:Label>
                            <asp:Label ID="CrewNumberSummaryLabel" runat="server" Style="left: 131px; position: absolute;
                                top: 129px" Width="70px"></asp:Label>
                            <asp:Label ID="RelocationSummaryLabel" runat="server" Style="left: 131px; position: absolute;
                                top: 214px" Width="70px"></asp:Label>
                            <asp:Label ID="InsuredIDLabel" runat="server" Style="left: 13px; position: absolute;
                                top: 185px" Text="<%$ Resources:Resource, InsuredLabel2 %>"></asp:Label>
                            <asp:Label ID="ExperienceSummaryLabel" runat="server" Style="left: 131px; position: absolute;
                                top: 101px"></asp:Label>
                            <asp:Label ID="InsuredSummaryLabel" runat="server" Style="left: 131px; position: absolute;
                                top: 186px"></asp:Label>
                            <asp:Label ID="IndustryIDLabel" runat="server" Style="left: 13px; position: absolute;
                                top: 27px" Text="<%$ Resources:Resource, IndustryLabel2 %>" Font-Size="10pt"></asp:Label>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            <asp:TextBox ID="IndustrySummaryTextBox" runat="server" Style="left: 131px; position: absolute;
                                top: 23px" Width="96px" ReadOnly="True"></asp:TextBox>
                            <asp:ListBox ID="SummarySpecializationListBox" runat="server" Font-Size="9pt" Height="46px"
                                Style="left: 131px; position: absolute; top: 53px" Width="143px"></asp:ListBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
                <asp:Panel ID="GlobalProjectRequirementPanel" runat="server" Height="176px" Style="left: 292px;
                    position: absolute; top: 296px" Width="274px">
                    <asp:Label ID="AmountOfferedSummaryLabel" runat="server" Height="11px" Style="left: 139px;
                        position: absolute; top: 122px"></asp:Label>
                    <asp:Label ID="EndDateSummaryLabel" runat="server" Height="26px" Style="left: 139px;
                        position: absolute; top: 91px" Width="121px"></asp:Label>
                    <asp:Label ID="ProjectTitleIDLabel" runat="server" Height="11px" Style="left: 13px;
                        position: absolute; top: 30px" Text="<%$ Resources:Resource, ProjectTitleLabel2 %>"></asp:Label>
                    <asp:Label ID="StartDateIDLabel" runat="server" Height="11px" Style="left: 13px;
                        position: absolute; top: 56px" Text="<%$ Resources:Resource, StartDateLabel %>"
                        Font-Size="10pt"></asp:Label>
                    <asp:Label ID="StartDateSummaryLabel" runat="server" Height="26px" Style="left: 139px;
                        position: absolute; top: 58px" Width="122px"></asp:Label>
                    <asp:Label ID="EndDateIDLabel" runat="server" Height="11px" Style="left: 13px; position: absolute;
                        top: 91px" Text="<%$ Resources:Resource, EndDateLabel %>"></asp:Label>
                    <asp:Label ID="ProjectTitleSummaryLabel" runat="server" Height="11px" Style="left: 140px;
                        position: absolute; top: 30px"></asp:Label>
                    <asp:Label ID="AmountOfferedIDLabel" runat="server" Height="11px" Style="left: 13px;
                        position: absolute; top: 123px" Text="<%$ Resources:Resource, AmountOfferedLabel %>"></asp:Label>
                    <asp:Label ID="ProjectRequirementIDLabel" runat="server" Height="11px" Style="left: 4px;
                        position: absolute; top: 6px" Text="<%$ Resources:Resource, ProjectRequirementLabel2 %>"
                        Font-Size="10pt" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                    &nbsp;
                    <asp:Label ID="CurrencyIDLabel" runat="server" Style="left: 13px; position: absolute;
                        top: 152px" Text="<%$ Resources:Resource, CurrencyLabel %>"></asp:Label>
                    <asp:Label ID="CurrencySummaryLabel" runat="server" Style="left: 140px; position: absolute;
                        top: 153px"></asp:Label>
                </asp:Panel>
                <asp:UpdatePanel ID="GlobalProjectUpdatePanel" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="GlobalProjectPhotoPanel" runat="server" Height="270px" Style="left: 15px;
                            position: absolute; top: 10px" Width="227px">
                            <cc1:RoundedCornersExtender ID="GlobalProjectPhotoPanelRoundedCornersExtender" runat="server"
                                TargetControlID="GlobalProjectPhotoPanel" BorderColor="64, 0, 0" Enabled="True"
                                Color="Maroon">
                            </cc1:RoundedCornersExtender>
                            <asp:FormView ID="PhotoFormView" runat="server" AllowPaging="True" DataSourceID="GlobalProjectPhotoObjectDataSource"
                                ForeColor="Maroon" Height="275px" HorizontalAlign="Center" Width="190px" EnableModelValidation="True"
                                OnPageIndexChanging="PhotoFormView_PageIndexChanging" CssClass="FormViewStyle">
                                <ItemTemplate>
                                    <asp:Image ID="PhotoImage" runat="server" Height="220px" ImageAlign="Middle" ImageUrl='<%# Bind("PhotoPath", "{0}") %>'
                                        Width="199px" />
                                    <asp:Label ID="PhotoCaptionLabel" runat="server" Text='<%# Bind("Caption") %>' Style="left: 65px;
                                        position: relative"></asp:Label></ItemTemplate>
                                <PagerSettings Mode="Numeric" />
                                <PagerStyle Font-Bold="True" ForeColor="Navy" HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:FormView>
                            <asp:ObjectDataSource ID="GlobalProjectPhotoObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="ProjectPhotosDataSetTableAdapters.SELECTALLProjectPictureTableAdapter">
                                <SelectParameters>
                                    <asp:SessionParameter Name="ProjectID" SessionField="ProjectID" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                &nbsp;
                <asp:Panel ID="GlobalProjectDescriptionPanel" runat="server" Height="459px" Style="left: 611px;
                    position: absolute; top: 11px" Width="380px">
                    <asp:Label ID="NotesIDLabel" runat="server" Style="left: 8px; position: absolute;
                        top: 276px" Text="<%$ Resources:Resource, NotesLabel %>" Font-Bold="True" Font-Size="10pt"
                        ForeColor="Maroon"></asp:Label>
                    <asp:TextBox ID="NotesSummaryTextBox" runat="server" Height="132px" Style="left: 5px;
                        position: absolute; top: 300px" Width="364px" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                    <asp:Label ID="ProjectDescriptionLabel" runat="server" Style="left: 9px; position: absolute;
                        top: 3px" Text="<%$ Resources:Resource, ProjectDescriptionLabel %>" Font-Bold="True"
                        Font-Size="10pt" ForeColor="Maroon"></asp:Label>
                    <asp:Label ID="ProjectDescriptionLabel2" runat="server" Style="left: 11px; position: absolute;
                        top: 28px" Text="<%$ Resources:Resource, DescriptionLabel2 %>" Font-Bold="True"
                        Font-Size="10pt" ForeColor="Maroon"></asp:Label>
                    <CustomEditor:CustomEditor ID="CustomDescriptionSummary" Style="z-index: 100; left: 2px;
                        position: absolute; top: 50px;" runat="server" Height="200px" Width="364px" />
                    &nbsp;
                </asp:Panel>
                <asp:Panel ID="GlobalProjectLocationPanel" runat="server" Height="178px" Style="left: 17px;
                    position: relative; top: 274px; overflow: hidden" Width="227px">
                    <asp:Label ID="AddressIDLabel" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="Maroon"
                        Style="left: 1px; position: relative; top: 1px" Text="<%$ Resources:Resource, AddressLabel2 %>"
                        Height="16px" Width="60px"></asp:Label><table style="left: 0px; width: 100%; padding-top: 1%;
                            position: relative; top: 9px; height: 70%">
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="AddressLabel0" runat="server" Style="position: relative" Text="<%$ Resources:Resource, AddressLabel %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:TextBox ID="SummaryAddressTextBox" runat="server" Style="position: relative"
                                        Width="109px" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="CountryIDLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, CountryLabel %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:Label ID="SummaryCountry" runat="server" Style="position: relative"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="StateLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, StateLabel %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:Label ID="SummaryState" runat="server" Style="position: relative"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="CityLabel0" runat="server" Style="position: relative" Text="<%$ Resources:Resource, CityLabel %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:Label ID="SummaryCity" runat="server" Style="position: relative"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="ZipcodeLabel0" runat="server" Style="position: relative" Text="<%$ Resources:Resource, ZipcodeLabel %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:Label ID="SummaryZipcode" runat="server" Style="position: relative"></asp:Label>
                                </td>
                            </tr>
                        </table>
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="GlobalValidationPanel" runat="server" Height="218px" Style="display: none;
            left: 48px; position: relative; top: 1218px; z-index: 103;" Width="440px" BackColor="Silver"
            BorderColor="Black" BorderStyle="Solid" BorderWidth="3px">
            <asp:UpdatePanel ID="GlobalValidationUpdatePanel" runat="server">
                <ContentTemplate>
                    <cc1:ModalPopupExtender ID="ValidationModalPopupExtender" runat="server" TargetControlID="GlobalValidationLabel"
                        PopupControlID="GlobalValidationPanel" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                    <asp:Label ID="GlobalValidationLabel" runat="server" Style="position: relative" Width="153px"></asp:Label><asp:Button
                        ID="ValidationOkButton" runat="server" CausesValidation="False" OnClick="ValidationOkButton_Click"
                        Style="position: relative; left: 181px; top: 180px;" Text="<%$ Resources:Resource, OkButton %>"
                        Width="63px" OnClientClick="fireanimation7();" />&nbsp;</ContentTemplate>
            </asp:UpdatePanel>
            <asp:Label ID="ErrorMessageLabel" runat="server" Style="left: 0px; position: relative"
                Text="<%$ Resources:Resource, ProjectErrorMessageLabel %>" Width="300px" Font-Bold="True"></asp:Label><br />
            <br />
            <asp:Label ID="GlobalValidation" runat="server" Font-Bold="True" ForeColor="#C00000"
                Height="7px" Style="position: relative" Text=" " Width="545px"></asp:Label></asp:Panel>
        <asp:Panel ID="CustomEditDescriptionPanel" runat="server" Height="218px" Style="display: none;
            left: 48px; position: relative; top: 1218px; z-index: 104;" Width="484px" BackColor="Silver"
            BorderColor="Black" BorderStyle="Solid" BorderWidth="3px">
            <asp:UpdatePanel ID="CustomMessageUpdatePanel" runat="server">
                <ContentTemplate>
                    <cc1:ModalPopupExtender ID="CustomMessageModalPopupExtender" runat="server" TargetControlID="CustomMessageLabel"
                        PopupControlID="CustomEditDescriptionPanel" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                    <asp:Label ID="CustomMessageLabel" runat="server" Style="position: relative; top: 9px;
                        text-align: center" Width="100%"></asp:Label><asp:Button ID="OkButton" runat="server"
                            CausesValidation="False" OnClick="Ok_Click" Style="position: relative; left: 200px;
                            top: 120px;" Text="<%$ Resources:Resource, OkButton %>" Width="63px" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <cc1:RoundedCornersExtender ID="GlobalSpecializationPanelRoundedCornersExtender"
            runat="server" TargetControlID="GlobalSpecializationPanel" BorderColor="64, 0, 0"
            Enabled="True" Color="Maroon">
        </cc1:RoundedCornersExtender>
        <cc1:RoundedCornersExtender ID="GlobalProjectRequirementPanelRoundedCornersExtender"
            runat="server" TargetControlID="GlobalProjectRequirementPanel" BorderColor="64, 0, 0"
            Enabled="True" Color="Maroon">
        </cc1:RoundedCornersExtender>
        <cc1:RoundedCornersExtender ID="GlobalProjectDescriptionPanelRoundedCornersExtender"
            runat="server" TargetControlID="GlobalProjectDescriptionPanel" BorderColor="64, 0, 0"
            Enabled="True" Color="Maroon">
        </cc1:RoundedCornersExtender>
        <cc1:RoundedCornersExtender ID="GlobalProjectLocationPanelRoundedCornersExtender"
            runat="server" TargetControlID="GlobalProjectLocationPanel" BorderColor="64, 0, 0"
            Enabled="True" Color="Maroon">
        </cc1:RoundedCornersExtender>
        <asp:Panel ID="GlobalJobSelectionPanel" runat="server" Style="display: none; left: 0px;
            z-index: 101;">
            <asp:Label ID="TargetedLabel" runat="server" Style="position: relative; z-index: 100;"
                Text=""></asp:Label>
            <cc1:ModalPopupExtender ID="GlobalJobSelectionModalPopupExtender" runat="server"
                TargetControlID="TargetedLabel" PopupControlID="GlobalJobSelectionPanel" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:UpdatePanel ID="GlobalUpdatePanel" runat="server">
                <ContentTemplate>
                    <table align="center">
                        <tr>
                            <td>
                                <asp:Button ID="HideListButton" runat="server" Style="position: absolute; top: 14px;
                                    left: 950px; height: 22px;" Font-Bold="True" BackColor="White" ForeColor="Black"
                                    Width="30px" Height="30px" CausesValidation="false" Text="X" OnClick="HideListButton_Click"
                                    OnClientClick="fireanimation3();" />
                                <asp:Panel ID="AlphabeticPanel" runat="server" Style="width: 930px; height: 35px;
                                    z-index: 1;" BackColor="#003366" ForeColor="White">
                                    <asp:DataList ID="AlphabeticDataList" runat="server" CellPadding="5" CellSpacing="5"
                                        DataSourceID="AlphabeticDataSource" RepeatDirection="Horizontal" Width="100%"
                                        DataKeyField="Char" ForeColor="White" OnSelectedIndexChanged="AlphabeticDataList_SelectedIndexChanged">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="AlphabeticLinkButton" runat="server" Text='<%# Eval("Char", "{0}") %>'
                                                CommandName="select" ForeColor="White" Font-Bold="True" CssClass="UnderlineLink"
                                                CausesValidation="false"></asp:LinkButton><br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:ObjectDataSource ID="AlphabeticDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetAlphabetic" TypeName="AlphabeticDataSetTableAdapters.AlphabeticLetterTableAdapter">
                                        <SelectParameters>
                                            <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="Language" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </asp:Panel>
                                <asp:Panel ID="JobsListPanel" runat="server" Style="width: 930px; height: 497px;
                                    z-index: 1;" BackColor="White">
                                    <asp:UpdatePanel ID="JobsListUpdatePanel" runat="server">
                                        <ContentTemplate>
                                            <asp:ObjectDataSource ID="JobSelectionDataSource" runat="server" TypeName="AlphabeticDataSetTableAdapters.JobSelectionTableAdapter"
                                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetJobSelectionEn">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="AlphabeticDataList" DefaultValue="A" Name="Alphabetic"
                                                        PropertyName="SelectedValue" Type="String" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:ListView ID="JobListView" runat="server" DataKeyNames="JobID" DataSourceID="JobSelectionDataSource"
                                                GroupItemCount="9">
                                                <EmptyItemTemplate>
                                                    <td id="Td1" runat="server" />
                                                </EmptyItemTemplate>
                                                <ItemTemplate>
                                                    <td id="Td2" runat="server" style="text-align: top; vertical-align: text-top">
                                                        <asp:LinkButton ID="JobIDLinkButton" runat="server" Text='<%# Eval("JobTitle") %>'
                                                            CommandName="select" Font-Size="Small" ForeColor="Blue" CssClass="JobLinkButton"
                                                            CausesValidation="False" OnClick="JobIDLinkButton_Click" OnClientClick="fireanimation3()"></asp:LinkButton><asp:Label
                                                                ID="JobCategoryLabel" runat="server" Text='<%# Eval("JobCategory ") %>' Visible="False"></asp:Label>
                                                    </td>
                                                </ItemTemplate>
                                                <EmptyDataTemplate>
                                                </EmptyDataTemplate>
                                                <LayoutTemplate>
                                                    <table id="Table1" runat="server">
                                                        <tr id="Tr1" runat="server">
                                                            <td id="Td3" runat="server">
                                                                <table id="groupPlaceholderContainer" runat="server" border="0" style="" cellspacing="3"
                                                                    cellpadding="3">
                                                                    <tr id="groupPlaceholder" runat="server">
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:Panel ID="DataPagerPanel" runat="server" Style="height: 31px; width: 930px;
                                                        text-align: center" BackColor="#003366" ForeColor="White" Font-Bold="True">
                                                        <asp:DataPager ID="JobListDataPager" runat="server" PageSize="72">
                                                            <Fields>
                                                                <asp:NumericPagerField NumericButtonCssClass="NumericStyle" NextPreviousButtonCssClass="NumericStyle" />
                                                            </Fields>
                                                        </asp:DataPager>
                                                    </asp:Panel>
                                                </LayoutTemplate>
                                                <GroupTemplate>
                                                    <tr id="itemPlaceholderContainer" runat="server">
                                                        <td id="itemPlaceholder" runat="server">
                                                        </td>
                                                    </tr>
                                                </GroupTemplate>
                                            </asp:ListView>
                                            <br />
                                            <br />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <cc1:RoundedCornersExtender ID="JobsListUpdatePanel_RoundedCornersExtender" runat="server"
                                        Enabled="True" TargetControlID="JobsListPanel" Color="#003366" BorderColor="#003366"
                                        Radius="5">
                                    </cc1:RoundedCornersExtender>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
    <div class="cleaner">
    </div>
    <LowerNavigationButtons:NavigationButtons ID="MainLowerNavigationButtons" runat="server" />
    <div id="LoadingDiv" style="width: 100px; height: 100px; z-index: 200; display: none;">
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
    <div id="LocationDelayDiv" style="width: 100px; height: 100px; z-index: 200; display: none;">
        <asp:UpdatePanel ID="LocationDelayUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <cc1:ModalPopupExtender ID="LocationDelayModalPopupExtender" runat="server" PopupControlID="LocationDelayPanel"
                    TargetControlID="LocationDelayPanel" BackgroundCssClass="customModalBackground"
                    RepositionMode="RepositionOnWindowResize">
                </cc1:ModalPopupExtender>
                <asp:Panel ID="LocationDelayPanel" runat="server" Height="240px" Style="display: none;
                    z-index: 200;" Width="574px" BackColor="Transparent">
                    <asp:Label ID="LocationLoadingLabel" runat="server" Font-Bold="True" ForeColor="Black"
                        Style="left: 222px; position: absolute; top: 8px" Text="<%$ Resources:Resource, Loading %>"></asp:Label>
                    <img src="../_assets/img/uploading.gif" alt="uploadingimages" style="left: 170px;
                        position: relative; top: 32px" />
                </asp:Panel>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
