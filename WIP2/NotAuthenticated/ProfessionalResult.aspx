<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProfessionalResult.aspx.vb"
    Inherits="NotAuthenticated_testprofessionalresults" %>

<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainLowerButtons.ascx" %>
<%@ Register Namespace="CommentAjaxControl" TagPrefix="CustomTextBox" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
            $find('LoadingModalPopupExtender').show();
            document.body.style.overflow = 'visible';
        }

        function fireanimation2() {
            $find('MessageModalPopupExtender').hide();
            document.getElementById('LoadingPanel').style.visibility = 'visible';
            $find('LoadingModalPopupExtender').show();
            document.body.style.overflow = 'visible';
            $find('LoadingModalPopupExtender').hide();
        }

        function fireanimation3() {
            $find('InvitationModalPopupExtender').hide();
            $find('LoadingModalPopupExtender').show();
            $find('LoadingModalPopupExtender').hide();
        }

        function fireanimation4() {
            $find('InvitationModalPopupExtender').hide();
            $find('LoadingModalPopupExtender').hide();
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
        /* Rating */
        .ratingStar
        {
            font-size: 0pt;
            width: 13px;
            height: 12px;
            margin: 0px;
            padding: 0px;
            cursor: pointer;
            display: block;
            background-repeat: no-repeat;
        }
        .filledRatingStar
        {
            background-image: url(../Images/FilledStar.png);
        }
        
        .emptyRatingStar
        {
            background-image: url(../Images/EmptyStar.png);
        }
        
        .savedRatingStar
        {
            background-image: url(../Images/SavedStar.png);
        }
        
        .gridViewHeader a:link
        {
            text-decoration: none;
        }
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
<body>
    <form id="form1" runat="server">
    <div>
        <UpperNavigationButtons:NavigationButtons ID="MainNavigationButtons" runat="server">
        </UpperNavigationButtons:NavigationButtons>
        <asp:AjaxScriptManager ID="ScriptManager1" runat="server">
        </asp:AjaxScriptManager>
        <table align="center" style="position: relative; padding-top: 35px; padding-bottom:5px">
            <tr>
                <td id="FilterResults" style="width: 119px; padding: 5px; vertical-align: top">
                    <asp:Panel ID="RequirementPanel" runat="server" BackColor="White" Style="width: 119px;">
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
                                            <asp:Label ID="CrewNumberLabel" runat="server" Text="<%$ Resources:Resource, CrewNumber %>"></asp:Label><br />
                                            &nbsp;
                                            <asp:DropDownList ID="CrewNumberDropDownList" runat="server" DataSourceID="CrewObjectDataSource"
                                                DataTextField="crewnumberValue" DataValueField="crewnumberID" >
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="ExperienceLabel" runat="server" Text="<%$ Resources:Resource, ExperienceLabel %>"
                                                ></asp:Label>
                                            <br />
                                            &nbsp;<asp:DropDownList ID="ExperienceDropDownList" runat="server" DataSourceID="ExperienceObjectDataSource"
                                                DataTextField="ExperienceValue" DataValueField="ExperienceID" >
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="LicensedLabel" runat="server" Text="<%$ Resources:Resource, LicensedLabel %>"></asp:Label><br />
                                            &nbsp;
                                            <asp:DropDownList ID="LicensedDropDownList" runat="server" DataSourceID="LicensedObjectDataSource"
                                                DataTextField="LicensedValue" DataValueField="LicensedID" >
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="InsuredLabel" runat="server" Text="<%$ Resources:Resource, InsuredLabel %>"></asp:Label><br />
                                            &nbsp;
                                            <asp:DropDownList ID="InsuredDropDownList" runat="server" DataSourceID="InsuredObjectDataSource"
                                                DataTextField="InsuredValue" DataValueField="InsuredID" >
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="RelocationLabel" runat="server" Text="<%$ Resources:Resource, RelocationLabel %>"></asp:Label>
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
                        <cc1:RoundedCornersExtender ID="RequirementPanelRoundedCornersExtender" runat="server"
                            BorderColor="0, 33, 66" Color="0, 33, 66" Enabled="True" TargetControlID="RequirementPanel">
                        </cc1:RoundedCornersExtender>
                    </asp:Panel>
                    <asp:Panel ID="AccomplishementPanel" runat="server" Style="position: relative; top: 30px;
                        background-color: #ffffff; overflow: hidden" Width="119px">
                        <br />
                        <asp:Label ID="AccomplishementLabel" runat="server" Font-Bold="True" BackColor="#5D7B9D"
                            ForeColor="White" Style="position: absolute; top: 0px" Text="<%$ Resources:Resource, Accomplishment %>"
                            Width="119px"></asp:Label>
                        <asp:UpdatePanel ID="AccomplishementUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table style="left: 0px; vertical-align: middle; width: 119px; position: relative;
                                    top: 0px; height: 80%; text-align: center">
                                    <tr>
                                        <td style="width: 100px; height: 18px">
                                            <asp:Label ID="AccomplishementMustHaveLabel" runat="server" Style="position: relative"
                                                Text="<%$ Resources:Resource, MustHave %>" Font-Bold="True" ForeColor="#C00000"></asp:Label>
                                            &nbsp;
                                            <asp:DropDownList ID="AccomplishementMustHaveDropDownList" runat="server" Style="position: relative">
                                                <asp:ListItem Value="0">&lt;</asp:ListItem>
                                                <asp:ListItem Value="1">&gt;</asp:ListItem>
                                                <asp:ListItem Value="2">=</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                            <asp:Label ID="CompletedProjectsLabel" runat="server" Style="position: relative"
                                                Text="<%$ Resources:Resource, CompletedProjects %>" Font-Bold="True" ForeColor="#000040"></asp:Label>&nbsp;<br/><asp:TextBox
                                                    ID="ProjectsCompleted" runat="server" Style="position: relative" Width="30px"></asp:TextBox><asp:TextBox
                                                        ID="ProjectsCompletedTargetTextBox" runat="server" Style="position: relative"></asp:TextBox>
                                            <cc1:SliderExtender ID="ProjectCompletedSliderExtender" runat="server" BoundControlID="ProjectsCompleted"
                                                Enabled="True" EnableHandleAnimation="True" Maximum="100" Minimum="0" TargetControlID="ProjectsCompletedTargetTextBox"
                                                Length="100">
                                            </cc1:SliderExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px;">
                                            <asp:Label ID="ReputationLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, Reputation %>"
                                                Font-Bold="True" ForeColor="#000040"></asp:Label>
                                            &nbsp;<asp:TextBox ID="ReputationTextBox" runat="server" Style="position: relative"
                                                Width="30px"></asp:TextBox>
                                            <asp:TextBox ID="ReputationTargetTextBox" runat="server" Style="position: relative"></asp:TextBox>
                                            <cc1:SliderExtender ID="ReputationSliderExtender" runat="server" Enabled="True" Maximum="100"
                                                Minimum="0" BoundControlID="ReputationTextBox" EnableHandleAnimation="True" TargetControlID="ReputationTargetTextBox"
                                                Length="100">
                                            </cc1:SliderExtender>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <cc1:RoundedCornersExtender ID="AccomplishementPanelRoundedCornersExtender" runat="server"
                            BorderColor="0, 33, 66" Color="0, 33, 66" Enabled="True" TargetControlID="AccomplishementPanel">
                        </cc1:RoundedCornersExtender>
                    </asp:Panel>
                  
                    <asp:Panel ID="StatusPanel" runat="server" Style="position: relative; top: 60px;
                        background-color: #ffffff; overflow: hidden" Width="119px">
                        <br />
                        <asp:Label ID="StatusLabel" runat="server" Font-Bold="True" BackColor="#5D7B9D" ForeColor="White"
                            Style="position: absolute; top: 0px" Text="<%$ Resources:Resource, Status %>"
                            Width="119px"></asp:Label>
                        <asp:UpdatePanel ID="StatusUpdatePanel" runat="server">
                            <ContentTemplate>
                                <table style="left: 0px; vertical-align: middle; width: 119px; position: relative;
                                    top: 0px; height: 80%; text-align: center">
                                    <tr>
                                        <td style="width: 100px; height: 18px">
                                            <asp:Label ID="StatusMustHaveLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, MustHave %>"
                                                Font-Bold="True" ForeColor="#C00000"></asp:Label>
                                            &nbsp;
                                            <asp:DropDownList ID="StatusMustHaveDropDownList" runat="server" Style="position: relative">
                                                <asp:ListItem Value="0">&lt;</asp:ListItem>
                                                <asp:ListItem Value="1">&gt;</asp:ListItem>
                                                <asp:ListItem Value="2">=</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                            <asp:Label ID="RankLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, Rank %>"
                                                Font-Bold="True" ForeColor="#000040"></asp:Label>&nbsp;<asp:TextBox ID="RankTextBox"
                                                    runat="server" Style="position: relative" Width="30px"></asp:TextBox>&nbsp;<asp:TextBox
                                                        ID="RankTargetTextBox" runat="server" Style="position: relative" Width="10px"></asp:TextBox>
                                            <cc1:SliderExtender ID="RankSliderExtender" runat="server" BoundControlID="RankTextBox"
                                                Enabled="True" EnableHandleAnimation="True" Maximum="100" Minimum="0" TargetControlID="RankTargetTextBox"
                                                Length="100">
                                            </cc1:SliderExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                            <asp:Label ID="PointsLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, Points %>"
                                                Font-Bold="True" ForeColor="#000040"></asp:Label>&nbsp;<asp:TextBox ID="PointsTextBox"
                                                    runat="server" Style="position: relative" Width="30px"></asp:TextBox>&nbsp;<asp:TextBox
                                                        ID="PointsTargetedTextBox" runat="server" Style="position: relative"></asp:TextBox>
                                            <cc1:SliderExtender ID="PointsSliderExtender" runat="server" BoundControlID="PointsTextBox"
                                                Enabled="True" EnableHandleAnimation="True" Maximum="100" Minimum="0" TargetControlID="PointsTargetedTextBox"
                                                Length="100">
                                            </cc1:SliderExtender>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <cc1:RoundedCornersExtender ID="StatusPanelRoundedCornersExtender" runat="server"
                            BorderColor="0, 33, 66" Color="0, 33, 66" Enabled="True" TargetControlID="StatusPanel">
                        </cc1:RoundedCornersExtender>
                    </asp:Panel>
                    <br />
                    <br />
                    <asp:Panel ID="ActionsPanel" runat="server" Style="position: relative; top: 39px;
                        overflow: hidden; text-align: center" Width="119px" BackColor="Transparent">
                        <asp:Button ID="UpdateAllButton" runat="server" Text="<%$ Resources:Resource, Update %>"
                             Style="float: right" OnClientClick="fireanimation();" Width="119px" />
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
                                                                        OnSelectedIndexChanged="IndustryListBox_SelectedIndexChanged" AutoPostBack="true"
                                                                        onclick="fireanimation();"></asp:ListBox>
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
                                                                        DataTextField="CustomProfessionalCustomRegionCount" DataValueField="RegionID"
                                                                        Font-Size="Small" OnSelectedIndexChanged="CityListBox_SelectedIndexChanged" AutoPostBack="true"
                                                                        onclick="fireanimation();"></asp:ListBox>
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
                                                                        DataTextField="CustomProfessionalCustomCountryCount" DataValueField="CountryID"
                                                                        Font-Size="Small" OnSelectedIndexChanged="StateListBox_SelectedIndexChanged"
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
                                        <asp:GridView ID="ProfessionalResultGridView" runat="server" AutoGenerateColumns="False"
                                            DataKeyNames="ProID" AllowPaging="True" CellPadding="4" 
                                            ForeColor="#333333" GridLines="None"
                                            AllowSorting="True" OnSelectedIndexChanged="ProfessionalResultGridView_SelectedIndexChanged"
                                            DataSourceID="ProfessionalResultSqlDataSource" 
                                            EnableModelValidation="True" CssClass="gridHeader" ShowFooter="True" >
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Image ID="ProfessionalImage" runat="server" Height="72px" ImageAlign="Middle"
                                                            ImageUrl='<%# Eval("PhotoPath", "{0}") %>' Style="position: relative" Width="79px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="<%$ Resources:Resource, Information %>" SortExpression="ProID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="UserNameBoundedLabel" runat="server" Font-Bold="True" ForeColor="#400000"
                                                            Style="position: relative" Text='<%# Bind("UserName", "{0}") %>'></asp:Label><br />
                                                        <asp:Label ID="AboutBoundedLabel" runat="server" Height="31px" Style="position: relative;
                                                            top: 0px; left: 0px; width: 250px;" Text='<%# Bind("About", "{0}") %>'></asp:Label><br />
                                                        <asp:HyperLink ID="ViewProfessionalHyperLink" runat="server" NavigateUrl='<%# Eval("ProID", "../Authenticated/ViewProfessionalProfile.aspx?PID={0}") %>'
                                                            Target="_blank" Text="<%$ Resources:Resource, Profile %>" Font-Bold="True" 
                                                           CssClass="UnderlineLink"  Style="position: relative" BackColor="#5D7B9D" ForeColor="White"></asp:HyperLink>
                                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                        <asp:LinkButton ID="SelectFavoriteLinkButton" runat="server" BackColor="Maroon" CausesValidation="False"
                                                            CommandName="select" Font-Bold="True" ForeColor="White" Style="position: absolute"
                                                            OnClick="SelectFavoriteLinkButton_Click" OnClientClick="fireanimation();" Text="<%$ Resources:Resource, Favorite %>"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <HeaderStyle Font-Underline="False" HorizontalAlign="Left" Font-Bold="True" Font-Strikeout="False" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="<%$ Resources:Resource, IndustryLabel %>" SortExpression="CategoryName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="CategoryBoundedLabel" runat="server" Text='<%# Bind("CategoryName") %>'
                                                            CssClass="SmallSize"></asp:Label>
                                                    </ItemTemplate>
                                                    <ControlStyle Width="70px" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="<%$ Resources:Resource, Profession %>" SortExpression="JobTitle">
                                                    <ItemTemplate>
                                                        <asp:Label ID="JobBoundedLabel" runat="server" Text='<%# Bind("JobTitle") %>' CssClass="SmallSize"
                                                            Width="50px"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="<%$ Resources:Resource, LocationLabel %>" SortExpression="CountryName">
                                                    <ItemTemplate>
                                                        <table style="width: 95%; position: relative; height: 100%">
                                                            <tr>
                                                                <td style="width: 50px; text-align: center">
                                                                    <asp:Label ID="CountryBoundedLabel" runat="server" Style="position: relative" Text='<%# Bind("CountryName", "{0}") %>'
                                                                        CssClass="SmallSize"></asp:Label><br />
                                                                    <asp:Image ID="CountryFlag" runat="server" ImageUrl='<%# Eval("CountryFlag") %>'
                                                                        Width="30px" Height="18px" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderImageUrl="../Images/FilledStar.png" SortExpression="intRate"
                                                    HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <cc1:Rating ID="ProfessionalRating" runat="server" CurrentRating='<%# Bind("intRate", "{0}") %>'
                                                            RatingAlign="Horizontal" MaxRating="5" StarCssClass="ratingStar" WaitingStarCssClass="savedRatingStar"
                                                            Direction="LeftToRight" FilledStarCssClass="filledRatingStar" EmptyStarCssClass="emptyRatingStar"
                                                            ReadOnly="True">
                                                        </cc1:Rating>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="InviteToProjectLinkButton" runat="server" CausesValidation="False"
                                                            CommandArgument="select" CommandName="select" Font-Bold="True" ForeColor="White"
                                                            Style="position: relative" Width="95px" Font-Size="10pt" OnClick="InviteToProjectLinkButton_Click"
                                                            OnClientClick="fireanimation();" Text="<%$ Resources:Resource, InvitetoProject %>" CssClass="UnderlineLink"></asp:LinkButton><br />
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <asp:LinkButton ID="AskQuestionLinkButton" runat="server" CausesValidation="False"
                                                            CommandName="select" Font-Bold="True" ForeColor="White" Style="position: relative"
                                                            Width="95px" Font-Size="10pt" OnClick="AskQuestionLinkButton_Click" OnClientClick="fireanimation();"
                                                            Text="<%$ Resources:Resource, FavoriteAskQuestionLinkButton %>"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ControlStyle BackColor="#284775" BorderColor="White" BorderStyle="Solid" BorderWidth="2px" />
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle BackColor="#F7F6F3" Font-Size="10pt" ForeColor="#333333" HorizontalAlign="Left" />
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" Height="20px"  CssClass="pager" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                            <EditRowStyle BackColor="#999999" />
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="20px" />
                                            <EmptyDataRowStyle BackColor="#284775" Height="600px" VerticalAlign="Top" />
                                            <EmptyDataTemplate>
                                                <asp:Label ID="EmptyProfessionalLabel" runat="server" Font-Bold="True" ForeColor="#000066"
                                                    Style="vertical-align: super; position: relative; text-align: center; top: 0px;
                                                    left: 0px;" Text="<%$ Resources:Resource, EmptyProfessional %>" Width="726px"
                                                    Height="20px" BackColor="#F7F6F3"></asp:Label><br />
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
                                    <asp:SqlDataSource ID="ProfessionalResultSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                        SelectCommand="SELECT  ProfessionalSkill.ProID, ProfessionalGeneral.UserName, ProfessionalGeneral.CountryName, (SELECT Path FROM CountriesUpdate WHERE (CountryId = ProfessionalGeneral.CountryID)) AS CountryFlag, ProfessionalGeneral.RegionName, Skills.CategoryID, Skills.CategoryName, Skills.JobID, Skills.JobTitle, ProfessionalAdditionalInformation.Rank, ProfessionalAdditionalInformation.Points, ProfessionalAdditionalInformation.Reputation, ProfessionalAdditionalInformation.ProjectCompleted, ProfessionalAdditionalInformation.MoneyEarned, ProfessionalAdditionalInformation.ProjectCompleted + ProfessionalAdditionalInformation.ProjectCanceled AS TotalProject, SUBSTRING(ProfessionalPortfolio.About, 0, 100) AS About, ProfessionalRating.IntRate, ProfessionalGeneral.PhotoPath FROM Skills INNER JOIN ProfessionalSkill ON Skills.SkillID = ProfessionalSkill.SkillID INNER JOIN ProfessionalGeneral ON ProfessionalSkill.ProID = ProfessionalGeneral.ProID INNER JOIN ProfessionalAdditionalInformation ON ProfessionalGeneral.ProID = ProfessionalAdditionalInformation.ProID INNER JOIN ProfessionalPortfolio ON ProfessionalGeneral.ProID = ProfessionalPortfolio.ProID INNER JOIN ProfessionalRating ON ProfessionalGeneral.ProID = ProfessionalRating.ProID WHERE (ProfessionalPortfolio.Modified = 0)"
                                        InsertCommand="AddProfessionalFavorite" InsertCommandType="StoredProcedure">
                                        <InsertParameters>
                                            <asp:Parameter Name="ProID" Type="Int32" />
                                            <asp:Parameter Name="PosterID" Type="Int32" />
                                            <asp:Parameter Name="Role" Type="String" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                </td>
                <td valign="top">
                    <asp:Panel ID="UserGreetingPanel" runat="server" Style="text-align: center">
                        <asp:LoginView ID="ProfileLoginView" runat="server">
                            <LoggedInTemplate>
                                <asp:Literal ID="WelcomeLiteral" runat="server" Text="<%$ Resources:Resource, Welcome %>"></asp:Literal>
                                <asp:LoginName ID="ProfileLoginName" runat="server" Font-Bold="true" ForeColor="Red"
                                    Style="position: relative" />
                                <br />
                                <asp:LinkButton ID="GoToProfileLinkButton" runat="server" Font-Bold="True" ForeColor="#000066"
                                    OnClick="GoToProfileLinkButton_Click" OnClientClick="fireanimation();" Text="<%$ Resources:Resource, GoToProfile %>"
                                    CssClass="UnderlineLink" ></asp:LinkButton>
                                     <div>
                                         <br />
                                     </div>
                            </LoggedInTemplate>
                            <AnonymousTemplate>
                                <asp:LoginName ID="ProfileLoginName" runat="server" Style="position: relative" />
                            </AnonymousTemplate>
                        </asp:LoginView>
                    </asp:Panel>
                    <asp:Panel ID="BackToSearchPanel" runat="server" CssClass="BlueMenublock" Height="1px"
                        Style="z-index: 106; top: 30px" Width="129px">
                        <ul>
                            <li>
                                <asp:LinkButton ID="BackToSearchLinkButton" runat="server" PostBackUrl="~/NotAuthenticated/FindProfessional.aspx"
                                    CausesValidation="False" Width="96px" Text="<%$ Resources:Resource, BackToSearch %>"></asp:LinkButton></li>
                        </ul>
                        <br />
                        <asp:Panel ID="LocationPanel" runat="server" Style="position: relative; top: 56px;
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
                                BorderColor="0, 33, 66" Color="0, 33, 66" Enabled="True" TargetControlID="LocationPanel">
                            </cc1:RoundedCornersExtender>
                        </asp:Panel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        <asp:Panel ID="ModalProfessionalPanel" runat="server" Height="218px" Style="display: none;
            left: 486px; position: relative; top: 2363px; z-index: 103;" Width="440px" BackColor="Silver"
            BorderColor="MidnightBlue" BorderStyle="Solid" BorderWidth="3px">
            <asp:UpdatePanel ID="ModalProfessionalResultUpdatePanel" runat="server">
                <ContentTemplate>
                    <cc1:ModalPopupExtender ID="ModalProfessionalResult" runat="server" TargetControlID="ModalProfessionalResultTargetedLabel"
                        PopupControlID="ModalProfessionalPanel" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                    <asp:Label ID="ModalProfessionalResultTargetedLabel" runat="server" Style="position: relative"
                        Width="153px"></asp:Label>
                    <asp:Button ID="OkButton" runat="server" CausesValidation="False" Style="position: relative;
                        left: 181px; top: 180px;" Text="<%$ Resources:Resource, OkButton %>" Width="63px" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Label ID="EmptyProjectLabel" runat="server" Style="left: 0px; position: relative"
                Text="<%$ Resources:Resource, ProjectErrorMessageLabel %>" Width="300px" Font-Bold="True"></asp:Label>
            <br />
            <br />
            <asp:Label ID="GlobalValidation" runat="server" Font-Bold="True" ForeColor="#C00000"
                Height="7px" Style="position: relative" Text=" " Width="545px"></asp:Label></asp:Panel>
        <asp:Panel ID="LoadingPanel" runat="server" Height="218px" Style="display: none;
            left: 382px; position: relative; top: 353px; z-index: 105;" Width="440px" BackColor="Transparent"
            BorderColor="MidnightBlue" BorderStyle="Solid" BorderWidth="0px">
            <asp:UpdatePanel ID="ModalLoadingUpdatePanel" runat="server">
                <ContentTemplate>
                    <cc1:ModalPopupExtender ID="LoadingModalPopupExtender" runat="server" TargetControlID="LoadingModalPanelTargetedLabel"
                        PopupControlID="LoadingPanel" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                    <asp:Label ID="LoadingModalPanelTargetedLabel" runat="server" Font-Bold="True" ForeColor="Black"
                        Style="left: 197px; position: absolute; top: 35%" Text="<%$ Resources:Resource, Loading %>"></asp:Label>
                    <img src="../_assets/img/uploading.gif" alt="loadingimage" style="left: 134px; position: absolute;
                        top: 45%" />
                    &nbsp;
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <asp:Panel ID="InvitationPanel" runat="server" Height="440px" Style="display: none;
            left: 151px; position: relative; top: 317px; z-index: 103;" Width="521px" BackColor="White"
            BorderStyle="Double" BorderColor="#5E7C95" BorderWidth="3px">
            <asp:UpdatePanel ID="InvitationUpdatePanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Button ID="CloseButton" runat="server" CausesValidation="False" Text="X" Font-Bold="true"
                        Style="left: 488px; position: relative; top: 2px" OnClientClick="fireanimation4();" />
                    <cc1:ModalPopupExtender ID="InvitationModalPopupExtender" runat="server" TargetControlID="InvitationModalTargetedLabel"
                        PopupControlID="InvitationPanel" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                    <cc1:RoundedCornersExtender ID="InvitationRoundedCornersExtender" runat="server"
                        BorderColor="Gray" Color="Gray" Enabled="True" TargetControlID="InvitationGridView"
                        Radius="8">
                    </cc1:RoundedCornersExtender>
                    &nbsp;
                    <asp:Label ID="InvitationModalTargetedLabel" runat="server" Style="position: relative"></asp:Label><br />
                    <asp:GridView ID="InvitationGridView" runat="server" AutoGenerateColumns="False"
                        Style="position: relative; text-align: center; top: 0px; left: 0px;" BackColor="White"
                        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
                        GridLines="None" HorizontalAlign="Center" AllowPaging="True" PageSize="5" DataKeyNames="ProjectID"
                        OnSelectedIndexChanged="InvitationGridView_SelectedIndexChanged" OnPageIndexChanging="InvitationGridView_PageIndexChanging"
                        Height="80%" Width="80%" Font-Size="Small" AllowSorting="True" CssClass="gridHeader">
                        <Columns>
                            <asp:BoundField DataField="ProjectID" HeaderText="<%$ Resources:Resource, ProjectIDLabel %>"
                                ReadOnly="True" SortExpression="ProjectID" />
                            <asp:BoundField DataField="HighestBid" HeaderText="<%$ Resources:Resource, HighestBidLabel %>"
                                SortExpression="HighestBid" />
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, TimeLeftLabel %>" SortExpression="TimeLeft">
                                <ItemTemplate>
                                    <asp:Label ID="BindedTimeLeft" runat="server" Text='<%# Bind("TimeLeft") %>' Width="84px"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Status" HeaderText="<%$ Resources:Resource, Status %>"
                                SortExpression="Status" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    &nbsp;
                                    <asp:LinkButton ID="InviteLinkButton" runat="server" BackColor="White" CausesValidation="False"
                                        CommandName="select" Font-Bold="True" ForeColor="#400000" Style="position: relative"
                                        Width="43px" OnClientClick="fireanimation3();" OnClick="InviteToProject" Text="<%$ Resources:Resource, Invite %>" CssClass="UnderlineLink"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle BackColor="#F7F7DE" HorizontalAlign="Center" />
                        <FooterStyle BackColor="#CCCC99" />
                        <PagerStyle BackColor="#663300" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"
                            Font-Bold="True" />
                        <EmptyDataTemplate>
                            <asp:Label ID="ModalProfessionalResultTargetedLabel" runat="server" Style="text-align: center"
                                Text="<%$ Resources:Resource, NoOpenProject %>" Width="95%"></asp:Label>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#999966" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="InvitationGridView" EventName="PageIndexChanging" />
                </Triggers>
            </asp:UpdatePanel>
        </asp:Panel>
        <asp:Panel ID="AdPanel2" runat="server" Height="90px" Style="text-align: center;
            ">
            <img src="../Images/ads2.jpg" alt="ads" />
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
                        BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" DestinationPageUrl="~/NotAuthenticated/ProfessionalResult.aspx"
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
                                                        ForeColor="#284775" Text="<%$ Resources:Resource, Cancel %>" OnClick="CancelLoginButton_Click" />
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
        <asp:Panel ID="MessagePanel" runat="server" Height="420px" Style="display: none;
            left: 100px; position: relative; z-index: 103" Width="700px" BackColor="white"
            BorderStyle="Double" BorderColor="Gray" BorderWidth="3px">
            <asp:UpdatePanel ID="MessageUpdatePanel" runat="server">
                <ContentTemplate>
                    <cc1:ModalPopupExtender ID="MessageModalPopupExtender" runat="server" TargetControlID="MessageModalTargetedLabel"
                        PopupControlID="MessagePanel" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                    <asp:Label ID="MessageModalTargetedLabel" runat="server" Style="position: relative"></asp:Label>
                    <CustomTextBox:CustomEditor ID="MessageCustomEditor" runat="server" Width="700px"
                        Height="400px" />
                    <asp:LinkButton ID="AskQuestionLinkButton" runat="server" CausesValidation="False"
                        Font-Bold="True" ForeColor="Black" Style="left: 80%; position: relative; top: 0px"
                        OnClientClick="fireanimation2();" Text="<%$ Resources:Resource, Submit %>" CssClass="UnderlineLink"></asp:LinkButton>
                    <asp:LinkButton ID="GoToProfileLinkButton2" runat="server" CausesValidation="False"
                        Font-Bold="True" ForeColor="Black" Style="left: 85%; position: relative; top: 0px"
                        OnClientClick="fireanimation2();" OnClick="GoToProfileLinkButton2_Click" Text="<%$ Resources:Resource, Cancel %>" CssClass="UnderlineLink"></asp:LinkButton>
                    <br />
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
