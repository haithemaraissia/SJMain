<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewCustomerProfile.aspx.vb"
    Inherits="UserProfile" Culture="auto:en-US" UICulture="auto" %>

<%--<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
--%><%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
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
            $find('DelayModalPopupExtender').show();
        }

        function refresh() {
            window.location.reload();
        }

        function fireanimation2() {
            $find('MoreProjectModalPopupExtender').hide();
        }

        function SwitchTab(number) {
            if (number == 1) {
                $find('ProfileModalPopupExtender').show();
                document.body.style.overflow = 'visible';
            }
        }

        function fireanimation7() {
            $find('MoreProjectModalPopupExtender').hide();
            $find('DelayModalPopupExtender').hide();
            window.open(document.getElementById('MoreProjectHiddenFieldButton').value);
        }
    </script>
    <script type="text/javascript" src="../scripts/jquery-1.5.2.js"></script>
    <script type="text/javascript">
        $(function ($) {
            $(document).ready(function () {

                //Summary
                function SummaryClick() {
                    $('#ProfileTabContainer_body').css("height", "541px");
                }
                $('#__tab_ProfileTabContainer_EventTabPanel').bind('click', SummaryClick);

                //Profile
                function ProfileClick() {
                    $('#ProfileTabContainer_body').css("height", "541px");
                }
                $('#__tab_ProfileTabContainer_ProfileTabPanel').bind('click', ProfileClick);


                //Portfolio
                function PortfolioClick() {
                    $('#ProfileTabContainer_body').css("height", "571px");

                }
                $('#__tab_ProfileTabContainer_PortfolioTabPanel').bind('click', PortfolioClick);

                //Project
                function ProjectClick() {
                    $('#ProfileTabContainer_body').css("height", "541px");

                }
                $('#__tab_ProfileTabContainer_ProjectTabPanel').bind('click', ProjectClick);


                //Favorite
                function FavoriteClick() {
                    $('#ProfileTabContainer_body').css("height", "578px");
                }
                $('#__tab_ProfileTabContainer_FavoriteTabPanel').bind('click', FavoriteClick);


                //Comment
                function CommentClick() {
                    $('#ProfileTabContainer_body').css("height", "1260px");
                }
                $('#__tab_ProfileTabContainer_CommentTabPanel').bind('click', CommentClick);

                //Add to Favorite Button
                $("#AddtoCustomerListButton").hover(function () {
                    $(this).css("background", "#0099CC");
                    $(this).css("cursor", "pointer");
                }, function () {
                    $(this).css("background", "#003366");
                });
            });
        })(jQuery);
    </script>
    <link href="../Authenticated/themes/opera/tabs2.css" rel="stylesheet" type="text/css" />
    <link href="../Authenticated/themes/BlueMenublockStyleSheet.css" rel="stylesheet"
        type="text/css" />
    <link href="../Authenticated/themes/GreenMenublockStyleSheet.css" rel="stylesheet"
        type="text/css" />
    <link type="text/css" href="../Authenticated/themes/detailgrid.css" rel="stylesheet" />
    <style type="text/css">
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.9;
        }
        
    </style>
