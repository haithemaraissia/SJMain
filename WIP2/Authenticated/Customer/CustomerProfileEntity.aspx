﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CustomerProfileEntity.aspx.vb" Inherits="Authenticated_Customer_CustomerProfileEntity" %>


<%--<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../../common/CustomerTemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../../common/TemplateMainLowerButtons.ascx" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <script language="javascript" type="text/javascript">

        function FireAnimation() {
            document.getElementById('LoadingPanel').style.visibility = 'visible';
            $find('DelayModalPopUpExtender').show();
            document.body.style.overflow = 'visible';
        }

        function ModalInvitationFireAnimation() {
            $find('ModalInvitationPopupExtender').hide();
            $find('DelayModalPopUpExtender').hide();
        }

        function MoreProjectFireAnimation() {
            $find('DelayModalPopUpExtender').show();
            $find('MoreProjectModalPopupExtender').hide();
        }

        function MoreProjectFireAnimation2() {
            $find('DelayModalPopUpExtender').hide();
            $find('MoreProjectModalPopupExtender').hide();
            window.open(document.getElementById('MoreProjectHiddenFieldButton').value);

        }
        function ExtendProjectFireAnimation() {
            $find('ExtendProjectModalPopupExtender').hide();
            $find('DelayModalPopUpExtender').show();
        }

        function CancelProjectFireAnimation() {
            $find('ExtendProjectModalPopupExtender').hide();
            $find('DelayModalPopUpExtender').show();
        }

        function ModalInvitationFireAnimation2() {
            $find('ModalInvitationPopupExtender').hide();
            $find('DelayModalPopUpExtender').show();
        }

        function MessageFireAnimation() {
            $find('DelayModalPopUpExtender').show();
            $find('MessageModalPopupExtender').hide();
            document.body.style.overflow = 'visible';
            $find('DelayModalPopUpExtender').hide();
        }

        function SwitchTab(number) {
            if (number == 1) {
                $find('ProfileSlideShowModalPopupExtender').show();
                document.body.style.overflow = 'visible';
            }
        }

        function GetContract() {
            var width = 500;
            var height = 300;
            var left = (screen.width - width) / 2;
            var top = (screen.height - height) / 2;
            var params = 'width=' + width + ', height=' + height;
            params += ', top=' + top + ', left=' + left; " '"; params += ', directories=no';
            params += ', location=no';
            params += ', menubar=no';
            params += ', copyhistory=no';
            params += ', resizable=no';
            params += ', scrollbars=no';
            params += ', status=no';
            params += ', toolbar=no';
            newwin = window.open('http://localhost:2058/SIDEJOB/Authenticated/ViewContract.aspx', 'Contract', params);
            if (window.focus) { newwin.focus() }
            return false;
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
    </script>
    <script type="text/javascript" src="../../scripts/jquery-1.5.2.js"></script>
    <script type="text/javascript">
        $(function ($) {
            $(document).ready(function () {

                //Summary
                function SummaryClick() {
                    $('#ProfileTabContainer_body').css("height", "635px");
                }
                $('#__tab_ProfileTabContainer_EventTabPanel').bind('click', SummaryClick);

                //Profile
                function ProfileClick() {
                    $('#ProfileTabContainer_body').css("height", "657px");
                }
                $('#__tab_ProfileTabContainer_ProfileTabPanel').bind('click', ProfileClick);



                //Portfolio
                function PortfolioClick() {
                    $('#ProfileTabContainer_body').css("height", "635px");

                }
                $('#__tab_ProfileTabContainer_PortfolioTabPanel').bind('click', PortfolioClick);

                //Message
                function MessageClick() {
                    $('#ProfileTabContainer_body').css("height", "660px");
                }
                $('#__tab_ProfileTabContainer_MessageTabPanel').bind('click', MessageClick);

                //Project
                function ProjectClick() {
                    $('#ProfileTabContainer_body').css("height", "650px");

                }
                $('#__tab_ProfileTabContainer_ProjectTabPanel').bind('click', ProjectClick);


                //Favorite
                function FavoriteClick() {
                    $('#ProfileTabContainer_body').css("height", "660px");
                }
                $('#__tab_ProfileTabContainer_FavoriteTabPanel').bind('click', FavoriteClick);

                //Invitation
                function InvitationClick() {
                    $('#ProfileTabContainer_body').css("height", "665px");
                }
                $('#__tab_ProfileTabContainer_InvitationTabPanel').bind('click', InvitationClick);


                //WatchList
                function WatchListClick() {
                    $('#ProfileTabContainer_body').css("height", "670px");
                }
                $('#__tab_ProfileTabContainer_WatchListTabPanel').bind('click', WatchListClick);

                //Transaction
                function TransactionClick() {
                    $('#ProfileTabContainer_body').css("height", "683px");
                }
                $('#__tab_ProfileTabContainer_TransactionTabPanel').bind('click', TransactionClick);

                //Contract
                function ContractClick() {
                    $('#ProfileTabContainer_body').css("height", "655px");
                }
                $('#__tab_ProfileTabContainer_ContractTabPanel').bind('click', ContractClick);

                //Account
                function AccountClick() {
                    $('#ProfileTabContainer_body').css("height", "650px");
                }
                $('#__tab_ProfileTabContainer_AccountTabPanel').bind('click', AccountClick);

                //Comment
                function CommentClick() {
                    $('#ProfileTabContainer_body').css("height", "1150px");
                }
                $('#__tab_ProfileTabContainer_CommentTabPanel').bind('click', CommentClick);

            });

        })(jQuery);
    </script>
    <link href="../themes/opera/tabs.css" rel="stylesheet" type="text/css" />
    <link href="../themes/BlueMenublockStyleSheet.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../../_assets/css/TemplateStyleSheet.css" type="text/css"
        media="screen" />
    <style type="text/css">
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
    </style>
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
</head>
<body>
    <form id="form1" runat="server">
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
    <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <%--    <div style="z-index: 100; left: 10px; width: 311px; position: absolute; top: 102px;
        height: 108px">--%>
    <%--    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>--%>
    <div id="wrapper" style="padding: 25px">
        <table align="center" id="TemplateGlobalTable">
            <tr>
                <td>
                    <table align="center">
                        <tr>
                            <td>
                                <div id="WelcomeCustomerHeader" style="z-index: 0; left: 745px; width: 230px; position: relative;
                                    top: 5px; height: 15px; text-align: center">
                                    <asp:LoginView ID="CustomerLoginView" runat="server">
                                        <LoggedInTemplate>
                                            <asp:Label ID="WelcomeLabel" runat="server" Text="<%$ Resources:Resource, WelcomeBackLabel %>"></asp:Label>
                                            <asp:LoginName ID="LoginName" runat="server" Style="position: relative" Font-Bold="True"
                                                ForeColor="#327E04" />
                                        </LoggedInTemplate>
                                    </asp:LoginView>
                                </div>
                                <div id="LoginDiv">
                                    <asp:LoginStatus ID="CustomerLoginStatus" runat="server" LogoutPageUrl="~/NotAuthenticated/Index.aspx"
                                        CssClass="UnderlineLink" Style="left: 850px; position: relative; top: 20px; z-index: 0;" ForeColor="Maroon" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <cc1:TabContainer ID="ProfileTabContainer" CssClass="opera" runat="server" ActiveTabIndex="7"
                                    Height="655px" Width="806px" EnableTheming="True" BorderWidth="0px" Visible="true"
                                    BackColor="White" AutoPostBack="false" Font-Size="Small">
                                    <cc1:TabPanel ID="EventTabPanel" runat="server" HeaderText="<%$ Resources:Resource, EventTabPanel %>">
                                        <ContentTemplate>
                                            <table style="width: 100%; height: 98%; position: relative;">
                                                <tr>
                                                    <td style="width: 50%; vertical-align: top;">
                                                        <asp:Label ID="StatusLabel" runat="server" Style="position: relative; left: 10px;
                                                            top: 10px" Text="<%$ Resources:Resource, Status %>" Font-Bold="True" ForeColor="#400000"
                                                            Height="23px" Font-Size="Medium" Font-Names="Times New Roman"></asp:Label>
                                                        <br />
                                                        <asp:DataList ID="StatusDataList" runat="server" DataKeyField="CustomerID" DataSourceID="StaticObjectDataSource"
                                                            Style="position: relative; left: 0px;">
                                                            <ItemTemplate>
                                                                <asp:Panel ID="StatusPanel" runat="server" Height="560px" Style="left: 10px; position: relative;
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
                                                        </asp:DataList><asp:ObjectDataSource ID="StaticObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                            SelectMethod="GetStatistic" TypeName="StatisticsDataSetTableAdapters.CustomerAdditionalInformationTableAdapter">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="CustomerId" SessionField="CustomerId" Type="String" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                    </td>
                                                    <td style="vertical-align: top; width: 49%">
                                                        <asp:Label ID="PerformanceIDLabel" runat="server" Style="position: relative; top: 12px;
                                                            left: 23px;" Text="<%$ Resources:Resource, EventPerformance %>" Font-Names="Times New Roman"
                                                            Font-Bold="True" ForeColor="#003300" Height="23px" Font-Size="Medium"></asp:Label><asp:Panel
                                                                ID="PerformancePanel" runat="server" Height="560px" Style="left: 23px; position: relative;
                                                                top: 12px; overflow: hidden" Width="355px">
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
                                                        <asp:ObjectDataSource ID="PerformanceDatatSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                            SelectMethod="GetCustomerCommentReceivedSummary" TypeName="CustomerCommentsReceivedTableAdapters.CustomerCommentReceivedSummaryTableAdapter">
                                                             <SelectParameters>
                                                            <asp:SessionParameter Name="CustomerID" SessionField="CustomerID" Type="Int32" />
                                                        </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                    </td>
                                                </tr>
                                            </table>
                                        
</ContentTemplate>
                                    



</cc1:TabPanel>
                                    <cc1:TabPanel ID="ProfileTabPanel" runat="server" HeaderText="<%$ Resources:Resource, ProfileTabPanel %>">
                                        <ContentTemplate>
                                            <table style="width: 100%; height: 80%; position: relative; vertical-align: middle;
                                                padding-top: 30px" align="center">
                                                <tr align="center">
                                                    <td style="width: 160px; background-color: #ffffff; height: 630px;" rowspan="2">
                                                        <asp:Panel ID="CustomerPhotoPanel" runat="server">
                                                            <asp:FormView ID="CustomerPhotoFormView" runat="server" DataKeyNames="PhotoID" DataSourceID="CustomerPhotoObjectDataSource"
                                                                EnableModelValidation="True">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="CustomerImageButton" runat="server" Height="385px" Style="z-index: 100;
                                                                        position: relative; top: 0px" Width="350px" CommandName="select" ImageUrl='<%# Eval("PhotoPath") %>' />
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <table align="center" style="width: 150px; position: relative; right: 10px">
                                                                        <tr>
                                                                            <td>
                                                                                <div>
                                                                                    <span class="BlueMenublock">
                                                                                        <ul>
                                                                                            <li>
                                                                                                <asp:HyperLink ID="SlideShowHyperLink" runat="server" NavigateUrl="#" onclick="$find('ProfileSlideShowModalPopupExtender').show();document.body.style.overflow =  'visible';"
                                                                                                    Text="<%$ Resources:Resource, SlideShow %>"></asp:HyperLink></li><li>
                                                                                                        <asp:HyperLink ID="EditPhotoHyperLink" runat="server" NavigateUrl="EditPhoto.aspx"
                                                                                                            Text="<%$ Resources:Resource, EditPhoto %>"></asp:HyperLink></li><li>
                                                                                                                <asp:HyperLink ID="UploadCustomerPhotoHyperLink" runat="server" NavigateUrl="UploadCustomerPhoto.aspx"
                                                                                                                    Text="<%$ Resources:Resource, AddPhoto %>"></asp:HyperLink></li><li>
                                                                                                                        <asp:HyperLink ID="EditAlbumHyperLink" runat="server" NavigateUrl="EditAlbum.aspx"
                                                                                                                            Text="<%$ Resources:Resource, EditAlbum %>"></asp:HyperLink></li><li>
                                                                                                                                <asp:HyperLink ID="ReorderPhotoHyperLink" runat="server" NavigateUrl="RearrangePhotos.aspx"
                                                                                                                                    Text="<%$ Resources:Resource, ReorderPhoto %>"></asp:HyperLink></li></ul>
                                                                                    </span>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                            </asp:FormView>
                                                            <asp:ObjectDataSource ID="CustomerPhotoObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GetCustomerPhoto" TypeName="CustomerPhotoDataSetTableAdapters.SelectCustomerPhotoTableAdapter">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="CustomerID" SessionField="CustomerId" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                        </asp:Panel>
                                                        <br />
                                                        <br />
                                                        <br />
                                                    </td>
                                                    <td style="width: 100px; height: 630px;" rowspan="2" id="Td2">
                                                        <asp:UpdatePanel ID="CustomerDetailUpdatePanel" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Panel ID="CustomerDetailProfilePanel" runat="server" Height="347px" Style="left: 445px;
                                                                    top: 47px; z-index: 103; height: 375px; overflow: hidden" Width="300px" BackColor="White">
                                                                    <asp:DetailsView ID="ProfileDetailView" runat="server" AutoGenerateRows="False" DataKeyNames="CustomerID"
                                                                        Height="286px" CellPadding="4"
                                                                        Width="300px" GridLines="None" Font-Size="9pt" ForeColor="#333333">
                                                                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                                                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                        <Fields>
                                                                            <asp:BoundField DataField="CustomerID" HeaderText="<%$ Resources:Resource, ID %>"
                                                                                ReadOnly="True" SortExpression="CustomerID" Visible="False" />
                                                                            <asp:BoundField DataField="FirstName" HeaderText="<%$ Resources:Resource, FirstName %>"
                                                                                SortExpression="FirstName">
                                                                                <HeaderStyle Width="300px" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="LastName" HeaderText="<%$ Resources:Resource, LastName %>"
                                                                                SortExpression="LastName" />
                                                                            <asp:BoundField DataField="UserName" HeaderText="<%$ Resources:Resource, UserName %>"
                                                                                SortExpression="UserName" />
                                                                            <asp:BoundField DataField="Address" HeaderText="<%$ Resources:Resource, AddressLabel2 %>"
                                                                                SortExpression="Address" />
                                                                            <asp:BoundField DataField="CountryName" HeaderText="<%$ Resources:Resource, CountryName %>"
                                                                                SortExpression="Country" />
                                                                            <asp:BoundField DataField="RegionName" HeaderText="<%$ Resources:Resource, RegionName %>"
                                                                                SortExpression="Region" />
                                                                            <asp:BoundField DataField="CityName" HeaderText="<%$ Resources:Resource, CityName %>"
                                                                                SortExpression="City" />
                                                                            <asp:BoundField DataField="Zipcode" HeaderText="<%$ Resources:Resource, Zipcode %>"
                                                                                SortExpression="Zipcode" />
                                                                            <asp:BoundField DataField="HomePhoneNumber" HeaderText="<%$ Resources:Resource, HomePhoneNumber %>"
                                                                                SortExpression="HomePhoneNumber" />
                                                                            <asp:BoundField DataField="MobilePhoneNumber" HeaderText="<%$ Resources:Resource, MobilePhoneNumber %>"
                                                                                SortExpression="MobilePhoneNumber" />
                                                                            <asp:BoundField DataField="Age" HeaderText="<%$ Resources:Resource, Age %>" SortExpression="Age" />
                                                                            <asp:TemplateField HeaderText="<%$ Resources:Resource, Gender %>" SortExpression="Gender">
                                                                                <ItemTemplate>
                                                                                    <asp:DropDownList ID="GenderDropDownList" runat="server" Font-Size="Small" Enabled="False"
                                                                                        SelectedValue='<%# Bind("Gender", "{0}") %>' EnableTheming="True" Width="40px"
                                                                                        Height="25px">
                                                                                        <asp:ListItem Value="1" Selected="True">M</asp:ListItem>
                                                                                        <asp:ListItem Value="2">F</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="EmailAddress" HeaderText="<%$ Resources:Resource, EmailAddress %>"
                                                                                SortExpression="EmailAddress" />
                                                                            <asp:TemplateField ShowHeader="False">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="EditProfileButton" runat="server" CausesValidation="False" ForeColor="Maroon"
                                                                                        PostBackUrl="EditProfile.aspx" CssClass="UnderlineLink" Style="position: relative"
                                                                                        Text="<%$ Resources:Resource, Edit %>" Font-Bold="True"></asp:LinkButton></ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Fields>
                                                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White" />
                                                                        <EditRowStyle BackColor="#999999" Font-Size="8pt" />
                                                                        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                    </asp:DetailsView>
                                                                </asp:Panel>
                                                                <cc1:RoundedCornersExtender ID="CustomerDetailProfilePanelRoundedCornersExtender"
                                                                    runat="server" BorderColor="0, 51, 102" Color="0, 51, 102" Enabled="True" TargetControlID="CustomerDetailProfilePanel">
                                                                </cc1:RoundedCornersExtender>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <asp:Panel ID="ProfileChangePasswordPanel" runat="server" CssClass="BlueMenublock"
                                                            Height="26px" Style="z-index: 113; left: 509px; top: 450px; width: 151px; height: 26px;"
                                                            Font-Size="10pt">
                                                            <ul>
                                                                <li>
                                                                    <asp:HyperLink ID="ChangePasswordHyperlink" runat="server" NavigateUrl="#" Text="<%$ Resources:Resource, ChangePassword %>"
                                                                        onclick="$find('ChangePasswordModalPopupExtender').show();document.body.style.overflow = 'visible';"></asp:HyperLink></li></ul>
                                                        </asp:Panel>
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <br />
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
                                            <asp:Panel ID="PortfolioPanel" runat="server" Style="width: 660px; position: relative;
                                                height: 100%; z-index: 100">
                                                <asp:UpdatePanel ID="CustomerPortfolioUpdatePanel" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:DataList ID="PortfolioDataList" runat="server" DataKeyField="CustomerID" DataSourceID="CustomerPortfolioDataSource"
                                                            Style="position: absolute; top: 20px; left: 0px; height: 557px; width: 634px;">
                                                            <ItemTemplate>
                                                                <asp:Label ID="AboutMeLabel" runat="server" Font-Bold="True" ForeColor="White" Style="position: absolute;
                                                                    top: 18px; left: 10px; z-index: 1;" Text="<%$ Resources:Resource, About %>" BorderColor="#336699"
                                                                    BorderStyle="Outset" BorderWidth="3px" Font-Size="Small" BackColor="#003366">
                                                                </asp:Label>
                                                                <asp:Label ID="ModifiedLabel" runat="server" Font-Bold="True" Style="left: 76px;
                                                                    position: absolute; top: 23px; height: 18px; width: 655px;" Text="<%$ Resources:Resource, ModifiedLabel %>"
                                                                    Visible='<%# Eval("Modified") %>' ForeColor="Maroon"></asp:Label>
                                                                <asp:Panel ID="AboutPanel" runat="server" Height="171px" Style="left: 50px; position: absolute;
                                                                    top: 55px; overflow: hidden" Width="535px" Wrap="False">
                                                                    <asp:TextBox ID="AboutTextBox" runat="server" Height="162px" Style="position: relative;
                                                                        top: 1px; left: 2px;" TextMode="MultiLine" Width="526px" MaxLength="1000" Text='<%# Eval("About", "{0}") %>'
                                                                        onKeyDown="CountLeft(this.value,this.value.length,1000,'LeftAboutLabel');" onKeyUp="CountLeft(this.id,this.value.length,1000,'LeftAboutLabel');"></asp:TextBox><asp:Panel
                                                                            ID="CharacterLeftAboutPanel" runat="server" Height="28px" Width="131px">
                                                                            <input id="LeftAboutLabel" style="position: absolute; top: 195px; width: 35px; color: #000080;"
                                                                                type="text" value="1000" />
                                                                            <asp:Label ID="CharactersLeftAboutLabel" runat="server" Text="<%$ Resources:Resource, CharactersLeftLabel %>"
                                                                                ForeColor="#000066" Width="200px" Style="position: absolute; top: 197px; left: 42px"></asp:Label>
                                                                        </asp:Panel>
                                                                </asp:Panel>
                                                                <asp:Label ID="SpecialNotesLabel" runat="server" Font-Bold="True" ForeColor="White"
                                                                    Style="position: absolute; top: 300px; z-index: 1; left: 8px;" Text="<%$ Resources:Resource, PortfolioSpecialNotes %>"
                                                                    BorderColor="#999999" BorderStyle="Outset" BorderWidth="3px" Font-Size="Small"
                                                                    BackColor="#003300"></asp:Label>
                                                                <cc1:FilteredTextBoxExtender ID="AboutTextBoxFilteredExtender" runat="server" InvalidChars="+-*/=)(*&amp;^%$#@!~`\|\]}[{&quot;':;?/&lt;&gt;"
                                                                    TargetControlID="AboutTextBox" FilterMode="InvalidChars">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <cc1:RoundedCornersExtender ID="AboutRoundedCornersExtender" runat="server" BorderColor="#003366"
                                                                    Radius="12" TargetControlID="AboutPanel" Color="#003366" Enabled="True">
                                                                </cc1:RoundedCornersExtender>
                                                                <asp:Panel ID="SpecialNotesPanel" runat="server" Style="left: 50px; top: 344px; position: absolute;
                                                                    z-index: 1; height: 205px; width: 533px;" Width="533px">
                                                                    <asp:TextBox ID="SpecialNotesTextBox" runat="server" Height="162px" Style="position: absolute;
                                                                        width: 520px; height: 195px; left: 3px; top: 1px;" TextMode="MultiLine" MaxLength="1000"
                                                                        Text='<%# Eval("SpecialNotes", "{0}") %>' onKeyDown="CountLeft(this.value,this.value.length,1000,'LeftSpecialNotesLabel');"
                                                                        onKeyUp="CountLeft(this.id,this.value.length,1000,'LeftSpecialNotesLabel');">></asp:TextBox>
                                                                    <asp:Panel ID="CharacterLeftSpecialNotesPanel" runat="server" Height="28px" Width="131px">
                                                                        <input id="LeftSpecialNotesLabel" style="position: absolute; top: 230px; width: 35px;
                                                                            color: #000080;" type="text" value="1000" />
                                                                        <asp:Label ID="CharacterLeftSpecialNotesLabel" runat="server" Text="<%$ Resources:Resource, CharactersLeftLabel %>"
                                                                            ForeColor="#000066" Width="200px" Style="position: absolute; top: 232px; left: 42px"></asp:Label>
                                                                    </asp:Panel>
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
                                                        <asp:LinkButton ID="UpdatePortfolioLinkButton" runat="server" Font-Bold="True" ForeColor="Maroon"
                                                            CssClass="UnderlineLink" Style="left: 656px; position: absolute; top: 599px;
                                                            height: 15px; width: 50px" CausesValidation="False" OnClick="UpdatePortfolioLinkButton_Click"
                                                            OnClientClick="FireAnimation();" Text="<%$ Resources:Resource, PortfolioUpdate %>"
                                                            Font-Size="Small"></asp:LinkButton>
                                                        <asp:LinkButton ID="CancelPortfolioLinkButton" runat="server" Font-Bold="True" ForeColor="Maroon"
                                                            CssClass="UnderlineLink" Style="left: 725px; position: absolute; top: 599px;
                                                            height: 15px; width: 50px" CausesValidation="False" OnClientClick="FireAnimation();"
                                                            Text="<%$ Resources:Resource, PortfolioCancel %>" Font-Size="Small"></asp:LinkButton>
                                                        <asp:ObjectDataSource ID="CustomerPortfolioDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                            SelectMethod="GetCustomerPortfolioOriginal" TypeName="CustomerPortfolioDataSetTableAdapters.CustomerPortfolioTableAdapter">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="CustomerID" SessionField="CustomerId" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </asp:Panel>
                                            <asp:Panel ID="FilterationPanel" runat="server" Width="173px" Height="80px" Style="top: 70px;
                                                overflow: hidden; left: 615px; position: relative; text-align: center;" BackColor="White">
                                                <table cellspacing="1" style="width: 100%; height: 100%">
                                                    <tr>
                                                        <td style="background-color: Maroon">
                                                            <asp:Label ID="FilterationHeaderLabel" runat="server" Text="<%$ Resources:Resource, FilterationHeaderLabel %>"
                                                                Font-Bold="True" Font-Size="Small" ForeColor="White"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="FilterationContent" Font-Bold="True" runat="server" Text="+-*/=)(*&^%$#@!~`\|\]}[{&quot;':;?/"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            <cc1:RoundedCornersExtender ID="FilterationPanelRoundedCornersExtender" runat="server"
                                                BorderColor="153, 0, 0" Color="153, 0, 0" Enabled="True" Radius="8" TargetControlID="FilterationPanel">
                                            </cc1:RoundedCornersExtender>
                                        
</ContentTemplate>
                                    



</cc1:TabPanel>
                                    <cc1:TabPanel ID="MessageTabPanel" runat="server" HeaderText="<%$ Resources:Resource, MessageTabPanel %>">
                                        <ContentTemplate>
                                            <table style="width: 100%; position: relative; height: 660px;">
                                                <tr>
                                                    <td rowspan="2" style="width: 95px; background-color: gainsboro; vertical-align: top;
                                                        text-align: center;">
                                                        <asp:UpdatePanel ID="MessageMenuUpdatePanel" runat="server">
                                                            <ContentTemplate>
                                                                <table style="position: relative; left: 0px; top: 0px;">
                                                                    <tr>
                                                                        <td style="">
                                                                            <asp:LinkButton ID="InboxLinkButton" runat="server" Font-Bold="True" ForeColor="Black"
                                                                                CssClass="UnderlineLink" Style="position: relative;" CausesValidation="False"
                                                                                Width="100px" Text="<%$ Resources:Resource, Inbox %>"></asp:LinkButton>
                                                                            <br />
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="">
                                                                            <asp:LinkButton ID="OutboxLinkButton" runat="server" Font-Bold="True" ForeColor="Black"
                                                                                CssClass="UnderlineLink" Style="position: relative;" CausesValidation="False"
                                                                                Width="100px" Text="<%$ Resources:Resource, Outbox %>"></asp:LinkButton>
                                                                            <br />
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="">
                                                                            <asp:LinkButton ID="SavedLinkButton" runat="server" Font-Bold="True" ForeColor="Black"
                                                                                CssClass="UnderlineLink" Style="position: relative;" CausesValidation="False"
                                                                                Width="100px" Text="<%$ Resources:Resource, Saved %>"></asp:LinkButton>
                                                                            <br />
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="">
                                                                            <asp:LinkButton ID="NumberofInboxLinkButton" runat="server" Visible="false" Style="position: relative;"
                                                                                CausesValidation="False" Width="100px" Text="<%$ Resources:Resource, Inbox %>"></asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="MessageGridView" EventName="SelectedIndexChanged" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td style="width: 100px; height: 300px; background-color: White;" valign="top">
                                                        <asp:Panel ID="UpperMessagePanel" runat="server" Height="300px" Width="680px" Style="z-index: 111;
                                                            overflow: hidden; background-color: #EFE7A7">
                                                            <asp:UpdatePanel ID="UpperMessageUpdatePanel" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:GridView ID="MessageGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                        DataKeyNames="MessageID" DataSourceID="CustomerMessageObjectDataSource" ForeColor="Black"
                                                                        AllowSorting="True" Style="position: relative; left: 1px; top: 0px; width: 678px;"
                                                                        GridLines="None" BackColor="white" BorderColor="#DEDFDE" BorderWidth="0px" CellPadding="4"
                                                                        OnRowDataBound="MessageGridView_RowDataBound" OnPreRender="MessageGridView_PreRender"
                                                                        BorderStyle="None" PageSize="9">
                                                                        <Columns>
                                                                            <asp:TemplateField>
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="MessageSelectorCheckBox" runat="server" Style="position: relative" /></ItemTemplate>
                                                                            </asp:TemplateField>
                                                                          <asp:TemplateField>
                                                                                <ItemTemplate>
                                                                                    <asp:Image ID="MessageResponseImage" runat="server" Height="16px" ImageUrl="~/Images/arrowback.gif"
                                                                                        Visible='<%#  (1 = Eval("Response", "{0:N}") ) %>' /></ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField DataField="MessageID" HeaderText="<%$ Resources:Resource, MessageIDLabel %>"
                                                                                ReadOnly="True" SortExpression="MessageID">
                                                                                <ControlStyle ForeColor="Black" />
                                                                                <HeaderStyle ForeColor="WHITE" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="SenderName" HeaderText="<%$ Resources:Resource, From %>"
                                                                                SortExpression="SenderName">
                                                                                <HeaderStyle ForeColor="WHITE" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="ReceiverName" HeaderText="<%$ Resources:Resource, To %>"
                                                                                SortExpression="ReceiverName"></asp:BoundField>
                                                                            <asp:BoundField DataField="Date" HeaderText="<%$ Resources:Resource, Date %>" SortExpression="Date"
                                                                                DataFormatString="{0:d}">
                                                                                <HeaderStyle ForeColor="WHITE" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                            </asp:BoundField>
                                                                            <asp:BoundField DataField="Title" HeaderText="<%$ Resources:Resource, TitleLabel %>"
                                                                                SortExpression="Title">
                                                                                <HeaderStyle ForeColor="WHITE" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                            </asp:BoundField>
                                                                            <asp:TemplateField ShowHeader="False">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="ViewLinkButton" runat="server" CausesValidation="False" CommandName="Select"
                                                                                        Font-Bold="true" ForeColor="#0000C0" CssClass="UnderlineLink" Text="<%$ Resources:Resource, View %>"></asp:LinkButton></ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                <ItemStyle ForeColor="WHITE" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField ShowHeader="False">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="False" CommandName="Delete"
                                                                                        Font-Bold="true" ForeColor="Maroon" CssClass="UnderlineLink" Text="<%$ Resources:Resource, Delete %>"
                                                                                        CommandArgument='<%# Eval("MessageID") %>'></asp:LinkButton></ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" Height="10px" ForeColor="White"
                                                                            CssClass="gridHeader" />
                                                                        <FooterStyle BackColor="#CCCC99" VerticalAlign="Bottom" />
                                                                        <PagerStyle BackColor="Gray" ForeColor="Black" HorizontalAlign="Center" Height="10px" />
                                                                        <SelectedRowStyle ForeColor="#6B696B" BorderColor="#6B696B" BorderWidth="2px" Font-Bold="True" />
                                                                        <AlternatingRowStyle BackColor="#EFE7A7" />
                                                                        <RowStyle BackColor="#EFE7A7" HorizontalAlign="Center" VerticalAlign="Top" />
                                                                        <EmptyDataTemplate>
                                                                            <asp:Label ID="EmptyMessageLabel" runat="server" Height="20px" Style="position: relative"
                                                                                Text="<%$ Resources:Resource, EmptyMessageLabel %>" Width="100%" BackColor="#6B696B"
                                                                                ForeColor="White"></asp:Label></EmptyDataTemplate>
                                                                        <EmptyDataRowStyle Font-Bold="true" BorderStyle="None" HorizontalAlign="Center" VerticalAlign="Top"
                                                                            Height="10px" />
                                                                    </asp:GridView>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="InboxLinkButton" EventName="Click" />
                                                                    <asp:AsyncPostBackTrigger ControlID="OutboxLinkButton" EventName="Click" />
                                                                    <asp:AsyncPostBackTrigger ControlID="SavedLinkButton" EventName="Click" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </asp:Panel>
                                                        <cc1:RoundedCornersExtender ID="UpperMessageRoundedCornersExtender" runat="server"
                                                            BorderColor="102, 102, 102" Color="102, 102, 102" Enabled="True" TargetControlID="UpperMessagePanel"
                                                            Radius="7">
                                                        </cc1:RoundedCornersExtender>
                                                        <asp:ObjectDataSource ID="CustomerMessageObjectDataSource" runat="server" DeleteMethod="DeleteCustomerMessageInbox"
                                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomerMessageInbox"
                                                            TypeName="CustomerMessageDataSetTableAdapters.CustomerMessageTableAdapter" UpdateMethod="UpdateCustomerMessageInbox"
                                                            InsertMethod="SaveCustomerMessage">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="MessageID" Type="Int32" />
                                                            </DeleteParameters>
                                                            <InsertParameters>
                                                                <asp:Parameter Name="MessageID" Type="Int32" />
                                                                <asp:Parameter Name="MessageMode" Type="Int32" />
                                                            </InsertParameters>
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="CustomerID" SessionField="CustomerID" Type="Int32" />
                                                            </SelectParameters>
                                                            <UpdateParameters>
                                                                <asp:Parameter Name="MessageID" Type="Int32" />
                                                            </UpdateParameters>
                                                        </asp:ObjectDataSource>
                                                        <asp:UpdatePanel ID="CustomMessageMenuUpdatePanel" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Panel runat="server" ID="CustomMessageMenuPanel" Height="28px" Style="top: 332px;
                                                                    vertical-align: bottom; text-align: center; height: 28px; width: 680px;" align="center"
                                                                    Width="100%">
                                                                    <table align="center" style="width: 500px">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Button ID="SelectAllButton" runat="server" Text="<%$ Resources:Resource, SelectAllButton %>"
                                                                                    CausesValidation="False" Font-Bold="True" ForeColor="#400000" Width="136px" Font-Size="9" />
                                                                            </td>
                                                                            <td>
                                                                                <asp:Button ID="DeselectAllButton" runat="server" Text="<%$ Resources:Resource, DeselectAllButton %>"
                                                                                    CausesValidation="False" Font-Bold="True" ForeColor="#400000" Width="136px" Font-Size="9" />
                                                                            </td>
                                                                            <td>
                                                                                <asp:Button ID="DeleteButton" runat="server" Text="<%$ Resources:Resource, Delete %>"
                                                                                    CausesValidation="False" Font-Bold="True" ForeColor="#400000" Width="136px" Font-Size="9" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </asp:Panel>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; height: 287px; background-color: #FFFFFF;">
                                                        <asp:UpdatePanel ID="LowerMessageUpdatePanel" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Panel ID="LowerMessagePanel" runat="server" BackColor="White" Style="z-index: 1;
                                                                    overflow: hidden; position: relative; max-width: 680px; width: 682px; display: block;
                                                                    white-space: normal;">
                                                                    <asp:DetailsView ID="DetailsMessageView" runat="server" Height="255px" Style="position: relative;
                                                                        vertical-align: top; top: 0px; left: 1px; width: 655px;" AutoGenerateRows="False"
                                                                        DataSourceID="CustomerMessageDetailObjectDataSource" CellPadding="4" ForeColor="Black"
                                                                        GridLines="None" RowStyle-VerticalAlign="Top">
                                                                        <Fields>
                                                                            <asp:TemplateField>
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="MessageDescriptionHeader" runat="server" Style="position: relative;
                                                                                        z-index: 1; top: 3px;" Text="<%$ Resources:Resource, DescriptionLabel %>" Font-Bold="True"
                                                                                        ForeColor="#400000"></asp:Label>
                                                                                    <hr style="background-color: Maroon" />
                                                                                    <asp:Label ID="MessageDescription" runat="server" Text='<%# Bind("Description", "{0}") %>'
                                                                                        Width="655px" Style="max-width: 655px; width: 655px; display: block; white-space: normal;"
                                                                                        BackColor="White"></asp:Label></ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Fields>
                                                                        <FooterStyle BackColor="#CCCC99" />
                                                                        <RowStyle BackColor="#FFFFFF" />
                                                                        <PagerStyle BackColor="#FFFFFF" ForeColor="Black" HorizontalAlign="Right" />
                                                                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                                                        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                                                        <AlternatingRowStyle BackColor="#FFFFFF" />
                                                                    </asp:DetailsView>
                                                                    &#160;&#160;
                                                                    <asp:LinkButton ID="ReplyLinkButton" runat="server" CausesValidation="False" Font-Bold="True"
                                                                        CssClass="UnderlineLink" ForeColor="#400000" Style="position: relative" Visible="False"
                                                                        OnClientClick="javascript: $find('DelayModalPopUpExtender').show(); " Text="<%$ Resources:Resource, ReplyButton %>"></asp:LinkButton>&#160;&nbsp;<asp:LinkButton
                                                                            ID="SaveLinkButton" runat="server" CausesValidation="False" Font-Bold="True"
                                                                            CssClass="UnderlineLink" ForeColor="#400000" OnClick="SaveLinkButton_Click" Style="position: relative"
                                                                            Visible="False" OnClientClick="javascript: $find('DelayModalPopUpExtender').show(); "
                                                                            Text="<%$ Resources:Resource, Save %>"></asp:LinkButton></asp:Panel>
                                                                <cc1:RoundedCornersExtender ID="LowerMessagePanel_RoundedCornersExtender" runat="server"
                                                                    Enabled="True" Radius="7" Color="DarkGray" BorderColor="DarkGray" TargetControlID="LowerMessagePanel">
                                                                </cc1:RoundedCornersExtender>
                                                                <asp:ObjectDataSource ID="CustomerMessageDetailObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                    SelectMethod="GetCustomerMessageInbox" TypeName="CustomerMessageDataSetTableAdapters.CustomerMessageDetailTableAdapter">
                                                                    <SelectParameters>
                                                                        <asp:SessionParameter Name="CustomerID" SessionField="CustomerID" Type="Int32" />
                                                                        <asp:ControlParameter ControlID="MessageGridView" Name="MessageID" PropertyName="SelectedValue"
                                                                            Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="MessageGridView" EventName="SelectedIndexChanged" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                            </table>
                                        
</ContentTemplate>
                                    



</cc1:TabPanel>
                                    <cc1:TabPanel ID="ProjectTabPanel" runat="server" HeaderText="<%$ Resources:Resource, ProjectTabPanel %>">
                                        <ContentTemplate>
                                            <asp:Panel ID="ProjectPanel" runat="server" BackColor="White" Height="150%" Style="left: 0px;
                                                position: relative; top: 1px; height: 292px;" Width="100%">
                                                <asp:UpdatePanel ID="ProjectUpdatePanel" runat="server">
                                                    <ContentTemplate>
                                                        <asp:GridView ID="ProjectGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                            CellPadding="4" DataKeyNames="ProjectID" DataSourceID="CustomerProjectDataSource"
                                                            ForeColor="#333333" GridLines="None" Style="position: relative" Width="100%"
                                                            AllowSorting="True" PageSize="9">
                                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle"
                                                                Font-Size="Small" />
                                                            <Columns>
                                                                <asp:BoundField DataField="ProjectID" HeaderText="<%$ Resources:Resource, ProjectIDLabel %>"
                                                                    ReadOnly="True" SortExpression="ProjectID" />
                                                                <asp:BoundField DataField="ProjectTitle" HeaderText="<%$ Resources:Resource, ProjectTitle %>"
                                                                    SortExpression="ProjectTitle" />
                                                                <asp:BoundField DataField="StartDate" HeaderText="<%$ Resources:Resource, ProjectStartDate %>"
                                                                    SortExpression="StartDate" />
                                                                <asp:BoundField DataField="EndDate" HeaderText="<%$ Resources:Resource, ProjectEndDate %>"
                                                                    SortExpression="EndDate" />
                                                                <asp:BoundField DataField="AmountOffered" HeaderText="<%$ Resources:Resource, ProjectAmountOffered %>"
                                                                    SortExpression="AmountOffered" />
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="ViewProjectLinkButton" runat="server" CausesValidation="False"
                                                                            CommandName="select" Font-Bold="True" ForeColor="#000040" OnClientClick="FireAnimation();"
                                                                            Style="position: relative" Text="<%$ Resources:Resource, ViewProjectLinkButton %>"
                                                                            OnClick="ViewProjectLinkButton_Click" CssClass="UnderlineLink"></asp:LinkButton></ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="DeleteProjectLinkButton" runat="server" Font-Bold="True" ForeColor="#400000"
                                                                            Style="position: relative" CausesValidation="False" CommandName="select" OnClientClick="FireAnimation();"
                                                                            OnClick="DeleteProjectLinkButton_Click" Text="<%$ Resources:Resource, DeleteProjectLinkButton %>" CssClass="UnderlineLink"></asp:LinkButton></ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                            <PagerStyle BackColor="Maroon" ForeColor="White" HorizontalAlign="Center" Font-Bold="True" />
                                                            <HeaderStyle BackColor="Maroon" Font-Bold="True" ForeColor="White" Height="10px" CssClass="gridHeader" />
                                                            <EditRowStyle BackColor="#999999" />
                                                            <AlternatingRowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                            <EmptyDataTemplate>
                                                                <asp:Label ID="EmptyProjectLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, EmptyProjectLabel %>"
                                                                    ForeColor="White" Width="100%"></asp:Label></EmptyDataTemplate>
                                                            <EmptyDataRowStyle BackColor="#990000" Font-Bold="true" BorderStyle="None" HorizontalAlign="Center" />
                                                            <SelectedRowStyle ForeColor="Maroon" BorderColor="Maroon" BorderWidth="2px" Font-Bold="True" />
                                                        </asp:GridView>
                                                        <asp:ObjectDataSource ID="CustomerProjectDataSource" runat="server" DeleteMethod="DeleteProject"
                                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomerProject"
                                                            TypeName="CustomerProjectDataSetTableAdapters.ProjectRequirementsTableAdapter">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="ProjectID" Type="Int32" />
                                                                <asp:Parameter Name="PosterID" Type="Int32" />
                                                                <asp:Parameter Name="PosterRole" Type="String" />
                                                            </DeleteParameters>
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="CustomerId" SessionField="CustomerId" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <asp:Panel ID="PanelAddProject" runat="server" CssClass="BlueMenublock" Height="16px"
                                                    Style="z-index: 100; left: 333px; position: absolute; top: 293px" Width="130px"
                                                    Font-Size="10pt">
                                                    <ul>
                                                        <li>
                                                            <asp:LinkButton ID="AddNewProjectLinkButton" runat="server" Font-Bold="True" Font-Size="Small"
                                                                Width="112px" CausesValidation="False" Height="13px" OnClientClick="FireAnimation();"
                                                                Text="<%$ Resources:Resource, AddNewProjectLinkButton %>"></asp:LinkButton></li></ul>
                                                </asp:Panel>
                                                <cc1:RoundedCornersExtender ID="ProjectPanelRoundedCornersExtender" runat="server"
                                                    BorderColor="64, 0, 0" Color="64, 0, 0" Radius="8" TargetControlID="ProjectPanel"
                                                    Enabled="True">
                                                </cc1:RoundedCornersExtender>
                                            </asp:Panel>
                                            <asp:Panel ID="DetailProjectPanel" runat="server" BackColor="White" Height="150%"
                                                Style="left: -3px; position: relative; top: 25px; height: 296px; overflow: hidden"
                                                Width="100%">
                                                <table style="width: 98%; position: relative; height: 66%; left: 2px; top: 13px;">
                                                    <tr>
                                                        <td style="width: 29%; height: 91%; vertical-align: middle; background-color: white;"
                                                            rowspan="1">
                                                            <asp:UpdatePanel ID="DetailProjectSpecificationUpdatePanel" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:Panel ID="DetailProjectSpecificationPanel" runat="server" Style="position: absolute;
                                                                        left: 10px; top: 42px; z-index: 1; height: 181px; width: 244px;">
                                                                        <asp:FormView ID="DetailProjectSpecificationFormView" runat="server" DataKeyNames="ProjectID"
                                                                            DataSourceID="DetailProjectDataSource" Style="position: absolute;">
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
                                                                                            <asp:Label ID="Category" runat="server" Style="position: relative" Text='<%# Bind("CategoryName") %>'></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="width: 100px">
                                                                                            <asp:Label ID="JobTitleLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, JobTitleLabel %>"
                                                                                                Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                                        </td>
                                                                                        <td style="width: 100px; text-align: center;">
                                                                                            <asp:Label ID="JobTitle" runat="server" Style="position: relative" Text='<%# Bind("JobTitle") %>'></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="width: 100px">
                                                                                            <asp:Label ID="ExperienceIDLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, ExperienceLabel %>"
                                                                                                Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                                        </td>
                                                                                        <td style="width: 100px; text-align: center;">
                                                                                            <asp:Label ID="ExperienceID" runat="server" Style="position: relative" Text='<%# Bind("Experience") %>'></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="width: 100px">
                                                                                            <asp:Label ID="CrewNumberLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, NumberofCrewsLabel %>"
                                                                                                Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                                        </td>
                                                                                        <td style="width: 100px; text-align: center;">
                                                                                            <asp:Label ID="CrewNumber" runat="server" Style="position: relative" Text='<%# Bind("CrewNumber") %>'></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="width: 100px">
                                                                                            <asp:Label ID="LicensedLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, LicensedLabel %>"
                                                                                                Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                                        </td>
                                                                                        <td style="width: 100px; text-align: center;">
                                                                                            <asp:Label ID="Licensed" runat="server" Style="position: relative" Text='<%# Bind("Licensed") %>'></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="width: 100px">
                                                                                            <asp:Label ID="InsuredLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, InsuredLabel %>"
                                                                                                Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                                        </td>
                                                                                        <td style="width: 100px; text-align: center;">
                                                                                            <asp:Label ID="Insured" runat="server" Style="position: relative" Text='<%# Bind("Insured") %>'></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="width: 100px">
                                                                                            <asp:Label ID="RelocationLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, RelocationLabel %>"
                                                                                                Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                                                        </td>
                                                                                        <td style="width: 100px; text-align: center;">
                                                                                            <asp:Label ID="Relocation" runat="server" Style="position: relative" Text='<%# Bind("Relocation") %>'></asp:Label>
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
                                                                            </ItemTemplate>
                                                                            <EmptyDataRowStyle BackColor="SlateGray" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                            <EmptyDataTemplate>
                                                                                <asp:Label ID="ProjectSelectionLabel" runat="server" Font-Bold="True" ForeColor="White"
                                                                                    Height="26px" Style="position: relative" Text="<%$ Resources:Resource, ProjectSelectionLabel %>"
                                                                                    Width="245px"></asp:Label></EmptyDataTemplate>
                                                                        </asp:FormView>
                                                                        <asp:LinkButton ID="EditProjectLinkButton" runat="server" CausesValidation="False"
                                                                            Visible="false" OnClientClick="FireAnimation();" Font-Bold="True" OnClick="EditProjectLinkButton_Click"
                                                                            CssClass="UnderlineLink" Style="left: 217px; position: absolute; top: 195px" Width="59px" ForeColor="#400000"
                                                                            Text="<%$ Resources:Resource, EditProjectLinkButton %>"></asp:LinkButton>
                                                                    </asp:Panel>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="ProjectGridView" EventName="SelectedIndexChanged" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                            <asp:ObjectDataSource ID="DetailProjectDataSource" runat="server" SelectMethod="GetProjectDetailRequirement"
                                                                TypeName="ProjectExtraDataSetTableAdapters.ProjectRequirementsTableAdapter">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="ProjectGridView" Name="ProjectID" PropertyName="SelectedValue"
                                                                        Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                        </td>
                                                        <td style="width: 31%; height: 91%; vertical-align: middle; background-color: white;
                                                            text-align: right;">
                                                            <asp:UpdatePanel ID="DetailProjectPhotoUpdatePanel" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:FormView ID="DetailProjectPhotoFormView" runat="server" DataKeyNames="PhotoID"
                                                                        DataSourceID="ProjectPhotoDetailDataSource" Style="position: absolute; left: 255px;
                                                                        top: 43px; width: 254px; height: 161px; z-index: 2;" Width="290px" AllowPaging="True">
                                                                        <ItemTemplate>
                                                                            &#160;<asp:Image ID="ProjectPhotoImage" runat="server" Height="182px" ImageUrl='<%# Bind("PhotoPath", "{0}") %>'
                                                                                Style="position: relative" Width="229px" />
                                                                            <br />
                                                                        </ItemTemplate>
                                                                        <PagerStyle Font-Bold="True" ForeColor="Maroon" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                    </asp:FormView>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="ProjectGridView" EventName="SelectedIndexChanged" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                            &#160;&#160;
                                                            <asp:ObjectDataSource ID="ProjectPhotoDetailDataSource" runat="server" SelectMethod="GetProjectPhoto"
                                                                TypeName="ViewProjectDataSetTableAdapters.ProjectPhotoTableAdapter" OldValuesParameterFormatString="original_{0}">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="ProjectGridView" Name="ProjectID" PropertyName="SelectedValue"
                                                                        Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                        </td>
                                                        <td style="width: 29%; height: 91%; vertical-align: middle; background-color: white;">
                                                            <asp:UpdatePanel ID="DetailProjectStatusUpdatePanel" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:DetailsView ID="DetailProjectStatusDetailView" runat="server" AutoGenerateRows="False"
                                                                        DataSourceID="ProjectExtraDataSource" Height="201px" Style="position: absolute;
                                                                        left: 550px; top: 45px; z-index: 3; height: 201px; width: 221px;" Width="221px"
                                                                        GridLines="None" BorderColor="SlateGray" BorderStyle="Outset" BorderWidth="1px">
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
                                                                        <FieldHeaderStyle BackColor="SlateGray" Font-Bold="True" ForeColor="White" Width="50%" />
                                                                    </asp:DetailsView>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="ProjectGridView" EventName="SelectedIndexChanged" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                            <asp:ObjectDataSource ID="ProjectExtraDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                SelectMethod="GETCustomProjectSelection" TypeName="ProjectExtraDataSetTableAdapters.CustomProjectSelectionTableAdapter">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="ProjectGridView" Name="ProjectID" PropertyName="SelectedValue"
                                                                        Type="Int32" />
                                                                    <asp:SessionParameter Name="LCID" SessionField="Language" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
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
                                                        <asp:Panel ID="FavoritePanel" runat="server" Height="642px" Style="left: 0px; position: relative;
                                                            overflow: hidden; top: 0px" Width="100%">
                                                            <asp:UpdatePanel ID="FavoriteUpdatePanel" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:ObjectDataSource ID="CustomerFavoriteDataSource" runat="server" DeleteMethod="DeleteCustomerFavorite"
                                                                        SelectMethod="GetCustomerFavorite" TypeName="CustomerFavoriteTableAdapters.CustomerFavoriteDataTableTableAdapter">
                                                                        <DeleteParameters>
                                                                            <asp:Parameter Name="FavoriteID" Type="Int32" />
                                                                        </DeleteParameters>
                                                                        <SelectParameters>
                                                                            <asp:SessionParameter Name="CustomerID" SessionField="CustomerId" Type="Int32" />
                                                                        </SelectParameters>
                                                                    </asp:ObjectDataSource>
                                                                    <asp:GridView ID="FavoriteGridView" runat="server" AllowPaging="True" AllowSorting="True"
                                                                        CellPadding="4" DataSourceID="CustomerFavoriteDataSource" ForeColor="#333333"
                                                                        GridLines="None" AutoGenerateColumns="False" DataKeyNames="FavoriteID" Width="100%"
                                                                        PageSize="8">
                                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                        <Columns>
                                                                            <asp:TemplateField>
                                                                                <ItemTemplate>
                                                                                    <asp:Image ID="ProfessionalPhoto" runat="server" Height="65px" ImageUrl='<%# Bind("PhotoPath", "{0}") %>'
                                                                                        Width="65px" /></ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="<%$ Resources:Resource, FavoriteID %>" SortExpression="ProID">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="ProID1" runat="server" Text='<%# Bind("ProID") %>'></asp:Label></ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="<%$ Resources:Resource, UserName %>" SortExpression="UserName">
                                                                                <ItemTemplate>
                                                                                    <asp:HyperLink ID="ProfessionalHyperlink" runat="server" CssClass="UnderlineLink" NavigateUrl='<%# Eval("ProID", "../ViewProfessionalProfile.aspx?PID={0}") %>'
                                                                                        Target="_blank" Text='<%# Eval("Username") %>'></asp:HyperLink></ItemTemplate>
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
                                                                            <asp:TemplateField>
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="InviteToProjectLinkButton1" runat="server" BackColor="#284775"
                                                                                        CausesValidation="False" Font-Bold="True" Font-Size="9pt" ForeColor="White" OnClick="InviteToProjectLinkButton_Click"
                                                                                        Style="position: relative; text-align: center;" Width="102px" CommandName="select"
                                                                                        OnClientClick="FireAnimation();" CssClass="UnderlineLink" Text="<%$ Resources:Resource, FavoriteInviteToProjectLinkButton %>"></asp:LinkButton>
                                                                                    <br />
                                                                                    <br />
                                                                                    <asp:LinkButton ID="DeleteFavoriteLinkButton1" runat="server" BackColor="#284775"
                                                                                        CausesValidation="False" CommandName="delete" Font-Bold="True" Font-Size="9pt"
                                                                                        ForeColor="White" Style="position: relative; top: 0px; left: 0px; text-align: center;"
                                                                                        Width="102px" CssClass="UnderlineLink" Text="<%$ Resources:Resource, FavoriteDelete %>"></asp:LinkButton>
                                                                                    <br />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField>
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="AskQuestionLinkButton1" runat="server" BackColor="#400000" CausesValidation="False"
                                                                                        Font-Bold="True" Font-Size="10pt" ForeColor="White" OnClick="AskQuestionLinkButton_Click"
                                                                                        Style="position: relative; text-align: center;" Width="102px" CommandName="select"
                                                                                        OnClientClick="FireAnimation();" CssClass="UnderlineLink" Text="<%$ Resources:Resource, FavoriteAskQuestionLinkButton %>"></asp:LinkButton>
                                                                                    <br />
                                                                                    <br />
                                                                                    <asp:HyperLink ID="ViewProfileLinkButton1" runat="server" BackColor="#400000" CausesValidation="False"
                                                                                        Font-Bold="True" Font-Size="10pt" ForeColor="White" Style="position: relative;
                                                                                        text-align: center;" Width="102px" NavigateUrl='<%# Eval("ProID", "../ViewProfessionalProfile.aspx?PID={0}") %>'
                                                                                        Target="_blank" CssClass="UnderlineLink" Text="<%$ Resources:Resource, FavoriteViewProfile %>">
                                                                                    </asp:HyperLink></ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                        <PagerStyle BackColor="Silver" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                        <EmptyDataTemplate>
                                                                            <asp:Label ID="EmptyFavoriteLabel" runat="server" BackColor="#666666" Font-Bold="True"
                                                                                ForeColor="White" Height="20px" Text="<%$ Resources:Resource, EmptyFavoriteLabel %>"
                                                                                Width="100%" Style="position: absolute; top: 5px; left: 0px; height: 28px; text-align: center;
                                                                                vertical-align: top"></asp:Label>
                                                                        </EmptyDataTemplate>
                                                                        <SelectedRowStyle ForeColor="gray" BorderColor="gray" BorderWidth="2px" Font-Bold="True" />
                                                                        <HeaderStyle BackColor="Silver" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center"
                                                                            Height="20px" CssClass="gridHeader" />
                                                                        <EditRowStyle BackColor="#999999" />
                                                                        <AlternatingRowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                    </asp:GridView>
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
                                    <cc1:TabPanel ID="InvitationTabPanel" runat="server" HeaderText="<%$ Resources:Resource, InvitationTabPanel %>">
                                        <ContentTemplate>
                                            <asp:Panel ID="InvitationPanel" runat="server" Height="655px" Style="left: 0px; position: relative;
                                                overflow: hidden; top: 0px" Width="100%">
                                                <asp:UpdatePanel ID="InvitationUpdatePanel" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Label ID="InvitationSentLabel" runat="server" BackColor="#003366" Font-Bold="True"
                                                            Height="20px" Style="position: relative" Text="<%$ Resources:Resource, InvitationSentLabel %>"
                                                            Width="100%" ForeColor="White"></asp:Label><asp:GridView ID="InvitationGridView"
                                                                runat="server" DataSourceID="InvitationDataSource" AllowPaging="True" AllowSorting="True"
                                                                AutoGenerateColumns="False" DataKeyNames="InvitationID" CellPadding="4" ForeColor="#333333"
                                                                GridLines="None" Width="100%" HorizontalAlign="Center">
                                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                <EmptyDataRowStyle BackColor="#F7F6F3" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                <Columns>
                                                                    <asp:BoundField DataField="InvitationID" HeaderText="<%$ Resources:Resource, InvitationIDLabel %>"
                                                                        ReadOnly="True" SortExpression="InvitationID" />
                                                                    <asp:BoundField DataField="EventDate" HeaderText="<%$ Resources:Resource, InvitationDate %>"
                                                                        SortExpression="EventDate" />
                                                                    <asp:TemplateField HeaderText="<%$ Resources:Resource, To %>" SortExpression="ProfessionalUsername">
                                                                        <ItemTemplate>
                                                                            <asp:HyperLink ID="ProfessionalHyperLink" runat="server" CssClass="UnderlineLink" NavigateUrl='<%# Eval("ReceiverID", "../ViewProfessionalProfile.aspx?PID={0}") %>'
                                                                                Target="_blank" Text='<%# Eval("ProfessionalUserName") %>'></asp:HyperLink></ItemTemplate>
                                                                        <ControlStyle ForeColor="#000099" />
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="ReceiverID" HeaderText="<%$ Resources:Resource, ID %>"
                                                                        SortExpression="ReceiverID" Visible="true" />
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:Image ID="ProfessionalImage" runat="server" Height="50px" ImageUrl='<%# Bind("ProfessionalPhotoPath", "{0}") %>'
                                                                                Width="50px" /></ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="ProjectID" HeaderText="<%$ Resources:Resource, ProjectIDLabel %>"
                                                                        SortExpression="ProjectID" />
                                                                    <asp:TemplateField SortExpression="ProjectlPhotoPath">
                                                                        <ItemTemplate>
                                                                            <asp:Image ID="ProjectImage" runat="server" Height="50px" ImageUrl='<%# Bind("ProjectlPhotoPath", "{0}") %>'
                                                                                Width="50px" /></ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:CommandField ShowDeleteButton="True" />
                                                                </Columns>
                                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                <SelectedRowStyle ForeColor="#003366" BorderColor="#003366" BorderWidth="2px" Font-Bold="True" />
                                                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="gridHeader"
                                                                    VerticalAlign="Middle" Height="20px" />
                                                                <EditRowStyle BackColor="#999999" />
                                                                <EmptyDataTemplate>
                                                                    <asp:Label ID="EmptyInvitationLabel" runat="server" Height="20px" Style="text-align: center"
                                                                        Text="<%$ Resources:Resource, EmptyInvitationLabel %>" Width="100%"></asp:Label></EmptyDataTemplate>
                                                                <AlternatingRowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                            </asp:GridView>
                                                        <asp:ObjectDataSource ID="InvitationDataSource" runat="server" DeleteMethod="DeleteCustomerInvitation"
                                                            SelectMethod="GetCustomerInvitationSent" TypeName="CustomerInvitationSentTableAdapters.CustomerInvitationSentTableAdapter">
                                                            <DeleteParameters>
                                                                <asp:SessionParameter Name="CustomerID" SessionField="CustomerId" Type="Int32" />
                                                                <asp:ControlParameter ControlID="InvitationGridView" Name="InvitationID" PropertyName="SelectedValue"
                                                                    Type="Int32" />
                                                            </DeleteParameters>
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="CustomerID" SessionField="CustomerId" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </asp:Panel>
                                            <cc1:RoundedCornersExtender ID="InvitationRoundedCornersExtender" runat="server"
                                                BorderColor="MidnightBlue" Color="MidnightBlue" Enabled="True" TargetControlID="InvitationPanel">
                                            </cc1:RoundedCornersExtender>
                                        
</ContentTemplate>
                                    



</cc1:TabPanel>
                                    <cc1:TabPanel ID="WatchListTabPanel" runat="server">
                                        <HeaderTemplate>
                                            <img src="../../Images/Magnifyingglass.gif" alt="image" width="20" height="20">
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <asp:Panel ID="WatchListPanel" runat="server" Height="649px" Style="position: relative;
                                                overflow: hidden; top: 0px;" BackColor="White">
                                                <asp:UpdatePanel ID="WatchListUpdatePanel" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Label ID="WatchListLabel" runat="server" BackColor="#414952" Font-Bold="True"
                                                            Height="20px" Style="position: relative" Text="<%$ Resources:Resource, WatchListLabel %>"
                                                            Width="100%" ForeColor="White"></asp:Label>

                                                        <asp:GridView ID="WatchListGridView" runat="server" AutoGenerateColumns="False" DataSourceID="WatchListObjectDataSource"
                                                            CellPadding="4"
                                                            ForeColor="#333333" GridLines="None" DataKeyNames="ProjectID" HorizontalAlign="Center"
                                                            OnSelectedIndexChanged="WatchListGridView_SelectedIndexChanged" AllowPaging="True"
                                                            AllowSorting="True" PageSize="23" Width="100%">
                                                                                                                            <EmptyDataRowStyle BackColor="#414952" HorizontalAlign="Center" 
                                                                                                                                VerticalAlign="Top" BorderStyle="None" BorderWidth="0px" />
                                                            <Columns>
                                                                <asp:BoundField DataField="ProjectID" HeaderText="<%$ Resources:Resource, ProjectIDLabel %>"
                                                                    SortExpression="ProjectID">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="ProjectTitle" HeaderText="<%$ Resources:Resource, ProjectTitle %>"
                                                                    SortExpression="ProjectTitle">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="HighestBid" HeaderText="<%$ Resources:Resource, HighestBidLabel %>"
                                                                    SortExpression="HighestBid">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Resource, BidderUsername %>" SortExpression="HighestBidUsername">
                                                                    <ItemTemplate>
                                                                        <asp:HyperLink ID="ViewBidderHyperLink" runat="server" Text='<%# Bind("HighestBidUsername") %>'
                                                                            CssClass="UnderlineLink" NavigateUrl='<%# Eval("HighestBidderID", "../ViewProfessionalProfile.aspx?PID={0}") %>'
                                                                            ForeColor="#003366" Font-Bold="true" Target="_blank"></asp:HyperLink></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="NumberofBids" HeaderText="<%$ Resources:Resource, NumberofBids %>"
                                                                    SortExpression="NumberofBids">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Status" HeaderText="<%$ Resources:Resource, Status %>"
                                                                    SortExpression="Status">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField ShowHeader="False">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="ViewWatchListProject" runat="server" CausesValidation="False"
                                                                            CommandName="Select" Font-Bold="True" ForeColor="Navy" CssClass="UnderlineLink"
                                                                            Text="<%$ Resources:Resource, ViewProjectLinkButton %>" OnClick="ViewWatchListProject_Click"
                                                                            OnClientClick="FireAnimation();"></asp:LinkButton></ItemTemplate>
                                                                    <ItemStyle Font-Bold="True" ForeColor="Maroon" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="DeleteWatchListProject" runat="server" CausesValidation="False"
                                                                            CommandName="Select" Font-Bold="True" ForeColor="Maroon" CssClass="UnderlineLink"
                                                                            Style="position: relative" OnClick="DeleteWatchListProject_Click" OnClientClick="FireAnimation();"
                                                                            Text="<%$ Resources:Resource, DeleteProjectLinkButton %>"></asp:LinkButton></ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Watch ID" InsertVisible="False" SortExpression="WatchID"
                                                                    Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="WatchLabelID" runat="server" Text='<%# Bind("WatchID") %>'></asp:Label></ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                            <PagerStyle BackColor="#4F5A64" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <SelectedRowStyle ForeColor="#708090" BorderColor="#708090" BorderWidth="2px" Font-Bold="True" />
                                                            <HeaderStyle BackColor="#4F5A64" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                                                                CssClass="gridHeader" />
                                                            <EditRowStyle BackColor="#999999" />
                                                            <AlternatingRowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                            <EmptyDataTemplate>
                                                                <asp:Label ID="EmptyWatchListProject" runat="server" Height="20px" Style="text-align: center"
                                                                    Text="<%$ Resources:Resource, EmptyWatchListProject %>" Width="100%" BackColor="#4F5A64"
                                                                    ForeColor="White" Font-Bold="true"></asp:Label></EmptyDataTemplate>
                                                        </asp:GridView>
                                                        <asp:ObjectDataSource ID="WatchListObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                            SelectMethod="GetCustomerWatchList" TypeName="CustomerWatchListDataSetTableAdapters.GetCustomerWatchListTableAdapter">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="CustomerID" SessionField="Customerid" Type="Int32" />
                                                                <asp:SessionParameter Name="LCID" SessionField="Language" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <cc1:RoundedCornersExtender ID="WatchListRoundedCornersExtender" runat="server" TargetControlID="WatchListPanel"
                                                    Color="SlateGray" Radius="9" Enabled="True" BorderColor="SlateGray">
                                                </cc1:RoundedCornersExtender>
                                            </asp:Panel>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="TransactionTabPanel" runat="server" HeaderText="<%$ Resources:Resource, Transaction %>">
                                        <ContentTemplate>
                                            <asp:Panel ID="ActiveTransactionPanel" runat="server" Height="200px" Style="left: 0px;
                                                position: relative; top: 0px" Width="100%" BackColor="White">
                                                <asp:UpdatePanel ID="ActiveTransactionUpdatePanel" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Label ID="ActiveTransactionLabel" runat="server" BackColor="DarkSlateGray" Font-Bold="True"
                                                            Height="10%" Style="position: relative" Text="<%$ Resources:Resource, PaymentDue %>"
                                                            Width="100%" ForeColor="White"></asp:Label>
                                                        <asp:GridView ID="ActiveTransactionGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                            CellPadding="4" DataKeyNames="TransactionID" DataSourceID="PaymentDueObjectDataSource"
                                                            ForeColor="#333333" GridLines="None" Style="position: relative" Width="100%"
                                                            Font-Bold="True" Height="90%" PageSize="3" EnableModelValidation="True">
                                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                                                            <Columns>
                                                                <asp:BoundField DataField="TransactionID" HeaderText="<%$ Resources:Resource, TransactionID %>"
                                                                    ReadOnly="True" SortExpression="TransactionID" />
                                                                <asp:BoundField DataField="ProjectID" HeaderText="<%$ Resources:Resource, ProjectIDLabel %>"
                                                                    SortExpression="ProjectID" />
                                                                <asp:BoundField DataField="ProjectAmount" HeaderText="<%$ Resources:Resource, ProjectAmount %>"
                                                                    SortExpression="ProjectAmount" />
                                                                <asp:BoundField DataField="DateCharged" HeaderText="<%$ Resources:Resource, Date %>"
                                                                    SortExpression="DateCharged" />
                                                                <asp:BoundField DataField="StatusID" HeaderText="<%$ Resources:Resource, Phase %>"
                                                                    SortExpression="StatusID" />
                                                                <asp:BoundField DataField="Currency" HeaderText="<%$ Resources:Resource, Currency %>"
                                                                    SortExpression="Currency" />
                                                                <asp:BoundField DataField="PaymentDue" HeaderText="<%$ Resources:Resource, PaymentDue %>"
                                                                    SortExpression="PaymentDue" />
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="ActiveTransactionDetailLinkButton" runat="server" CausesValidation="False"
                                                                            CommandName="select" Font-Bold="True" ForeColor="#003333" Style="position: relative" CssClass="UnderlineLink"
                                                                            OnClick="ActiveTransactionDetailLinkButton_Click" Text="<%$ Resources:Resource, Detail %>"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="ActiveTransactionPayNowLinkButton" runat="server" CausesValidation="False"
                                                                            CommandName="select" Font-Bold="True" ForeColor="Maroon" CssClass="UnderlineLink" Style="position: relative"
                                                                            OnClick="ActiveTransactionPayNowLinkButton_Click" Text="<%$ Resources:Resource, PayNow %>"></asp:LinkButton></ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                            <PagerStyle BackColor="#003300" ForeColor="White" HorizontalAlign="Center" />
                                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                            <HeaderStyle BackColor="#003300" Font-Bold="True" ForeColor="White" BorderStyle="None"
                                                                HorizontalAlign="Center" Font-Strikeout="False" Font-Underline="False" CssClass="gridHeader"  />
                                                            <EditRowStyle BackColor="#999999" />
                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center"
                                                                VerticalAlign="Middle" />
                                                        </asp:GridView>
                                                        <asp:ObjectDataSource ID="PaymentDueObjectDataSource" runat="server" SelectMethod="GetPaymentDueTransaction"
                                                            TypeName="CustomerTransactionDataSetTableAdapters.CustomerTransactionTableAdapter"
                                                            OldValuesParameterFormatString="original_{0}">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="CustomerID" SessionField="CustomerId" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="ActiveTransactionGridView" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <cc1:RoundedCornersExtender ID="ActiveTransactionRoundedCornersExtender" runat="server"
                                                    BorderColor="0, 51, 0" Color="0, 51, 0" Enabled="True" TargetControlID="ActiveTransactionPanel">
                                                </cc1:RoundedCornersExtender>
                                            </asp:Panel>
                                            <asp:Panel ID="TransactionProgressPanel" runat="server" Height="200px" Style="left: 0px;
                                                position: relative; top: 34px" Width="100%" BackColor="White">
                                                <asp:UpdatePanel ID="TransactionProgressUpdatePanel" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Label ID="TransactionProgressLabel" runat="server" BackColor="DarkRed" Font-Bold="True"
                                                            ForeColor="White" Height="10%" Style="position: relative" Text="<%$ Resources:Resource, PaymentPending %>"
                                                            Width="100%"></asp:Label>
                                                        <asp:GridView ID="TransactionProgressGridView" runat="server" Style="position: relative"
                                                            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"
                                                            DataKeyNames="TransactionID" DataSourceID="PaymentProgressObjectDataSource" ForeColor="#333333"
                                                            GridLines="None" Height="90%" Width="100%" PageSize="3" EnableModelValidation="True">
                                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" Font-Bold="True" />
                                                            <Columns>
                                                                <asp:BoundField DataField="TransactionID" HeaderText="<%$ Resources:Resource, TransactionID %>"
                                                                    ReadOnly="True" SortExpression="TransactionID" />
                                                                <asp:BoundField DataField="ProjectID" HeaderText="<%$ Resources:Resource, ProjectIDLabel %>"
                                                                    SortExpression="ProjectID" />
                                                                <asp:BoundField DataField="DateCharged" HeaderText="<%$ Resources:Resource, Date %>"
                                                                    SortExpression="DateCharged" DataFormatString="{0:d}" />
                                                                <asp:BoundField DataField="PhaseID" HeaderText="<%$ Resources:Resource, Phase %>"
                                                                    SortExpression="PhaseID" />
                                                                <asp:BoundField DataField="Currency" HeaderText="<%$ Resources:Resource, Currency %>"
                                                                    SortExpression="Currency" />
                                                                <asp:BoundField DataField="PaymentDue" HeaderText="<%$ Resources:Resource, AmountLabel %>"
                                                                    SortExpression="PaymentDue" />
                                                                <asp:BoundField DataField="PaymentMethod" HeaderText="<%$ Resources:Resource, Method %>"
                                                                    ReadOnly="True" SortExpression="PaymentMethod" />
                                                                <asp:BoundField DataField="Status" HeaderText="<%$ Resources:Resource, Status %>"
                                                                    ReadOnly="True" SortExpression="Status" />
                                                            </Columns>
                                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                            <PagerStyle BackColor="#400000" ForeColor="White" HorizontalAlign="Center" />
                                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                            <HeaderStyle BackColor="#400000" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" CssClass="gridHeader"  />
                                                            <EditRowStyle BackColor="#999999" />
                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        </asp:GridView>
                                                        <asp:ObjectDataSource ID="PaymentProgressObjectDataSource" runat="server" SelectMethod="GetPaymentPendingTransaction"
                                                            TypeName="CustomerTransactionDataSetTableAdapters.TransactionPendingTableAdapter"
                                                            OldValuesParameterFormatString="original_{0}">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="CustomerID" SessionField="CustomerId" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <cc1:RoundedCornersExtender ID="TransactionProgressPanelRoundedCornersExtender" runat="server"
                                                    BorderColor="64, 0, 0" Color="64, 0, 0" Enabled="True" TargetControlID="TransactionProgressPanel">
                                                </cc1:RoundedCornersExtender>
                                            </asp:Panel>
                                            <asp:Panel ID="TransactionHistoryPanel" runat="server" Height="200px" Style="left: 0px;
                                                position: relative; top: 52px" Width="100%" BackColor="White">
                                                <asp:UpdatePanel ID="TransactionHistoryUpdatePanel" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Label ID="TransactionHistoryLabel" runat="server" BackColor="LightGray" Font-Bold="True"
                                                            ForeColor="Black" Height="10%" Style="position: relative" Text="<%$ Resources:Resource, PaymentHistory %>"
                                                            Width="100%"></asp:Label>
                                                        <asp:GridView ID="TransactionHistoryGridView" runat="server" Style="position: relative"
                                                            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"
                                                            DataKeyNames="TransactionID" DataSourceID="PaymentHistoryObjectDataSource" ForeColor="#333333"
                                                            GridLines="None" Width="100%" PageSize="3" EnableModelValidation="True">
                                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                                                            <Columns>
                                                                <asp:BoundField DataField="TransactionID" HeaderText="<%$ Resources:Resource, TransactionID %>"
                                                                    ReadOnly="True" SortExpression="TransactionID" />
                                                                <asp:BoundField DataField="ProjectID" HeaderText="<%$ Resources:Resource, ProjectIDLabel %>"
                                                                    SortExpression="ProjectID" />
                                                                <asp:BoundField DataField="DateCharged" DataFormatString="{0:d}" HeaderText="<%$ Resources:Resource, Date %>"
                                                                    SortExpression="DateCharged" />
                                                                <asp:BoundField DataField="PhaseID" HeaderText="<%$ Resources:Resource, Phase %>"
                                                                    SortExpression="PhaseID" />
                                                                <asp:BoundField DataField="Currency" HeaderText="<%$ Resources:Resource, Currency %>"
                                                                    ReadOnly="True" SortExpression="Currency" />
                                                                <asp:BoundField DataField="PaymentDue" HeaderText="<%$ Resources:Resource, AmountLabel %>"
                                                                    SortExpression="PaymentDue" />
                                                                <asp:BoundField DataField="PaymentMethod" HeaderText="<%$ Resources:Resource, Method %>"
                                                                    ReadOnly="True" SortExpression="PaymentMethod" />
                                                                <asp:BoundField DataField="Status" HeaderText="<%$ Resources:Resource, Status %>"
                                                                    ReadOnly="True" SortExpression="Status" />
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="DeleteTransactionHistoryLinkButton" runat="server" CausesValidation="False"
                                                                            CommandName="delete" Font-Bold="True" ForeColor="Black" Style="position: relative"
                                                                           CssClass="UnderlineLink" Text="<%$ Resources:Resource, Delete %>"></asp:LinkButton></ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                            <PagerStyle BackColor="#404040" ForeColor="White" HorizontalAlign="Center" />
                                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                            <HeaderStyle BackColor="#404040" Font-Bold="True" ForeColor="White" CssClass="gridHeader"  />
                                                            <EditRowStyle BackColor="#999999" />
                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        </asp:GridView>
                                                        <asp:ObjectDataSource ID="PaymentHistoryObjectDataSource" runat="server" SelectMethod="GetPaymentHistoryTransaction"
                                                            TypeName="CustomerTransactionDataSetTableAdapters.CustomerTransactionHistoryTableAdapter"
                                                            OldValuesParameterFormatString="original_{0}" DeleteMethod="DeleteTransactionHistory">
                                                            <SelectParameters>
                                                                 <asp:SessionParameter Name="CustomerId" SessionField="CustomerId" />
                                                            </SelectParameters>
                                                            <DeleteParameters>
                                                                <asp:ControlParameter ControlID="TransactionHistoryGridView" Name="TransactionID"
                                                                    PropertyName="SelectedValue" />
                                                                <asp:SessionParameter Name="CustomerId" SessionField="CustomerId" />
                                                            </DeleteParameters>
                                                        </asp:ObjectDataSource>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="TransactionHistoryGridView" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <cc1:RoundedCornersExtender ID="TransactionHistoryPanelRoundedCornersExtender" runat="server"
                                                    BorderColor="64, 64, 64" Color="64, 64, 64" Enabled="True" TargetControlID="TransactionHistoryPanel">
                                                </cc1:RoundedCornersExtender>
                                            </asp:Panel>
                                        
</ContentTemplate>
                                    



</cc1:TabPanel>
                                    <cc1:TabPanel ID="ContractTabPanel" runat="server" HeaderText="<%$ Resources:Resource, Contract %>">
                                        <ContentTemplate>
                                            <asp:Panel ID="GlobalContractPanel" runat="server" BackColor="White" Height="300px"
                                                Style="left: 0px; position: relative; top: 0px" Width="100%">
                                                <asp:Label ID="ContractLabel" runat="server" BackColor="#400000" Font-Bold="True"
                                                    Height="6%" Style="position: relative" Text="<%$ Resources:Resource, Contract %>"
                                                    Width="100%" ForeColor="White"></asp:Label>




                                                <asp:UpdatePanel ID="GlobalContractUpdatePanel" runat="server"><ContentTemplate>
                                                        <asp:GridView ID="GlobalContractGridView" runat="server" AutoGenerateColumns="False"
                                                            DataSourceID="CustomerContractGeneralObjectDataSource" Height="90%" Style="position: relative"
                                                            Width="100%" AllowPaging="True" AllowSorting="True" DataKeyNames="ContractID"
                                                            GridLines="None" CellPadding="4" ForeColor="#333333" HorizontalAlign="Center"
                                                            EnableModelValidation="True">
                                                            <Columns>
                                                                <asp:BoundField DataField="ContractID" HeaderText="<%$ Resources:Resource, ContractID %>"
                                                                    ReadOnly="True" SortExpression="ContractID" />
                                                                <asp:BoundField DataField="ProjectID" HeaderText="<%$ Resources:Resource, ProjectIDLabel %>"
                                                                    SortExpression="ProjectID" />
                                                                <asp:BoundField DataField="ContractDate" HeaderText="<%$ Resources:Resource, Date %>"
                                                                    SortExpression="ContractDate" />
                                                                <asp:BoundField DataField="BidderUsername" HeaderText="<%$ Resources:Resource, BidderUsername %>"
                                                                    SortExpression="BidderUsername" />
                                                                <asp:BoundField DataField="PosterUsername" HeaderText="<%$ Resources:Resource, PosterUsername %>"
                                                                    SortExpression="PosterUsername" />
                                                                <asp:BoundField DataField="HighestBid" HeaderText="<%$ Resources:Resource, HighestBidLabel %>"
                                                                    SortExpression="HighestBid" />
                                                                <asp:BoundField DataField="Currency" HeaderText="<%$ Resources:Resource, Currency %>"
                                                                    SortExpression="Currency" />
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="DetailsLinkButton" runat="server" ForeColor="#400000" CssClass="UnderlineLink" Style="position: relative"
                                                                            CausesValidation="False" CommandName="select" Font-Bold="True" Text="<%$ Resources:Resource, MoreDetails %>"
                                                                            onmouseover="this.style='text-underline:true'" onmouseout="this.style='text-underline:false'"></asp:LinkButton></ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                            <PagerStyle BackColor="Maroon" ForeColor="White" HorizontalAlign="Center" />
                                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                            <HeaderStyle BackColor="Maroon" Font-Bold="True" ForeColor="White" Height="12%" HorizontalAlign="Center"
                                                                CssClass="gridHeader" />
                                                            <EditRowStyle BackColor="#999999" />
                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        </asp:GridView>
                                                    
</ContentTemplate>
</asp:UpdatePanel>




                                            </asp:Panel>




                                            <asp:ObjectDataSource ID="CustomerContractGeneralObjectDataSource" runat="server"
                                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomerContractGeneral"
                                                TypeName="CustomerContractTableAdapters.CustomerContractGeneralTableAdapter"><SelectParameters>
<asp:SessionParameter Name="CustomerID" SessionField="CustomerId" />
</SelectParameters>
</asp:ObjectDataSource>




                                            <asp:Panel ID="DetailContractPanel" runat="server" BackColor="White" Height="305px"
                                                Style="left: 0px; position: relative; top: 12px" Width="100%">
                                                <asp:UpdatePanel ID="DetailContractUpdatePanel" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:FormView ID="DetailContractFormView" runat="server" DataSourceID="CustomerContractDetailObjectDataSource"
                                                            Style="position: relative">
                                                            <ItemTemplate>
                                                                <table style="width: 100%; position: relative; height: 219px">
                                                                    <tr>
                                                                        <td style="width: 100px; height: 36px">
                                                                            <asp:Label ID="SpecificationLabel" runat="server" Style="position: relative" HeaderText="<%$ Resources:Resource, Specification %>"
                                                                                Font-Bold="True" ForeColor="DarkSlateGray"></asp:Label>
                                                                        </td>
                                                                        <td style="width: 100px; text-align: center;">
                                                                        </td>
                                                                        <td style="width: 100px; height: 36px">
                                                                        </td>
                                                                        <td style="width: 100px; height: 36px">
                                                                            &nbsp;&nbsp;<asp:Label ID="DescriptionLabel" runat="server" Style="position: relative"
                                                                                Text="<%$ Resources:Resource, DescriptionLabel %>" Width="88px" Font-Bold="True"
                                                                                ForeColor="DarkSlateGray"></asp:Label>
                                                                        </td>
                                                                        <td style="width: 100px; height: 36px">
                                                                        </td>
                                                                        <td style="width: 100px; height: 36px">
                                                                        </td>
                                                                        <td style="width: 100px; height: 36px">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100px; background-color: #660000;">
                                                                            <asp:Label ID="ProjectIDLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, ProjectIDLabel %>"
                                                                                Font-Bold="True" ForeColor="White"></asp:Label>
                                                                        </td>
                                                                        <td style="width: 100px; text-align: center;">
                                                                            <asp:Label ID="ProjectIDBindedLabel" runat="server" Style="position: relative" Text='<%# Bind("ProjectID", "{0}") %>'></asp:Label>
                                                                        </td>
                                                                        <td style="width: 100px">
                                                                        </td>
                                                                        <td colspan="3" rowspan="4">
                                                                            &nbsp;&nbsp;<asp:TextBox ID="DescriptionTextBox" runat="server" Height="145px" Style="position: relative;
                                                                                top: -1px" Text='<%# Bind("Description", "{0}") %>' Width="374px"></asp:TextBox>&#160;&nbsp;
                                                                        </td>
                                                                        <td style="width: 100px; text-align: center">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100px; background-color: #660000;">
                                                                            <asp:Label ID="NumberofBidsLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, NumberofBids %>"
                                                                                Font-Bold="True" ForeColor="White"></asp:Label>
                                                                        </td>
                                                                        <td style="width: 100px; text-align: center;">
                                                                            <asp:Label ID="NumberofBidsBindedLabel" runat="server" Style="position: relative"
                                                                                Text='<%# Bind("NumberofBids", "{0}") %>'></asp:Label>
                                                                        </td>
                                                                        <td style="width: 100px">
                                                                        </td>
                                                                        <td style="width: 100px">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100px; background-color: #660000;">
                                                                            <asp:Label ID="StartDateLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, StartDate %>"
                                                                                Font-Bold="True" ForeColor="White"></asp:Label>
                                                                        </td>
                                                                        <td style="width: 100px; text-align: center;">
                                                                            <asp:Label ID="StartDateBindedLabel" runat="server" Style="position: relative" Text='<%# Bind("StartDate", "{0:D}") %>'></asp:Label>
                                                                        </td>
                                                                        <td style="width: 100px">
                                                                        </td>
                                                                        <td style="width: 100px; text-align: center">
                                                                            <br />
                                                                            <asp:LinkButton ID="DownloadLinkButton" runat="server" ForeColor="#400000" CssClass="UnderlineLink" Style="position: relative"
                                                                                CausesValidation="False" Font-Bold="True" OnClick="DownloadLinkButton_Click"
                                                                                Text="<%$ Resources:Resource, ViewandPrint %>"></asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 100px; background-color: #660000;">
                                                                            <asp:Label ID="EndDateLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, EndDate %>"
                                                                                Font-Bold="True" ForeColor="White"></asp:Label>
                                                                        </td>
                                                                        <td style="width: 100px; text-align: center;">
                                                                            <asp:Label ID="EndDateBindedLabel" runat="server" Style="position: relative" Text='<%# Bind("EndDate", "{0:D}") %>'></asp:Label>
                                                                        </td>
                                                                        <td style="width: 100px">
                                                                        </td>
                                                                        <td style="width: 100px">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                        </asp:FormView>
                                                        <asp:ObjectDataSource ID="CustomerContractDetailObjectDataSource" runat="server"
                                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomerContractDetail"
                                                            TypeName="CustomerContractTableAdapters.CustomerContractDetailTableAdapter">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="GlobalContractGridView" Name="ContractID" PropertyName="SelectedValue" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                    
</ContentTemplate>
<Triggers>
<asp:PostBackTrigger ControlID="DetailContractFormView" />
<asp:AsyncPostBackTrigger ControlID="GlobalContractGridView" EventName="SelectedIndexChanged" />
</Triggers>
</asp:UpdatePanel>




                                            </asp:Panel>




                                        
</ContentTemplate>
                                    



</cc1:TabPanel>
                                    <cc1:TabPanel ID="CommentTabPanel" runat="server" HeaderText="<%$ Resources:Resource, CommentTabPanel %>">
                                        <ContentTemplate>
                                            <asp:Panel ID="Summary" runat="server" Width="477px" Height="190px">
                                                <table cellpadding="0" cellspacing="0" style="width: 99%">
                                                    <tr>
                                                        <td colspan="3">
                                                            <asp:Label ID="StatisticsLabel" runat="server" BackColor="#006699" Text="<%$ Resources:Resource, StatisticsLabel %>"
                                                                Width="101%" Height="25px" Font-Bold="True" ForeColor="White"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td rowspan="2">
                                                            <asp:GridView ID="CommentSummaryGridView" runat="server" AutoGenerateColumns="False"
                                                                DataSourceID="CustomerCommentReceivedSummaryDataSource" Width="80px" CellPadding="0"
                                                                Height="160px" GridLines="None" ShowHeader="False">
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <table style="width: 249px; height: 160px;" cellpadding="8" cellspacing="0">
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="PositiveLabel" runat="server" Text="<%$ Resources:Resource, PositiveLabel %>"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="PositiveCommentLabel" runat="server" Text='<%# Eval("NumberofPositive", "{0}") %>'></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <img src="../../Images/Comment/PositiveIcon.gif" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="NegativeLabel" runat="server" Text="<%$ Resources:Resource, NegativeLabel %>"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="NegativeCommentLabel" runat="server" Text='<%# Eval("NumberofNegative", "{0}") %>'></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <img src="../../Images/Comment/NegativeIcon.gif" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="height: 43px">
                                                                                        <asp:Label ID="NeutralLabel" runat="server" Text="<%$ Resources:Resource, NeutralLabel %>"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="NeutralCommentLabel" runat="server" Text='<%# Eval("NumberofNeutral", "{0}") %>'></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <img src="../../Images/Comment/NeutralIcon.GIF" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="TotalLabel" runat="server" Text="<%$ Resources:Resource, TotalLabel %>"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="TotalCommentLabel" runat="server" Text='<%# Eval("Total", "{0}") %>'></asp:Label>
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
                                                            <asp:Chart ID="CommentChart" runat="server" Palette="None" Width="130px" Height="130px"
                                                                PaletteCustomColors="DarkGreen; DarkRed; DarkGray" DataSourceID="CustomerCommentReceivedSummaryDataSource"
                                                                IsSoftShadows="False">
                                                                <Titles>
                                                                    <asp:Title DockedToChartArea="CommentChartArea" Font="Microsoft Sans Serif, 20pt, style=Bold"
                                                                        ForeColor="Snow" Name="PercentageTitle" ShadowColor="Black" Text="100%" TextStyle="Emboss">
                                                                        <Position Height="90" Width="90" X="8" Y="3" Auto="False" />
                                                                    </asp:Title>
                                                                </Titles>
                                                                <Series>
                                                                    <asp:Series ChartType="Pie" Name="Series1" ChartArea="CommentChartArea">
                                                                        <Points>
                                                                            <asp:DataPoint XValue="100" YValues="100" />
                                                                            <asp:DataPoint YValues="0" />
                                                                            <asp:DataPoint YValues="0" />
                                                                        </Points>
                                                                    </asp:Series>
                                                                </Series>
                                                                <ChartAreas>
                                                                    <asp:ChartArea BackColor="White" Name="CommentChartArea">
                                                                        <Area3DStyle Enable3D="True" Inclination="25" />
                                                                    </asp:ChartArea>
                                                                </ChartAreas>
                                                            </asp:Chart>
                                                            <br />
                                                            <asp:Label ID="RecommendLabel" runat="server" Text="<%$ Resources:Resource, RecommendLabel %>"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:ObjectDataSource ID="CustomerCommentReceivedSummaryDataSource" runat="server"
                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomerCommentReceivedSummary"
                                                    TypeName="CustomerCommentsReceivedTableAdapters.CustomerCommentReceivedSummaryTableAdapter">
                                                   <SelectParameters>
                                                                    <asp:SessionParameter Name="CustomerID" SessionField="CustomerId" Type="Int32" />
                                                   </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </asp:Panel>
                                            <cc1:RoundedCornersExtender ID="Summary_RoundedCornersExtender" runat="server" Color="0, 33, 66"
                                                Enabled="True" TargetControlID="Summary" BorderColor="0, 33, 66">
                                            </cc1:RoundedCornersExtender>
                                            <asp:Panel ID="CommentReceivedPanel" runat="server" Height="440px" Style="left: 0px;
                                                overflow: hidden; position: relative; top: 10px" Width="100%">
                                                <asp:UpdatePanel ID="CommentReceivedUpdatePanel" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Label ID="CommentReceivedLabel" runat="server" BackColor="#003300" Font-Bold="True"
                                                            Height="10%" Style="position: relative" Text="<%$ Resources:Resource, CommentReceivedLabel %>"
                                                            Width="100%" ForeColor="White">
                                                        </asp:Label><asp:GridView ID="CommentReceivedGridView" runat="server" AllowPaging="True"
                                                            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                                                            GridLines="None" Width="100%" HorizontalAlign="Center" DataSourceID="CommentReceivedDataSource"
                                                            DataKeyNames="ProjectID" Font-Size="Small" PageSize="5">
                                                            <RowStyle BackColor="#E3EAEB" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <EmptyDataRowStyle BackColor="#E3EAEB" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <Columns>
                                                                <asp:BoundField DataField="CommentDate" HeaderText="<%$ Resources:Resource, CommentDate %>"
                                                                    SortExpression="CommentDate" DataFormatString="{0:dd/MM/yyyy}" />
                                                                <asp:TemplateField HeaderText="<%$ Resources:Resource, From %>" SortExpression="ProfessionalUsername">
                                                                    <ItemTemplate>
                                                                        <asp:HyperLink ID="ProfessionalHyperLink" runat="server" NavigateUrl='<%# Eval("ProfessionalID", "../ViewProfessionalProfile.aspx?PID={0}") %>'
                                                                            Target="_blank" Text='<%# Eval("ProfessionalUserName") %>' Font-Bold="False"
                                                                            ForeColor="#000066" CssClass="UnderlineLink"></asp:HyperLink></ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Resource, About %>" SortExpression="ProjectTitle">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="AboutProjectLinkButton" runat="server" CausesValidation="False"
                                                                            CommandName="select" ForeColor="#000066" Text='<%# Bind("ProjectTitle", "{0}") %>'
                                                                            OnClientClick="FireAnimation();"></asp:LinkButton>
                                                                        <br />
                                                                        <asp:Image ID="ProjectImage" runat="server" Height="50px" ImageUrl='<%# Bind("ProjectPhotoPath", "{0}") %>'
                                                                            Width="50px" /></ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:Label ID="ProjectLabel" runat="server" Text='<%# Eval("ProjectTitle") %>'></asp:Label></EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Resource, Comment %>" SortExpression="Comment">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="CommentLabel" runat="server" Height="34px" Text='<%# Bind("Comment") %>'
                                                                            Width="100%"></asp:Label></ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Resource, Positive %>" HeaderImageUrl="~/Images/Comment/PositiveIcon.gif"
                                                                    SortExpression="Positive">
                                                                    <ItemTemplate>
                                                                        <asp:Image ID="PositiveCommentImage" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Comment/CheckMark.gif"
                                                                            Visible='<%# Bind("Positive") %>' /></ItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="gridHeader" />
                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Resource, Negative %>" SortExpression="Negative"
                                                                    HeaderImageUrl="~/Images/Comment/NegativeIcon.gif">
                                                                    <ItemTemplate>
                                                                        <asp:Image ID="NegativeCommentImage" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Comment/CheckMark.gif"
                                                                            Visible='<%# Bind("Negative") %>' /></ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="<%$ Resources:Resource, Neutral %>" HeaderImageUrl="~/Images/Comment/NeutralIcon.gif"
                                                                    SortExpression="Neutral">
                                                                    <ItemTemplate>
                                                                        <asp:Image ID="NeutralCommentImage" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Comment/CheckMark.gif"
                                                                            Visible='<%# Bind("Neutral") %>' /></ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="Positive" HeaderText="<%$ Resources:Resource, Positive %>"
                                                                    Visible="false" SortExpression="Positive" />
                                                            </Columns>
                                                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                            <PagerStyle BackColor="#003300" ForeColor="White" HorizontalAlign="Center" />
                                                            <EmptyDataTemplate>
                                                                <asp:Label ID="EmptyCommentLabel" runat="server" Height="20px" Style="text-align: center"
                                                                    Text="<%$ Resources:Resource, EmptyCommentLabel %>" Width="100%"></asp:Label></EmptyDataTemplate>
                                                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                                                                VerticalAlign="Middle" Height="10%" CssClass="gridHeader" />
                                                            <EditRowStyle BackColor="#7C6F57" />
                                                            <AlternatingRowStyle BackColor="#E3EAEB" ForeColor="Black" />
                                                            <SelectedRowStyle ForeColor="#003300" BorderColor="#003300" BorderWidth="2px" Font-Bold="True" />
                                                        </asp:GridView>
                                                        <asp:ObjectDataSource ID="CommentReceivedDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                            SelectMethod="GetCustomerCommentReceived" TypeName="CustomerCommentsReceivedTableAdapters.CustomerCommentReceivedTableAdapter">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="CustomerID" SessionField="CustomerId" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </asp:Panel>
                                            <cc1:RoundedCornersExtender ID="CommentReceivedRoundedCornersExtender" runat="server"
                                                Color="DarkOliveGreen" Enabled="True" TargetControlID="CommentReceivedPanel"
                                                BorderColor="DarkOliveGreen">
                                            </cc1:RoundedCornersExtender>
                                            <asp:Panel ID="CommentSentPanel" runat="server" Height="440px" Style="left: 0px;
                                                overflow: hidden; position: relative; top: 50px" Width="100%" BackColor="White">
                                                <asp:UpdatePanel ID="CommentSentUpdatePanel" runat="server">
                                                    <ContentTemplate>
                                                        <asp:Label ID="CommentSentLabel" runat="server" BackColor="#003366" Font-Bold="True"
                                                            Height="10%" Style="position: relative" Text="<%$ Resources:Resource, CommentSentLabel %>"
                                                            Width="100%" ForeColor="White"></asp:Label><asp:GridView ID="CommentSentGridView"
                                                                runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" HorizontalAlign="Center"
                                                                DataSourceID="CommentSentDataSource" DataKeyNames="ProjectID" Font-Size="Small"
                                                                PageSize="5">
                                                                <RowStyle BackColor="#F7F6F3" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                <Columns>
                                                                    <asp:BoundField DataField="CommentDate" HeaderText="<%$ Resources:Resource, CommentDate %>"
                                                                        SortExpression="CommentDate" DataFormatString="{0:dd/MM/yyyy}" />
                                                                    <asp:TemplateField HeaderText="<%$ Resources:Resource, To %>" SortExpression="ProfessionalUsername">
                                                                        <ItemTemplate>
                                                                            <asp:HyperLink ID="ProfessionalHyperLink" runat="server" NavigateUrl='<%# Eval("ProfessionalID", "../ViewProfessionalProfile.aspx?PID={0}") %>'
                                                                                Target="_blank" Text='<%# Eval("ProfessionalUserName") %>' Font-Bold="False"
                                                                                ForeColor="#000066" CssClass="UnderlineLink"></asp:HyperLink></ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="<%$ Resources:Resource, About %>" SortExpression="ProjectTitle">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="AboutProjectLinkButton" runat="server" CausesValidation="False"
                                                                                CommandName="select" ForeColor="#000066" Text='<%# Bind("ProjectTitle", "{0}") %>'
                                                                                OnClientClick="FireAnimation();"></asp:LinkButton>
                                                                            <br />
                                                                            <asp:Image ID="ProjectImage" runat="server" Height="50px" ImageUrl='<%# Bind("ProjectPhotoPath", "{0}") %>'
                                                                                Width="50px" /></ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:Label ID="ProjectTitleLabel" runat="server" Text='<%# Eval("ProjectTitle") %>'></asp:Label></EditItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="<%$ Resources:Resource, Comment %>" SortExpression="Comment">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="CommentLabel" runat="server" Height="34px" Text='<%# Bind("Comment") %>'
                                                                                Width="100%"></asp:Label></ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="<%$ Resources:Resource, Positive %>" HeaderImageUrl="~/Images/Comment/PositiveIcon.gif"
                                                                        SortExpression="Positive">
                                                                        <ItemTemplate>
                                                                            <asp:Image ID="PositiveCommentImage" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Comment/CheckMark.gif"
                                                                                Visible='<%# Bind("Positive") %>' /></ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="gridHeader"  />
                                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="<%$ Resources:Resource, Negative %>" SortExpression="Negative"
                                                                        HeaderImageUrl="~/Images/Comment/NegativeIcon.gif">
                                                                        <ItemTemplate>
                                                                            <asp:Image ID="NegativeCommentImage" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Comment/CheckMark.gif"
                                                                                Visible='<%# Bind("Negative") %>' /></ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="<%$ Resources:Resource, Neutral %>" HeaderImageUrl="~/Images/Comment/NeutralIcon.gif"
                                                                        SortExpression="Neutral">
                                                                        <ItemTemplate>
                                                                            <asp:Image ID="NeutralCommentImage" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Comment/CheckMark.gif"
                                                                                Visible='<%# Bind("Neutral") %>' /></ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="Positive" HeaderText="<%$ Resources:Resource, Positive %>"
                                                                        Visible="false" SortExpression="Positive" />
                                                                </Columns>
                                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                <EmptyDataTemplate>
                                                                    <asp:Label ID="EmptyCommentLabel" runat="server" Height="20px" Style="text-align: center"
                                                                        Text="<%$ Resources:Resource, EmptyCommentLabel %>" Width="100%"></asp:Label></EmptyDataTemplate>
                                                                <SelectedRowStyle ForeColor="#003366" BorderColor="#003366" BorderWidth="2px" Font-Bold="True" />
                                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                                                                    VerticalAlign="Middle" Height="10%" CssClass="gridHeader" />
                                                                <EditRowStyle BackColor="#999999" />
                                                                <AlternatingRowStyle BackColor="#F7F6F3" ForeColor="Black" />
                                                                <EmptyDataRowStyle BackColor="#E3EAEB" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            </asp:GridView>
                                                        <asp:ObjectDataSource ID="CommentSentDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                            SelectMethod="GetCustomerCommentSent" TypeName="CustomerCommentSentTableAdapters.CustomerCommentSentTableAdapter">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="CustomerID" SessionField="CustomerId" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:ObjectDataSource>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </asp:Panel>
                                            <cc1:RoundedCornersExtender ID="CommentSentRoundedCornersExtender" runat="server"
                                                Color="0, 33, 66" Enabled="True" TargetControlID="CommentSentPanel" BorderColor="0, 33, 66">
                                            </cc1:RoundedCornersExtender>
                                        
</ContentTemplate>
                                    



</cc1:TabPanel>
                                    <cc1:TabPanel ID="AccountTabPanel" runat="server" HeaderText="<%$ Resources:Resource, AccountTabPanel %>">
                                        <ContentTemplate>
                                            <table style="width: 100%; position: relative; height: 100%;">
                                                <tr>
                                                    <td colspan="3" style="text-align: center; vertical-align: text-top">
                                                        <asp:Label ID="AccountManagingAccountLabel" runat="server" Font-Bold="True" ForeColor="Navy"
                                                            Style="position: relative;" Text="<%$ Resources:Resource, AccountManagingAccountLabel %>"
                                                            Width="173px"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 33%">
                                                        <br />
                                                    </td>
                                                    <td style="width: 33%;">
                                                    </td>
                                                    <td style="width: 33%">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="DeleteAccountLinkButton" runat="server" CausesValidation="False"
                                                            Font-Bold="True" ForeColor="#400000" CssClass="UnderlineLink" Style="position: relative;" 
                                                            Text="<%$ Resources:Resource, DeleteAccountLinkButton %>"></asp:LinkButton><cc1:ConfirmButtonExtender
                                                                ID="DeleteAccountConfirmButtonExtender" runat="server" ConfirmText="<%$ Resources:Resource, DeleteAccountConfirmButtonExtender %>"
                                                                TargetControlID="DeleteAccountLinkButton" Enabled="True">
                                                            </cc1:ConfirmButtonExtender>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 33%">
                                                        <br />
                                                    </td>
                                                    <td style="width: 33%;">
                                                    </td>
                                                    <td style="width: 33%">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="AccountContactCustomerServiceLabel" runat="server" Font-Bold="True"
                                                            ForeColor="#400000" Style="position: relative;" Text="<%$ Resources:Resource, AccountContactCustomerServiceLabel %>"
                                                            Width="188px"></asp:Label>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Label ID="AccountHeaderCustomerServiceLabel" runat="server" Style="position: relative;"
                                                            Text="<%$ Resources:Resource, AccountHeaderCustomerServiceLabel %>"></asp:Label>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 33%">
                                                        <br />
                                                    </td>
                                                    <td style="width: 33%">
                                                    </td>
                                                    <td style="width: 33%">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 30%;">
                                                        <asp:Label ID="AccountEmailCustomerServiceLabel" runat="server" Font-Bold="True"
                                                            ForeColor="#400000" Style="position: relative;" Text="<%$ Resources:Resource, AccountEmailCustomerServiceLabel %>"
                                                            Width="194px"></asp:Label>
                                                    </td>
                                                    <td style="width: 30%; text-align: right">
                                                        <asp:Label ID="AccountCategoryLabel" runat="server" Font-Bold="True" ForeColor="Navy"
                                                            Style="position: relative;" Text="<%$ Resources:Resource, AccountCategoryLabel %>"></asp:Label>
                                                    </td>
                                                    <td style="width: 40%; text-align: left">
                                                        <asp:DropDownList ID="AccountDropDownList" runat="server" Style="position: relative;"
                                                            DataSourceID="CustomerServiceObjectDataSource" DataTextField="Description" DataValueField="ReasonID"
                                                            Font-Size="Small">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <asp:TextBox ID="AccountCustomerServiceMessageTextBox" runat="server" Height="400px"
                                                            Style="position: relative;" Width="656px" TextMode="MultiLine" ForeColor="#003366"
                                                            MaxLength="1000" Rows="25" onKeyDown="CountLeft(this.value,this.value.length,1000,'LeftLabel');"
                                                            onKeyUp="CountLeft(this.id,this.value.length,1000,'LeftLabel');"></asp:TextBox><asp:Panel
                                                                ID="CharacterLeftPanel" runat="server" Height="28px" Width="131px">
                                                                <input id="LeftLabel" style="width: 35px; color: #000080;" type="text" value="1000" /><asp:Label
                                                                    ID="CharactersLeftLabel" runat="server" Text="<%$ Resources:Resource, CharactersLeftLabel %>"
                                                                    ForeColor="#000066" Width="200px"></asp:Label></asp:Panel>
                                                        <cc1:FilteredTextBoxExtender ID="AccountCustomerServiceTextBoxFilteredExtender" runat="server"
                                                            InvalidChars="+-*/=)(*&amp;^%$#@!~`\|\]}[{&quot;':;?/&lt;&gt;" TargetControlID="AccountCustomerServiceMessageTextBox"
                                                            FilterMode="InvalidChars">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 33%">
                                                    </td>
                                                    <td style="width: 33%">
                                                    </td>
                                                    <td style="width: 33%; text-align: right">
                                                        <asp:LinkButton ID="AccountSendMessageLinkButton" runat="server" Text="<%$ Resources:Resource, AccountSendMessageLabel %>"
                                                            CssClass="UnderlineLink" Style="position: relative; text-align: center" ForeColor="#003366" Font-Bold="True"
                                                            CausesValidation="False"></asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 33%">
                                                    </td>
                                                    <td style="width: 33%;">
                                                    </td>
                                                    <td style="width: 33%">
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:ObjectDataSource ID="CustomerServiceObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetCustomerService" TypeName="AccountCustomerServiceDataSetTableAdapters.CustomerServiceTableAdapter">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="LCID" SessionField="Language" Type="Int32" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                        
</ContentTemplate>
                                    



</cc1:TabPanel>
                                </cc1:TabContainer>
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
    <asp:Panel ID="DetailTransaction" runat="server" Height="150px" Style="display: block;
        left: 91px; position: relative; top: 308px; z-index: 103; text-align: center;"
        Width="473px" BackColor="White">
        <asp:UpdatePanel ID="DetailTransactionUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <cc1:ModalPopupExtender ID="DetailTransactionModalPopupExtender" runat="server" TargetControlID="DetailTransactionTargetedLabel"
                    PopupControlID="DetailTransaction" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>
                <cc1:RoundedCornersExtender ID="DetailTransactionRoundedCornersExtender" runat="server"
                    BorderColor="64, 0, 0" Color="64, 0, 0" Enabled="True" TargetControlID="DetailTransactionDetailView">
                </cc1:RoundedCornersExtender>
                &nbsp;
                <asp:DetailsView ID="DetailTransactionDetailView" runat="server" AutoGenerateRows="False"
                    DataSourceID="PhaseInformationObjectDataSource" Height="90%" Style="position: relative"
                    Width="90%" GridLines="None">
                    <Fields>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="PhaseStatusLabel" runat="server" Height="61px" Style="position: relative"
                                    Text='<%# Bind("PhaseStatus", "{0}") %>' Width="461px"></asp:Label><br />
                                <br />
                                <asp:LinkButton ID="PhaseInformationLabel" runat="server" Font-Bold="True" ForeColor="#000040"
                                    CssClass="UnderlineLink" Style="position: relative" CausesValidation="False" OnClientClick="window.open('../../PhaseInformation.aspx','','width=400, height=200');"
                                    Text="<%$ Resources:Resource, PhaseInformationLabel %>"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                <asp:ObjectDataSource ID="PhaseInformationObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetPhaseInformation" TypeName="PhaseInformationDataSetTableAdapters.CustomerTransactionTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="TransactionID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Label ID="DetailTransactionTargetedLabel" runat="server" Style="position: relative"
                    Width="153px"></asp:Label>
                <asp:LinkButton ID="CloseLinkButton" runat="server" CausesValidation="False" Font-Bold="True"
                    ForeColor="Black" CssClass="UnderlineLink" Style="left: 267px; position: relative; top: 0px" Text="<%$ Resources:Resource, Close %>"></asp:LinkButton></ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Panel ID="MethodofPaymentPanel" runat="server" Height="192px" Style="display: block;
        left: 91px; position: relative; top: 471px; z-index: 103;" Width="512px" BackColor="White">
        <asp:UpdatePanel ID="MethodofPaymentUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <cc1:ModalPopupExtender ID="MethodofPaymentModalPopupExtender" runat="server" TargetControlID="MethodofPaymentTargetedLabel"
                    PopupControlID="MethodofPaymentPanel" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>
                <cc1:RoundedCornersExtender ID="MethodofPaymentRoundedCornersExtender" runat="server"
                    BorderColor="64, 0, 0" Color="64, 0, 0" Enabled="True" TargetControlID="CreditCardPanel">
                </cc1:RoundedCornersExtender>
                <asp:Panel ID="CreditCardPanel" runat="server" Style="position: relative; left: 2px;
                    top: 13px;" Height="120%" Width="98%">
                    <div style="text-align: center">
                        <table style="left: 0px; width: 98%; position: relative; top: 0px; height: 100%">
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="OptionLabel" runat="server" Font-Bold="True" ForeColor="#400000" Style="position: relative"
                                        Text="<%$ Resources:Resource, Options %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:ImageButton ID="PayPalImageButton" runat="server" Height="29px" ImageUrl="~/Images/CreditCard/PaypalLogo.jpg"
                                        Style="position: relative" Width="80px" />
                                </td>
                                <!-- Future Acceptable Payment 
                                <td style="width: 100px">
                                    <asp:Image ID="CreditCardImage" runat="server" Height="29px" ImageUrl="~/Images/CreditCard/CreditCardLogo.jpg"
                                        Style="position: relative" Width="80px" />
                                </td>
                                <td style="width: 100px">
                                    <asp:Image ID="GoogleCheckOutImage" runat="server" Height="29px" ImageUrl="~/Images/CreditCard/GoogleCheckOut.jpg"
                                        Style="position: relative" Width="80px" />
                                </td>
                                <td style="width: 100px">
                                    <asp:Image ID="BidPayImage" runat="server" Height="29px" ImageUrl="~/Images/CreditCard/BidpayLogo.jpg"
                                        Style="position: relative" Width="80px" />
                                </td>!-->
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="FeesLabel" runat="server" Font-Bold="True" ForeColor="#400000" Style="position: relative"
                                        Text="<%$ Resources:Resource, Fees %>"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="PayPalLinkButton" runat="server" ForeColor="#000040" CssClass="UnderlineLink" Style="position: relative"
                                        Font-Bold="True" Text="<%$ Resources:Resource, Go %>"></asp:LinkButton>
                                </td>
                                <%--  <td style="width: 100px">
                                    <asp:LinkButton ID="CreditCardLinkButton" runat="server" ForeColor="#000040" Style="position: relative"
                                        Font-Bold="True">Go</asp:LinkButton>
                                </td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="GoogleLinkButton" runat="server" ForeColor="#000040" Style="position: relative"
                                        Font-Bold="True">Go</asp:LinkButton>
                                </td>
                              
                                <td style="width: 100px">
                                    <asp:LinkButton ID="BidPayLinkButton" runat="server" ForeColor="#000040" Style="position: relative"
                                        Font-Bold="True">Go</asp:LinkButton>
                                </td>--%>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px; text-align: right;">
                                    <asp:Button ID="CancelPayment" runat="server" Style="position: relative; left: 0px;
                                        top: 22px;" Text="<%$ Resources:Resource, Cancel %>" OnClick="CancelPayment_Click"
                                        CausesValidation="False" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px; text-align: right">
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
                <asp:Label ID="MethodofPaymentTargetedLabel" runat="server" Style="position: relative"
                    Width="153px"></asp:Label></ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <p>
        <asp:GridView ID="ProjectCurrentStatusGridView" runat="server" DataSourceID="CustomerBidObjectDataSource"
            Style="position: relative; vertical-align: middle; text-align: center;" AutoGenerateColumns="False"
            ShowHeader="False" GridLines="None" Width="50%">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <table style="width: 80%; position: relative; height: 113%; left: 0px; vertical-align: middle;
                            top: 4px; text-align: center;" cellspacing="0">
                            <tr>
                                <td style="width: 25%; background-color: #5d7b9d; height: 26px;">
                                    <asp:Label ID="ProjectIDLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, ProjectIDLabel %>"
                                        Font-Bold="True" ForeColor="White"></asp:Label>
                                </td>
                                <td style="width: 83px; height: 26px">
                                    &nbsp;
                                    <asp:Label ID="ProjectIDValue" runat="server" Style="position: relative; top: -6px;
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
                                        Font-Bold="True" ForeColor="Black"></asp:Label>
                                </td>
                                <td style="width: 83px">
                                    &nbsp;
                                    <asp:Label ID="BidderValue" runat="server" Style="position: relative; top: -5px;
                                        left: 30px;" Text='<%# Bind("HighestBidUsername", "{0}") %>' Height="19px" Width="53px"
                                        ForeColor="White"></asp:Label>
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
                                    <asp:Label ID="HighestBidValue" runat="server" Style="position: relative; top: -3px;
                                        left: 34px;" Text='<%# Bind("HighestBid", "{0}") %>' Height="19px" Width="61px"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="CustomerBidObjectDataSource" runat="server" DeleteMethod="DeleteBid"
            InsertMethod="InsertBid" OldValuesParameterFormatString="original_{0}" SelectMethod="GetBid"
            TypeName="CustomerBidDataSetTableAdapters.BidsTableAdapter" UpdateMethod="UpdateBid">
            <SelectParameters>
                <asp:Parameter Name="ProjectID" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_ProjectID" Type="Int32" />
                <asp:Parameter Name="original_HighestBid" Type="Double" />
                <asp:Parameter Name="original_HighestBidderID" Type="Int32" />
                <asp:Parameter Name="original_HighestBidUsername" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="HighestBid" Type="Double" />
                <asp:Parameter Name="HighestBidderID" Type="Int32" />
                <asp:Parameter Name="HighestBidUsername" Type="String" />
                <asp:Parameter Name="original_ProjectID" Type="Int32" />
                <asp:Parameter Name="original_HighestBid" Type="Double" />
                <asp:Parameter Name="original_HighestBidderID" Type="Int32" />
                <asp:Parameter Name="original_HighestBidUsername" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="HighestBid" Type="Double" />
                <asp:Parameter Name="HighestBidderID" Type="Int32" />
                <asp:Parameter Name="HighestBidUsername" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </p>
    <asp:Panel ID="CustomerReport" runat="server">
        <rsweb:ReportViewer ID="CustomerReportViewer" runat="server" Font-Names="Verdana"
            Font-Size="8pt" InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana"
            WaitMessageFont-Size="14pt" Height="536px" Width="712px" ExportContentDisposition="AlwaysAttachment"
            Visible="True" SizeToReportContent="True">
            <LocalReport ReportPath="Authenticated\Contracts\Report.rdlc" EnableExternalImages="True"
                EnableHyperlinks="True">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="CustomerContractObjectDataSource" Name="CustomerContractDataSet" />
                    <rsweb:ReportDataSource DataSourceId="CustomerContractDescriptionObjectDataSource"
                        Name="CustomerContractDataSet" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="CustomerContractObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetContract" TypeName="ContractDataSetTableAdapters.ContractTableAdapter">
            <SelectParameters>
                <asp:Parameter Name="ContractID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="CustomerContractDescriptionObjectDataSource" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetContractDescription"
            TypeName="ContractDataSetTableAdapters.ContractDescriptionTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </asp:Panel>
    <asp:Panel ID="GlobalChangePasswordPanel" runat="server" Style="z-index: 100; left: 199px;
        position: absolute; top: 921px; display: none;" Width="400px" Height="266px"
        BackColor="Transparent">
        <cc1:ModalPopupExtender ID="ChangePasswordModalPopupExtender" runat="server" TargetControlID="TargetedControlLabel"
            PopupControlID="GlobalChangePasswordPanel" BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
        <asp:Panel ID="ChangePasswordPanel" runat="server" Height="266px" Width="320px" BackColor="Silver"
            Style="z-index: 100;">
            <asp:ChangePassword ID="ChangePassword" runat="server" BackColor="Silver" Height="103px"
                Width="316px">
                <SuccessTemplate>
                    <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;
                        width: 305px;">
                        <tr>
                            <td style="height: 105px">
                                <table border="0" cellpadding="0">
                                    <tr>
                                        <td align="center" colspan="2" style="height: 19px; text-align: center">
                                            <asp:Label ID="ChangePasswordCompleteLabel" runat="server" Text="<%$ Resources:Resource, ChangePasswordComplete %>"
                                                ForeColor="#990000" Font-Bold="true"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 300px; height: 38px; text-align: center">
                                            <asp:Label ID="PasswordChangedLabel" runat="server" Text="<%$ Resources:Resource, PasswordChanged %>"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                        </td>
                                    </tr>
                                </table>
                                <asp:Button ID="ContinuePushButton" runat="server" CausesValidation="False" CommandName="Continue"
                                    Text="<%$ Resources:Resource, Continue %>" Width="100px" Style="z-index: 100;
                                    left: 202px; position: absolute; top: 80px" />
                            </td>
                        </tr>
                    </table>
                </SuccessTemplate>
                <ChangePasswordTemplate>
                    <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse">
                        <tr>
                            <td style="height: 266px">
                                <table border="0" cellpadding="0">
                                    <tr>
                                        <td align="center" colspan="2">
                                            <span style="color: #660000"><strong>
                                                <asp:Label ID="ChangePasswordLabel" runat="server" Text="<%$ Resources:Resource, ChangeYourPassword %>"></asp:Label>
                                                <br />
                                                <br />
                                            </strong></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="vertical-align: text-top">
                                            <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword"
                                                Text="<%$ Resources:Resource, Password %>" Width="150px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password" Width="130px"></asp:TextBox><asp:RequiredFieldValidator
                                                ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword"
                                                ErrorMessage="<%$ Resources:Resource, PasswordRequiredValidator %>" ToolTip="<%$ Resources:Resource, PasswordRequiredValidator %>"
                                                ValidationGroup="ChangePasswordGroup">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="vertical-align: text-top">
                                            <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword"
                                                Text="<%$ Resources:Resource, NewPassword %>" Width="150px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" Width="130px"></asp:TextBox><asp:RequiredFieldValidator
                                                ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" ErrorMessage="<%$ Resources:Resource, NewPasswordRequiredValidator %>"
                                                ToolTip="<%$ Resources:Resource, NewPasswordRequiredValidator %>" ValidationGroup="ChangePasswordGroup">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="vertical-align: text-top">
                                            <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword"
                                                Text="<%$ Resources:Resource, ConfirmNewPassword %>" Width="150px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password" Width="130px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
                                                ErrorMessage="<%$ Resources:Resource, ConfirmNewPasswordRequiredValidator %>"
                                                ToolTip="<%$ Resources:Resource, ConfirmNewPasswordRequiredValidator %>" ValidationGroup="ChangePasswordGroup">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
                                                ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="<%$ Resources:Resource, PasswordMatch %>"
                                                ValidationGroup="ChangePasswordGroup"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color: red">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="height: 24px">
                                            <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword"
                                                OnClick="ChangePasswordPushButton_Click" Text="<%$ Resources:Resource, ChangeYourPassword %>"
                                                ValidationGroup="ChangePasswordGroup" />
                                        </td>
                                        <td style="height: 24px">
                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                            <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                Text="<%$ Resources:Resource, Cancel %>" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </td>
                        </tr>
                    </table>
                </ChangePasswordTemplate>
            </asp:ChangePassword>
        </asp:Panel>
        <cc1:RoundedCornersExtender ID="ChangePasswordPanelRoundedCornersExtender" runat="server"
            BorderColor="Black" Color="Black" TargetControlID="ChangePasswordPanel">
        </cc1:RoundedCornersExtender>
    </asp:Panel>
    <asp:Panel ID="ProfileSlideShowPanel" runat="server" Style="left: 189px; display: none;
        position: relative; top: 664px; background-color: #D2B48C; z-index: 100;" Height="374px"
        Width="485px" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px">
        <cc1:ModalPopupExtender ID="ProfileSlideShowModalPopupExtender" runat="server" PopupControlID="ProfileSlideShowPanel"
            TargetControlID="TargetedControlLabel" DropShadow="false" BackgroundCssClass="modalBackground"
            RepositionMode="RepositionOnWindowResizeAndScroll" CancelControlID="ProfileImageExitButton">
        </cc1:ModalPopupExtender>
        &nbsp; &nbsp;
        <asp:Image ID="ProfileImage" runat="server" Height="243px" Style="left: 60px; position: absolute;
            top: 44px" Width="364px" />
        <br />
        <asp:Button ID="ProfileImagePreviousButton" runat="server" Style="left: 81px; position: absolute;
            top: 299px" Text="<%$ Resources:Resource, Previous %>" Width="90px" />
        &nbsp;
        <asp:Button ID="ProfileImagePlayButton" runat="server" Style="left: 198px; position: absolute;
            top: 299px" Text="" Width="90px" />
        &nbsp;
        <asp:Button ID="ProfileImageNextButton" runat="server" Style="left: 316px; position: absolute;
            top: 299px" Text="<%$ Resources:Resource, Next %>" Width="90px" />
        <asp:Button ID="ProfileImageExitButton" runat="server" Style="left: 406px; position: absolute;
            top: 338px" Text="<%$ Resources:Resource, Close %>" Width="75px" />
        <br />
        <asp:Label ID="TargetedControlLabel" runat="server" Style="left: 715px; position: relative;
            top: 373px; z-index: 101;" Text=" " Width="33px"></asp:Label>
        <asp:HiddenField ID="PlayHiddenField" runat="server" Value="<%$ Resources:Resource, Play %>" />
        <asp:HiddenField ID="StopHiddenField" runat="server" Value="<%$ Resources:Resource, Stop %>" />
    </asp:Panel>
    <div id="LoadingDiv" style="left: 0px; width: 100px; position: absolute; top: 0px;
        height: 100px; z-index: 101">
        <asp:UpdatePanel ID="DelayUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <cc1:ModalPopupExtender ID="DelayModalPopUpExtender" runat="server" BackgroundCssClass="modalBackground"
                    PopupControlID="LoadingPanel" TargetControlID="LoadingPanel" RepositionMode="RepositionOnWindowResize">
                </cc1:ModalPopupExtender>
                &nbsp; &nbsp;
                <asp:Panel ID="LoadingPanel" runat="server" Height="45px" Style="display: none; left: 36px;
                    position: absolute; top: 48px" Width="196px" BackColor="Silver">
                    &nbsp;
                    <asp:Label ID="UploadingLabel" runat="server" Font-Bold="True" ForeColor="Black"
                        Style="left: 63px; position: absolute; top: 25px" Text="<%$ Resources:Resource, Loading %>"></asp:Label>
                    <img src="../../_assets/img/uploading.gif" alt="LoadingImage" style="left: 0px; position: relative;
                        top: -9px" />
                </asp:Panel>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:Panel ID="ExtendProject" runat="server" Height="200px" Style="display: none;
        left: 45px; position: relative; top: 1850px; z-index: 100; width: 174px;" HorizontalAlign="Center">
        <asp:UpdatePanel ID="ExtendProjectUpdatePanel" runat="server">
            <ContentTemplate>
                <asp:Panel ID="ExtendProjectCalenderPanel" runat="server" BackColor="White" Style="margin-right: 0px"
                    Width="300px">
                    <cc1:ModalPopupExtender ID="ExtendProjectModalPopupExtender" runat="server" TargetControlID="ExtendProjectTargetedLabel"
                        PopupControlID="ExtendProject" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                    <asp:Label ID="ExtendProjectTargetedLabel" runat="server"> </asp:Label>
                    <asp:Label ID="ExtendProjectLabel" runat="server" Text="<%$ Resources:Resource, ExtendProjectLabel %>"
                        Font-Bold="True" ForeColor="Maroon"> 
                    </asp:Label>
                    <asp:Calendar ID="Calendar1" runat="server" Width="100%">
                        <SelectedDayStyle BackColor="DarkRed" />
                    </asp:Calendar>
                    <br />
                    <asp:Button ID="ExtendButton" runat="server" Text="<%$ Resources:Resource, ExtendButton %>"
                        CausesValidation="false" OnClick="Extend" BorderColor="#990000" BorderStyle="Solid"
                        BorderWidth="1px" Font-Bold="True" ForeColor="#990000" OnClientClick="ExtendProjectFireAnimation();" />
                    &nbsp;&nbsp;
                    <asp:Button ID="CancelExtensionButton" runat="server" Text="<%$ Resources:Resource, CancelExtensionButton %>"
                        CausesValidation="false" OnClick="CancelExtension" BorderColor="#990000" BorderStyle="Solid"
                        BorderWidth="1px" Font-Bold="True" ForeColor="#990000" OnClientClick="CancelProjectFireAnimation();" />
                </asp:Panel>
                <cc1:RoundedCornersExtender ID="ExtendProjectCalenderRoundedCornersExtender" runat="server"
                    Enabled="True" TargetControlID="ExtendProjectCalenderPanel" BorderColor="Maroon"
                    Color="Maroon">
                </cc1:RoundedCornersExtender>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Panel ID="MoreProject" runat="server" Height="510px" Style="display: block;
        left: 48px; position: relative; top: 1218px; z-index: 103;" Width="940px" BackColor="White"
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
                                    <asp:Label ID="ProjectIDLabel0" runat="server" Font-Size="10pt" Style="position: relative"
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
                                    <asp:Label ID="TimeLeftLabel" runat="server" Font-Size="10pt" Style="position: relative"
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
                        <asp:Label ID="DescriptionLabel0" runat="server" Style="left: 4px; position: absolute;
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
        <asp:LinkButton ID="MoreProjectLinkButton" runat="server" Text="<%$ Resources:Resource, More %>"
            CssClass="UnderlineLink" Style="left: 760px; position: relative; top: 522px; width: 40px" CausesValidation="False"
            OnClientClick="MoreProjectFireAnimation2();" Font-Bold="True" ForeColor="Maroon"></asp:LinkButton>
        <asp:Button ID="OkButton" runat="server" Text="<%$ Resources:Resource, OkButton %>"
            Style="left: 820px; position: relative; top: 522px; width: 40px" CausesValidation="False"
            OnClick="OkButton_Click" OnClientClick="MoreProjectFireAnimation();" />
        <asp:ObjectDataSource ID="ProjectPhotoObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetProjectPhoto" TypeName="ViewProjectDataSetTableAdapters.ProjectPhotoTableAdapter">
            <SelectParameters>
                <asp:Parameter Name="ProjectID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </asp:Panel>
    <asp:Panel ID="MessageDeletionPanel" runat="server" BackColor="White" Style="display: none;
        margin-right: 0px" Width="341px" Height="89px" HorizontalAlign="Center" BorderColor="Maroon"
        BorderWidth="2px">
        <cc1:ModalPopupExtender ID="MessageDeletionModalPopupExtender" runat="server" TargetControlID="MessageDeletionTargetedLabel"
            PopupControlID="MessageDeletionPanel" BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
        <asp:Label ID="EmptyMessageDeletion" runat="server" Text="<%$ Resources:Resource, EmptyMessageDeletion%>"
            Font-Bold="True" ForeColor="Maroon" Width="100%"></asp:Label>
        <br />
        <br />
        <asp:Button ID="MessageDeletionCloseButton" runat="server" Text="<%$ Resources:Resource, Close%>"
            CausesValidation="false" BorderColor="#990000" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" ForeColor="#990000" />
        <asp:Label ID="MessageDeletionTargetedLabel" runat="server"></asp:Label>
    </asp:Panel>
    <asp:Panel ID="ModalInvitationPanel" runat="server" Height="420px" Style="display: none;
        left: 151px; position: relative; top: 317px; z-index: 103;" Width="421px" BackColor="White"
        BorderStyle="Double" BorderColor="Gray" BorderWidth="3px">
        <asp:UpdatePanel ID="ModalInvitationUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Button ID="CloseInvitationButton" runat="server" CausesValidation="False" Text="X"
                    Font-Bold="true" Style="left: 388px; position: relative; top: 2px" OnClientClick="ModalInvitationFireAnimation();" />
                <cc1:ModalPopupExtender ID="ModalInvitationPopupExtender" runat="server" TargetControlID="TargetedLabel"
                    PopupControlID="ModalInvitationPanel" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>
                <cc1:RoundedCornersExtender ID="ModalInvitationRoundedCornersExtender" runat="server"
                    BorderColor="Gray" Color="Gray" Enabled="True" TargetControlID="GlobalModalInvitationPanel"
                    Radius="8">
                </cc1:RoundedCornersExtender>
                &nbsp;
                <asp:Label ID="TargetedLabel" runat="server" Style="position: relative"></asp:Label><br />
                <asp:Panel ID="GlobalModalInvitationPanel" runat="server" Style="position: relative;
                    left: 20px; top: 11px; height: 334px;" Width="366px">
                    <asp:GridView ID="ModalInvitationGridView" runat="server" AutoGenerateColumns="False"
                        DataSourceID="CustomerOpenProjectDataSource" Style="position: relative; text-align: center;
                        top: 0px; left: 0px;" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
                        BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="None" HorizontalAlign="Center"
                        AllowPaging="True" PageSize="5" DataKeyNames="ProjectID" OnSelectedIndexChanged="ModalInvitationGridView_SelectedIndexChanged"
                        OnPageIndexChanging="ModalInvitationGridView_PageIndexChanging" Font-Size="Small"
                        AllowSorting="True" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="ProjectID" HeaderText="<%$ Resources:Resource, ProjectIDLabel %>"
                                ReadOnly="True" SortExpression="ProjectID" />
                            <asp:BoundField DataField="HighestBid" HeaderText="<%$ Resources:Resource, HighestBidLabel %>"
                                SortExpression="HighestBid" />
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, TimeLeftLabel %>" SortExpression="TimeLeft">
                                <ItemTemplate>
                                    <asp:Label ID="TimeLeftLabel" runat="server" Text='<%# Bind("TimeLeft") %>' Width="84px"></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Status" HeaderText="<%$ Resources:Resource, Status %>"
                                SortExpression="Status" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    &nbsp;
                                    <asp:LinkButton ID="InviteLinkButton" runat="server" BackColor="White" CausesValidation="False"
                                        CommandName="select" Font-Bold="True" ForeColor="#400000" CssClass="UnderlineLink" Style="position: relative"
                                        Width="43px" OnClientClick="ModalInvitationFireAnimation2();" Text="<%$ Resources:Resource, InviteLinkButton %>"></asp:LinkButton></ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle BackColor="#F7F7DE" HorizontalAlign="Center" />
                        <FooterStyle BackColor="#CCCC99" />
                        <PagerStyle BackColor="#663300" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"
                            Font-Bold="True" />
                        <EmptyDataTemplate>
                            <asp:Label ID="EmptyOpenProjectLabel" runat="server" Style="text-align: center" Text="<%$ Resources:Resource, EmptyOpenProjectLabel %>"
                                Width="95%"></asp:Label></EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#999966" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" CssClass="gridHeader" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </asp:Panel>
                &nbsp;<br />
                <asp:ObjectDataSource ID="CustomerOpenProjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetCustomerOpenProject" TypeName="CustomerOpenProjectDataSetTableAdapters.CustomerOpenProjectDataTableTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="CustomerID" SessionField="CustomerId" Type="Int32" />
                        <asp:SessionParameter Name="LCID" SessionField="Language" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ModalInvitationGridView" EventName="PageIndexChanging" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Panel ID="MessagePanel" runat="server" Height="453px" Style="display: none;
        left: 100px; position: relative; top: 456px; z-index: 105;" Width="480px" BorderStyle="Double"
        BorderColor="Gray" BorderWidth="3px" BackColor="#cccccc">
        <asp:UpdatePanel ID="MessagePanelUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <cc1:ModalPopupExtender ID="MessageModalPopupExtender" runat="server" TargetControlID="MessageTargetedLabel"
                    PopupControlID="MessagePanel" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>
                <asp:TextBox ID="MessageTextBox" runat="server" Height="400px" Style="position: relative;"
                    Width="475px" TextMode="MultiLine" ForeColor="#003366" MaxLength="1000" Rows="25"
                    onKeyDown="CountLeft(this.value,this.value.length,1000,'MessageCharacterLeft');"
                    onKeyUp="CountLeft(this.id,this.value.length,1000,'MessageCharacterLeft');"></asp:TextBox>
                <asp:Panel ID="MessageLeftPanel" runat="server" Height="28px" Width="131px">
                    <input id="MessageCharacterLeft" value="1000" type="text" style="width: 35px; color: #000080;" />
                    <asp:Label ID="MessageLeftLabel" runat="server" Text="<%$ Resources:Resource, CharactersLeftLabel %>"
                        ForeColor="#000066" Width="200px"></asp:Label>
                </asp:Panel>
                <cc1:FilteredTextBoxExtender ID="MessageTextBoxFilteredExtender" runat="server" InvalidChars="+-*/=)(*&amp;^%$#@!~`\|\]}[{&quot;':;?/&lt;&gt;"
                    TargetControlID="MessageTextBox" FilterMode="InvalidChars">
                </cc1:FilteredTextBoxExtender>
                <asp:Panel ID="MessageTextBoxFilterationPanel" runat="server" Width="173px" Height="80px"
                    Style="top: 36px; left: 515px; position: absolute; text-align: center;" BackColor="White">
                    <table cellspacing="1" style="width: 100%; height: 100%">
                        <tr>
                            <td style="background-color: Maroon">
                                <asp:Label ID="MessageTextBoxFilterationLabel" runat="server" Text="<%$ Resources:Resource, FilterationHeaderLabel %>"
                                    Font-Bold="True" Font-Size="Small" ForeColor="White"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="MessageTextBoxFilterationContentLabel" Font-Bold="True" runat="server"
                                    Text="+-*/=)(*&^%$#@!~`\|\]}[{&quot;':;?/"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <cc1:RoundedCornersExtender ID="MessageTextBoxFilterationRoundedCornersExtender"
                    runat="server" BorderColor="153, 0, 0" Color="153, 0, 0" Enabled="True" Radius="8"
                    TargetControlID="MessageTextBoxFilterationPanel">
                </cc1:RoundedCornersExtender>
                <asp:LinkButton ID="SubmitQuestion" runat="server" CausesValidation="False" Font-Bold="True"
                    ForeColor="Black" CssClass="UnderlineLink" Style="left: 70%; position: relative; top: 0px" OnClientClick="MessageFireAnimation();"
                    Text="<%$ Resources:Resource, SubmitQuestion %>"></asp:LinkButton>
                <asp:LinkButton ID="CancelQuestion" runat="server" CausesValidation="False" Font-Bold="True"
                    ForeColor="Black" CssClass="UnderlineLink" Style="left: 75%; position: relative; top: 0px" OnClientClick="MessageFireAnimation();"
                    Text="<%$ Resources:Resource, CancelQuestion %>"></asp:LinkButton>
                <asp:Label ID="MessageTargetedLabel" runat="server" Style="position: relative"></asp:Label><br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Panel ID="ReplyMessagePanel" runat="server" Height="453px" Style="display: none;
        left: 100px; position: relative; top: 456px; z-index: 100;" Width="480px" BorderStyle="Double"
        BorderColor="Gray" BorderWidth="3px" BackColor="#cccccc">
        <asp:UpdatePanel ID="ReplyMessageUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <cc1:ModalPopupExtender ID="ReplyMessageModalPopupExtender" runat="server" TargetControlID="ReplyMessageTargetedLabel"
                    PopupControlID="ReplyMessagePanel" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>
                <asp:TextBox ID="ReplyMessageTextBox" runat="server" Height="400px" Style="position: relative;"
                    Width="475px" TextMode="MultiLine" ForeColor="#003366" MaxLength="1000" Rows="25"
                    onKeyDown="CountLeft(this.value,this.value.length,1000,'ReplyMessageCharacterLeftLabel');"
                    onKeyUp="CountLeft(this.id,this.value.length,1000,'ReplyMessageCharacterLeftLabel');"></asp:TextBox>
                <asp:Panel ID="ReplyMessageCharacterLeftPanel" runat="server" Height="28px" Width="131px">
                    <input id="ReplyMessageCharacterLeftLabel" value="1000" type="text" style="width: 35px;
                        color: #000080;" />
                    <asp:Label ID="ReplyMessageCharacterLabel" runat="server" Text="<%$ Resources:Resource, CharactersLeftLabel %>"
                        ForeColor="#000066" Width="200px"></asp:Label>
                </asp:Panel>
                <cc1:FilteredTextBoxExtender ID="ReplyMessageFilteredTextBoxExtender" runat="server"
                    InvalidChars="+-*/=)(*&amp;^%$#@!~`\|\]}[{&quot;':;?/&lt;&gt;" TargetControlID="ReplyMessageTextBox"
                    FilterMode="InvalidChars">
                </cc1:FilteredTextBoxExtender>
                <asp:Panel ID="ReplyMessageTextBoxFilterationPanel" runat="server" Width="173px"
                    Height="80px" Style="top: 36px; left: 515px; position: absolute; text-align: center;"
                    BackColor="White">
                    <table cellspacing="1" style="width: 100%; height: 100%">
                        <tr>
                            <td style="background-color: Maroon">
                                <asp:Label ID="ReplyMessageFilterationHeaderLabel" runat="server" Text="<%$ Resources:Resource, FilterationHeaderLabel %>"
                                    Font-Bold="True" Font-Size="Small" ForeColor="White"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="ReplyMessageFilterationLabel" Font-Bold="True" runat="server" Text="+-*/=)(*&^%$#@!~`\|\]}[{&quot;':;?/"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <cc1:RoundedCornersExtender ID="ReplyMessageTextBoxFilterationPanelRoundedCornersExtender"
                    runat="server" BorderColor="153, 0, 0" Color="153, 0, 0" Enabled="True" Radius="8"
                    TargetControlID="ReplyMessageTextBoxFilterationPanel">
                </cc1:RoundedCornersExtender>
                <asp:LinkButton ID="ReplyEmailLinkButton" runat="server" CausesValidation="False"
                    Font-Bold="True" ForeColor="Black" CssClass="UnderlineLink" Style="left: 70%;
                    position: relative; top: 0px" OnClientClick="javascript: $find('ReplyMessageModalPopupExtender').hide();"
                    Text="<%$ Resources:Resource, SubmitQuestion %>"></asp:LinkButton>
                <asp:LinkButton ID="CancelReplyEmailLinkButton" runat="server" CausesValidation="False"
                    Font-Bold="True" ForeColor="Black" CssClass="UnderlineLink" Style="left: 75%;
                    position: relative; top: 0px" OnClientClick="javascript: $find('ReplyMessageModalPopupExtender').hide();"
                    Text="<%$ Resources:Resource, CancelQuestion %>"></asp:LinkButton>
                <asp:Label ID="ReplyMessageTargetedLabel" runat="server" Style="position: relative"></asp:Label><br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Panel ID="PayPalPanel" runat="server" Height="420px" Style="display: none; left: 151px;
        position: relative; top: 317px; z-index: 103;" Width="421px" BackColor="White"
        BorderStyle="Double" BorderColor="Gray" BorderWidth="3px">
        <asp:UpdatePanel ID="PayPalUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <cc1:ModalPopupExtender ID="PayPalPanelModalPopupExtender" runat="server" TargetControlID="TargetedPaypalLabel"
                    PopupControlID="PayPalPanel" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>
                <asp:Button ID="CancelButton" runat="server" CausesValidation="False" Text="X" Font-Bold="true"
                    Style="left: 388px; position: relative; top: 2px" OnClientClick="ModalInvitationFireAnimation();" />
                <iframe width="100%" height="100%" marginwidth="0" marginheight="0" id="PayPalIFrame"
                    runat="server" src="http://www.yahoo.com"></iframe>
                <iframe width="100%" height="100%" marginwidth="0" marginheight="0" id="Iframe1"
                    src="http://www.yahoo.com"></iframe>
                <asp:Label ID="TargetedPaypalLabel" runat="server" Style="position: relative"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
        <cc1:RoundedCornersExtender ID="PayPalPanelRoundedCornersExtender" runat="server"
            BorderColor="Gray" Color="Gray" Enabled="True" TargetControlID="PayPalPanel"
            Radius="8">
        </cc1:RoundedCornersExtender>
    </asp:Panel>
    </form>
</body>
</html>
