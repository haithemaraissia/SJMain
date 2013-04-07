<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FindProfessional.aspx.vb"
    Inherits="FindJob" %>

<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainLowerButtons.ascx" %>
<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script language="javascript" type="text/javascript">
        function disableBackButton() {
            window.history.forward();
        }
        setTimeout("disableBackButton()", 0);
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
    </style>
    <title id="Title1" runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <script type="text/javascript" src="../scripts/jquery-1.5.2.js"></script>
    <link rel="stylesheet" href="../_assets/css/TemplateStyleSheet.css" type="text/css"
        media="screen" />
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
</head>
<body onload="disableBackButton()">
    <form id="form1" runat="server">
    <div>
        <UpperNavigationButtons:NavigationButtons ID="MainNavigationButtons" runat="server">
        </UpperNavigationButtons:NavigationButtons>
    </div>
    <asp:AjaxScriptManager ID="ScriptManager1" runat="server">
    </asp:AjaxScriptManager>
    <div id="wrapper" style="padding: 25px">
        <table align="center" id="TemplateGlobalTable">
            <tr>
                <td>
                    <table align="center" style="position: relative;">
                        <tr>
                            <td>
                                <asp:Wizard ID="FindProfessionalWizard" runat="server" ActiveStepIndex="1" BackColor="#E6E2D8"
                                    BorderColor="#999999" BorderWidth="1px" FinishCompleteButtonText="<%$ Resources:Resource, Post %>"
                                    Font-Names="Verdana" Font-Size="0.8em" Height="521px" Width="667px" BorderStyle="Solid"
                                    StepNextButtonText="">
                                    <StepStyle VerticalAlign="Top" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderStyle="Solid"
                                        BorderWidth="2px" CssClass="UnderlineLink" />
                                    <SideBarStyle BackColor="Silver" Font-Size="0.9em" VerticalAlign="Top" Width="150px"
                                        HorizontalAlign="Left" Wrap="True" CssClass="UnderlineLink" />
                                    <NavigationButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid"
                                        BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
                                    <WizardSteps>
                                        <asp:WizardStep ID="BasicFindProfessional" runat="server" Title="<%$ Resources:Resource, Basic %>">
                                            <asp:Panel ID="SearchByUserNamePanel" runat="server" Height="68px" Style="left: 0px;
                                                position: relative; top: 7px; background-color: #ffffff; width: 508px;">
                                                <asp:Label ID="UsernameLabel" runat="server" Style="left: 76px; position: relative;
                                                    top: 29px" Text="<%$ Resources:Resource, UserName1 %>" Width="86px"></asp:Label>
                                                <asp:Label ID="SearchByUserNameLabel" runat="server" Font-Bold="True" ForeColor="#400000"
                                                    Height="16px" Style="left: -81px; position: relative; top: 0px" Text="<%$ Resources:Resource, SearchBy %>"
                                                    Width="102px"></asp:Label>
                                                <asp:TextBox ID="UsernameTextBox" runat="server" Style="left: 0px; position: relative;
                                                    top: 33px" MaxLength="99"></asp:TextBox>
                                                <asp:Button ID="SearchByUserNameButton" runat="server" Style="left: 61px; position: relative;
                                                    top: 33px" Text="<%$ Resources:Resource, Search%>" Width="66px" />
                                                <cc1:RoundedCornersExtender ID="SearchByUserNamePanelRoundedCornersExtender" runat="server"
                                                    BorderColor="64, 0, 0" Enabled="True" Color="Maroon" TargetControlID="SearchByUserNamePanel">
                                                </cc1:RoundedCornersExtender>
                                            </asp:Panel>
                                            <asp:Panel ID="SearchByJobPanel" runat="server" Height="414px" Style="left: 0px;
                                                position: relative; top: 25px; background-color: #ffffff;">
                                                <asp:Label ID="SearchByIndustryLabel" runat="server" Font-Bold="True" ForeColor="#400000"
                                                    Height="16px" Style="left: 5px; position: relative; top: 3px" Text="<%$ Resources:Resource, SearchBy %>"
                                                    Width="102px"></asp:Label>
                                                &nbsp;
                                                <asp:Panel ID="IndustyPanel" runat="server" BackColor="White" Height="56px" Style="left: 15px;
                                                    position: relative; top: 12px" Width="485px">
                                                    <asp:Label ID="IndustryLabel" runat="server" Font-Bold="True" ForeColor="Maroon"
                                                        Style="position: absolute" Text="<%$ Resources:Resource, IndustryLabel %>"></asp:Label>
                                                    <asp:DropDownList ID="IndustryDropDownList" runat="server" AutoPostBack="True" DataSourceID="CategoryObjectDataSource"
                                                        DataTextField="CategoryName" DataValueField="CategoryID" Style="left: 143px;
                                                        position: absolute; top: 18px" Width="240px">
                                                    </asp:DropDownList>
                                                    <asp:ObjectDataSource ID="CategoryObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                        SelectMethod="GetCategory" TypeName="SpecializationDataSetTableAdapters.GetCategoryTableAdapter">
                                                        <SelectParameters>
                                                            <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                    <cc1:RoundedCornersExtender ID="IndustryRoundedCornersExtender2" runat="server" BorderColor="64, 0, 0"
                                                        Enabled="True" Color="Maroon" TargetControlID="IndustyPanel">
                                                    </cc1:RoundedCornersExtender>
                                                </asp:Panel>
                                                <asp:Panel ID="SpecialtyPanel" runat="server" BackColor="White" BorderColor="Maroon"
                                                    BorderWidth="0px" Height="243px" Style="left: 14px; position: relative; top: 19px"
                                                    Width="487px" Wrap="False">
                                                    <cc1:RoundedCornersExtender ID="SpecialtyPanelRoundedCornersExtender2" runat="server"
                                                        BorderColor="64, 0, 0" Enabled="True" Color="Maroon" TargetControlID="SpecialtyPanel">
                                                    </cc1:RoundedCornersExtender>
                                                    <asp:UpdatePanel ID="SpecializationUpdatePanel" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Label ID="SpecialisationLabel" runat="server" Font-Bold="True" ForeColor="Maroon"
                                                                Style="left: 4px; position: absolute; top: 4px" Text="<%$ Resources:Resource, SpecializationLabel %>"></asp:Label>
                                                            <asp:ListBox ID="SpecialtyListBox1" runat="server" DataSourceID="SpecialtyList1ObjectDataSource"
                                                                DataTextField="JobTitle" DataValueField="JobID" Font-Size="8pt" Height="207px"
                                                                SelectionMode="Multiple" Style="left: 6px; position: absolute; top: 25px" Width="139px">
                                                            </asp:ListBox>
                                                            <asp:ObjectDataSource ID="SpecialtyList1ObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetFirstListSpeciality" TypeName="SpecializationDataSetTableAdapters.GetFirstListSpecialtyTableAdapter">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="IndustryDropDownList" DefaultValue="1" Name="JobCategory"
                                                                        PropertyName="SelectedValue" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                            &nbsp;
                                                            <asp:ListBox ID="SpecialtyListBox3" runat="server" DataSourceID="SpecialtyList3ObjectDataSource"
                                                                DataTextField="JobTitle" DataValueField="JobID" Font-Size="8pt" Height="207px"
                                                                SelectionMode="Multiple" Style="left: 340px; position: absolute; top: 25px" Width="139px">
                                                            </asp:ListBox>
                                                            <asp:ObjectDataSource ID="SpecialtyList3ObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetThirdListSpeciality" TypeName="SpecializationDataSetTableAdapters.GetFirstListSpecialtyTableAdapter">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="IndustryDropDownList" DefaultValue="1" Name="JobCategory"
                                                                        PropertyName="SelectedValue" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                            &nbsp;
                                                            <asp:ListBox ID="SpecialtyListBox2" runat="server" DataSourceID="SpecialtyList2ObjectDataSource"
                                                                DataTextField="JobTitle" DataValueField="JobID" Font-Size="8pt" Height="207px"
                                                                SelectionMode="Multiple" Style="left: 173px; position: absolute; top: 25px" Width="139px">
                                                            </asp:ListBox>
                                                            <asp:ObjectDataSource ID="SpecialtyList2ObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetSecondListSpeciality" TypeName="SpecializationDataSetTableAdapters.GetFirstListSpecialtyTableAdapter">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="IndustryDropDownList" DefaultValue="1" Name="JobCategory"
                                                                        PropertyName="SelectedValue" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                            &nbsp;
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="IndustryDropDownList" EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                    <br />
                                                </asp:Panel>
                                                &nbsp;<br />
                                                <asp:Button ID="SearchButton" runat="server" Style="left: 419px; position: relative;
                                                    top: 24px" Text="<%$ Resources:Resource, Search %>" Width="66px" />
                                            </asp:Panel>
                                        </asp:WizardStep>
                                        <asp:WizardStep ID="AdvancedFindProfessional" runat="server" Title="<%$ Resources:Resource, Advanced %>">
                                            <asp:Panel ID="IndustyPanel2" runat="server" BackColor="White" Height="56px" Style="left: 10px;
                                                position: relative; top: 4px" Width="487px">
                                                <asp:Label ID="IndustryLabel2" runat="server" Font-Bold="True" ForeColor="Maroon"
                                                    Style="position: absolute" Text="<%$ Resources:Resource, IndustryLabel %>"></asp:Label>
                                                <asp:DropDownList ID="IndustryDropDownList2" runat="server" AutoPostBack="True" DataSourceID="IndustryObjectDataSource"
                                                    DataTextField="CategoryName" DataValueField="CategoryID" Style="left: 143px;
                                                    position: absolute; top: 18px" Width="240px">
                                                </asp:DropDownList>
                                                <asp:ObjectDataSource ID="IndustryObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetCategory" TypeName="SpecializationDataSetTableAdapters.GetCategoryTableAdapter">
                                                    <SelectParameters>
                                                        <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                                <cc1:RoundedCornersExtender ID="IndustryRoundedCornersExtender3" runat="server" BorderColor="64, 0, 0"
                                                    Enabled="True" Color="Maroon" TargetControlID="IndustyPanel2">
                                                </cc1:RoundedCornersExtender>
                                            </asp:Panel>
                                            <asp:Panel ID="SpecialtyPanel2" runat="server" BackColor="White" BorderColor="Maroon"
                                                BorderWidth="0px" Height="243px" Style="left: 10px; position: relative; top: 14px"
                                                Width="487px" Wrap="False">
                                                <cc1:RoundedCornersExtender ID="SpecialtyPanel2RoundedCornersExtender" runat="server"
                                                    BorderColor="64, 0, 0" Enabled="True" Color="Maroon" TargetControlID="SpecialtyPanel2">
                                                </cc1:RoundedCornersExtender>
                                                <asp:UpdatePanel ID="SpecialisationNorthAmericaUpdatePanel" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Label ID="SpecialisationLabel2" runat="server" Font-Bold="True" ForeColor="Maroon"
                                                            Style="left: 4px; position: absolute; top: 4px" Text="<%$ Resources:Resource, SpecializationLabel2 %>"></asp:Label>
                                                        <asp:ListBox ID="SpecialtyListBox21" runat="server" DataSourceID="SpecialityListBox21ObjectDataSource"
                                                            DataTextField="JobTitle" DataValueField="JobID" Font-Size="9pt" Height="207px"
                                                            SelectionMode="Multiple" Style="left: 6px; position: absolute; top: 25px" Width="139px">
                                                        </asp:ListBox>
                                                        &nbsp;
                                                        <asp:ListBox ID="SpecialtyListBox22" runat="server" DataSourceID="SpecialityListBox22ObjectDataSource"
                                                            DataTextField="JobTitle" DataValueField="JobID" Font-Size="9pt" Height="207px"
                                                            SelectionMode="Multiple" Style="left: 340px; position: absolute; top: 25px" Width="139px">
                                                        </asp:ListBox>
                                                        &nbsp;
                                                        <asp:ListBox ID="SpecialtyListBox23" runat="server" DataSourceID="SpecialityListBox23ObjectDataSource"
                                                            DataTextField="JobTitle" DataValueField="JobID" Font-Size="9pt" Height="207px"
                                                            SelectionMode="Multiple" Style="left: 173px; position: absolute; top: 25px" Width="139px">
                                                        </asp:ListBox>
                                                        &nbsp;
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="IndustryDropDownList2" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <asp:ObjectDataSource ID="SpecialityListBox21ObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetFirstListSpeciality" TypeName="SpecializationDataSetTableAdapters.GetFirstListSpecialtyTableAdapter">
                                                    <SelectParameters>
                                                        <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                                        <asp:ControlParameter ControlID="IndustryDropDownList2" DefaultValue="1" Name="JobCategory"
                                                            PropertyName="SelectedValue" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                                <asp:ObjectDataSource ID="SpecialityListBox23ObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetSecondListSpeciality" TypeName="SpecializationDataSetTableAdapters.GetFirstListSpecialtyTableAdapter">
                                                    <SelectParameters>
                                                        <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                                        <asp:ControlParameter ControlID="IndustryDropDownList2" DefaultValue="1" Name="JobCategory"
                                                            PropertyName="SelectedValue" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                                <asp:ObjectDataSource ID="SpecialityListBox22ObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetThirdListSpeciality" TypeName="SpecializationDataSetTableAdapters.GetFirstListSpecialtyTableAdapter">
                                                    <SelectParameters>
                                                        <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
                                                        <asp:ControlParameter ControlID="IndustryDropDownList2" DefaultValue="1" Name="JobCategory"
                                                            PropertyName="SelectedValue" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </asp:Panel>
                                            <asp:Panel ID="RequirementPanel" runat="server" BackColor="White" Height="196px"
                                                Style="left: 10px; position: relative; top: 26px" Width="487px">
                                                <asp:Label ID="RequirementLabel" runat="server" Font-Bold="True" ForeColor="Maroon"
                                                    Style="position: absolute" Text="<%$ Resources:Resource, RequirementLabel %>"></asp:Label>
                                                &nbsp;
                                                <cc1:RoundedCornersExtender ID="RequirementPanelRoundedCornersExtender" runat="server"
                                                    BorderColor="64, 0, 0" Color="Maroon" Enabled="True" TargetControlID="RequirementPanel">
                                                </cc1:RoundedCornersExtender>
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
                                                <asp:Table ID="RequirementTable" runat="server" BorderColor="Gray" BorderStyle="Inset"
                                                    BorderWidth="2px" CellPadding="4" CellSpacing="4" Height="166px" Style="left: 117px;
                                                    position: absolute; top: 12px" Width="287px">
                                                    <asp:TableRow ID="ExperienceTableRow" runat="server">
                                                        <asp:TableCell ID="ExperienceLabelTableCell" runat="server" HorizontalAlign="Center">
                                                            <asp:Label ID="ExperienceLabel" runat="server" Text="<%$ Resources:Resource, ExperienceLabel %>"></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell ID="ExperienceDropDownListTableCell" runat="server" HorizontalAlign="Center">
                                                            <asp:DropDownList ID="ExperienceDropDownList" runat="server" DataSourceID="ExperienceObjectDataSource"
                                                                DataTextField="ExperienceValue" DataValueField="ExperienceID">
                                                            </asp:DropDownList>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow ID="CrewNumberTableRow" runat="server">
                                                        <asp:TableCell ID="CrewNumberLabelTableCell" runat="server" HorizontalAlign="Center">
                                                            <asp:Label ID="CrewNumberLabel" runat="server" Text="<%$ Resources:Resource, CrewNumber %>"></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell ID="CrewNumberDropDownListTableCell" runat="server" HorizontalAlign="Center">
                                                            <asp:DropDownList ID="CrewNumberDropDownList" runat="server" DataSourceID="CrewObjectDataSource"
                                                                DataTextField="crewnumberValue" DataValueField="crewnumberID">
                                                            </asp:DropDownList>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow ID="LicensedTableRow" runat="server">
                                                        <asp:TableCell ID="LicensedLabelTableCell" runat="server" HorizontalAlign="Center">
                                                            <asp:Label ID="LicensedLabel" runat="server" Text="<%$ Resources:Resource, LicensedLabel %>"></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell ID="LicensedDropDownListTableCell" runat="server" HorizontalAlign="Center">
                                                            <asp:DropDownList ID="LicensedDropDownList" runat="server" DataSourceID="LicensedObjectDataSource"
                                                                DataTextField="LicensedValue" DataValueField="LicensedID">
                                                            </asp:DropDownList>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow ID="InsuredTableRow" runat="server">
                                                        <asp:TableCell ID="InsuredLabelTableCell" runat="server" HorizontalAlign="Center">
                                                            <asp:Label ID="InsuredLabel" runat="server" Text="<%$ Resources:Resource, InsuredLabel %>"></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell ID="InsuredDropDownListTableCell" runat="server" HorizontalAlign="Center">
                                                            <asp:DropDownList ID="InsuredDropDownList" runat="server" DataSourceID="InsuredObjectDataSource"
                                                                DataTextField="InsuredValue" DataValueField="InsuredID">
                                                            </asp:DropDownList>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow ID="RelocationTableRow" runat="server">
                                                        <asp:TableCell ID="RelocationLabelTableCell" runat="server" HorizontalAlign="Center">
                                                            <asp:Label ID="RelocationLabel" runat="server" Text="<%$ Resources:Resource, RelocationLabel %>"></asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell ID="RelocationDropDownListTableCell" runat="server" HorizontalAlign="Center">
                                                            <asp:DropDownList ID="RelocationDropDownList" runat="server" DataSourceID="RelocationObjectDataSource"
                                                                DataTextField="RelocationValue" DataValueField="RelocationID">
                                                            </asp:DropDownList>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </asp:Panel>
                                            <asp:Panel ID="TimeFramePanel" runat="server" Height="239px" Style="left: 10px; position: relative;
                                                top: 39px; background-color: #ffffff;" Width="487px">
                                                <asp:UpdatePanel ID="TimeFrameUpdatePanel" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Label ID="AccomplishementLabel" runat="server" Font-Bold="True" ForeColor="Maroon"
                                                            Style="left: 4px; position: absolute; top: 4px" Text="<%$ Resources:Resource, Accomplissement %>"
                                                            Width="120px"></asp:Label>
                                                        <br />
                                                        <br />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <cc1:RoundedCornersExtender ID="TimeFramePanelRoundedCornersExtender" runat="server"
                                                    BorderColor="64, 0, 0" Color="Maroon" Enabled="True" TargetControlID="TimeFramePanel">
                                                </cc1:RoundedCornersExtender>
                                                <table style="left: 0px; vertical-align: middle; width: 100%; position: relative;
                                                    top: 0px; height: 80%; text-align: center">
                                                    <tr>
                                                        <td style="width: 100px; height: 18px">
                                                            <asp:Label ID="MustHaveLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, MustHave %>"
                                                                Font-Bold="True" ForeColor="#C00000"></asp:Label>
                                                        </td>
                                                        <td style="vertical-align: middle; width: 66px; height: 18px; text-align: center">
                                                            <asp:DropDownList ID="MustHaveDropDownList" runat="server" Style="position: relative">
                                                                <asp:ListItem Value="0">&lt;</asp:ListItem>
                                                                <asp:ListItem Value="1">&gt;</asp:ListItem>
                                                                <asp:ListItem Value="2">=</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="width: 100px; height: 18px">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100px; text-align: center;">
                                                            <asp:Label ID="ReputationLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, Reputation %>"
                                                                Font-Bold="True" ForeColor="#000040" Width="141px"></asp:Label>
                                                        </td>
                                                        <td style="width: 66px; text-align: center;">
                                                            <asp:TextBox ID="Reputation" runat="server" Style="position: relative" Width="30px"></asp:TextBox>
                                                        </td>
                                                        <td style="width: 100px">
                                                            <asp:TextBox ID="ReputationTargetTextBox" runat="server" Style="position: relative"></asp:TextBox>
                                                            <cc1:SliderExtender ID="ReputationSliderExtender" runat="server" Enabled="True" Maximum="100"
                                                                Minimum="0" BoundControlID="Reputation" EnableHandleAnimation="True" TargetControlID="ReputationTargetTextBox">
                                                            </cc1:SliderExtender>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:Label ID="CompletedProjectsLabel" runat="server" Style="position: relative"
                                                                Text="<%$ Resources:Resource, CompletedProjects %>" Font-Bold="True" ForeColor="#000040"></asp:Label>
                                                        </td>
                                                        <td style="vertical-align: middle; width: 66px; text-align: center">
                                                            <asp:TextBox ID="ProjectsCompleted" runat="server" Style="position: relative" Width="30px"></asp:TextBox>
                                                        </td>
                                                        <td style="width: 100px; text-align: center;">
                                                            <asp:TextBox ID="ProjectsCompletedTargetTextBox" runat="server" Style="position: relative"></asp:TextBox>
                                                            <cc1:SliderExtender ID="ProjectCompletedSliderExtender" runat="server" BoundControlID="ProjectsCompleted"
                                                                Enabled="True" EnableHandleAnimation="True" Maximum="100" Minimum="0" TargetControlID="ProjectsCompletedTargetTextBox">
                                                            </cc1:SliderExtender>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            &nbsp;
                                            <asp:Panel ID="LocationPanel" runat="server" Height="263px" Style="left: 10px; overflow: hidden;
                                                position: relative; top: 37px; background-color: #ffffff;" Width="487px">
                                                <table style="left: 3px; width: 98%; position: relative; top: 7px; height: 51%; background-color: #ffffff;"
                                                    id="LocationTable" runat="server">
                                                    <tr runat="server">
                                                        <td align="center" style="width: 33%" valign="middle" runat="server">
                                                            &nbsp;<asp:Label ID="CountryLabel" runat="server" Text="<%$ Resources:Resource, CountryLabel %>"
                                                                Style="left: 1px; position: relative; top: -8px"></asp:Label>
                                                            &nbsp;
                                                            <asp:DropDownList ID="CountryDropDownList" runat="server" AutoPostBack="True" DataSourceID="CountriesObjectDataSource"
                                                                DataTextField="Title" DataValueField="CountryId" Font-Size="Small" Width="123px"
                                                                Style="left: 4px; position: relative; top: -8px">
                                                            </asp:DropDownList>
                                                            &nbsp;&nbsp;
                                                        </td>
                                                        <td align="center" style="width: 40%" valign="middle" runat="server">
                                                            <asp:UpdatePanel ID="RegionUpdatePanel" runat="server">
                                                                <ContentTemplate>
                                                                    &nbsp;<asp:Label ID="RegionLabel" runat="server" Text="<%$ Resources:Resource, StateLabel %>"
                                                                        Style="left: -3px; position: relative; top: -9px"></asp:Label>
                                                                    &nbsp;<asp:DropDownList ID="RegionsDropDownList" runat="server" AutoPostBack="True"
                                                                        DataSourceID="RegionObjectDataSource" DataTextField="Region" DataValueField="RegionId"
                                                                        Font-Size="Small" Width="123px" Style="left: -3px; position: relative; top: -8px">
                                                                    </asp:DropDownList>
                                                                    &nbsp;&nbsp;
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                        <td align="center" style="width: 33%" valign="middle" runat="server">
                                                            <asp:Label ID="CityLabel" runat="server" Style="left: -2px; position: relative; top: 0px"
                                                                Text="<%$ Resources:Resource, CityLabel %>"></asp:Label>
                                                            <asp:UpdatePanel ID="CitiesUpdatePanel" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:DropDownList ID="CitiesDropDownList" runat="server" AutoPostBack="True" DataSourceID="CitiesObjectDataSource"
                                                                        DataTextField="City" DataValueField="CityId" Width="123px" Style="position: relative;
                                                                        top: 0px; left: 2px">
                                                                    </asp:DropDownList>
                                                                    &nbsp; &nbsp;
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="CountryDropDownList" EventName="SelectedIndexChanged" />
                                                                    <asp:AsyncPostBackTrigger ControlID="RegionsDropDownList" EventName="SelectedIndexChanged" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                    </tr>
                                                    <tr runat="server">
                                                        <td align="center" colspan="3" style="height: 132px; background-color: #ffffff;"
                                                            valign="middle" runat="server">
                                                            <asp:ObjectDataSource ID="RegionObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetRegion" TypeName="LocationDataSetTableAdapters.regionsUpdateTableAdapter">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="CountryDropDownList" DefaultValue="1" Name="CountryId"
                                                                        PropertyName="SelectedValue" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                            <asp:ObjectDataSource ID="CitiesObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetCities" TypeName="LocationDataSetTableAdapters.CitiesUpdateTableAdapter">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="CountryDropDownList" DefaultValue="1" Name="CountryId"
                                                                        PropertyName="SelectedValue" Type="Int32" />
                                                                    <asp:ControlParameter ControlID="RegionsDropDownList" DefaultValue="1" Name="RegionId"
                                                                        PropertyName="SelectedValue" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                            <cc1:RoundedCornersExtender ID="LocationPanelRoundedCornersExtender" runat="server"
                                                                BorderColor="64, 0, 0" Color="Maroon" Enabled="True" TargetControlID="LocationPanel">
                                                            </cc1:RoundedCornersExtender>
                                                            <asp:ObjectDataSource ID="CountriesObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetCountries" TypeName="LocationDataSetTableAdapters.CountriesUpdateTableAdapter">
                                                            </asp:ObjectDataSource>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="ZipcodeLabel" runat="server" Font-Size="10pt" Style="position: relative;
                                                    left: 385px; top: -96px;" Text="<%$ Resources:Resource, ZipcodeLabel %>"></asp:Label>
                                                <asp:TextBox ID="ZipcodeTextBox" runat="server" Style="position: relative; left: 295px;
                                                    top: -69px;" TabIndex="3" Text='<%# Bind("Zipcode", "{0}") %>' Width="106px"></asp:TextBox>
                                                <asp:Label ID="OnlyUSCanadaLabel" runat="server" ForeColor="Maroon" Height="24px"
                                                    Style="left: 165px; position: relative; top: -36px" Text="<%$ Resources:Resource, OnlyUSCanadaLabel %>"></asp:Label>
                                            </asp:Panel>
                                            <div onmouseout="document.getElementById('FindProfessionalWizard_AdvancedSearchButton').style.background='white';document.getElementById('FindProfessionalWizard_AdvancedSearchButton').style.cursor='pointer';"
                                                onmouseover="document.getElementById('FindProfessionalWizard_AdvancedSearchButton').style.background='#BFC8D3';">
                                                <asp:Button ID="AdvancedSearchButton" runat="server" BackColor="Gainsboro" BorderColor="DarkGray"
                                                    BorderStyle="Outset" BorderWidth="1px" Text="<%$ Resources:Resource, Search%>"
                                                    Style="left: 428px; position: relative; top: 43px" />
                                            </div>
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                        </asp:WizardStep>
                                        <asp:WizardStep ID="Custom" runat="server" Title="<%$ Resources:Resource, Custom %>">
                                            <asp:Panel ID="CustomPanel" runat="server" Height="68px" Style="left: 0px; position: relative;
                                                top: 7px; background-color: #ffffff;" Width="508px">
                                                <asp:Label ID="CustomLabel" runat="server" Style="left: 76px; position: relative;
                                                    top: 29px" Text="<%$ Resources:Resource, ProfessionalID %>" Width="86px"></asp:Label>
                                                <asp:Label ID="SearchByLabel" runat="server" Font-Bold="True" ForeColor="#400000"
                                                    Height="16px" Style="left: -83px; position: relative; top: 0px" Text="<%$ Resources:Resource, SearchBy %>"
                                                    Width="102px"></asp:Label>
                                                <asp:TextBox ID="ProfessionalIDTextBox" runat="server" Style="left: 0px; position: relative;
                                                    top: 33px"></asp:TextBox>
                                                &nbsp;
                                                <asp:Button ID="CustomSearchButton" runat="server" Style="left: 61px; position: relative;
                                                    top: 33px" Text="<%$ Resources:Resource, Search %>" Width="66px" />
                                                <asp:RequiredFieldValidator ID="ProjectIDRequiredFieldValidator" runat="server" ControlToValidate="ProfessionalIDTextBox"
                                                    Display="None" ErrorMessage="<%$ Resources:Resource, ProjectRequired %>" Font-Bold="True"
                                                    Style="left: 200px; position: relative; top: 35px">*</asp:RequiredFieldValidator>
                                                <cc1:RoundedCornersExtender ID="CustomPanelRoundedCornersExtender" runat="server"
                                                    BorderColor="64, 0, 0" Enabled="True" Color="Maroon" TargetControlID="CustomPanel">
                                                </cc1:RoundedCornersExtender>
                                                <asp:RegularExpressionValidator ID="ProfessionalIDRegularExpressionValidator" runat="server"
                                                    ControlToValidate="ProfessionalIDTextBox" Display="None" ErrorMessage="<%$ Resources:Resource, EnterProjectID %>"
                                                    Font-Bold="True" Style="left: 184px; position: relative; top: -51px" ValidationExpression="\d+">*</asp:RegularExpressionValidator>
                                                <cc1:ValidatorCalloutExtender ID="ProjectIDRequiredFieldValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="ProjectIDRequiredFieldValidator">
                                                </cc1:ValidatorCalloutExtender>
                                                <cc1:ValidatorCalloutExtender ID="ProfessionalIDRegularExpressionValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="ProfessionalIDRegularExpressionValidator">
                                                </cc1:ValidatorCalloutExtender>
                                            </asp:Panel>
                                        </asp:WizardStep>
                                        <asp:WizardStep runat="server" Title="<%$ Resources:Resource, BrowseContinents %>">
                                            <table style="width: 99%; position: relative; height: 100%; left: 2px; top: 0px;"
                                                cellpadding="5" cellspacing="5">
                                                <tr>
                                                    <td style="width: 50%">
                                                        <asp:Panel ID="NorthAmericaPanel" runat="server" Height="124px" Width="230px">
                                                            <cc1:RoundedCornersExtender ID="NorthAmericaPanelRoundedCornersExtender" runat="server"
                                                                BorderColor="64, 0, 0" Enabled="True" Color="Maroon" TargetControlID="NorthAmericaPanel">
                                                            </cc1:RoundedCornersExtender>
                                                            <asp:Label ID="NorthAmericaLabel" runat="server" ForeColor="Maroon" Style="position: relative"
                                                                Text="<%$ Resources:Resource, NorthAmerica %>" Width="121px" Font-Bold="True"></asp:Label>
                                                            <asp:UpdatePanel ID="NorthAmericaUpdatePanel" runat="server">
                                                                <ContentTemplate>
                                                                    <div onmouseout="document.getElementById('FindProfessionalWizard_NorthAmericaPanel').style.background='white';"
                                                                        onmouseover="document.getElementById('FindProfessionalWizard_NorthAmericaPanel').style.background='#BFC8D3';">
                                                                        &nbsp;<asp:ImageButton ID="NorthAmericaImageButton" runat="server" Height="82px"
                                                                            ImageUrl="~/Images/Continent/NorthAmerica.jpg" Style="left: 26px; position: relative;
                                                                            top: 5px" Width="186px" OnClick="NorthAmericaImageButton_Click" BorderColor="#400000"
                                                                            BorderStyle="Solid" BorderWidth="2px" /></div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                            &nbsp;</asp:Panel>
                                                    </td>
                                                    <td style="width: 50%">
                                                        <asp:Panel ID="SouthAmericaPanel" runat="server" Height="124px" Width="230px">
                                                            <cc1:RoundedCornersExtender ID="SouthAmericaPanelRoundedCornersExtender" runat="server"
                                                                BorderColor="DarkGreen" Enabled="True" Color="0, 64, 0" TargetControlID="SouthAmericaPanel">
                                                            </cc1:RoundedCornersExtender>
                                                            <asp:Label ID="SouthAmericaLabel" runat="server" ForeColor="Green" Style="position: relative"
                                                                Text="<%$ Resources:Resource, SouthAmerica %>" Width="121px" Font-Bold="True"></asp:Label>
                                                            <asp:UpdatePanel ID="SouthAmericaUpdatePanel" runat="server">
                                                                <ContentTemplate>
                                                                    <div onmouseout="document.getElementById('FindProfessionalWizard_SouthAmericaPanel').style.background='white';"
                                                                        onmouseover="document.getElementById('FindProfessionalWizard_SouthAmericaPanel').style.background='#BFC8D3';">
                                                                        <asp:ImageButton ID="SouthAmericaImageButton" runat="server" Height="82px" ImageUrl="~/Images/Continent/SouthAmerica.jpg"
                                                                            Style="left: 26px; position: relative; top: 5px" Width="186px" OnClick="SouthAmericaImageButton_Click" /></div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 50%">
                                                    </td>
                                                    <td style="width: 50%">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 50%">
                                                        <asp:Panel ID="EuropePanel" runat="server" Height="124px" Width="230px">
                                                            <cc1:RoundedCornersExtender ID="EuropePanelRoundedCornersExtender" runat="server"
                                                                BorderColor="DarkBlue" Enabled="True" Color="0, 0, 64" TargetControlID="EuropePanel">
                                                            </cc1:RoundedCornersExtender>
                                                            <asp:Label ID="EuropeLabel" runat="server" ForeColor="#000040" Style="position: relative"
                                                                Text="<%$ Resources:Resource, Europe %>" Width="121px" Font-Bold="True"></asp:Label>
                                                            <asp:UpdatePanel ID="EuropeUpdatePanel" runat="server">
                                                                <ContentTemplate>
                                                                    <div onmouseout="document.getElementById('FindProfessionalWizard_EuropePanel').style.background='white';"
                                                                        onmouseover="document.getElementById('FindProfessionalWizard_EuropePanel').style.background='#BFC8D3';">
                                                                        <asp:ImageButton ID="EuropeImageButton" runat="server" Height="82px" ImageUrl="~/Images/Continent/Europe.jpg"
                                                                            Style="left: 26px; position: relative; top: 5px" Width="186px" OnClick="EuropeImageButton_Click" /></div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </asp:Panel>
                                                    </td>
                                                    <td style="width: 50%">
                                                        <asp:Panel ID="AfricaPanel" runat="server" Height="124px" Width="230px">
                                                            <cc1:RoundedCornersExtender ID="AfricaRoundedCornersExtender" runat="server" BorderColor="128, 64, 20"
                                                                Enabled="True" Color="128, 64, 0" TargetControlID="AfricaPanel">
                                                            </cc1:RoundedCornersExtender>
                                                            <asp:Label ID="AfricaLabel" runat="server" ForeColor="#804000" Style="position: relative"
                                                                Text="<%$ Resources:Resource, Africa %>" Width="121px" Font-Bold="True"></asp:Label>
                                                            <asp:UpdatePanel ID="AfricaUpdatePanel" runat="server">
                                                                <ContentTemplate>
                                                                    <div onmouseout="document.getElementById('FindProfessionalWizard_AfricaPanel').style.background='white';"
                                                                        onmouseover="document.getElementById('FindProfessionalWizard_AfricaPanel').style.background='#BFC8D3';">
                                                                        <asp:ImageButton ID="AfricaImageButton" runat="server" Height="82px" ImageUrl="~/Images/Continent/Africa.jpg"
                                                                            Style="left: 26px; position: relative; top: 5px" Width="186px" OnClick="AfricaImageButton_Click" /></div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 50%">
                                                    </td>
                                                    <td style="width: 50%">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 50%">
                                                        <asp:Panel ID="AsiaPanel" runat="server" Height="124px" Width="230px">
                                                            <cc1:RoundedCornersExtender ID="AsiaRoundedCornersExtender" runat="server" BorderColor="192, 0, 0"
                                                                Enabled="True" Color="192, 0, 0" TargetControlID="AsiaPanel">
                                                            </cc1:RoundedCornersExtender>
                                                            <asp:Label ID="AsiaLabel" runat="server" ForeColor="#C00000" Style="position: relative"
                                                                Text="<%$ Resources:Resource, Asia %>" Width="121px" Font-Bold="True"></asp:Label>
                                                            <asp:UpdatePanel ID="AsiaUpdatePanel" runat="server">
                                                                <ContentTemplate>
                                                                    <div onmouseout="document.getElementById('FindProfessionalWizard_AsiaPanel').style.background='white';"
                                                                        onmouseover="document.getElementById('FindProfessionalWizard_AsiaPanel').style.background='#BFC8D3';">
                                                                        <asp:ImageButton ID="AsiaImageButton" runat="server" Height="82px" ImageUrl="~/Images/Continent/Asia.jpg"
                                                                            Style="left: 26px; position: relative; top: 5px" Width="186px" OnClick="AsiaImageButton_Click" /></div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </asp:Panel>
                                                    </td>
                                                    <td style="width: 50%">
                                                        <asp:Panel ID="SoutheastAsiaPanel" runat="server" Height="124px" Width="230px">
                                                            <cc1:RoundedCornersExtender ID="SoutheastAsiaRoundedCornersExtender" runat="server"
                                                                BorderColor="0, 0, 64" Enabled="True" Color="0, 0, 64" TargetControlID="SoutheastAsiaPanel">
                                                            </cc1:RoundedCornersExtender>
                                                            <asp:Label ID="SoutheastAsiaLabel" runat="server" ForeColor="#000040" Style="position: relative"
                                                                Text="<%$ Resources:Resource, SoutheastAsia %>" Width="121px" Font-Bold="True"></asp:Label>
                                                            <asp:UpdatePanel ID="SoutheastUpdatePanel" runat="server">
                                                                <ContentTemplate>
                                                                    <div onmouseout="document.getElementById('FindProfessionalWizard_SoutheastAsiaPanel').style.background='white';"
                                                                        onmouseover="document.getElementById('FindProfessionalWizard_SoutheastAsiaPanel').style.background='#BFC8D3';">
                                                                        <asp:ImageButton ID="SoutheastAsiaImageButton" runat="server" Height="82px" ImageUrl="~/Images/Continent/SoutheastAsia.jpg"
                                                                            Style="left: 26px; position: relative; top: 5px" Width="186px" OnClick="SoutheastAsiaImageButton_Click" /></div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 50%">
                                                    </td>
                                                    <td style="width: 50%">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 50%">
                                                        <asp:Panel ID="MiddleEastPanel" runat="server" Height="124px" Width="230px">
                                                            <cc1:RoundedCornersExtender ID="MiddleEastRoundedCornersExtender" runat="server"
                                                                BorderColor="DarkOliveGreen" Enabled="True" Color="DarkOliveGreen" TargetControlID="MiddleEastPanel">
                                                            </cc1:RoundedCornersExtender>
                                                            <asp:Label ID="MiddleEastLabel" runat="server" ForeColor="DarkOliveGreen" Style="position: relative"
                                                                Text="<%$ Resources:Resource, MiddleEast %>" Width="121px" Font-Bold="True"></asp:Label>
                                                            <asp:UpdatePanel ID="MiddleEastUpdatePanel" runat="server">
                                                                <ContentTemplate>
                                                                    <div onmouseout="document.getElementById('FindProfessionalWizard_MiddleEastPanel').style.background='white';"
                                                                        onmouseover="document.getElementById('FindProfessionalWizard_MiddleEastPanel').style.background='#BFC8D3';">
                                                                        <asp:ImageButton ID="MiddleEastImageButton" runat="server" Height="82px" ImageUrl="~/Images/Continent/MiddleEast.jpg"
                                                                            Style="left: 26px; position: relative; top: 5px" Width="186px" OnClick="MiddleEastImageButton_Click" /></div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </asp:Panel>
                                                    </td>
                                                    <td style="width: 50%">
                                                        <asp:Panel ID="OceaniaArcticAntartic" runat="server" Height="124px" Width="230px">
                                                            <cc1:RoundedCornersExtender ID="OceaniaArcticAntarticRoundedCornersExtender" runat="server"
                                                                BorderColor="Blue" Enabled="True" Color="Navy" TargetControlID="OceaniaArcticAntartic">
                                                            </cc1:RoundedCornersExtender>
                                                            <asp:Label ID="OceaniaArcticAntarticLabel" runat="server" ForeColor="Blue" Style="position: relative"
                                                                Text="<%$ Resources:Resource, OceaniaArcticAntarctic %>" Width="212px" Font-Bold="True"></asp:Label>
                                                            <asp:UpdatePanel ID="OceaniaArcticAntarticUpdatePanel" runat="server">
                                                                <ContentTemplate>
                                                                    <div onmouseout="document.getElementById('FindProfessionalWizard_OceaniaArcticAntartic').style.background='white';"
                                                                        onmouseover="document.getElementById('FindProfessionalWizard_OceaniaArcticAntartic').style.background='#BFC8D3';">
                                                                        <asp:ImageButton ID="OceaniaImageButton" runat="server" Height="82px" ImageUrl="~/Images/Continent/Oceania.jpg"
                                                                            Style="left: 26px; position: relative; top: 5px" Width="186px" OnClick="OceaniaImageButton_Click" /></div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:WizardStep>
                                    </WizardSteps>
                                    <SideBarButtonStyle ForeColor="Black" />
                                    <HeaderStyle BackColor="#666666" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="2px"
                                        Font-Bold="True" Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center"
                                        Font-Underline="false" />
                                    <SideBarTemplate>
                                        <asp:DataList ID="SideBarList" runat="server">
                                            <SelectedItemStyle Font-Bold="True" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="SideBarButton" runat="server" CausesValidation="False" ForeColor="Black"
                                                    CssClass="UnderlineLink"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </SideBarTemplate>
                                    <StartNavigationTemplate>
                                        &nbsp;
                                    </StartNavigationTemplate>
                                    <FinishNavigationTemplate>
                                        &nbsp;
                                    </FinishNavigationTemplate>
                                    <StepNavigationTemplate>
                                        &nbsp;
                                    </StepNavigationTemplate>
                                </asp:Wizard>
                            </td>
                            <td valign="top">
                                <table align="center">
                                    <tr>
                                        <td>
                                            <asp:Panel ID="Ad1Panel" runat="server" Width="250px" Height="250px" BackColor="#000099">
                                                <img src="../Images/ads3.gif" alt="" />
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="Ad2Panel" runat="server" Width="250px" Height="250px" BackColor="#000099">
                                                <img src="../Images/ads3.gif" alt="" />
                                            </asp:Panel>
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
    <asp:Panel ID="CountryPanel" runat="server" Height="517px" Style="display: none;
        left: 18px; position: relative; top: 1720px; z-index: 103;" Width="914px" BorderColor="MidnightBlue"
        BorderStyle="Solid" BorderWidth="0px">
        <asp:UpdatePanel ID="CountryUpdatePanel" runat="server">
            <ContentTemplate>
                <cc1:ModalPopupExtender ID="CountryPopupExtender" runat="server" TargetControlID="ModalCountryTargetedLabel"
                    PopupControlID="CountryPanel" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>
                <asp:Label ID="ModalCountryTargetedLabel" runat="server" Style="position: relative"
                    Width="153px"></asp:Label>
                <asp:DataList ID="CountryDataList" runat="server" DataKeyField="CountryId" DataSourceID="ContinentObjectDataSource"
                    OnSelectedIndexChanged="CountryDataList_SelectedIndexChanged" Style="position: relative"
                    HorizontalAlign="Center" RepeatDirection="Horizontal" Height="99%" Width="100%"
                    BackColor="White">
                    <ItemTemplate>
                        <asp:Image ID="CountryImage" runat="server" Height="30px" ImageUrl='<%# Eval("Path", "{0}") %>'
                            Style="position: relative" Width="30px" />
                        <asp:LinkButton ID="CountryLinkButton" runat="server" CausesValidation="False" CommandName="select"
                            ForeColor="#000040" Style="position: relative" Text='<%# Eval("Title", "{0}") %>'
                            CssClass="UnderlineLink"></asp:LinkButton><br />
                    </ItemTemplate>
                </asp:DataList>
                <br />
                <div onmouseout="document.getElementById('CountryButton').style.background='white';document.getElementById('CountryButton').style.cursor='pointer';"
                    onmouseover="document.getElementById('CountryButton').style.background='#BFC8D3';">
                    <asp:Button ID="CountryButton" runat="server" CausesValidation="False" OnClick="Country_Click"
                        Style="position: relative; left: 92%;" Text="<%$ Resources:Resource, Cancel%>"
                        Width="63px" BorderStyle="Ridge" BorderWidth="2px" BorderColor="#003366" BackColor="White"
                        Font-Bold="True" ForeColor="#000066" /></div>
                <asp:ObjectDataSource ID="ContinentObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetContinentCountries" TypeName="ContinentDataSetTableAdapters.CountriesUpdateTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="ContinentReference" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <cc1:RoundedCornersExtender ID="CountryPanel_RoundedCornersExtender" runat="server"
                    BorderColor="#003366" Color="#003366" Enabled="True" TargetControlID="CountryDataList">
                </cc1:RoundedCornersExtender>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Panel ID="RegionPanel" runat="server" Height="517px" Style="display: none; left: 18px;
        position: relative; top: 0px; z-index: 103;" Width="87%" BorderColor="MidnightBlue"
        BorderStyle="Solid" BorderWidth="0px">
        <asp:UpdatePanel ID="RegionUpdatePanel1" runat="server">
            <ContentTemplate>
                <cc1:ModalPopupExtender ID="RegionModalPopupExtender" runat="server" TargetControlID="RegionTargetedLabel"
                    PopupControlID="RegionPanel" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>
                <asp:Label ID="RegionTargetedLabel" runat="server" Style="position: relative; z-index: 100;"
                    Width="153px"></asp:Label>
                <asp:DataList ID="RegionDataList" runat="server" DataKeyField="RegionId" DataSourceID="RegionObjectDataSource1"
                    OnSelectedIndexChanged="RegionDataList_SelectedIndexChanged" Style="position: relative;
                    z-index: 101;" HorizontalAlign="Center" RepeatDirection="Horizontal" BackColor="White"
                    Height="99%" RepeatColumns="7" Width="100%" Font-Size="12pt" CellPadding="1"
                    CellSpacing="1">
                    <ItemTemplate>
                        <asp:LinkButton ID="RegionLinkButton" runat="server" CausesValidation="False" CommandName="select"
                            Font-Bold="True" ForeColor="#000040" Style="position: relative" Text='<%# Eval("Region", "{0}") %>'
                            CssClass="UnderlineLink"></asp:LinkButton>
                    </ItemTemplate>
                </asp:DataList>
                <cc1:RoundedCornersExtender ID="RegionDataListRoundedCornersExtender" runat="server"
                    BorderColor="Black" Enabled="True" Color="Black" TargetControlID="RegionDataList"
                    Radius="7">
                </cc1:RoundedCornersExtender>
                <br />
                <div onmouseout="document.getElementById('RegionButton').style.background='white';document.getElementById('RegionButton').style.cursor='pointer';"
                    onmouseover="document.getElementById('RegionButton').style.background='#BFC8D3';">
                    <asp:Button ID="RegionButton" runat="server" CausesValidation="False" OnClick="RegionButton_Click"
                        Style="position: relative; left: 92%; z-index: 104;" Text="<%$ Resources:Resource, Cancel%>"
                        Width="63px" BorderStyle="Ridge" BorderWidth="2px" BorderColor="#333333" BackColor="White"
                        Font-Bold="True" ForeColor="Black" /></div>
                <asp:Label ID="EmptyRegionLabel" runat="server" BackColor="White" Font-Bold="True"
                    ForeColor="Black" Style="position: relative; z-index: 103;" Text="<%$ Resources:Resource, EmptyRegion %>"
                    Visible="False" Width="147px"></asp:Label>
                <asp:ObjectDataSource ID="RegionObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetRegion" TypeName="ContinentDataSetTableAdapters.regionsUpdateTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="CountryID" Type="Int32" />
                        <asp:Parameter Name="SelectedCountry" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <div class="cleaner">
    </div>
    <LowerNavigationButtons:NavigationButtons ID="MainLowerNavigationButtons" runat="server" />
    </form>
</body>
</html>