</head>
<body>
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
    <form id="form1" runat="server">
                <div id="wrapper" style="padding: 25px">
    <table align="center"  id="TemplateGlobalTable">
        <tr>
            <td style="width: 160px">
            </td>
            <td>
                <div style="overflow: visible">
                    <%--      <asp:AjaxScriptManager ID="AjaxScriptManager1" runat="server">
        </asp:AjaxScriptManager>--%>
                    <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
                    </cc1:ToolkitScriptManager>
                    <div style="z-index: 110;">
                        <cc1:TabContainer ID="ProfileTabContainer" runat="server" ActiveTabIndex="1" Height="541px"
                            Width="765px" EnableTheming="True" BorderWidth="0px" CssClass="opera" BackColor="White"
                            Style="vertical-align: top" Font-Size="Small" ForeColor="#003366">
                            <cc1:TabPanel ID="EventTabPanel" runat="server" HeaderText="<%$ Resources:Resource, EventTabPanel %>">
                                <ContentTemplate>
                                    <table style="width: 100%; height: 98%; position: relative;">
                                        <tr>
                                            <td style="width: 50%; vertical-align: top;">
                                                <asp:Label ID="StatusIDLabel" runat="server" Style="position: relative; left: 0px;
                                                    top: 10px" Text="<%$ Resources:Resource, Status %>" Font-Bold="True" ForeColor="#400000"
                                                    Height="23px" Font-Size="Medium" Font-Names="Times New Roman"></asp:Label>
                                                <br />
                                                <asp:DataList ID="StatusDataList" runat="server" DataKeyField="CustomerID" DataSourceID="StatisticObjectDataSource"
                                                    Style="position: relative; left: 0px;">
                                                    <ItemTemplate>
                                                        <asp:Panel ID="StatusPanel" runat="server" Height="490px" Style="left: 0px; position: relative;
                                                            top: 10px" Width="375px">
                                                            <table style="left: 0px; width: 100%; position: relative; top: 0px; height: 100%;
                                                                vertical-align: middle; text-align: center;">
                                                                <tr>
                                                                    <td style="width: 100px; height: 16%">
                                                                        <asp:Label ID="MemberIDLabel" runat="server" Font-Size="Medium" Style="position: relative"
                                                                            Text="<%$ Resources:Resource, EventMemberID %>" Font-Names="Times New Roman"
                                                                            Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 100px; height: 16%">
                                                                        <asp:Label ID="DateCreatedLabel" runat="server" Style="position: relative" Text='<%# Eval("DateCreated", "{0:d}") %>'
                                                                            Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100px; height: 16%">
                                                                        <asp:Label ID="ProfileViewLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, EventProfileView %>"
                                                                            Font-Names="Times New Roman" Font-Size="Medium" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 100px; height: 16%">
                                                                        <asp:Label ID="PeopleVisitedLabel" runat="server" Style="position: relative" Text='<%# Eval("PeopleVisited", "{0}") %>'
                                                                            Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100px; height: 16%">
                                                                        <asp:Label ID="InvitationSentIDLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, EventInvitationSent %>"
                                                                            Font-Names="Times New Roman" Font-Size="Medium" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 100px; height: 16%">
                                                                        <asp:Label ID="InvitationSentLabel" runat="server" Style="position: relative" Text='<%# Eval("InvitationSent", "{0}") %>'
                                                                            Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100px; height: 16%">
                                                                        <asp:Label ID="PointsIDLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, EventPoints %>"
                                                                            Font-Size="Medium" Font-Names="Times New Roman" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 100px">
                                                                        <asp:Label ID="PointsLabel" runat="server" Style="position: relative" Text='<%# Eval("Points", "{0}") %>'
                                                                            Font-Size="Medium" Font-Names="Times New Roman"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100px; height: 16%">
                                                                        <asp:Label ID="ProjectPostedIDLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, EventProjectPosted %>"
                                                                            Font-Size="Medium" Font-Names="Times New Roman" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 100px; height: 16%">
                                                                        <asp:Label ID="ProjectPostedLabel" runat="server" Style="position: relative" Text='<%# Eval("ProjectPosted", "{0}") %>'
                                                                            Font-Size="Medium" Font-Names="Times New Roman"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                        <cc1:RoundedCornersExtender ID="StatusRoundedCornersExtender" runat="server" BorderColor="64, 0, 0"
                                                            Color="64, 0, 0" TargetControlID="StatusPanel">
                                                        </cc1:RoundedCornersExtender>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                <asp:ObjectDataSource ID="StatisticObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetStatistic" TypeName="StatisticsDataSetTableAdapters.CustomerAdditionalInformationTableAdapter">
                                                    <SelectParameters>
                                                        <asp:QueryStringParameter Name="CustomerID" QueryStringField="CID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                            <td style="vertical-align: top; width: 104px">
                                                <asp:Label ID="PerformanceIDLabel" runat="server" Style="position: relative; top: 10px;
                                                    left: 5px;" Text="<%$ Resources:Resource, EventPerformance %>" Font-Names="Times New Roman"
                                                    Font-Bold="True" ForeColor="#003300" Height="23px" Font-Size="Medium"></asp:Label>
                                                <asp:Panel ID="PerformancePanel" runat="server" Height="490px" Style="left: 2px;
                                                    overflow: hidden; position: relative; top: 10px" Width="355px">
                                                    <table style="left: 4px; width: 100%; position: relative; top: 0px; height: 350px;
                                                        vertical-align: middle; text-align: center;">
                                                        <tr>
                                                            <td>
                                                                <asp:Chart ID="PerformanceChart" runat="server" Palette="None" Width="280px" Height="280px"
                                                                    PaletteCustomColors="DarkGreen; DarkRed; DarkGray" DataSourceID="PerformanceDatatSource"
                                                                    IsSoftShadows="False">
                                                                    <Titles>
                                                                        <asp:Title DockedToChartArea="ChartArea1" Font="Microsoft Sans Serif, 20pt, style=Bold"
                                                                            ForeColor="Snow" Name="PercentageTitle" ShadowColor="Black" Text="100%" TextStyle="Emboss">
                                                                            <Position Height="90" Width="90" X="8" Y="3" Auto="False" />
                                                                        </asp:Title>
                                                                    </Titles>
                                                                    <Series>
                                                                        <asp:Series ChartType="Pie" Name="Series1" ChartArea="ChartArea1">
                                                                            <Points>
                                                                                <asp:DataPoint XValue="100" YValues="100" />
                                                                                <asp:DataPoint YValues="0" />
                                                                                <asp:DataPoint YValues="0" />
                                                                            </Points>
                                                                        </asp:Series>
                                                                    </Series>
                                                                    <ChartAreas>
                                                                        <asp:ChartArea BackColor="White" Name="ChartArea1">
                                                                            <Area3DStyle Enable3D="True" Inclination="25" />
                                                                        </asp:ChartArea>
                                                                    </ChartAreas>
                                                                </asp:Chart>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="CustomerRecommendationIDLabel" runat="server" Text="<%$ Resources:Resource, EventProfessionalRecommendation %>"
                                                                    Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="#003300"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <cc1:RoundedCornersExtender ID="PerformanceRoundedCornersExtender" runat="server"
                                                    BorderColor="0, 51, 0" Color="0, 51, 0" TargetControlID="PerformancePanel" Enabled="True">
                                                </cc1:RoundedCornersExtender>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="ProfileTabPanel" runat="server" HeaderText="<%$ Resources:Resource, ProfileTabPanel %>">
                                <ContentTemplate>
                                     <table style="z-index: 101; width: 100%; position: static; height: 79%; top: 30px;"
                                            id="ProfileTable">
                                        <tr>
                                            <td style="width: 160px; background-color: #ffffff; height: 452px;">
                                                <asp:FormView ID="ProfileFormView" runat="server" DataKeyNames="PhotoID" DataSourceID="CustomerPhotoObjectDataSource"
                                                    Style="position: relative; top: 0px; left: 15px;" 
                                                    EnableModelValidation="True">
                                                                     <ItemTemplate>
                                                        <asp:ImageButton ID="CustomerImageButton" runat="server" Height="318px" Style="z-index: 100;
                                                            left: 20px; position: relative; top: 0px" Width="253px" CommandName="select"
                                                            ImageUrl='~/Images/EmployeeImages/electrician.jpg' /></ItemTemplate>
                                                </asp:FormView>
                                                <asp:ObjectDataSource ID="CustomerPhotoObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetCustomerPhoto" TypeName="CustomerPhotoDataSetTableAdapters.SelectCustomerPhotoTableAdapter">
                                                    <SelectParameters>
                                                        <asp:QueryStringParameter Name="CustomerID" QueryStringField="CID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                                <asp:Panel ID="ProfileSideShowPanel" runat="server" CssClass="BlueMenublock" Height="64px"
                                                    Style="z-index: 101; left: 78px; position: relative; top: 18px" Width="131px"
                                                    Font-Size="10pt">
                                                    <ul>
                                                        <li>
                                                            <asp:HyperLink ID="SlideShowHyperlink" runat="server" onclick="SwitchTab(1)" NavigateUrl="#"
                                                                Style="font: smallcaption" Text="<%$ Resources:Resource, SlideShow %>"></asp:HyperLink></li></ul>
                                                </asp:Panel>
                                            </td>
                                            <td style="width: 100px; height: 472px; z-index: 100; display: block" id="Td2">
                                                <asp:UpdatePanel ID="ProfileUpdatePanel" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Panel ID="ProfileDetailPanel" runat="server" Style=" position: relative;
                                                            top: 30px;  left:170px; width: 270px; z-index: 100">
                                                            <asp:DetailsView ID="ProfileDetailView" runat="server" AutoGenerateRows="False" DataKeyNames="CustomerID"
                                                                DataSourceID="CustomerProfileObjectDataSource" Height="356px" Style="position: relative;
                                                                width: 270px" CellPadding="4" GridLines="None" Font-Size="9pt" ForeColor="#333333">
                                                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                                                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                <Fields>
                                                                    <asp:BoundField DataField="CustomerID" HeaderText="<%$ Resources:Resource, ID %>"
                                                                        ReadOnly="True" SortExpression="CustomerID" />
                                                                    <asp:BoundField DataField="UserName" HeaderText="<%$ Resources:Resource, UserName %>"
                                                                        SortExpression="UserName" />
                                                                    <asp:BoundField DataField="Age" HeaderText="<%$ Resources:Resource, Age %>" SortExpression="Age" />
                                                                    <asp:TemplateField SortExpression="Gender" HeaderText="<%$ Resources:Resource, Gender %>">
                                                                        <ItemTemplate>
                                                                            <asp:DropDownList ID="GenderDropDownList" runat="server" Font-Size="Small" Enabled="False"
                                                                                SelectedValue='<%# Bind("Gender", "{0}") %>' EnableTheming="True" Width="40px"
                                                                                Height="20" Font-Names="Times New Roman" ForeColor="#003366">
                                                                                <asp:ListItem Value="1" Selected="True">M</asp:ListItem>
                                                                                <asp:ListItem Value="2">F</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="CountryName" HeaderText="<%$ Resources:Resource, CountryName %>"
                                                                        SortExpression="CountryName" />
                                                                    <asp:BoundField DataField="RegionName" HeaderText="<%$ Resources:Resource, RegionName %>"
                                                                        SortExpression="RegionName" />
                                                                </Fields>
                                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <EditRowStyle BackColor="#999999" Font-Size="8pt" />
                                                                <FieldHeaderStyle BackColor="#E9ECF1" Width="50%" Font-Bold="True" />
                                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                            </asp:DetailsView>
                                                            <asp:ObjectDataSource ID="CustomerProfileObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetCustomerProfile" TypeName="CustomerProfileDataSetTableAdapters.CustomerGeneralTableAdapter">
                                                                <SelectParameters>
                                                                    <asp:QueryStringParameter Name="CustomerID" QueryStringField="CID" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                        </asp:Panel>
                                                        <cc1:RoundedCornersExtender ID="ProfileDetailsView_RoundedCornersExtender" runat="server"
                                                            BorderColor="0, 51, 102" Color="0, 51, 102" Enabled="True" TargetControlID="ProfileDetailPanel">
                                                        </cc1:RoundedCornersExtender>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                &nbsp;<br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="PortfolioTabPanel" runat="server" HeaderText="<%$ Resources:Resource, PortfolioTabPanel %>">
                                <ContentTemplate>
                                    <asp:DataList ID="PortfolioDataList" runat="server" DataKeyField="CustomerID" DataSourceID="CustomerPortfolioObjectDataSource"
                                            Style="position: relative; top: 12px; left: 0px; height: 557px; width: 634px;">
                                            <ItemTemplate>
                                                <asp:Label ID="AboutMeLabel" runat="server" Font-Bold="True" ForeColor="White" Style="position: absolute;
                                                    top: 32px; left: 10px; z-index: 1;" Text="<%$ Resources:Resource, About %>" BorderColor="#336699"
                                                    BorderStyle="Outset" BorderWidth="3px" Font-Size="Small" BackColor="#003366">
                                                </asp:Label>
                                                <asp:Panel ID="AboutPanel" runat="server" Height="157px" Style="left: 80px; position: absolute;
                                                    top: 55px" Width="535px" Wrap="False">
                                                    <asp:TextBox ID="AboutTextBox" runat="server" Height="146px" Style="position: relative;
                                                        top: 2px; left: 4px;" TextMode="MultiLine" ReadOnly="true" Width="520px" MaxLength="1000"
                                                        Text='<%# Eval("About", "{0}") %>'></asp:TextBox>
                                                </asp:Panel>
                                                <asp:Label ID="SpecialNotesLabel" runat="server" Font-Bold="True" ForeColor="White"
                                                    Style="position: absolute; top: 292px; z-index: 1; left: 8px;" Text="<%$ Resources:Resource, PortfolioSpecialNotes %>"
                                                    BorderColor="#999999" BorderStyle="Outset" BorderWidth="3px" Font-Size="Small"
                                                    BackColor="#003300"></asp:Label>
                                                <cc1:FilteredTextBoxExtender ID="AboutTextBoxFilteredExtender" runat="server" InvalidChars="+-*/=)(*&amp;^%$#@!~`\|\]}[{&quot;':;?/&lt;&gt;"
                                                    TargetControlID="AboutTextBox" FilterMode="InvalidChars">
                                                </cc1:FilteredTextBoxExtender>
                                                <cc1:RoundedCornersExtender ID="AboutRoundedCornersExtender" runat="server" BorderColor="#003366"
                                                    Radius="12" TargetControlID="AboutPanel" Color="#003366" Enabled="True">
                                                </cc1:RoundedCornersExtender>
                                                <asp:Panel ID="SpecialNotesPanel" runat="server" Style="left: 80px; top: 344px; position: absolute;
                                                    z-index: 1; height: 205px; width: 533px;" Width="533px">
                                                    <asp:TextBox ID="SpecialNotesTextBox" runat="server" Height="182px" Style="position: absolute;
                                                        width: 520px; height: 192px; left: 4px; top: 3px;" TextMode="MultiLine" ReadOnly="true"
                                                        MaxLength="1000" Text='<%# Eval("SpecialNotes", "{0}") %>'></asp:TextBox>
                                                </asp:Panel>
                                                <cc1:FilteredTextBoxExtender ID="SpecialNotesTextBoxFilteredExtender" runat="server"
                                                    InvalidChars="+-*/=)(*&amp;^%$#@!~`\|\]}[{&quot;':;?/&lt;&gt;" TargetControlID="SpecialNotesTextBox"
                                                    FilterMode="InvalidChars">
                                                </cc1:FilteredTextBoxExtender>
                                                <cc1:RoundedCornersExtender ID="SpecialNotesRoundedCornersExtender" runat="server"
                                                    BorderColor="#003300" Radius="13" TargetControlID="SpecialNotesPanel" Color="#003300"
                                                    Enabled="True">
                                                </cc1:RoundedCornersExtender>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    <asp:ObjectDataSource ID="CustomerPortfolioObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetCustomerPortfolio" TypeName="CustomerPortfolioDataSetTableAdapters.CustomerPortfolioTableAdapter">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="CustomerID" QueryStringField="CID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <asp:Label ID="UnderReviewLabel" runat="server" Text="<%$ Resources:Resource, UnderReviewLabel %>"
                                        Width="100%" Font-Size="Small" Visible="false" Font-Bold="True" BackColor="#003366"
                                        ForeColor="White" Style="text-align: center"></asp:Label>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="ProjectTabPanel" runat="server" HeaderText="<%$ Resources:Resource, ProjectTabPanel %>">
                                <ContentTemplate>
                                    <asp:Panel ID="GeneralProjectPanel" runat="server" BackColor="White" Height="100%"
                                        Style="left: 0px; position: relative; top: 1px; height: 236px; overflow: hidden"
                                        Width="100%">
                                        <asp:UpdatePanel ID="GeneralProjectUpdatePanel" runat="server">
                                            <ContentTemplate>
                                                <asp:GridView ID="GeneralProjectGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                    CellPadding="4" DataKeyNames="ProjectID" DataSourceID="CustomerProjectCompletedObjectDataSource"
                                                    ForeColor="#333333" GridLines="None" Height="10%" Style="position: relative;
                                                    top: 0px; left: 0px;" Width="100%" PageSize="7" AllowSorting="true" CssClass="gridHeader" PagerStyle-CssClass="pager">
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle"
                                                        Font-Size="Small" />
                                                    <Columns>
                                                        <asp:BoundField DataField="ProjectID" HeaderText="<%$ Resources:Resource, ProjectIDLabel %>"
                                                            ReadOnly="True" SortExpression="ProjectID" />
                                                        <asp:BoundField DataField="ProjectTitle" HeaderText="<%$ Resources:Resource, ProjectTitle %>"
                                                            SortExpression="ProjectTitle" />
                                                        <asp:BoundField DataField="StartDate" HeaderText="<%$ Resources:Resource, StartDate %>"
                                                            SortExpression="StartDate" />
                                                        <asp:BoundField DataField="EndDate" HeaderText="<%$ Resources:Resource, EndDate %>"
                                                            SortExpression="EndDate" />
                                                        <asp:BoundField DataField="AmountOffered" HeaderText="<%$ Resources:Resource, AmountOffered %>"
                                                            SortExpression="AmountOffered" />
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="ViewProjectLinkButton" runat="server" CausesValidation="False"
                                                                    CommandName="select" Font-Bold="True" ForeColor="#000040" Style="position: relative"
                                                                    Text="<%$ Resources:Resource, ViewProjectLinkButton %>" CssClass="UnderlineLink"></asp:LinkButton></ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="Maroon" ForeColor="White" HorizontalAlign="Center" Font-Bold="True"
                                                        Font-Size="Small" />
                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <HeaderStyle BackColor="Maroon" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                                                    <EditRowStyle BackColor="#999999" />
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <EmptyDataTemplate>
                                                        <asp:Label ID="EmptyProjectLabel" runat="server" Style="position: relative; top: 0px;
                                                            left: 0px; height: 18px; text-align: center" Text="<%$ Resources:Resource, EmptyProject %>"
                                                            ForeColor="White" Width="100%" Font-Size="Small" Font-Bold="True"></asp:Label></EmptyDataTemplate>
                                                    <EmptyDataRowStyle BackColor="Maroon" BorderStyle="None" />
                                                </asp:GridView>
                                                <asp:ObjectDataSource ID="CustomerProjectCompletedObjectDataSource" runat="server"
                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomerProjectCompleted"
                                                    TypeName="CustomerProjectCompletedDataSetTableAdapters.ProjectRequirementsTableAdapter">
                                                    <SelectParameters>
                                                        <asp:QueryStringParameter Name="CustomerID" QueryStringField="PID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <cc1:RoundedCornersExtender ID="GeneralProjectPanelRoundedCornersExtender" runat="server"
                                            BorderColor="64, 0, 0" Color="64, 0, 0" Radius="8" TargetControlID="GeneralProjectPanel"
                                            Enabled="True">
                                        </cc1:RoundedCornersExtender>
                                    </asp:Panel>
                                    <asp:Panel ID="DetailProjectPanel" runat="server" BackColor="White" Height="100%"
                                        Style="left: -3px; position: relative; top: 25px; height: 236px; overflow: hidden"
                                        Width="100%">
                                        <table style="width: 98%; position: relative; height: 66%; left: 2px; top: 0px;">
                                            <tr>
                                                <td style="width: 29%; height: 91%; vertical-align: middle; background-color: white;"
                                                    rowspan="1">
                                                    <asp:Panel ID="DetailProjectSpecificationPanel" runat="server" Height="185px" Width="248px"
                                                        Style="z-index: 1; left: 3px; top: 24px; position: absolute; height: 188px; width: 248px">
                                                        <asp:UpdatePanel ID="DetailProjectSpecificatioUpdatePanel" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:FormView ID="DetailProjectSpecificatioFormView" runat="server" DataKeyNames="PhotoID"
                                                                    DataSourceID="ProjectDetailObjectDataSource" Style="height: 181px; left: 0px;
                                                                    top: 10px; position: absolute; width: 245px;" Font-Size="Small">
                                                                    <ItemTemplate>
                                                                        <div style="background-color: SlateGray; margin-left: 4px; margin-right: 2px; height: 1px;
                                                                            font-size: 1px; overflow: hidden; border-left: 4px solid SlateGray; border-right: 4px solid SlateGray;">
                                                                        </div>
                                                                        <div style="background-color: SlateGray; margin-left: 3px; margin-right: 1px; height: 1px;
                                                                            font-size: 1px; overflow: hidden; border-left: 1px solid SlateGray; border-right: 1px solid SlateGray;">
                                                                        </div>
                                                                        <div style="background-color: SlateGray; margin-left: 2px; margin-right: 0px; height: 1px;
                                                                            font-size: 1px; overflow: hidden; border-left: 1px solid SlateGray; border-right: 1px solid SlateGray;">
                                                                        </div>
                                                                        <div style="background-color: SlateGray; margin-left: 1px; margin-right: -1px; height: 1px;
                                                                            font-size: 1px; overflow: hidden; border-left: 1px solid SlateGray; border-right: 1px solid SlateGray;">
                                                                        </div>
                                                                        <div style="background-color: SlateGray; margin-left: 1px; margin-right: -1px; height: 1px;
                                                                            font-size: 1px; overflow: hidden; border-left: 1px solid SlateGray; border-right: 1px solid SlateGray;">
                                                                        </div>
                                                                        <div style="background-color: SlateGray; margin-left: 0px; margin-right: -2px; height: 1px;
                                                                            font-size: 1px; overflow: hidden; border-left: 1px solid SlateGray; border-right: 1px solid SlateGray;">
                                                                        </div>
                                                                        <div style="background-color: SlateGray; margin-left: 0px; margin-right: -2px; height: 1px;
                                                                            font-size: 1px; overflow: hidden; border-left: 1px solid SlateGray; border-right: 1px solid SlateGray;">
                                                                        </div>
                                                                        <table cellspacing="0" border="0" style="border-collapse: collapse; width: 100%;
                                                                            overflow: auto; border-style: none solid; border-left: 1px solid SlateGray; border-right: 1px solid SlateGray;">
                                                                            <tr>
                                                                                <td style="width: 100px">
                                                                                    <asp:Label ID="CategoryLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, CategoryLabel %>"
                                                                                        Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                                </td>
                                                                                <td style="width: 100px; text-align: center;">
                                                                                    <asp:Label ID="CategoryIDLabel" runat="server" Style="position: relative" Text='<%# Bind("CategoryName") %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px">
                                                                                    <asp:Label ID="JobTitleLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, JobTitleLabel %>"
                                                                                        Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                                </td>
                                                                                <td style="width: 100px; text-align: center;">
                                                                                    <asp:Label ID="JobTitleIDLabel" runat="server" Style="position: relative" Text='<%# Bind("JobTitle") %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px">
                                                                                    <asp:Label ID="ExperienceLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, ExperienceLabel %>"
                                                                                        Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                                </td>
                                                                                <td style="width: 100px; text-align: center;">
                                                                                    <asp:Label ID="ExperienceIDLabel" runat="server" Style="position: relative" Text='<%# Bind("Experience") %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px">
                                                                                    <asp:Label ID="CrewNumberLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, NumberofCrewsLabel %>"
                                                                                        Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                                </td>
                                                                                <td style="width: 100px; text-align: center;">
                                                                                    <asp:Label ID="CrewNumberIDLabel" runat="server" Style="position: relative" Text='<%# Bind("CrewNumber") %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px">
                                                                                    <asp:Label ID="LicensedLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, LicensedLabel %>"
                                                                                        Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                                </td>
                                                                                <td style="width: 100px; text-align: center;">
                                                                                    <asp:Label ID="LicensedIDLabel" runat="server" Style="position: relative" Text='<%# Bind("Licensed") %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px">
                                                                                    <asp:Label ID="InsuredLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, InsuredLabel %>"
                                                                                        Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                                </td>
                                                                                <td style="width: 100px; text-align: center;">
                                                                                    <asp:Label ID="InsuredIDLabel" runat="server" Style="position: relative" Text='<%# Bind("Insured") %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px">
                                                                                    <asp:Label ID="RelocationLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, RelocationLabel %>"
                                                                                        Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                                </td>
                                                                                <td style="width: 100px; text-align: center;">
                                                                                    <asp:Label ID="RelocationIDLabel" runat="server" Style="position: relative" Text='<%# Bind("Relocation") %>'></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <div style="background-color: SlateGray; margin-left: 0px; margin-right: -2px; height: 1px;
                                                                            font-size: 1px; overflow: hidden; border-left: 1px solid SlateGray; border-right: 1px solid SlateGray;">
                                                                        </div>
                                                                        <div style="background-color: SlateGray; margin-left: 0px; margin-right: -2px; height: 1px;
                                                                            font-size: 1px; overflow: hidden; border-left: 1px solid SlateGray; border-right: 1px solid SlateGray;">
                                                                        </div>
                                                                        <div style="background-color: SlateGray; margin-left: 1px; margin-right: -1px; height: 1px;
                                                                            font-size: 1px; overflow: hidden; border-left: 1px solid SlateGray; border-right: 1px solid SlateGray;">
                                                                        </div>
                                                                        <div style="background-color: SlateGray; margin-left: 1px; margin-right: -1px; height: 1px;
                                                                            font-size: 1px; overflow: hidden; border-left: 1px solid SlateGray; border-right: 1px solid SlateGray;">
                                                                        </div>
                                                                        <div style="background-color: SlateGray; margin-left: 2px; margin-right: 0px; height: 1px;
                                                                            font-size: 1px; overflow: hidden; border-left: 1px solid SlateGray; border-right: 1px solid SlateGray;">
                                                                        </div>
                                                                        <div style="background-color: SlateGray; margin-left: 3px; margin-right: 1px; height: 1px;
                                                                            font-size: 1px; overflow: hidden; border-left: 1px solid SlateGray; border-right: 1px solid SlateGray;">
                                                                        </div>
                                                                        <div style="background-color: SlateGray; margin-left: 4px; margin-right: 2px; height: 1px;
                                                                            font-size: 1px; overflow: hidden; border-left: 4px solid SlateGray; border-right: 4px solid SlateGray;">
                                                                        </div>
                                                                        <div style="background-color: SlateGray; margin-left: 8px; margin-right: 6px; height: 1px;
                                                                            font-size: 1px; overflow: hidden; border-left: 1px solid SlateGray; border-right: 1px solid SlateGray;">
                                                                        </div>
                                                                        <br />
                                                                    </ItemTemplate>
                                                                    <EmptyDataRowStyle BackColor="SlateGray" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                    <EmptyDataTemplate>
                                                                        <asp:Label ID="ProjectSelectionLabel" runat="server" Font-Bold="True" ForeColor="White"
                                                                            Height="26px" Style="position: relative" Text="<%$ Resources:Resource, ProjectSelectionLabel %>"
                                                                            Width="245px"></asp:Label>
                                                                    </EmptyDataTemplate>
                                                                </asp:FormView>
                                                                <asp:ObjectDataSource ID="ProjectDetailObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                    SelectMethod="GetDetailProject" TypeName="CustomerProjectCompletedDataSetTableAdapters.DetailProjectTableAdapter">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="GeneralProjectGridView" Name="ProjectID" PropertyName="SelectedValue"
                                                                            Type="Int64" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="GeneralProjectGridView" EventName="SelectedIndexChanged" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </asp:Panel>
                                                </td>
                                                <td style="width: 31%; height: 91%; vertical-align: middle; background-color: white;
                                                    text-align: right;">
                                                    <asp:UpdatePanel ID="DetailProjectImageUpdatePanel" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:FormView ID="DetailProjectImageFormView" runat="server" DataKeyNames="PhotoID"
                                                                DataSourceID="ProjectDetailObjectDataSource" Style="position: absolute; left: 228px;
                                                                top: 23px; width: 254px; height: 161px; z-index: 3;" Width="290px" AllowPaging="True">
                                                                <ItemTemplate>
                                                                    &#160;<asp:Image ID="ProjectImage" runat="server" Height="182px" ImageUrl='<%# Bind("PhotoPath", "{0}") %>'
                                                                        Style="position: relative" Width="199px" /><br />
                                                                </ItemTemplate>
                                                                <PagerStyle Font-Bold="True" ForeColor="Maroon" HorizontalAlign="Center" VerticalAlign="Middle"
                                                                    Font-Size="Small" />
                                                            </asp:FormView>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="GeneralProjectGridView" EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                    &#160;&#160; &#160;&#160;
                                                </td>
                                                <td style="width: 29%; height: 91%; vertical-align: middle; background-color: white;">
                                                    <asp:UpdatePanel ID="DetailProjectStatusUpdatePanel" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:DetailsView ID="DetailProjectStatusDetailsView" runat="server" AutoGenerateRows="False"
                                                                DataSourceID="ProjectExtraObjectDataSource" Height="201px" Style="position: absolute;
                                                                left: 510px; top: 22px; z-index: 3; height: 201px; width: 221px;" Width="221px"
                                                                GridLines="None" BorderColor="SlateGray" BorderStyle="Outset" BorderWidth="1px"
                                                                DataKeyNames="Status">
                                                                <Fields>
                                                                    <asp:BoundField DataField="Status" HeaderText="<%$ Resources:Resource, Status %>"
                                                                        SortExpression="Status">
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="HighestBid" HeaderText="<%$ Resources:Resource, HighestBidLabel %>"
                                                                        SortExpression="HighestBid">
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="HighestBidderID" HeaderText="<%$ Resources:Resource, BidderID %>"
                                                                        SortExpression="HighestBidderID">
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="HighestBidUsername" HeaderText="<%$ Resources:Resource, BidderUsername %>"
                                                                        SortExpression="HighestBidUsername">
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="NumberofBids" HeaderText="<%$ Resources:Resource, NumberofBids %>"
                                                                        SortExpression="NumberofBids">
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Posted" HeaderText="<%$ Resources:Resource, Posted %>"
                                                                        SortExpression="Posted">
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:BoundField>
                                                                </Fields>
                                                                <RowStyle Font-Size="Small" />
                                                                <FieldHeaderStyle BackColor="SlateGray" Font-Bold="True" ForeColor="White" Width="50%" />
                                                            </asp:DetailsView>
                                                            <asp:ObjectDataSource ID="ProjectExtraObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetProjectExtra" TypeName="CustomerProjectCompletedDataSetTableAdapters.ProjectsExtraTableAdapter">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="GeneralProjectGridView" Name="ProjectID" PropertyName="SelectedValue"
                                                                        Type="Int64" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="GeneralProjectGridView" EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                        </table>
                                        <cc1:RoundedCornersExtender ID="DetailProjectPanelRoundedCornersExtender" runat="server"
                                            BorderColor="SlateGray" Color="SlateGray" Radius="8" TargetControlID="DetailProjectPanel"
                                            Enabled="True">
                                        </cc1:RoundedCornersExtender>
                                    </asp:Panel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="FavoriteTabPanel" runat="server" HeaderText="<%$ Resources:Resource, FavoriteTabPanel %>">
                                <ContentTemplate>
                                    <table style="width: 100%; position: relative; height: 100%; left: 0px; top: 0px;">
                                        <tr>
                                            <td style="height: 154px; vertical-align: top; text-align: center;">
                                                <asp:Panel ID="FavoritePanel" runat="server" Height="570px" Style="left: 0px; position: relative;
                                                    top: 0px" Width="100%">
                                                    <asp:UpdatePanel ID="FavoriteUpdatePanel" runat="server">
                                                        <ContentTemplate>
                                                            <asp:GridView ID="FavoriteGridView" runat="server" AllowPaging="True" AllowSorting="True"
                                                                CellPadding="4" DataSourceID="CustomerFavoriteObjectDataSource" ForeColor="#333333"
                                                                GridLines="None" AutoGenerateColumns="False" DataKeyNames="FavoriteID" Height="10%"
                                                                Width="100%" PageSize="7" Font-Size="Small" CssClass="gridHeader" PagerStyle-CssClass="pager" >
                                                                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:Image ID="FavoriteImage" runat="server" Height="65px" ImageUrl='<%# Bind("PhotoPath", "{0}") %>'
                                                                                Width="65px" /></ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="ProID" HeaderText="<%$ Resources:Resource, ID %>" SortExpression="CustomerID" />
                                                                    <asp:TemplateField HeaderText="<%$ Resources:Resource, UserName %>" SortExpression="UserName">
                                                                        <ItemTemplate>
                                                                            <asp:HyperLink ID="ProfessionalHyperlink" runat="server" NavigateUrl='<%# Eval("ProID", "ViewProfessionalProfile.aspx?PID={0}") %>'
                                                                                Target="_blank" Text='<%# Eval("Username") %>' CssClass="UnderlineLink"></asp:HyperLink></ItemTemplate>
                                                                        <ControlStyle ForeColor="#000099" />
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="WorkAccomplished" HeaderText="<%$ Resources:Resource, FavoriteWorkAccomplished %>"
                                                                        SortExpression="WorkAccomplished" />
                                                                    <asp:BoundField DataField="Rank" HeaderText="<%$ Resources:Resource, FavoriteRank %>"
                                                                        SortExpression="Rank" />
                                                                    <asp:BoundField DataField="Points" HeaderText="<%$ Resources:Resource, FavoritePoints %>"
                                                                        SortExpression="Points" />
                                                                    <asp:BoundField DataField="Reputation" HeaderText="<%$ Resources:Resource, FavoriteReputation %>"
                                                                        SortExpression="Reputation" />
                                                                </Columns>
                                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <EmptyDataTemplate>
                                                                    <asp:Label ID="EmptyFavoriteLabel" runat="server" BackColor="#666666" Font-Size="Small"
                                                                        Font-Bold="True" ForeColor="White" Text="<%$ Resources:Resource, EmptyFavorite %>"
                                                                        Width="100%" Style="position: absolute; top: 5px; left: 0px; height: 28px; text-align: center;
                                                                        vertical-align: top"></asp:Label>
                                                                </EmptyDataTemplate>
                                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                <HeaderStyle BackColor="Silver" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center"
                                                                    Height="10%" />
                                                                <EditRowStyle BackColor="#999999" />
                                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <PagerStyle BackColor="Silver" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                <AlternatingRowStyle BackColor="White" ForeColor="#003366" />
                                                            </asp:GridView>
                                                            <asp:ObjectDataSource ID="CustomerFavoriteObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetCustomerFavorite" TypeName="CustomerFavoriteTableAdapters.CustomerFavoriteDataTableTableAdapter">
                                                                <SelectParameters>
                                                                    <asp:QueryStringParameter Name="CustomerID" QueryStringField="CID" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </asp:Panel>
                                                <cc1:RoundedCornersExtender ID="FavoritePanel_RoundedCornersExtender" runat="server"
                                                    BorderColor="Gray" Color="Gray" Enabled="True" Radius="7" TargetControlID="FavoritePanel">
                                                </cc1:RoundedCornersExtender>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="CommentTabPanel" runat="server" HeaderText="<%$ Resources:Resource, CommentTabPanel %>">
                                <ContentTemplate>
                                    <asp:Panel ID="SummaryPanel" runat="server" Width="477px" Height="190px">
                                        <table cellpadding="0" cellspacing="0" style="width: 99%">
                                            <tr>
                                                <td colspan="3">
                                                    <asp:Label ID="StatisticsLabel" runat="server" BackColor="#006699" Text="<%$ Resources:Resource, StatisticsLabel %>"
                                                        Width="101%" Height="25px" Font-Bold="True" ForeColor="White" Font-Size="Small"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2">
                                                    <asp:GridView ID="SummaryGridView" runat="server" AutoGenerateColumns="False" DataSourceID="PerformanceDatatSource"
                                                        Width="80px" CellPadding="0" Height="160px" GridLines="None" ShowHeader="False" CssClass="gridHeader">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <table style="width: 249px; height: 160px;" cellpadding="8" cellspacing="0">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="PositiveIDLabel" runat="server" Text="<%$ Resources:Resource, Positive %>"
                                                                                    Font-Size="Small"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="PositiveLabel" runat="server" Font-Size="Small" Text='<%# Eval("NumberofPositive", "{0}") %>'></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <img src="../Images/Comment/PositiveIcon.gif" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="NegativeIDLabel" runat="server" Text="<%$ Resources:Resource, Negative %>"
                                                                                    Font-Size="Small"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="NegativeLabel" runat="server" Font-Size="Small" Text='<%# Eval("NumberofNegative", "{0}") %>'></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <img src="../Images/Comment/NegativeIcon.gif" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="height: 43px">
                                                                                <asp:Label ID="NeutralIDLabel" runat="server" Font-Size="Small" Text="<%$ Resources:Resource, Neutral %>"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="NeutralLabel" runat="server" Font-Size="Small" Text='<%# Eval("NumberofNeutral", "{0}") %>'></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <img src="../Images/Comment/NeutralIcon.GIF" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="TotalIDLabel" runat="server" Font-Size="Small" Text="<%$ Resources:Resource, TotalLabel %>"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="TotalLabel" runat="server" Font-Size="Small" Text='<%# Eval("Total", "{0}") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                                <td rowspan="2">
                                                    <hr style="height: 100%; width: 1px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align: text-top; text-align: center;">
                                                    <asp:Chart ID="SummaryChart" runat="server" Palette="None" Width="130px" Height="130px"
                                                        PaletteCustomColors="DarkGreen; DarkRed; DarkGray" DataSourceID="PerformanceDatatSource"
                                                        IsSoftShadows="False">
                                                        <Titles>
                                                            <asp:Title DockedToChartArea="ChartArea1" Font="Microsoft Sans Serif, 20pt, style=Bold"
                                                                ForeColor="Snow" Name="PercentageTitle" ShadowColor="Black" Text="100%" TextStyle="Emboss">
                                                                <Position Height="90" Width="90" X="8" Y="3" Auto="False" />
                                                            </asp:Title>
                                                        </Titles>
                                                        <Series>
                                                            <asp:Series ChartType="Pie" Name="Series1" ChartArea="ChartArea1">
                                                                <Points>
                                                                    <asp:DataPoint XValue="100" YValues="100" />
                                                                    <asp:DataPoint YValues="0" />
                                                                    <asp:DataPoint YValues="0" />
                                                                </Points>
                                                            </asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea BackColor="White" Name="ChartArea1">
                                                                <Area3DStyle Enable3D="True" Inclination="25" />
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                    <br />
                                                    <asp:Label ID="RecommendationLabel" runat="server" Font-Size="Small"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <cc1:RoundedCornersExtender ID="SummaryPanel_RoundedCornersExtender" runat="server"
                                        Color="0, 33, 66" Enabled="True" TargetControlID="SummaryPanel" BorderColor="0, 33, 66">
                                    </cc1:RoundedCornersExtender>
                                    <br />
                                    <asp:Panel ID="CommentReceivedPanel" runat="server" Height="490px" Style="left: 0px;
                                        overflow: hidden; position: relative; top: 10px" Width="100%" BackColor="White">
                                        <asp:UpdatePanel ID="CommentReceivedUpdatePanel" runat="server">
                                            <ContentTemplate>
                                                <asp:Label ID="CommentReceivedIDLabel" runat="server" BackColor="#003300" Font-Bold="True"
                                                    Height="10%" Style="position: relative; top: 0px; left: 0px;" Text="<%$ Resources:Resource, CommentReceivedLabel %>"
                                                    Width="100%" ForeColor="White" Font-Size="Small"></asp:Label>
                                                <asp:GridView ID="CommentReceivedGridView" runat="server" AllowPaging="True" AllowSorting="True"
                                                    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                    Width="100%" HorizontalAlign="Center" DataSourceID="CommentReceivedDataSource"
                                                    DataKeyNames="ProjectID" Font-Size="Small" PageSize="5" CssClass="gridHeader" PagerStyle-CssClass="pager" >
                                                    <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <EmptyDataRowStyle BackColor="#E3EAEB" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <Columns>
                                                        <asp:BoundField DataField="CommentDate" HeaderText="<%$ Resources:Resource, CommentDate %>"
                                                            SortExpression="CommentDate" DataFormatString="{0:dd/MM/yyyy}" />
                                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, From %>" SortExpression="ProfessionalUsername">
                                                            <ItemTemplate>
                                                                <asp:HyperLink ID="ProfessionalHyperlink" runat="server" NavigateUrl='<%# Eval("ProfessionalID", "ViewProfessionalProfile.aspx?PID={0}") %>'
                                                                    Target="_blank" Text='<%# Eval("ProfessionalUserName") %>' Font-Bold="False"
                                                                    ForeColor="#000066" CssClass="UnderlineLink"></asp:HyperLink></ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, About %>" SortExpression="ProjectTitle">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="ProjectTitleLinkButton" runat="server" CausesValidation="False"
                                                                    CommandName="select" ForeColor="#000066" Text='<%# Bind("ProjectTitle", "{0}") %>' CssClass="UnderlineLink"></asp:LinkButton><br />
                                                                <asp:Image ID="ProjectImage" runat="server" Height="50px" ImageUrl='<%# Bind("ProjectPhotoPath", "{0}") %>'
                                                                    Width="50px" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, Comment %>" SortExpression="Comment">
                                                            <ItemTemplate>
                                                                <asp:Label ID="CommentLabel" runat="server" Height="34px" Text='<%# Bind("Comment") %>'
                                                                    Width="100%"></asp:Label></ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, Positive %>" HeaderImageUrl="../Images/Comment/PositiveIcon.gif"
                                                            SortExpression="Positive">
                                                            <ItemTemplate>
                                                                <asp:Image ID="PositiveCheckMarkImage" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Comment/CheckMark.gif"
                                                                    Visible='<%# Bind("Positive") %>' /></ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="10%" />
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, Negative %>" SortExpression="Negative"
                                                            HeaderImageUrl="~/Images/Comment/NegativeIcon.gif">
                                                            <ItemTemplate>
                                                                <asp:Image ID="NegativeCheckMarkImage" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Comment/CheckMark.gif"
                                                                    Visible='<%# Bind("Negative") %>' /></ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, Neutral %>" HeaderImageUrl="~/Images/Comment/NeutralIcon.gif"
                                                            SortExpression="Neutral">
                                                            <ItemTemplate>
                                                                <asp:Image ID="NeutralCheckMarkImage" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Comment/CheckMark.gif"
                                                                    Visible='<%# Bind("Neutral") %>' /></ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Positive" HeaderText="<%$ Resources:Resource, Positive %>"
                                                            Visible="false" SortExpression="Positive" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#003300" ForeColor="White" HorizontalAlign="Center" />
                                                    <EmptyDataTemplate>
                                                        <asp:Label ID="EmptyComment" runat="server" Height="20px" Style="text-align: center"
                                                            Text="<%$ Resources:Resource, EmptyComment %>" Width="100%"></asp:Label></EmptyDataTemplate>
                                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                                                        VerticalAlign="Middle" />
                                                    <EditRowStyle BackColor="#7C6F57" />
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                </asp:GridView>
                                                <asp:ObjectDataSource ID="CommentReceivedDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetCustomerCommentReceived" TypeName="CustomerCommentsReceivedTableAdapters.CustomerCommentReceivedTableAdapter">
                                                    <SelectParameters>
                                                        <asp:QueryStringParameter Name="CustomerID" QueryStringField="CID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                    <cc1:RoundedCornersExtender ID="CommentReceived_RoundedCornersExtender" runat="server"
                                        Color="DarkOliveGreen" Enabled="True" TargetControlID="CommentReceivedPanel"
                                        BorderColor="DarkOliveGreen">
                                    </cc1:RoundedCornersExtender>
                                    <asp:Panel ID="CommentSentPanel" runat="server" Height="490px" Style="left: 0px;
                                        overflow: hidden; position: relative; top: 50px" Width="100%" BackColor="White">
                                        <asp:UpdatePanel ID="CommentSentUpdatePanel" runat="server">
                                            <ContentTemplate>
                                                <asp:Label ID="CommentSentLabel" runat="server" BackColor="#003366" Font-Bold="True"
                                                    Height="10%" Style="position: relative" Text="<%$ Resources:Resource, CommentSentLabel %>"
                                                    Width="100%" ForeColor="White" Font-Size="Small"></asp:Label>
                                                <asp:GridView ID="CommentSentGridView" runat="server" AllowPaging="True" AllowSorting="True"
                                                    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                    Width="100%" HorizontalAlign="Center" DataSourceID="CommentSentDataSource" DataKeyNames="ProjectID"
                                                    Font-Size="Small" PageSize="5" CssClass="gridHeader" PagerStyle-CssClass="pager">
                                                    <RowStyle BackColor="#F7F6F3" HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="#333333" />
                                                    <Columns>
                                                        <asp:BoundField DataField="CommentDate" HeaderText="<%$ Resources:Resource, CommentDate %>"
                                                            SortExpression="CommentDate" DataFormatString="{0:dd/MM/yyyy}" />
                                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, To %>" SortExpression="ProfessionalUsername">
                                                            <ItemTemplate>
                                                                <asp:HyperLink ID="ProfessionalHyperlink" runat="server" NavigateUrl='<%# Eval("ProfessionalID", "ViewProfessionalProfile.aspx?PID={0}") %>'
                                                                    Target="_blank" Text='<%# Eval("ProfessionalUserName") %>' Font-Bold="False"
                                                                    ForeColor="#000066" CssClass="UnderlineLink"></asp:HyperLink></ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, About %>" SortExpression="ProjectTitle">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="ProjectTitleLinkButton" runat="server" CausesValidation="False"
                                                                    CommandName="select" ForeColor="#000066" Text='<%# Bind("ProjectTitle", "{0}") %>' CssClass="UnderlineLink"></asp:LinkButton><br />
                                                                <asp:Image ID="ProjectImage" runat="server" Height="50px" ImageUrl='<%# Bind("ProjectPhotoPath", "{0}") %>'
                                                                    Width="50px" /></ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, Comment %>" SortExpression="Comment">
                                                            <ItemTemplate>
                                                                <asp:Label ID="CommentLabel" runat="server" Height="34px" Text='<%# Bind("Comment") %>'
                                                                    Width="100%"></asp:Label></ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, Positive %>" HeaderImageUrl="~/Images/Comment/PositiveIcon.gif"
                                                            SortExpression="Positive">
                                                            <ItemTemplate>
                                                                <asp:Image ID="PositiveCheckMarkImage" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Comment/CheckMark.gif"
                                                                    Visible='<%# Bind("Positive") %>' /></ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, Negative %>" SortExpression="Negative"
                                                            HeaderImageUrl="~/Images/Comment/NegativeIcon.gif">
                                                            <ItemTemplate>
                                                                <asp:Image ID="NegativeCheckMarkImage" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Comment/CheckMark.gif"
                                                                    Visible='<%# Bind("Negative") %>' /></ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, Neutral %>" HeaderImageUrl="~/Images/Comment/NeutralIcon.gif"
                                                            SortExpression="Neutral">
                                                            <ItemTemplate>
                                                                <asp:Image ID="NeutralCheckMarkImage" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Comment/CheckMark.gif"
                                                                    Visible='<%# Bind("Neutral") %>' /></ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Positive" HeaderText="<%$ Resources:Resource, Positive %>"
                                                            Visible="false" SortExpression="Positive" />
                                                    </Columns>
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <EmptyDataTemplate>
                                                        <asp:Label ID="EmptyCommentLabel" runat="server" Height="20px" Style="text-align: center"
                                                            Text="<%$ Resources:Resource, EmptyComment %>" Width="100%"></asp:Label></EmptyDataTemplate>
                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                                                        VerticalAlign="Middle" Height="10%" />
                                                    <EditRowStyle BackColor="#999999" />
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <EmptyDataRowStyle BackColor="#E3EAEB" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:GridView>
                                                <asp:ObjectDataSource ID="CommentSentDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetCustomerCommentSent" TypeName="CustomerCommentSentTableAdapters.CustomerCommentSentTableAdapter">
                                                    <SelectParameters>
                                                        <asp:QueryStringParameter Name="CustomerID" QueryStringField="CID" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                    <cc1:RoundedCornersExtender ID="CommentSentPanel_RoundedCornersExtender" runat="server"
                                        Color="0, 33, 66" Enabled="True" TargetControlID="CommentSentPanel" BorderColor="0, 33, 66">
                                    </cc1:RoundedCornersExtender>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                        <asp:ObjectDataSource ID="PerformanceDatatSource" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetCustomerCommentReceivedSummary" TypeName="CustomerCommentsReceivedTableAdapters.CustomerCommentReceivedSummaryTableAdapter">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="" Name="CustomerID" QueryStringField="CID"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </div>
            </td>
            <td>
                <asp:Panel ID="ProjectMenu" runat="server" Wrap="true" Style="z-index: 0; text-align: center;
                    height: 25px; width: 180px;" BackColor="White" Visible="false">
                    <asp:Button ID="AddtoCustomerListButton" runat="server" CausesValidation="False"
                        BorderColor="#000066" BorderStyle="Groove" BorderWidth="2px" BackColor="#003366"
                        Font-Bold="False" ForeColor="White" Style="top: 10px" Font-Size="12px" Text="<%$ Resources:Resource, CustomerList %>"
                        OnClientClick="fireanimation();" />
                </asp:Panel>
                <cc1:RoundedCornersExtender ID="ProjectMenu_RoundedCornersExtender" runat="server"
                    Color="#003366" BorderColor="#003366" Enabled="True" Radius="8" TargetControlID="ProjectMenu">
                </cc1:RoundedCornersExtender>
            </td>
        </tr>
    </table>

    </div>
    <div class="cleaner">
    </div>
    <LowerNavigationButtons:NavigationButtons ID="MainLowerNavigationButtons" runat="server" />
    <asp:Panel ID="WorkShopPanel" runat="server" Style="left: 0px; display: none; position: relative;
        top: 304px; background-color: tan; z-index: 100;" Height="374px" Width="485px"
        BorderColor="Black" BorderStyle="Solid" BorderWidth="3px">
        <cc1:ModalPopupExtender ID="WorkShopModalPopupExtender" runat="server" PopupControlID="WorkShopPanel"
            TargetControlID="TargetedControlLabel" DropShadow="false" BackgroundCssClass="modalBackground"
            RepositionMode="RepositionOnWindowResizeAndScroll" CancelControlID="Exit2">
        </cc1:ModalPopupExtender>
        <asp:Image ID="WorkShopImage" runat="server" Height="263px" Style="left: 60px; position: absolute;
            top: 44px" Width="364px" />
        <br />
        <asp:Button ID="PreviousButton2" runat="server" Style="left: 91px; position: absolute;
            top: 319px"  Text="<%$ Resources:Resource, Previous %>" Width="70px" />
        &nbsp;
        <asp:Button ID="PlayButton2" runat="server" Style="left: 206px; position: absolute;
            top: 319px"  Text="<%$ Resources:Resource, Play %>" Width="74px" />
        &nbsp;
        <asp:Button ID="NextButton2" runat="server" Style="left: 326px; position: absolute;
            top: 319px"  Text="<%$ Resources:Resource, Next %>" Width="76px" />
        <asp:Button ID="Exit2" runat="server" Style="left: 426px; position: absolute; top: 338px"
           Text="<%$ Resources:Resource, Exit %>" Width="45px" />
        <br />
    </asp:Panel>
    <asp:Panel ID="ProfessionalPanel" runat="server" Style="left: 189px; display: none;
        position: relative; top: 664px; background-color: tan; z-index: 100;" Height="374px"
        Width="485px" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px">
        <cc1:ModalPopupExtender ID="ProfileModalPopupExtender" runat="server" PopupControlID="ProfessionalPanel"
            TargetControlID="TargetedControlLabel" DropShadow="false" BackgroundCssClass="modalBackground"
            RepositionMode="RepositionOnWindowResizeAndScroll" CancelControlID="ExitButton">
        </cc1:ModalPopupExtender>
        <asp:Image ID="ProfessionalImage" runat="server" Height="263px" Style="left: 60px;
            position: absolute; top: 44px" Width="364px" />
        <br />
        <asp:Button ID="PreviousButton" runat="server" Style="left: 91px; position: absolute;
            top: 319px"  Text="<%$ Resources:Resource, Previous %>" Width="70px" />
        &nbsp;
        <asp:Button ID="PlayButton" runat="server" Style="left: 206px; position: absolute;
            top: 319px"  Text="<%$ Resources:Resource, Play %>" Width="74px" />
        &nbsp;
        <asp:Button ID="NextButton" runat="server" Style="left: 326px; position: absolute;
            top: 319px"  Text="<%$ Resources:Resource, Next %>" Width="76px" />
        <asp:Button ID="ExitButton" runat="server" Style="left: 426px; position: absolute;
            top: 338px"  Text="<%$ Resources:Resource, Exit %>" Width="45px" />
        <br />
        <asp:Label ID="TargetedControlLabel" runat="server" Style="left: 715px; position: relative;
            top: 373px; z-index: 101;" Text=" " Width="33px"></asp:Label>
    </asp:Panel>
    <div id="LoadingDiv" style="left: 0px; width: 100px; position: absolute; top: 0px;
        height: 100px">
        <asp:UpdatePanel ID="DelayUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <cc1:ModalPopupExtender ID="DelayModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                    PopupControlID="LoadingPanel" TargetControlID="LoadingPanel" RepositionMode="RepositionOnWindowResize">
                </cc1:ModalPopupExtender>
                &nbsp; &nbsp;
                <asp:Panel ID="LoadingPanel" runat="server" Height="45px" Style="display: none; left: 36px;
                    position: absolute; top: 48px" Width="196px" BackColor="Silver">
                    &nbsp;
                    <asp:Label ID="LoadingLabel" runat="server" Font-Bold="True" ForeColor="Black" Style="left: 63px;
                        position: absolute; top: 25px" Text="<%$ Resources:Resource, Loading %>"></asp:Label>
                    <img src="../_assets/img/uploading.gif" alt="loading" style="left: 0px; position: relative;
                        top: -9px" />
                </asp:Panel>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:Panel ID="MoreProject" runat="server" Height="520px" Style="display: none; left: 48px;
        position: relative; top: 1218px; z-index: 103;" Width="990px" BackColor="White"
        BorderColor="Maroon" BorderStyle="Solid" BorderWidth="3px">
        <asp:UpdatePanel ID="MoreProjectUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <cc1:ModalPopupExtender ID="MoreProjectModalPopupExtender" runat="server" TargetControlID="MoreProjectTargetedLabel"
                    PopupControlID="MoreProject" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>
                <asp:Label ID="MoreProjectTargetedLabel" runat="server" Style="position: relative"
                    Width="153px"></asp:Label>
                <asp:Panel ID="MoreProjectGlobal" runat="server" Height="370px" Style="left: 5px;
                    position: absolute; top: 9px; z-index: 101;" Width="87%" BackColor="White">
                    <asp:Panel ID="MoreProjectRequirementPanel" runat="server" Height="212px" Style="left: 284px;
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
                                    <asp:Label ID="ExperienceView" runat="server" Style="position: relative" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="NumberofCrewsLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, NumberofCrewsLabel %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:Label ID="CrewNumberView" runat="server" Style="position: relative" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="LicensedLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, LicensedLabel %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:Label ID="LicensedView" runat="server" Style="position: relative" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="InsuredLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, InsuredLabel %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:Label ID="InsuredView" runat="server" Style="position: relative" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="RelocationLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, RelocationLabel %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:Label ID="RelocationView" runat="server" Style="position: relative" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="MoreProjectSpecificationPanel" runat="server" Height="212px" Style="left: 284px;
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
                                        Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="TitleLabel" runat="server" Font-Size="10pt" Style="position: relative"
                                        Text="<%$ Resources:Resource, ProjectTitle %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:Label ID="TitleView" runat="server" Font-Size="10pt" Style="position: relative"
                                        Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="IndustryLabel" runat="server" Font-Size="10pt" Style="position: relative"
                                        Text="<%$ Resources:Resource, IndustryLabel %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:Label ID="IndustryView" runat="server" Font-Size="10pt" Style="position: relative"
                                        Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="SpecializationLabel" runat="server" Font-Size="10pt" Style="position: relative"
                                        Text="<%$ Resources:Resource, SpecializationLabel %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:Label ID="SpecializationView" runat="server" Font-Size="10pt" Style="position: relative"
                                        Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="TimeLeftLabel" runat="server" Font-Size="10pt" Style="position: relative"
                                        Text="<%$ Resources:Resource, TimeLeftLabel %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:Label ID="TimeLeftView" runat="server" Font-Size="10pt" Style="position: relative"
                                        Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="HighestBidLabel" runat="server" Font-Size="10pt" Style="position: relative"
                                        Text="<%$ Resources:Resource, HighestBidLabel %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:Label ID="HighestBidView" runat="server" Font-Size="10pt" Style="position: relative"
                                        Text="">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:UpdatePanel ID="MoreProjectPhotoUpdatePanel" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="MoreProjectPhotoPanel" runat="server" Height="270px" Style="left: 15px;
                                overflow: hidden; position: absolute; top: 10px" Width="227px">
                                <cc1:RoundedCornersExtender ID="MoreProjectPhotoRoundedCornersExtender" runat="server"
                                    TargetControlID="MoreProjectPhotoPanel" BorderColor="64, 0, 0" Enabled="True"
                                    Color="Maroon">
                                </cc1:RoundedCornersExtender>
                                <asp:FormView ID="ProjectFormView" runat="server" AllowPaging="True" DataSourceID="ProjectPhotoObjectDataSource"
                                    ForeColor="Maroon" Height="205px" HorizontalAlign="Center" Style="left: 7px;
                                    position: relative; top: -18px" Width="215px" EnableModelValidation="True">
                                    <PagerSettings Mode="Numeric" />
                                    <ItemTemplate>
                                        <br />
                                        <asp:Label ID="PhotoCaptionLabel" runat="server" Style="left: 74px; position: relative;
                                            top: 223px" Text='<%# Bind("Caption") %>' Height="20px"></asp:Label>
                                        <asp:Image ID="PhotoImage" runat="server" Height="220px" ImageAlign="Middle" ImageUrl='<%# Bind("PhotoPath", "{0}") %>'
                                            Style="left: 0px; position: relative; top: -16px" Width="199px" /><br />
                                    </ItemTemplate>
                                    <PagerStyle Font-Bold="True" ForeColor="Navy" HorizontalAlign="Center" VerticalAlign="Top" />
                                </asp:FormView>
                                <asp:ObjectDataSource ID="ProjectPhotoObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetProjectPhoto" TypeName="ViewProjectDataSetTableAdapters.ProjectPhotoTableAdapter">
                                    <SelectParameters>
                                        <asp:Parameter Name="ProjectID" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:Panel ID="MoreProjectDescriptionPanel" runat="server" Style="left: 588px; position: relative;
                        top: 13px" Height="457px" Width="388px">
                        <asp:Label ID="SpecialNotesLabel" runat="server" Style="left: 8px; position: absolute;
                            top: 276px" Text="<%$ Resources:Resource, NotesLabel %>" Font-Bold="True" Font-Size="10pt"
                            ForeColor="Maroon"></asp:Label>
                        <asp:TextBox ID="notesview" runat="server" Height="132px" Style="left: 5px; position: absolute;
                            top: 300px" Width="364px" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                        <asp:Label ID="ProjectDescriptionLabel" runat="server" Style="left: 5px; position: absolute;
                            top: 3px" Text="<%$ Resources:Resource, ProjectDescriptionLabel %>" Font-Bold="True"
                            Font-Size="10pt" ForeColor="Maroon"></asp:Label>
                        <asp:Label ID="DescriptionLabel" runat="server" Style="left: 5px; position: absolute;
                            top: 28px" Text="<%$ Resources:Resource, DescriptionLabel2 %>" Font-Bold="True"
                            Font-Size="10pt" ForeColor="Maroon"></asp:Label>
                        <asp:Label ID="CustomDescriptionLabel" runat="server" Style="z-index: 100; left: 5px;
                            position: absolute; top: 50px;" Height="200px" Width="364px" BackColor="LightGray"></asp:Label>
                        &nbsp;</asp:Panel>
                    <cc1:RoundedCornersExtender ID="MoreProjectSpecificationRoundedCornersExtender" runat="server"
                        TargetControlID="MoreProjectSpecificationPanel" BorderColor="64, 0, 0" Enabled="True"
                        Color="Maroon">
                    </cc1:RoundedCornersExtender>
                    <cc1:RoundedCornersExtender ID="MoreProjectLocationRoundedCornersExtender" runat="server"
                        TargetControlID="MoreProjectLocationPanel" BorderColor="64, 0, 0" Enabled="True"
                        Color="Maroon">
                    </cc1:RoundedCornersExtender>
                    <cc1:RoundedCornersExtender ID="MoreProjectDescriptionRoundedCornersExtender" runat="server"
                        TargetControlID="MoreProjectDescriptionPanel" BorderColor="64, 0, 0" Enabled="True"
                        Color="Maroon">
                    </cc1:RoundedCornersExtender>
                    <cc1:RoundedCornersExtender ID="MoreProjectRequirementRoundedCornersExtender" runat="server"
                        TargetControlID="MoreProjectRequirementPanel" BorderColor="64, 0, 0" Enabled="True"
                        Color="Maroon">
                    </cc1:RoundedCornersExtender>
                    <asp:Panel ID="MoreProjectLocationPanel" runat="server" Height="130px" Style="left: 15px;
                        overflow: hidden; position: relative; top: -128px" Width="227px">
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
                    <asp:Panel ID="MoreProjectNavigationPanel" runat="server" Style="left: 588px; position: relative;
                        top: -121px" Width="390px">
                        <asp:LinkButton ID="MoreProjectLinkButton" runat="server" Text="<%$ Resources:Resource, More %>"
                            Style="left: 240px; position: relative; width: 40px" CausesValidation="False"
                            OnClientClick="fireanimation7();" Font-Bold="True" ForeColor="Maroon" CssClass="UnderlineLink"></asp:LinkButton>
                        <asp:Button ID="OkButton" runat="server" Text="<%$ Resources:Resource, OkButton %>"
                            Style="left: 290px; position: relative;" CausesValidation="False" OnClientClick="fireanimation2();"  CssClass="UnderlineLink"/>
                    </asp:Panel>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>


    </form>
</body>
</html>
