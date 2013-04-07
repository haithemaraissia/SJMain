<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProfessionalProfileBest3.aspx.vb"
    Inherits="UserProfile" Culture="auto:en-US" UICulture="auto" %>
<%--
<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
--%><%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="~/common/MainUpperButtons.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head id="Head1" runat="server"><title>Professional Profile</title><script language="javascript" type="text/javascript">
    
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
                $find('WorkShopSlideShowModalPopupExtender').hide(); 
                document.body.style.overflow = 'visible';
            }
            if (number == 2) {
                $find('WorkShopSlideShowModalPopupExtender').show();
                $find('ProfileSlideShowModalPopupExtender').hide(); 
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
    </script><link href="../themes/opera/tabs.css" rel="stylesheet" type="text/css" /><link href="../themes/BlueMenublockStyleSheet.css" rel="stylesheet" type="text/css" /><link href="../themes/CenteredStyleSheet.css" rel="stylesheet" type="text/css" /><style type="text/css">
                                                                                              
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
    </style></head><body><form id="form1" runat="server">
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
    <%--<div id="containerdefault" style="z-index: 100; left: 10px; width: 311px; position: absolute; top: 102px;
        height: 108px">--%>
         <div id="wrapper">
         <div id="page">
            <div id="sidebar1" class="sidebar">
                <img src="../../Images/textgoogle.bmp" style="width: 
                </div>
                
                <div id="content" ">
   <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server"></cc1:ToolkitScriptManager>
     <cc1:TabContainer ID="ProfileTabContainer" CssClass="opera" runat="server" ActiveTabIndex="14"
            Height="655px" Width="670px" EnableTheming="True" BorderWidth="0px" Visible="true"
            BackColor="White" AutoPostBack="false" Font-Size="Small">
            <cc1:TabPanel ID="EventTabPanel" runat="server" HeaderText="<%$ Resources:Resource, EventTabPanel %>">
                <ContentTemplate>
                    <table style="width: 100%; height: 98%; position: relative;">
                        <tr>
                            <td style="width: 50%; vertical-align: top;">
                                <asp:Label ID="StatusLabel" runat="server" Style="position: relative; left: 10px;
                                    top: 10px" Text="<%$ Resources:Resource, Status %>" Font-Bold="True" ForeColor="#400000"
                                    Height="23px" Font-Size="Medium" Font-Names="Times New Roman"></asp:Label><br />
                                <asp:DataList ID="StatusDataList" runat="server" DataKeyField="ProID" DataSourceID="StatisticObjectDataSource"
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
                                                        <asp:Label ID="InvitationToProjectLabel" runat="server" Style="position: relative"
                                                            Text="<%$ Resources:Resource, EventInvitationToProject %>" Font-Names="Times New Roman"
                                                            Font-Size="Medium" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                    </td>
                                                    <td style="width: 100px; height: 16%">
                                                        <asp:Label ID="InviteToProjectLabel" runat="server" Style="position: relative" Text='<%# Eval("InvitedToProject", "{0}") %>'
                                                            Font-Names="Times New Roman" Font-Size="Medium"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; height: 16%">
                                                        <asp:Label ID="ProjectCompletedIDLabel" runat="server" Style="position: relative"
                                                            Text="<%$ Resources:Resource, EventProjectCompleted %>" Font-Size="Medium" Font-Names="Times New Roman"
                                                            Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                    </td>
                                                    <td style="width: 100px; height: 16%">
                                                        <asp:Label ID="ProjectCompletedLabel" runat="server" Style="position: relative" Text='<%# Eval("ProjectCompleted", "{0}") %>'
                                                            Font-Size="Medium" Font-Names="Times New Roman"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; height: 16%">
                                                        <asp:Label ID="ProjectCanceledIDLabel" runat="server" Style="position: relative"
                                                            Text="<%$ Resources:Resource, EventProjectCanceled %>" Font-Size="Medium" Font-Names="Times New Roman"
                                                            Font-Bold="True" ForeColor="Maroon"></asp:Label>
                                                    </td>
                                                    <td style="width: 100px; height: 16%">
                                                        <asp:Label ID="ProjectCanceledLabel" runat="server" Style="position: relative" Text='<%# Eval("ProjectCanceled", "{0}") %>'
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
                                    SelectMethod="GetStatistic" TypeName="StatisticsDataSetTableAdapters.ProfessionalAdditionalInformationTableAdapter">
                                     <SelectParameters>
                                            <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
                                        </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                            <td style="vertical-align: top; width: 104px">
                                <asp:Label ID="AccomplishementIDLabel" runat="server" Style="position: relative;
                                    left: 5px;" Text="<%$ Resources:Resource, EventAccomplishement %>" Font-Names="Times New Roman"
                                    Font-Bold="True" ForeColor="#003366" Height="23px" Font-Size="Medium"></asp:Label><br />
                                <asp:Panel ID="AccomplishementPanel" runat="server" Height="280px" Style="left: 10px;
                                    position: relative; top: 10px" Width="375px">
                                    <asp:DataList ID="AccomplishementDataList" runat="server" DataKeyField="ProID" DataSourceID="StatisticObjectDataSource"
                                        Style="position: relative; left: 23px; top: 0px; width: 355px;" CellPadding="0"
                                        CellSpacing="5" Width="355px">
                                        <ItemTemplate>
                                            <table style="left: -4px; width: 100%; position: relative; top: 0px; height: 290px;
                                                vertical-align: middle; text-align: center;">
                                                <tr>
                                                    <td style="width: 100px; height: 16%">
                                                        <asp:Label ID="RankIDLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, EventRank %>"
                                                            Font-Size="Medium" Font-Names="Times New Roman" Font-Bold="True" ForeColor="#003366"></asp:Label>
                                                    </td>
                                                    <td style="width: 100px">
                                                        <asp:Label ID="RankLabel" runat="server" Style="position: relative" Text='<%# Eval("Rank", "{0}") %>'
                                                            Font-Size="Medium" Font-Names="Times New Roman"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; height: 16%">
                                                        <asp:Label ID="PointsIDLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, EventPoints %>"
                                                            Font-Size="Medium" Font-Names="Times New Roman" Font-Bold="True" ForeColor="#003366"></asp:Label>
                                                    </td>
                                                    <td style="width: 100px">
                                                        <asp:Label ID="PointsLabel" runat="server" Style="position: relative" Text='<%# Eval("Points", "{0}") %>'
                                                            Font-Size="Medium" Font-Names="Times New Roman"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; height: 16%">
                                                        <asp:Label ID="MoneyEarnedIDLabel" runat="server" Height="19px" Style="position: relative;
                                                            top: 0px; left: -1px;" Text="<%$ Resources:Resource, EventMoneyEarned %>" Font-Names="Times New Roman"
                                                            Width="110px" Font-Size="Medium" Font-Bold="True" ForeColor="#003366"></asp:Label>
                                                    </td>
                                                    <td style="width: 100px">
                                                        <asp:Label ID="MoneyEarnedLabel" runat="server" Style="position: relative" Text='<%# Eval("MoneyEarned", "{0:C}") %>'
                                                            Font-Size="Medium" Font-Names="Times New Roman"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList></asp:Panel>
                                <cc1:RoundedCornersExtender ID="AccomplishementRoundedCornersExtender" runat="server"
                                    BorderColor="0, 51, 102" Color="0, 51, 102" TargetControlID="AccomplishementPanel"
                                    Enabled="True">
                                </cc1:RoundedCornersExtender>
                                <br />
                                <asp:Label ID="PerformanceIDLabel" runat="server" Style="position: relative; left: 5px;"
                                    Text="<%$ Resources:Resource, EventPerformance %>" Font-Names="Times New Roman"
                                    Font-Bold="True" ForeColor="#003300" Height="23px" Font-Size="Medium"></asp:Label>
                                <asp:Panel ID="PerformancePanel" runat="server" Height="173px" Style="left: 10px;
                                    position: relative; top: 10px" Width="375px">
                                    <table style="left: -4px; width: 100%; position: relative; top: 0px; height: 190px;
                                        vertical-align: middle; text-align: center;">
                                        <tr>
                                            <td>
                                                <asp:Label ID="CustomerRecommendationIDLabel" runat="server" Text="<%$ Resources:Resource, EventCustomerRecommendation %>"
                                                    Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="#003300"></asp:Label>
                                            </td>
                                            <td style="width: 100px">
                                                <asp:Chart ID="PerformanceChart" runat="server" Palette="None" Width="130px" Height="130px"
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
                                    </table>
                                </asp:Panel>
                                <cc1:RoundedCornersExtender ID="PerformanceRoundedCornersExtender" runat="server"
                                    BorderColor="0, 51, 0" Color="0, 51, 0" TargetControlID="PerformancePanel" Enabled="True">
                                </cc1:RoundedCornersExtender>
                            </td>
                            <asp:ObjectDataSource ID="PerformanceDatatSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetProfessionalCommentReceivedSummary" TypeName="ProfessionalCommentReceivedDataSetTableAdapters.ProfessionalCommentReceivedSummaryTableAdapter">
                                <SelectParameters>
                                            <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
                                        </SelectParameters>
                            </asp:ObjectDataSource>
                        </tr>
                    </table>
                
                
</ContentTemplate>
            




</cc1:TabPanel>
            <cc1:TabPanel ID="ProfileTabPanel" runat="server" HeaderText="<%$ Resources:Resource, ProfileTabPanel %>">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td style="width: 160px; background-color: #ffffff; height: 452px;" rowspan="2">
                                <asp:Panel ID="ProfessionalPhotoPanel" runat="server" Style="position: absolute; z-index: 104;
                                    height: 323px; width: 284px; top: 50px; left: 57px;">
                                    <asp:FormView ID="ProfessionalPhotoFormView" runat="server" DataKeyNames="PhotoID" DataSourceID="ProfessionalPhotoObjectDataSource">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ProfessionalImageButton" runat="server" Height="350px" Style="z-index: 100;
                                                position: relative; top: 0px" Width="263px" CommandName="select" ImageUrl='<%# Eval("PhotoPath") %>' />
                                        </ItemTemplate>
                                    </asp:FormView>
                                    
                                    <asp:ObjectDataSource ID="ProfessionalPhotoObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetProfessionalPhoto" TypeName="ProfessionalPhotoDataSetTableAdapters.SelectProfessionalPhotoTableAdapter">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    
                                </asp:Panel>
                                <asp:Panel ID="ProfessionalProfileMenu" CssClass="BlueMenublock" runat="server" Height="64px"
                                    Style="z-index: 105; left: 95px; position: absolute; top: 450px; height: 120px;
                                    width: 151px;" Width="121px" Font-Size="10pt">
                                    <ul>
                                        <li>
                                            <asp:HyperLink ID="SlideShowHyperLink" runat="server" NavigateUrl="#" onclick="$find('ProfileSlideShowModalPopupExtender').show();document.body.style.overflow =  'visible';"
                                                Text="<%$ Resources:Resource, SlideShow %>"></asp:HyperLink>
                                        </li>
                                        <li>
                                            <asp:HyperLink ID="EditPhotoHyperLink" runat="server" NavigateUrl="EditPhoto.aspx"
                                                Text="<%$ Resources:Resource, EditPhoto %>"></asp:HyperLink>
                                        </li>
                                        <li>
                                            <asp:HyperLink ID="UploadProfessionalPhotoHyperLink" runat="server" NavigateUrl="UploadProfessionalPhoto.aspx"
                                                Text="<%$ Resources:Resource, AddPhoto %>"></asp:HyperLink>
                                        </li>
                                        <li>
                                            <asp:HyperLink ID="EditAlbumHyperLink" runat="server" NavigateUrl="EditAlbum.aspx"
                                                Text="<%$ Resources:Resource, EditAlbum %>"></asp:HyperLink>
                                        </li>
                                        <li>
                                            <asp:HyperLink ID="ReorderPhotoHyperLink" runat="server" NavigateUrl="RearrangePhotos.aspx"
                                                Text="<%$ Resources:Resource, ReorderPhoto %>"></asp:HyperLink>
                                        </li>
                                    </ul>
                                </asp:Panel>
                            </td>
                            <td style="width: 100px; height: 452px;" rowspan="2" id="Td2">
                                <asp:UpdatePanel ID="ProfessionalDetailUpdatePanel" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Panel ID="ProfessionalDetailProfilePanel" runat="server" Height="347px" Style="left: 445px;
                                            position: absolute; top: 47px; z-index: 103; height: 365px;" Width="300px" BackColor="White">
                                            
                                            <asp:DetailsView ID="ProfileDetailView" runat="server" AutoGenerateRows="False" DataKeyNames="ProID"
                                                DataSourceID="ProfessionalProfileObjectDataSource" Height="286px" CellPadding="4"
                                                Width="300px" GridLines="None" Font-Size="9pt" ForeColor="#333333">
                                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                <Fields>
                                                    <asp:BoundField DataField="ProID" HeaderText="<%$ Resources:Resource, ID %>"
                                                        ReadOnly="True" SortExpression="ProID" Visible="False" />
                                                        
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
                                                                PostBackUrl="EditProfile.aspx" Style="position: relative" Text="<%$ Resources:Resource, Edit %>"
                                                                Font-Bold="True"></asp:LinkButton></ItemTemplate>
                                                    </asp:TemplateField>
                                                </Fields>
                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White" />
                                                <EditRowStyle BackColor="#999999" Font-Size="8pt" />
                                                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            </asp:DetailsView>
                                        </asp:Panel>
                                        <cc1:RoundedCornersExtender ID="ProfessionalDetailProfilePanelRoundedCornersExtender"
                                            runat="server" BorderColor="0, 51, 102" Color="0, 51, 102" Enabled="True" 
                                            TargetControlID="ProfessionalDetailProfilePanel">
                                        </cc1:RoundedCornersExtender>
                                        
                                        <asp:ObjectDataSource ID="ProfessionalProfileObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetProfessionalProfile" TypeName="ProfessionalProfileDataSetTableAdapters.ProfessionalGeneralTableAdapter">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <br />
                                <asp:Panel ID="ProfileChangePasswordPanel" runat="server" CssClass="BlueMenublock"
                                    Height="26px" Style="z-index: 113; left: 509px; position: absolute; top: 450px;
                                    width: 151px; height: 26px;" Font-Size="10pt">
                                    <ul>
                                        <li>
                                            <asp:HyperLink ID="ChangePasswordHyperlink" runat="server" NavigateUrl="#" Text="<%$ Resources:Resource, ChangePassword %>"
                                                onclick="$find('ChangePasswordModalPopupExtender').show();document.body.style.overflow = 'visible';"></asp:HyperLink>
                                        </li>
                                    </ul>
                                </asp:Panel>
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
                    <asp:Panel ID="PortfolioPanel" runat="server" Style="left: 0px; width: 100%; position: absolute;
                        top: 12px; height: 100%; z-index: 100">
                        <asp:UpdatePanel ID="ProfessionalPortfolioUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:DataList ID="PortfolioDataList" runat="server" DataKeyField="ProID" DataSourceID="ProfessionalPortfolioDataSource"
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
                                            top: 55px" Width="535px" Wrap="False">
                                            <asp:TextBox ID="AboutTextBox" runat="server" Height="162px" Style="position: relative;
                                                top: 1px; left: 2px;" TextMode="MultiLine" Width="526px" MaxLength="1000" Text='<%# Eval("About", "{0}") %>'
                                                onKeyDown="CountLeft(this.value,this.value.length,1000,'LeftAboutLabel');" onKeyUp="CountLeft(this.id,this.value.length,1000,'LeftAboutLabel');"></asp:TextBox>
                                            <asp:Panel ID="CharacterLeftAboutPanel" runat="server" Height="28px" Width="131px">
                                                <input id="LeftAboutLabel" value="1000" type="text" style="position: absolute; top: 195px;
                                                    width: 35px; color: #000080;" />
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
                                                width: 522px; height: 199px; left: 4px; top: 13px;" TextMode="MultiLine" MaxLength="1000"
                                                Text='<%# Eval("SpecialNotes", "{0}") %>' onKeyDown="CountLeft(this.value,this.value.length,1000,'LeftSpecialNotesLabel');"
                                                onKeyUp="CountLeft(this.id,this.value.length,1000,'LeftSpecialNotesLabel');">></asp:TextBox>
                                            <asp:Panel ID="CharacterLeftSpecialNotesPanel" runat="server" Height="28px" Width="131px">
                                                <input id="LeftSpecialNotesLabel" value="1000" type="text" style="position: absolute;
                                                    top: 230px; width: 35px; color: #000080;" />
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
                                    Style="left: 656px; position: absolute; top: 599px; height: 15px; width: 50px"
                                    CausesValidation="False" OnClick="UpdatePortfolioLinkButton_Click" OnClientClick="FireAnimation();"
                                    Text="<%$ Resources:Resource, PortfolioUpdate %>" Font-Size="Small"></asp:LinkButton>
                                <asp:LinkButton ID="CancelPortfolioLinkButton" runat="server" Font-Bold="True" ForeColor="Maroon"
                                    Style="left: 725px; position: absolute; top: 599px; height: 15px; width: 50px"
                                    CausesValidation="False" OnClientClick="FireAnimation();" Text="<%$ Resources:Resource, PortfolioCancel %>"
                                    Font-Size="Small"></asp:LinkButton>
                                <asp:ObjectDataSource ID="ProfessionalPortfolioDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetProfessionalPortfolioOriginal" TypeName="ProfessionalPortfolioDataSetTableAdapters.ProfessionalPortfolioTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                    <asp:Panel ID="FilterationPanel" runat="server" Width="173px" Height="80px" Style="top: 70px;
                        left: 615px; position: absolute; text-align: center;" BackColor="White">
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
                    <table style="width: 800px; position: absolute; height: 670px; left: 0px; top: 25px;">
                        <tr>
                            <td rowspan="2" style="width: 95px; background-color: gainsboro; vertical-align: top;
                                text-align: center;">
                                <asp:UpdatePanel ID="MessageMenuUpdatePanel" runat="server"><ContentTemplate>
                                        <table style="position: relative; left: 0px; top: 0px;">
                                            <tr>
                                                <td style="">
                                                    <asp:LinkButton ID="InboxLinkButton" runat="server" Font-Bold="True" ForeColor="Black"
                                                        Style="position: relative;" CausesValidation="False" Width="100px" Text="<%$ Resources:Resource, Inbox %>"></asp:LinkButton><br />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="">
                                                    <asp:LinkButton ID="OutboxLinkButton" runat="server" Font-Bold="True" ForeColor="Black"
                                                        Style="position: relative;" CausesValidation="False" Width="100px" Text="<%$ Resources:Resource, Outbox %>"></asp:LinkButton><br />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="">
                                                    <asp:LinkButton ID="SavedLinkButton" runat="server" Font-Bold="True" ForeColor="Black"
                                                        Style="position: relative;" CausesValidation="False" Width="100px" Text="<%$ Resources:Resource, Saved %>"></asp:LinkButton><br />
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
                            <td style="width: 100px; height: 289px; background-color: White;" valign="top">
                                <asp:Panel ID="UpperMessagePanel" runat="server" Height="289px" Width="680px" Style="z-index: 111">
                                    <asp:UpdatePanel ID="UpperMessageUpdatePanel" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:GridView ID="MessageGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                DataKeyNames="MessageID" DataSourceID="ProfessionalMessageObjectDataSource" ForeColor="Black"
                                                AllowSorting="True" Style="position: relative; left: 1px; top: 0px; width: 678px;
                                                height: 289px;" GridLines="None" BackColor="White" BorderColor="#DEDFDE" BorderWidth="0px"
                                                CellPadding="4" OnRowDataBound="MessageGridView_RowDataBound" OnPreRender="MessageGridView_PreRender"
                                                BorderStyle="None" PageSize="8">
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
                                                                Font-Bold="true" ForeColor="#0000C0" Text="<%$ Resources:Resource, View %>"></asp:LinkButton></ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle ForeColor="WHITE" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="False" CommandName="Delete"
                                                                Font-Bold="true" ForeColor="Maroon" Text="<%$ Resources:Resource, Delete %>"
                                                                CommandArgument='<%# Eval("MessageID") %>'></asp:LinkButton></ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" Height="10px" ForeColor="White" />
                                                <FooterStyle BackColor="#CCCC99" />
                                                <PagerStyle BackColor="Gray" ForeColor="Black" HorizontalAlign="Center" Height="10px" />
                                                <SelectedRowStyle ForeColor="#6B696B" BorderColor="#6B696B" BorderWidth="2px" Font-Bold="True" />
                                                <AlternatingRowStyle BackColor="#EFE7A7" />
                                                <RowStyle BackColor="#EFE7A7" HorizontalAlign="Center" VerticalAlign="Top" />
                                                <EmptyDataTemplate>
                                                    <asp:Label ID="EmptyMessageLabel" runat="server" Height="20px" Style="position: relative"
                                                        Text="<%$ Resources:Resource, EmptyMessageLabel %>" Width="100%" BackColor="#6B696B"
                                                        ForeColor="White"></asp:Label>
                                                </EmptyDataTemplate>
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
                                    Radius="7"></cc1:RoundedCornersExtender>





                                <asp:ObjectDataSource ID="ProfessionalMessageObjectDataSource" runat="server" DeleteMethod="DeleteProfessionalMessageInbox"
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetProfessionalMessageInbox"
                                    TypeName="ProfessionalMessageDataSetTableAdapters.ProfessionalMessageTableAdapter" UpdateMethod="UpdateProfessionalMessageInbox"
                                    InsertMethod="SaveProfessionalMessage">
                                    <SelectParameters>
<asp:SessionParameter Name="ProfessionalID" SessionField="ProfessionalID" Type="Int32" />
</SelectParameters>
<DeleteParameters>
<asp:Parameter Name="MessageID" Type="Int32" />
</DeleteParameters>
<InsertParameters>
<asp:Parameter Name="MessageID" Type="Int32" />
<asp:Parameter Name="MessageMode" Type="Int32" />
</InsertParameters>
<UpdateParameters>
<asp:Parameter Name="MessageID" Type="Int32" />
</UpdateParameters>
</asp:ObjectDataSource>





                                <asp:UpdatePanel ID="CustomMessageMenuUpdatePanel" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Panel runat="server" ID="CustomMessageMenuPanel" Height="28px" Style="position: absolute;
                                            left: 220px; top: 332px; vertical-align: bottom; text-align: center; height: 28px;
                                            width: 680px;" Width="100%">
                                            <asp:Button ID="SelectAllButton" runat="server" Style="position: absolute; top: 0px;
                                                left: 0px;" Text="<%$ Resources:Resource, SelectAllButton %>" CausesValidation="False"
                                                Font-Bold="True" ForeColor="#400000" Width="136px" Font-Size="9" />
                                            <asp:Button ID="DeselectAllButton" runat="server" Style="position: absolute; left: 180px;
                                                top: 0px;" Text="<%$ Resources:Resource, DeselectAllButton %>" CausesValidation="False"
                                                Font-Bold="True" ForeColor="#400000" Width="136px" Font-Size="9" />
                                            <asp:Button ID="DeleteButton" runat="server" Style="position: absolute; left: 360px;
                                                top: 0px;" Text="<%$ Resources:Resource, Delete %>" CausesValidation="False"
                                                Font-Bold="True" ForeColor="#400000" Width="136px" Font-Size="9" />
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
                                            left: 114px; top: 390px; position: absolute; max-width: 680px; width: 682px;
                                            display: block; white-space: normal;">
                                            <asp:DetailsView ID="DetailsMessageView" runat="server" Height="255px" Style="position: relative;
                                                top: 0px; left: 1px; width: 655px;" AutoGenerateRows="False" DataSourceID="ProfessionalMessageDetailObjectDataSource"
                                                CellPadding="4" ForeColor="Black" GridLines="None">
                                                <Fields>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Label ID="MessageDescriptionHeader" runat="server" Style="position: relative;
                                                                z-index: 1; top: 3px;" Text="<%$ Resources:Resource, DescriptionLabel %>" Font-Bold="True"
                                                                ForeColor="Black"></asp:Label><br />
                                                            <br />
                                                            <asp:Label ID="MessageDescription" runat="server" Text='<%# Bind("Description", "{0}") %>'
                                                                Width="655px" Style="max-width: 655px; width: 655px; display: block; white-space: normal;"
                                                                BackColor="White"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            &#160;&#160;</ItemTemplate>
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
                                                ForeColor="#400000" Style="position: relative" Visible="False" OnClientClick="javascript: $find('DelayModalPopUpExtender').show(); "
                                                Text="<%$ Resources:Resource, ReplyButton %>"></asp:LinkButton>&#160;&nbsp;<asp:LinkButton
                                                    ID="SaveLinkButton" runat="server" CausesValidation="False" Font-Bold="True"
                                                    ForeColor="#400000" OnClick="SaveLinkButton_Click" Style="position: relative"
                                                    Visible="False" OnClientClick="javascript: $find('DelayModalPopUpExtender').show(); "
                                                    Text="<%$ Resources:Resource, Save %>"></asp:LinkButton>
                                        </asp:Panel>
                                        <cc1:RoundedCornersExtender ID="LowerMessagePanel_RoundedCornersExtender" runat="server"
                                            Enabled="True" Radius="7" Color="DarkGray" BorderColor="DarkGray" TargetControlID="LowerMessagePanel">
                                        </cc1:RoundedCornersExtender>
                                        <asp:ObjectDataSource ID="ProfessionalMessageDetailObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetProfessionalMessageInbox" TypeName="ProfessionalMessageDataSetTableAdapters.ProfessionalMessageDetailTableAdapter">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="ProfessionalID" SessionField="ProfessionalID" Type="Int32" />
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
                                    CellPadding="4" DataKeyNames="ProjectID" DataSourceID="ProfessionalProjectDataSource"
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
                                                    OnClick="ViewProjectLinkButton_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="DeleteProjectLinkButton" runat="server" Font-Bold="True" ForeColor="#400000"
                                                    Style="position: relative" CausesValidation="False" CommandName="select" OnClientClick="FireAnimation();"
                                                    OnClick="DeleteProjectLinkButton_Click" Text="<%$ Resources:Resource, DeleteProjectLinkButton %>"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="Maroon" ForeColor="White" HorizontalAlign="Center" Font-Bold="True" />
                                    <HeaderStyle BackColor="Maroon" Font-Bold="True" ForeColor="White" Height="10px" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <EmptyDataTemplate>
                                        <asp:Label ID="EmptyProjectLabel" runat="server" Style="position: relative" Text="<%$ Resources:Resource, EmptyProjectLabel %>"
                                            ForeColor="White" Width="100%"></asp:Label>
                                    </EmptyDataTemplate>
                                    <EmptyDataRowStyle BackColor="#990000" Font-Bold="true" BorderStyle="None" HorizontalAlign="Center" />
                                    <SelectedRowStyle ForeColor="Maroon" BorderColor="Maroon" BorderWidth="2px" Font-Bold="True" />
                                </asp:GridView>
                                <asp:ObjectDataSource ID="ProfessionalProjectDataSource" runat="server" DeleteMethod="DeleteProject"
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetProfessionalProject"
                                    TypeName="ProfessionalProjectDataSetTableAdapters.ProjectRequirementsTableAdapter">
                                    <DeleteParameters>
                                        <asp:Parameter Name="ProjectID" Type="Int32" />
                                        <asp:Parameter Name="PosterID" Type="Int32" />
                                        <asp:Parameter Name="PosterRole" Type="String" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ProfessionalID" SessionField="ProfessionalID" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:Panel ID="PanelAddProject" runat="server" CssClass="BlueMenublock" Height="16px"
                            Style="z-index: 99; left: 803px; position: absolute; top: 10px" Width="130px"
                            Font-Size="10pt">
                            <ul>
                                <li>
                                    <asp:LinkButton ID="AddNewProjectLinkButton" runat="server" Font-Bold="True" Font-Size="Small"
                                        Width="112px" CausesValidation="False" Height="13px" OnClientClick="FireAnimation();"
                                        Text="<%$ Resources:Resource, AddNewProjectLinkButton %>"></asp:LinkButton>
                                </li>
                            </ul>
                        </asp:Panel>
                        <cc1:RoundedCornersExtender ID="ProjectPanelRoundedCornersExtender" runat="server"
                            BorderColor="64, 0, 0" Color="64, 0, 0" Radius="8" TargetControlID="ProjectPanel"
                            Enabled="True">
                        </cc1:RoundedCornersExtender>
                    </asp:Panel>
                    <asp:Panel ID="DetailProjectPanel" runat="server" BackColor="White" Height="150%"
                        Style="left: -3px; position: relative; top: 25px; height: 296px;" Width="100%">
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
                                                        <table style="width: 100%; position: relative; height: 100%; top: 8px; left: 1px;">
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
                                                        <br />
                                                    </ItemTemplate>
                                                    <EmptyDataRowStyle BackColor="SlateGray" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <EmptyDataTemplate>
                                                        <asp:Label ID="ProjectSelectionLabel" runat="server" Font-Bold="True" ForeColor="White"
                                                            Height="26px" Style="position: relative" Text="<%$ Resources:Resource, ProjectSelectionLabel %>"
                                                            Width="245px"></asp:Label>
                                                    </EmptyDataTemplate>
                                                </asp:FormView>
                                                <asp:LinkButton ID="EditProjectLinkButton" runat="server" CausesValidation="False"
                                                    Visible="false" OnClientClick="FireAnimation();" Font-Bold="True" OnClick="EditProjectLinkButton_Click"
                                                    Style="left: 217px; position: absolute; top: 195px" Width="59px" ForeColor="#400000"
                                                    Text="<%$ Resources:Resource, EditProjectLinkButton %>"></asp:LinkButton>
                                            </asp:Panel>
                                            <cc1:RoundedCornersExtender ID="DetailProjectSpecificationRoundedCornersExtender"
                                                runat="server" BorderColor="SlateGray" Color="SlateGray" Radius="8" TargetControlID="DetailProjectSpecificationPanel">
                                            </cc1:RoundedCornersExtender>
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
                                                DataSourceID="ProjectPhotoDetailDataSource" Style="position: absolute; left: 265px;
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
            <cc1:TabPanel ID="BidsTabPanel" runat="server" HeaderText="<%$ Resources:Resource, BidsTabPanel %>">
                <ContentTemplate>
                    <asp:UpdatePanel ID="GlobalBidsUpdatePanel" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="ActiveBidsPanel" runat="server" BackColor="White" Height="200px" Style="left: 0px;
                                position: relative; top: 1px" Width="100%">
                                <asp:Label ID="ActiveBidsLabel" runat="server" BackColor="#284775" Font-Bold="True"
                                    Height="10%" Style="position: relative" Text="<%$ Resources:Resource, ActiveBidsLabel %>"
                                    Width="100%" ForeColor="White"></asp:Label>
                                <asp:GridView ID="ActiveBidsGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    CellPadding="4" DataKeyNames="BidID" DataSourceID="ProfessionalBidDataSource" ForeColor="#333333"
                                    GridLines="None" Height="90%" HorizontalAlign="Center" Style="position: relative"
                                    Width="100%" PageSize="5">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <Columns>
                                        <asp:BoundField DataField="BidID" HeaderText="<%$ Resources:Resource, BidID %>" InsertVisible="False"
                                            ReadOnly="True" SortExpression="BidID" />
                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, ProjectIDLabel %>" SortExpression="ProjectID">
                                            <ItemTemplate>
                                                <asp:Label ID="ProjectIDLabel" runat="server" Text='<%# Bind("ProjectID") %>'></asp:Label></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ProjectTitle" HeaderText="<%$ Resources:Resource, ProjectTitle %>"
                                            ReadOnly="True" SortExpression="ProjectTitle" />
                                        <asp:BoundField DataField="AmountOffered" HeaderText="<%$ Resources:Resource, AmountOffered %>"
                                            SortExpression="AmountOffered" />
                                        <asp:BoundField DataField="BidDate" HeaderText="<%$ Resources:Resource, BidDate %>"
                                            SortExpression="BidDate" />
                                        <asp:BoundField DataField="Expr1" HeaderText="<%$ Resources:Resource, Currency %>"
                                            ReadOnly="True" SortExpression="Expr1" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="ActiveBidsViewProjectLinkButton" runat="server" CausesValidation="False"
                                                    Font-Bold="True" ForeColor="Navy" Style="position: relative" CommandName="select"
                                                    OnClick="ActiveBidsViewProjectLinkButton_Click" Text="<%$ Resources:Resource, ViewProject %>"></asp:LinkButton></ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                </asp:GridView>
                            </asp:Panel>
                            <asp:Panel ID="WinningBidsPanel" runat="server" BackColor="White" Height="200px"
                                Style="left: 0px; position: relative; top: 17px" Width="100%">
                                <asp:Label ID="WonBidsLabel" runat="server" BackColor="Maroon" Height="10%" Style="position: relative"
                                    Text="<%$ Resources:Resource, WonBidsLabel %>" Width="100%" Font-Bold="True"
                                    ForeColor="White"></asp:Label>
                                <asp:GridView ID="WonBidsGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="BidID"
                                    DataSourceID="SqlDataSource299" Height="90%" Style="position: relative" Width="100%"
                                    AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center"
                                    PageSize="5" OnSelectedIndexChanged="WonBidsGridView_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="BidID" HeaderText="<%$ Resources:Resource, BidID %>" ReadOnly="True"
                                            SortExpression="BidID" />
                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, ProjectIDLabel %>" SortExpression="ProjectID">
                                            <ItemTemplate>
                                                <asp:Label ID="ProjectWonIDLabel" runat="server" Text='<%# Bind("ProjectID") %>'></asp:Label></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="AmountOffered" HeaderText="<%$ Resources:Resource, AmountOffered %>"
                                            SortExpression="AmountOffered" />
                                        <asp:BoundField DataField="Expr1" HeaderText="<%$ Resources:Resource, Currency %>"
                                            ReadOnly="True" SortExpression="Expr1" />
                                        <asp:BoundField DataField="BidDate" HeaderText="<%$ Resources:Resource, BidDate %>"
                                            SortExpression="BidDate" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="WonBidsViewProjectLinkButton" runat="server" CausesValidation="False"
                                                    Font-Bold="True" ForeColor="#400000" Style="position: relative" CommandName="select"
                                                    OnClick="WonBidsViewProjectLinkButton_Click" Text="<%$ Resources:Resource, ViewProject %>"></asp:LinkButton></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="WonBidsRemoveProjectLinkButton" runat="server" CausesValidation="False"
                                                    Font-Bold="True" ForeColor="#400000" Style="position: relative" CommandName="select"
                                                    OnClick="WonBidsRemoveProjectLinkButton_Click" HeaderText="<%$ Resources:Resource, Remove %>"></asp:LinkButton></ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#400000" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#400000" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                </asp:GridView>
                            </asp:Panel>
                            <asp:Panel ID="LosingBidsPanel" runat="server" BackColor="White" Height="200px" Style="left: 0px;
                                position: relative; top: 33px" Width="100%">
                                <asp:Label ID="LostBidsLabel" runat="server" BackColor="Black" Height="10%" Style="position: relative"
                                    Text="<%$ Resources:Resource, LostBidsLabel %>" Width="100%" Font-Bold="True"
                                    ForeColor="White"></asp:Label>
                                <asp:GridView ID="LostBidsGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    CellPadding="4" DataKeyNames="BidID" DataSourceID="SqlDataSource399" ForeColor="#333333"
                                    GridLines="None" Height="90%" HorizontalAlign="Center" OnRowDeleting="LostBids_RowDeleting"
                                    OnSelectedIndexChanged="LostBids_SelectedIndexChanged" PageSize="5" Style="position: relative"
                                    Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="BidID" HeaderText="<%$ Resources:Resource, BidID %>" ReadOnly="True"
                                            SortExpression="BidID" />
                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, ProjectIDLabel %>" SortExpression="ProjectID">
                                            <ItemTemplate>
                                                <asp:Label ID="ProjectLostIDLabel" runat="server" Text='<%# Bind("ProjectID") %>'></asp:Label></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="AmountOffered" HeaderText="<%$ Resources:Resource, AmountOffered %>"
                                            SortExpression="AmountOffered" />
                                        <asp:BoundField DataField="BidDate" HeaderText="<%$ Resources:Resource, BidDate %>"
                                            SortExpression="BidDate" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LostBidsViewProjectLinkButton" runat="server" CausesValidation="False"
                                                    CommandName="select" Font-Bold="True" ForeColor="Black" OnClick="LostBidsViewProjectLinkButton_Click"
                                                    Style="position: relative" Text="<%$ Resources:Resource, ViewProject %>"></asp:LinkButton></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LostBidsDeleteProjectLinkButton" runat="server" CausesValidation="False"
                                                    CommandName="delete" Font-Bold="True" ForeColor="Black" Style="position: relative"
                                                    Text="<%$ Resources:Resource, Delete %>"></asp:LinkButton></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="NewBidLinkButton" runat="server" CausesValidation="False" CommandName="select"
                                                    Font-Bold="True" ForeColor="Black" OnClick="NewBidLinkButton_Click" Style="position: relative"
                                                    Text="<%$ Resources:Resource, Bid %>"></asp:LinkButton></ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#404040" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#404040" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                </asp:GridView>
                            </asp:Panel>
                            <asp:SqlDataSource ID="ProfessionalBidDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                
                                SelectCommand="SELECT Bids.ProjectID, (SELECT ProjectTitle FROM ProjectRequirements WHERE (ProjectID = Bids.ProjectID)) AS ProjectTitle, Bids.AmountOffered, Bids.BidDate, (SELECT CurrencyValue FROM Currency WHERE (CurrencyID = Bids.CurrencyID)) AS Expr1, Bids.BidID, ProfessionalBid.NumberofBids FROM ProfessionalBid INNER JOIN Bids ON ProfessionalBid.BidID = Bids.BidID WHERE (ProfessionalBid.ProID = @ProID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource399" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                SelectCommand="SELECT Bids.ProjectID, (SELECT ProjectTitle FROM ProjectRequirements WHERE (ProjectID = Bids.ProjectID)) AS ProjectTitle, Bids.AmountOffered, (SELECT CurrencyValue FROM Currency WHERE (CurrencyID = Bids.CurrencyID)) AS Expr1, Bids.BidDate, ProfessionalLostBid.BidID FROM Bids INNER JOIN ProfessionalLostBid ON Bids.BidID = ProfessionalLostBid.BidID WHERE (ProfessionalLostBid.ProID = @ProID)"
                                DeleteCommand="DeleteLostBid" DeleteCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="ProID" SessionField="ProID" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="BidID" Type="Int32" />
                                    <asp:Parameter Name="BidderID" Type="Int32" />
                                    <asp:Parameter Name="BidderRole" Type="String" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource299" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                SelectCommand="SELECT Bids.ProjectID, (SELECT ProjectTitle FROM ProjectRequirements WHERE (ProjectID = Bids.ProjectID)) AS ProjectTitle, Bids.AmountOffered, (SELECT CurrencyValue FROM Currency WHERE (CurrencyID = Bids.CurrencyID)) AS Expr1, Bids.BidDate, ProfessionalWinBid.BidID FROM Bids INNER JOIN ProfessionalWinBid ON Bids.BidID = ProfessionalWinBid.BidID WHERE (ProfessionalWinBid.ProID = @ProID)"
                                DeleteCommand="DELETE FROM ProfessionalWinBid WHERE (BidID = @BidID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="ProID" SessionField="ProID" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="BidID" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                            <cc1:RoundedCornersExtender ID="ActiveBidsPanelRoundedCornersExtender" runat="server"
                                BorderColor="40, 71, 117" Color="40, 71, 117" Enabled="True" TargetControlID="ActiveBidsPanel">
                            </cc1:RoundedCornersExtender>
                            <cc1:RoundedCornersExtender ID="WinningBidsPanelRoundedCornersExtender" runat="server"
                                BorderColor="64, 0, 0" Color="64, 0, 0" Enabled="True" TargetControlID="WinningBidsPanel">
                            </cc1:RoundedCornersExtender>
                            <cc1:RoundedCornersExtender ID="LosingBidsPanelRoundedCornersExtender" runat="server"
                                BorderColor="64, 64, 64" Color="64, 64, 64" Enabled="True" TargetControlID="LosingBidsPanel">
                            </cc1:RoundedCornersExtender>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                
                
</ContentTemplate>
            




</cc1:TabPanel>
            <cc1:TabPanel ID="FavoriteTabPanel" runat="server" HeaderText="<%$ Resources:Resource, FavoriteTabPanel %>">
                <ContentTemplate>
                    <table style="width: 100%; position: relative; height: 100%; left: 0px; top: 0px;">
                        <tr>
                            <td style="height: 154px; vertical-align: top; text-align: center;">
                                <asp:Panel ID="FavoritePanel" runat="server" Height="642px" Style="left: 0px; position: relative;
                                    top: 0px" Width="100%">
                                    <asp:UpdatePanel ID="FavoriteUpdatePanel" runat="server">
                                        <ContentTemplate>
                                            <asp:ObjectDataSource ID="ProfessionalFavoriteDataSource" runat="server" DeleteMethod="DeleteProfessionalFavorite"
                                                SelectMethod="GetProfessionalFavorite" TypeName="ProfessionalFavoriteDataSetTableAdapters.ProfessionalFavoriteDataTableTableAdapter">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="FavoriteID" Type="Int32" />
                                                </DeleteParameters>
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:GridView ID="FavoriteGridView" runat="server" AllowPaging="True" AllowSorting="True"
                                                CellPadding="4" DataSourceID="ProfessionalFavoriteDataSource" ForeColor="#333333"
                                                GridLines="None" AutoGenerateColumns="False" DataKeyNames="FavoriteID" Width="100%"
                                                PageSize="8">
                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Image ID="ProfessionalPhoto" runat="server" Height="65px" ImageUrl='<%# Bind("PhotoPath", "{0}") %>'
                                                                Width="65px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="<%$ Resources:Resource, FavoriteID %>" SortExpression="ProID">
                                                        <ItemTemplate>
                                                            <asp:Label ID="ProID1" runat="server" Text='<%# Bind("ProID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="<%$ Resources:Resource, UserName %>" SortExpression="UserName">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="ProfessionalHyperlink" runat="server" NavigateUrl='<%# Eval("ProID", "../ViewProfessionalProfile.aspx?PID={0}") %>'
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
                                                                OnClientClick="FireAnimation();" Text="<%$ Resources:Resource, FavoriteInviteToProjectLinkButton %>"></asp:LinkButton><br />
                                                            <br />
                                                            <asp:LinkButton ID="DeleteFavoriteLinkButton1" runat="server" BackColor="#284775"
                                                                CausesValidation="False" CommandName="delete" Font-Bold="True" Font-Size="9pt"
                                                                ForeColor="White" Style="position: relative; top: 0px; left: 0px; text-align: center;"
                                                                Width="102px" Text="<%$ Resources:Resource, FavoriteDelete %>"></asp:LinkButton><br />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="AskQuestionLinkButton1" runat="server" BackColor="#400000" CausesValidation="False"
                                                                Font-Bold="True" Font-Size="10pt" ForeColor="White" OnClick="AskQuestionLinkButton_Click"
                                                                Style="position: relative; text-align: center;" Width="102px" CommandName="select"
                                                                OnClientClick="FireAnimation();" Text="<%$ Resources:Resource, FavoriteAskQuestionLinkButton %>"></asp:LinkButton><br />
                                                            <br />
                                                            <asp:HyperLink ID="ViewProfileLinkButton1" runat="server" BackColor="#400000" CausesValidation="False"
                                                                Font-Bold="True" Font-Size="10pt" ForeColor="White" Style="position: relative;
                                                                text-align: center;" Width="102px" NavigateUrl='<%# Eval("ProID", "../ViewProfessionalProfile.aspx?PID={0}") %>'
                                                                Target="_blank" Text="<%$ Resources:Resource, FavoriteViewProfile %>">
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
                                                    Height="20px" />
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
                        top: 0px" Width="100%">
                        <asp:UpdatePanel ID="InvitationUpdatePanel" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="InvitationSentLabel" runat="server" BackColor="#003366" Font-Bold="True"
                                    Height="20px" Style="position: relative" Text="<%$ Resources:Resource, InvitationSentLabel %>"
                                    Width="100%" ForeColor="White"></asp:Label>
                                <asp:GridView ID="InvitationGridView" runat="server" DataSourceID="InvitationDataSource"
                                    AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="InvitationID"
                                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" HorizontalAlign="Center">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <EmptyDataRowStyle BackColor="#F7F6F3" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <Columns>
                                        <asp:BoundField DataField="InvitationID" HeaderText="<%$ Resources:Resource, InvitationIDLabel %>"
                                            ReadOnly="True" SortExpression="InvitationID" />
                                        <asp:BoundField DataField="EventDate" HeaderText="<%$ Resources:Resource, InvitationDate %>"
                                            SortExpression="EventDate" />
                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, To %>" SortExpression="ProfessionalUsername">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="ProfessionalHyperLink" runat="server" NavigateUrl='<%# Eval("ReceiverID", "../ViewProfessionalProfile.aspx?PID={0}") %>'
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
                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                                        VerticalAlign="Middle" Height="20px" />
                                    <EditRowStyle BackColor="#999999" />
                                    <EmptyDataTemplate>
                                        <asp:Label ID="EmptyInvitationLabel" runat="server" Height="20px" Style="text-align: center"
                                            Text="<%$ Resources:Resource, EmptyInvitationLabel %>" Width="100%"></asp:Label></EmptyDataTemplate>
                                    <AlternatingRowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                </asp:GridView>
                                <asp:ObjectDataSource ID="InvitationDataSource" runat="server" DeleteMethod="DeleteProfessionalInvitation"
                                    SelectMethod="GetProfessionalInvitationSent" TypeName="ProfessionalInvitationSentTableAdapters.ProfessionalInvitationSentTableAdapter">
                                    <DeleteParameters>
                                        <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
                                        <asp:ControlParameter ControlID="InvitationGridView" Name="InvitationID" PropertyName="SelectedValue"
                                            Type="Int32" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ProfessionalID" SessionField="ProfessionalID" Type="Int32" />
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
                    <img src="../../Images/Magnifyingglass.gif" alt="image" width="20px" height="20px">
                
                
</HeaderTemplate>
                




<ContentTemplate>
                    <asp:Panel ID="WatchListPanel" runat="server" Height="649px" Style="position: relative;
                        top: 4px; left: 0px;" BackColor="White">
                        <asp:UpdatePanel ID="WatchListUpdatePanel" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="WatchListGridView" runat="server" AutoGenerateColumns="False" DataSourceID="WatchListObjectDataSource"
                                    Style="position: relative; top: 0px; left: 0px; width: 100%;" CellPadding="4"
                                    ForeColor="#333333" GridLines="None" DataKeyNames="ProjectID" HorizontalAlign="Center"
                                    OnSelectedIndexChanged="WatchListGridView_SelectedIndexChanged" AllowPaging="True"
                                    AllowSorting="True" PageSize="23">
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
                                                    NavigateUrl='<%# Eval("HighestBidderID", "../ViewProfessionalProfile.aspx?PID={0}") %>'
                                                    ForeColor="#003366" Font-Bold="true" Target="_blank"></asp:HyperLink>
                                            </ItemTemplate>
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
                                                    CommandName="Select" Font-Bold="True" ForeColor="Navy" Text="<%$ Resources:Resource, ViewProjectLinkButton %>"
                                                    OnClick="ViewWatchListProject_Click" OnClientClick="FireAnimation();"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Font-Bold="True" ForeColor="Maroon" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="DeleteWatchListProject" runat="server" CausesValidation="False"
                                                    CommandName="Select" Font-Bold="True" ForeColor="Maroon" Style="position: relative"
                                                    OnClick="DeleteWatchListProject_Click" OnClientClick="FireAnimation();" Text="<%$ Resources:Resource, DeleteProjectLinkButton %>"></asp:LinkButton></ItemTemplate>
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
                                    <HeaderStyle BackColor="#4F5A64" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <EmptyDataTemplate>
                                        <asp:Label ID="EmptyWatchListProject" runat="server" Height="20px" Style="text-align: center"
                                            Text="<%$ Resources:Resource, EmptyWatchListProject %>" Width="100%" BackColor="#4F5A64"
                                            ForeColor="White" Font-Bold="true"></asp:Label>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                <asp:ObjectDataSource ID="WatchListObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetProfessionalWatchList" TypeName="ProfessionalWatchListDataSetTableAdapters.GetProfessionalWatchListTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ProfessionalID" SessionField="ProfessionalID" Type="Int32" />
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
            <cc1:TabPanel ID="TransactionTabPanel" runat="server" HeaderText="TabPanel7">
                <HeaderTemplate>
                    Transaction
                
                
</HeaderTemplate>
                




<ContentTemplate>
                    <asp:Panel ID="ActiveTransactionPanel" runat="server" Height="200px" Style="left: 0px;
                        position: relative; top: 0px" Width="100%" BackColor="White">
                        <asp:UpdatePanel ID="ActiveTransactionUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Label ID="ActiveTransactionLabel" runat="server" BackColor="DarkSlateGray" Font-Bold="True"
                                    Height="10%" Style="position: relative" Text="Active Transaction " Width="100%"
                                    ForeColor="White"></asp:Label>
                                <asp:GridView ID="ActiveTransactionGridView" runat="server" AllowPaging="True" AllowSorting="True"
                                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TransactionID" DataSourceID="SqlDataSource2900"
                                    ForeColor="#333333" GridLines="None" Style="position: relative" Width="100%"
                                    Font-Bold="True" Height="90%" PageSize="5">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                                    <Columns>
                                        <asp:BoundField DataField="TransactionID" HeaderText="Transaction ID" ReadOnly="True"
                                            SortExpression="TransactionID" />
                                        <asp:BoundField DataField="ProjectID" HeaderText="Project ID" SortExpression="ProjectID" />
                                        <asp:BoundField DataField="ProjectAmount" HeaderText="Project Amount" SortExpression="ProjectAmount" />
                                        <asp:BoundField DataField="DateCharged" HeaderText="Date" SortExpression="DateCharged" />
                                        <asp:BoundField DataField="StatusID" HeaderText="Phase" SortExpression="StatusID" />
                                        <asp:BoundField DataField="Currency" HeaderText="Currency" SortExpression="Currency" />
                                        <asp:BoundField DataField="PaymentDue" HeaderText="Payment Due" SortExpression="PaymentDue" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="ActiveTransactionDetailLinkButton" runat="server" CausesValidation="False"
                                                    CommandName="select" Font-Bold="True" ForeColor="#003333" Style="position: relative"
                                                    OnClick="ActiveTransactionDetailLinkButton_Click">Detail</asp:LinkButton></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="ActiveTransactionPayNowLinkButton" runat="server" CausesValidation="False"
                                                    CommandName="select" Font-Bold="True" ForeColor="Maroon" Style="position: relative"
                                                    OnClick="ActiveTransactionPayNowLinkButton_Click">Pay Now</asp:LinkButton></ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#003300" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#003300" Font-Bold="True" ForeColor="White" BorderStyle="None"
                                        HorizontalAlign="Center" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" HorizontalAlign="Center"
                                        VerticalAlign="Middle" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2900" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                    SelectCommand="SELECT TransactionID, ProjectID, ProjectAmount, AmountCharged, DateCharged, StatusID, (SELECT CurrencyValue FROM Currency WHERE (CurrencyID = ProfessionalTransaction.CurrencyID)) AS Currency, PaymentDue, PhaseStatus FROM ProfessionalTransaction WHERE (ProID = @ProID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ProID" SessionField="ProID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
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
                        position: relative; top: 27px" Width="100%" BackColor="White">
                        <asp:UpdatePanel ID="TransactionProgressUpdatePanel" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="TransactionProgressLabel" runat="server" BackColor="DarkRed" Font-Bold="True"
                                    ForeColor="White" Height="10%" Style="position: relative" Text="Transaction Progress"
                                    Width="100%"></asp:Label>
                                <asp:GridView ID="TransactionProgressGridView" runat="server" Style="position: relative"
                                    AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"
                                    DataKeyNames="TransactionID" DataSourceID="SqlDataSource2516516161" ForeColor="#333333"
                                    GridLines="None" Height="90%" Width="100%" PageSize="5">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" Font-Bold="True" />
                                    <Columns>
                                        <asp:BoundField DataField="TransactionID" HeaderText="Transaction ID" ReadOnly="True"
                                            SortExpression="TransactionID" />
                                        <asp:BoundField DataField="ProjectID" HeaderText="Project ID" SortExpression="ProjectID" />
                                        <asp:BoundField DataField="DateCharged" HeaderText="Date " SortExpression="DateCharged"
                                            DataFormatString="{0:d}" />
                                        <asp:BoundField DataField="PhaseID" HeaderText="Phase " SortExpression="PhaseID" />
                                        <asp:BoundField DataField="Currency" HeaderText="Currency" SortExpression="Currency" />
                                        <asp:BoundField DataField="PaymentDue" HeaderText="Amount" SortExpression="PaymentDue" />
                                        <asp:BoundField DataField="PayerUserName" HeaderText="From" SortExpression="PayerUserName" />
                                        <asp:BoundField DataField="PayeeUserName" HeaderText="To" SortExpression="PayeeUserName" />
                                        <asp:BoundField DataField="PaymentMethod" HeaderText="Method" ReadOnly="True" SortExpression="PaymentMethod" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True" SortExpression="Status" />
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#400000" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#400000" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2516516161" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                    SelectCommand="SELECT TransactionID, ProjectID, DateCharged, PhaseID, (SELECT CurrencyValue FROM Currency WHERE (CurrencyID = TransactionPending.CurrencyID)) AS Currency, PaymentDue, PayerUserName, PayeeUserName, (SELECT Description FROM TransactionStatus WHERE (TransactionStatusID = TransactionPending.TransactionStatusID)) AS Status, (SELECT PaymentMethodValue FROM PaymentMethod WHERE (PaymentMethodID = TransactionPending.PaymentMethod)) AS PaymentMethod FROM TransactionPending WHERE (PayerID = @ProID) AND (PayerRole = 'CUS') OR (PayeeID = @ProID) AND (PayerRole = 'CUS')">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ProID" SessionField="ProID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
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
                                    ForeColor="Black" Height="10%" Style="position: relative" Text="Transaction History"
                                    Width="100%"></asp:Label>
                                <asp:GridView ID="TransactionHistoryGridView" runat="server" Style="position: relative"
                                    AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"
                                    DataKeyNames="TransactionID" DataSourceID="SqlDataSourcecustomtComplete" ForeColor="#333333"
                                    GridLines="None" Width="100%" PageSize="5">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                                    <Columns>
                                        <asp:BoundField DataField="TransactionID" HeaderText="Transaction ID" ReadOnly="True"
                                            SortExpression="TransactionID" />
                                        <asp:BoundField DataField="ProjectID" HeaderText="Project ID" SortExpression="ProjectID" />
                                        <asp:BoundField DataField="DateCharged" DataFormatString="{0:d}" HeaderText="Date"
                                            SortExpression="DateCharged" />
                                        <asp:BoundField DataField="PhaseID" HeaderText="Phase" SortExpression="PhaseID" />
                                        <asp:BoundField DataField="Currency" HeaderText="Currency" ReadOnly="True" SortExpression="Currency" />
                                        <asp:BoundField DataField="PaymentDue" HeaderText="Amount" SortExpression="PaymentDue" />
                                        <asp:BoundField DataField="PayerUserName" HeaderText="From" SortExpression="PayerUserName" />
                                        <asp:BoundField DataField="PayeeUserName" HeaderText="To" SortExpression="PayeeUserName" />
                                        <asp:BoundField DataField="PaymentMethod" HeaderText="Method" ReadOnly="True" SortExpression="PaymentMethod" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True" SortExpression="Status" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="DeleteTransactionHistoryLinkButton" runat="server" CausesValidation="False"
                                                    CommandName="delete" Font-Bold="True" ForeColor="Black" Style="position: relative">Delete</asp:LinkButton></ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#404040" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#404040" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSourcecustomtComplete" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                    DeleteCommand="DELETE FROM ProfessionalTransactionHistory WHERE (TransactionID = @TransactionID) AND (ProID = @ProID)"
                                    SelectCommand="SELECT TransactionID, ProjectID, DateCharged, PhaseID, (SELECT CurrencyValue FROM Currency WHERE (CurrencyID = ProfessionalTransactionHistory.CurrencyID)) AS Currency, PaymentDue, PayerUserName, PayeeUserName, (SELECT Description FROM TransactionStatus WHERE (TransactionStatusID = ProfessionalTransactionHistory.TransactionStatusID)) AS Status, (SELECT PaymentMethodValue FROM PaymentMethod WHERE (PaymentMethodID = ProfessionalTransactionHistory.PaymentMethod)) AS PaymentMethod FROM ProfessionalTransactionHistory WHERE (ProID = @ProID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ProID" SessionField="ProID" />
                                    </SelectParameters>
                                    <DeleteParameters>
                                        <asp:ControlParameter ControlID="TransactionHistoryGridView" Name="TransactionID"
                                            PropertyName="SelectedValue" />
                                        <asp:SessionParameter Name="ProID" SessionField="ProID" />
                                    </DeleteParameters>
                                </asp:SqlDataSource>
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
            <cc1:TabPanel ID="ContractTabPanel" runat="server" HeaderText="TabPanel10">
                <HeaderTemplate>
                    Contract
                
                
</HeaderTemplate>
                




<ContentTemplate>
                    <asp:Panel ID="GlobalContractPanel" runat="server" BackColor="White" Height="300px"
                        Style="left: -6px; position: relative; top: 0px" Width="100%">
                        <asp:Label ID="ContractLabel" runat="server" BackColor="#400000" Font-Bold="True"
                            Height="6%" Style="position: relative" Text="Contract" Width="100%" ForeColor="White"></asp:Label>
                        <asp:GridView ID="GlobalContractGridView" runat="server" AutoGenerateColumns="False"
                            DataSourceID="ProfessionalContractSqlDataSource" Height="90%" Style="position: relative"
                            Width="100%" AllowPaging="True" AllowSorting="True" DataKeyNames="ContractID" GridLines="None"
                            CellPadding="4" ForeColor="#333333" HorizontalAlign="Center">
                            <Columns>
                                <asp:BoundField DataField="ContractID" HeaderText="Report ID" ReadOnly="True" SortExpression="ContractID" />
                                <asp:BoundField DataField="ProjectID" HeaderText="Project ID" SortExpression="ProjectID" />
                                <asp:BoundField DataField="ContractDate" HeaderText="Date" SortExpression="ContractDate" />
                                <asp:BoundField DataField="BidderUsername" HeaderText="Bidder Username" SortExpression="BidderUsername" />
                                <asp:BoundField DataField="PosterUsername" HeaderText="Poster Username" SortExpression="PosterUsername" />
                                <asp:BoundField DataField="HighestBid" HeaderText="Highest Bid" SortExpression="HighestBid" />
                                <asp:BoundField DataField="Currency" HeaderText="Currency" SortExpression="Currency" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="DetailsLinkButton" runat="server" ForeColor="#400000" Style="position: relative"
                                            CausesValidation="False" CommandName="select" Font-Bold="True" OnClick="DetailsLinkButton_Click">More Details</asp:LinkButton></ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="Maroon" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="Maroon" Font-Bold="True" ForeColor="White" Height="12%" HorizontalAlign="Center" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                    </asp:Panel>
                    <asp:SqlDataSource ID="ProfessionalContractSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                        SelectCommand="SELECT ProfessionalContract.ContractID, ProfessionalContract.ProjectID, ProfessionalContract.ContractDate, ProfessionalContract.BidderUsername, ProfessionalContract.PosterUsername, ProfessionalContract.HighestBid, (SELECT CurrencyValue FROM Currency WHERE (CurrencyID = ProfessionalContract.CurrencyID)) AS Currency FROM ProfessionalContract INNER JOIN Currency AS Currency_1 ON ProfessionalContract.CurrencyID = Currency_1.CurrencyID WHERE (ProfessionalContract.ProID = @ProID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Panel ID="DetailContractPanel" runat="server" BackColor="White" Height="305px"
                        Style="left: -5px; position: relative; top: 12px" Width="100%">
                        <asp:UpdatePanel ID="DetailContractUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:FormView ID="DetailContractFormView" runat="server" DataSourceID="SqlDataSource2cdfhfd"
                                    Style="position: relative">
                                    <ItemTemplate>
                                        <table style="width: 100%; position: relative; height: 219px">
                                            <tr>
                                                <td style="width: 100px; height: 36px">
                                                    <asp:Label ID="SpecificationLabel" runat="server" Style="position: relative" Text="Specification"
                                                        Font-Bold="True" ForeColor="DarkSlateGray"></asp:Label>
                                                </td>
                                                <td style="width: 100px; text-align: center;">
                                                </td>
                                                <td style="width: 100px; height: 36px">
                                                </td>
                                                <td style="width: 100px; height: 36px">
                                                    &#160;&#160;<asp:Label ID="DescriptionLabel" runat="server" Style="position: relative"
                                                        Text="Description" Width="88px" Font-Bold="True" ForeColor="DarkSlateGray"></asp:Label>
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
                                                    <asp:Label ID="ProjectIDLabel" runat="server" Style="position: relative" Text="Project ID"
                                                        Font-Bold="True" ForeColor="White"></asp:Label>
                                                </td>
                                                <td style="width: 100px; text-align: center;">
                                                    <asp:Label ID="ProjectIDBindedLabel" runat="server" Style="position: relative" Text='<%# Bind("ProjectID", "{0}") %>'></asp:Label>
                                                </td>
                                                <td style="width: 100px">
                                                </td>
                                                <td colspan="3" rowspan="4">
                                                    &#160;&#160;<asp:TextBox ID="DescriptionTextBox" runat="server" Height="145px" Style="position: relative;
                                                        top: -1px" Text='<%# Bind("Description", "{0}") %>' Width="374px"></asp:TextBox>&#160;&nbsp;
                                                </td>
                                                <td style="width: 100px; text-align: center">
                                                    <asp:LinkButton ID="ViewandPrintLinkButton" runat="server" CausesValidation="False"
                                                        ForeColor="#400000" OnClick="ViewandPrintLinkButton_Click" Style="position: relative"
                                                        OnClientClick=" javascript: var width = 500; var height = 300; var left = (screen.width  - width)/2; var top  = (screen.height - height)/2; var params = 'width=500, height=300,';  params += ', top='+top+', left='+left; params += ', directories=no';  params += ', location=no'; params += ', menubar=no'; params += ', copyhistory=no'; ', status=no'; params += ', toolbar=no'; newwin = window.open('../PrintContract.aspx','windowname5', params); if (window.focus) {newwin.focus()} return false;"
                                                        Font-Bold="True">View and Print</asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px; background-color: #660000;">
                                                    <asp:Label ID="NumberofBidsLabel" runat="server" Style="position: relative" Text="Number of Bids"
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
                                                    <asp:Label ID="StartDateLabel" runat="server" Style="position: relative" Text="Start Date"
                                                        Font-Bold="True" ForeColor="White"></asp:Label>
                                                </td>
                                                <td style="width: 100px; text-align: center;">
                                                    <asp:Label ID="StartDateBindedLabel" runat="server" Style="position: relative" Text='<%# Bind("StartDate", "{0:D}") %>'></asp:Label>
                                                </td>
                                                <td style="width: 100px">
                                                </td>
                                                <td style="width: 100px; text-align: center">
                                                    <asp:LinkButton ID="DownloadLinkButton" runat="server" ForeColor="#400000" Style="position: relative"
                                                        CausesValidation="False" OnClientClick=" javascript: var width = 500; var height = 300; var left = (screen.width  - width)/2; var top  = (screen.height - height)/2; var params = 'width=500, height=300,';  params += ', top='+top+', left='+left; params += ', directories=no';  params += ', location=no'; params += ', menubar=no'; params += ', copyhistory=no'; ', status=no'; params += ', toolbar=no'; newwin = window.open('../DownloadContract.aspx','windowname5', params); if (window.focus) {newwin.focus()} return false;"
                                                        Font-Bold="True">Download</asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px; background-color: #660000;">
                                                    <asp:Label ID="EndDateLabel" runat="server" Style="position: relative" Text="End Date"
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
                                <asp:SqlDataSource ID="SqlDataSource2cdfhfd" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                    SelectCommand="SELECT ProfessionalContract.ProjectID, ProjectRequirements.CategoryName, Projects.HighestBidderID, Projects.NumberofBids, ProjectRequirements.StartDate, ProjectRequirements.EndDate, ProjectRequirements.Description, ProjectRequirements.SpecialNotes FROM Projects INNER JOIN ProjectRequirements ON Projects.ProjectID = ProjectRequirements.ProjectID INNER JOIN ProfessionalContract ON ProfessionalContract.ProjectID = Projects.ProjectID WHERE (ProfessionalContract.ContractID = @ContractID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="GlobalContractGridView" Name="ContractID" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ContentTemplate>
                            <Triggers>
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
                                        DataSourceID="ProfessionalCommentReceivedSummaryDataSource" Width="80px" CellPadding="0"
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
                                        PaletteCustomColors="DarkGreen; DarkRed; DarkGray" DataSourceID="ProfessionalCommentReceivedSummaryDataSource"
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
                        <asp:ObjectDataSource ID="ProfessionalCommentReceivedSummaryDataSource" runat="server"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetProfessionalCommentReceivedSummary"
                            TypeName="ProfessionalCommentsReceivedTableAdapters.ProfessionalCommentReceivedSummaryTableAdapter">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="" Name="ProID" SessionField="ProfessionalID"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </asp:Panel>
                    <cc1:RoundedCornersExtender ID="Summary_RoundedCornersExtender" runat="server" Color="0, 33, 66"
                        Enabled="True" TargetControlID="Summary" BorderColor="0, 33, 66">
                    </cc1:RoundedCornersExtender>
                    <asp:Panel ID="CommentReceivedPanel" runat="server" Height="450px" Style="left: 0px;
                        position: relative; top: 10px" Width="100%">
                        <asp:UpdatePanel ID="CommentReceivedUpdatePanel" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="CommentReceivedLabel" runat="server" BackColor="#003300" Font-Bold="True"
                                    Height="10%" Style="position: relative" Text="<%$ Resources:Resource, CommentReceivedLabel %>"
                                    Width="100%" ForeColor="White">
                                </asp:Label>
                                <asp:GridView ID="CommentReceivedGridView" runat="server" AllowPaging="True" AllowSorting="True"
                                    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                                    Width="100%" HorizontalAlign="Center" DataSourceID="CommentReceivedDataSource"
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
                                                    ForeColor="#000066"></asp:HyperLink></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, About %>" SortExpression="ProjectTitle">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="AboutProjectLinkButton" runat="server" CausesValidation="False"
                                                    CommandName="select" ForeColor="#000066" Text='<%# Bind("ProjectTitle", "{0}") %>'
                                                    OnClientClick="FireAnimation();"></asp:LinkButton><br />
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
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                                        VerticalAlign="Middle" Height="10%" />
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <AlternatingRowStyle BackColor="#E3EAEB" ForeColor="Black" />
                                    <SelectedRowStyle ForeColor="#003300" BorderColor="#003300" BorderWidth="2px" Font-Bold="True" />
                                </asp:GridView>
                                <asp:ObjectDataSource ID="CommentReceivedDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetProfessionalCommentReceived" TypeName="ProfessionalCommentsReceivedTableAdapters.ProfessionalCommentReceivedTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                    <cc1:RoundedCornersExtender ID="CommentReceivedRoundedCornersExtender" runat="server"
                        Color="DarkOliveGreen" Enabled="True" TargetControlID="CommentReceivedPanel"
                        BorderColor="DarkOliveGreen">
                    </cc1:RoundedCornersExtender>
                    <asp:Panel ID="CommentSentPanel" runat="server" Height="450px" Style="left: 0px;
                        position: relative; top: 50px" Width="100%" BackColor="White">
                        <asp:UpdatePanel ID="CommentSentUpdatePanel" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="CommentSentLabel" runat="server" BackColor="#003366" Font-Bold="True"
                                    Height="10%" Style="position: relative" Text="<%$ Resources:Resource, CommentSentLabel %>"
                                    Width="100%" ForeColor="White"></asp:Label>
                                <asp:GridView ID="CommentSentGridView" runat="server" AllowPaging="True" AllowSorting="True"
                                    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"
                                    Width="100%" HorizontalAlign="Center" DataSourceID="CommentSentDataSource" DataKeyNames="ProjectID"
                                    Font-Size="Small" PageSize="5">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <Columns>
                                        <asp:BoundField DataField="CommentDate" HeaderText="<%$ Resources:Resource, CommentDate %>"
                                            SortExpression="CommentDate" DataFormatString="{0:dd/MM/yyyy}" />
                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, To %>" SortExpression="ProfessionalUsername">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="ProfessionalHyperLink" runat="server" NavigateUrl='<%# Eval("ProfessionalID", "../ViewProfessionalProfile.aspx?PID={0}") %>'
                                                    Target="_blank" Text='<%# Eval("ProfessionalUserName") %>' Font-Bold="False"
                                                    ForeColor="#000066"></asp:HyperLink></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:Resource, About %>" SortExpression="ProjectTitle">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="AboutProjectLinkButton" runat="server" CausesValidation="False"
                                                    CommandName="select" ForeColor="#000066" Text='<%# Bind("ProjectTitle", "{0}") %>'
                                                    OnClientClick="FireAnimation();"></asp:LinkButton><br />
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
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                                        VerticalAlign="Middle" Height="10%" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="#F7F6F3" ForeColor="Black" />
                                    <EmptyDataRowStyle BackColor="#E3EAEB" HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:GridView>
                                <asp:ObjectDataSource ID="CommentSentDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetProfessionalCommentSent" TypeName="ProfessionalCommentSentDataSetTableAdapters.ProfessionalCommentSentTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
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
                                    Font-Bold="True" ForeColor="#400000" Style="position: relative;" Text="<%$ Resources:Resource, DeleteAccountLinkButton %>"></asp:LinkButton>
                                <cc1:ConfirmButtonExtender ID="DeleteAccountConfirmButtonExtender" runat="server"
                                    ConfirmText="<%$ Resources:Resource, DeleteAccountConfirmButtonExtender %>" TargetControlID="DeleteAccountLinkButton"
                                    Enabled="True">
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
                                <asp:Label ID="AccountContactProfessionalServiceLabel" runat="server" Font-Bold="True"
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
                                <asp:Label ID="AccountHeaderProfessionalServiceLabel" runat="server" Style="position: relative;"
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
                                <asp:Label ID="AccountEmailProfessionalServiceLabel" runat="server" Font-Bold="True"
                                    ForeColor="#400000" Style="position: relative;" Text="<%$ Resources:Resource, AccountEmailCustomerServiceLabel %>"
                                    Width="194px"></asp:Label>
                            </td>
                            <td style="width: 30%; text-align: right">
                                <asp:Label ID="AccountCategoryLabel" runat="server" Font-Bold="True" ForeColor="Navy"
                                    Style="position: relative;" Text="<%$ Resources:Resource, AccountCategoryLabel %>"></asp:Label>
                            </td>
                            <td style="width: 40%; text-align: left">
                                <asp:DropDownList ID="AccountDropDownList" runat="server" Style="position: relative;"
                                    DataSourceID="ProfessionalServiceObjectDataSource" DataTextField="Description" DataValueField="ReasonID"
                                    Font-Size="Small">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:TextBox ID="AccountProfessionalServiceMessageTextBox" runat="server" Height="400px"
                                    Style="position: relative;" Width="656px" TextMode="MultiLine" ForeColor="#003366"
                                    MaxLength="1000" Rows="25" onKeyDown="CountLeft(this.value,this.value.length,1000,'LeftLabel');"
                                    onKeyUp="CountLeft(this.id,this.value.length,1000,'LeftLabel');"></asp:TextBox>
                                <asp:Panel ID="CharacterLeftPanel" runat="server" Height="28px" Width="131px">
                                    <input id="LeftLabel" value="1000" type="text" style="width: 35px; color: #000080;" />
                                    <asp:Label ID="CharactersLeftLabel" runat="server" Text="<%$ Resources:Resource, CharactersLeftLabel %>"
                                        ForeColor="#000066" Width="200px"></asp:Label>
                                </asp:Panel>
                                <cc1:FilteredTextBoxExtender ID="AccountProfessionalServiceTextBoxFilteredExtender" runat="server"
                                    InvalidChars="+-*/=)(*&amp;^%$#@!~`\|\]}[{&quot;':;?/&lt;&gt;" TargetControlID="AccountProfessionalServiceMessageTextBox"
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
                                    Style="position: relative; text-align: center" ForeColor="#003366" Font-Bold="True"
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
                    <asp:ObjectDataSource ID="ProfessionalServiceObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetCustomerService" TypeName="AccountCustomerServiceDataSetTableAdapters.CustomerServiceTableAdapter">
                        <SelectParameters>
                            <asp:SessionParameter Name="LCID" SessionField="Language" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                
                
</ContentTemplate>
            




</cc1:TabPanel>


         <cc1:TabPanel ID="TabPanel10" runat="server" HeaderText="TabPanel10">
             <HeaderTemplate>
                 Skills
             </HeaderTemplate>
             <ContentTemplate>
                 <asp:Panel ID="PanelAddSkill" runat="server" CssClass="BlueMenublock" Height="10px"
                     Style="z-index: 101; left: 761px; position: relative; top: 100px" Width="100px"
                     Font-Size="10pt">
                     <ul>
                         <li>
                             <asp:LinkButton ID="LinkButton4" runat="server" Font-Bold="True" Font-Size="Small"
                                 Width="76px" OnClick="LinkButton4_Click" CausesValidation="False">Add Skill</asp:LinkButton>
                         </li>
                     </ul>
                 </asp:Panel>
                 <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                     <ContentTemplate>
                         <asp:DataList ID="DataList2" runat="server" DataSourceID="SkillDataSqlDataSource"
                             RepeatColumns="2" Style="position: relative; top: 0px;" CellSpacing="5" Height="515px"
                             Width="818px" DataKeyField="SkillID">
                             <ItemTemplate>
                                 <asp:Panel ID="Panel5" runat="server" Width="327px" Height="155px">
                                     <table style="width: 100%; position: relative; height: 70%; top: 0px; left: 0px;">
                                         <tr>
                                             <td colspan="3" style="background-color: #003366">
                                                 <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Eval("JobTitle") %>' Font-Bold="True"
                                                     ForeColor="White"></asp:Label>
                                             </td>
                                         </tr>
                                         <tr>
                                             <td style="width: 100px">
                                             </td>
                                             <td style="width: 100px">
                                                 <asp:Label ID="CategoryLabel" runat="server" Text="Industry"></asp:Label>
                                             </td>
                                             <td style="width: 100px">
                                                 <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                                             </td>
                                         </tr>
                                         <tr>
                                             <td style="width: 100px">
                                             </td>
                                             <td style="width: 100px">
                                                 <asp:Label ID="ExperienceLabe" runat="server" Text="Experience"></asp:Label>
                                             </td>
                                             <td style="width: 100px">
                                                 <asp:Label ID="ExperienceLabel" runat="server" Text='<%# Eval("Experience") %>'></asp:Label>
                                             </td>
                                         </tr>
                                         <tr>
                                             <td style="width: 100px">
                                             </td>
                                             <td style="width: 100px">
                                                 <asp:Label ID="CrewNumberlabel" runat="server" Text="Crew Number"></asp:Label>
                                             </td>
                                             <td style="width: 100px">
                                                 <asp:Label ID="CrewLabel" runat="server" Text='<%# Eval("Crew") %>'></asp:Label>
                                             </td>
                                         </tr>
                                         <tr>
                                             <td style="width: 100px">
                                             </td>
                                             <td style="width: 100px">
                                                 <asp:Label ID="LicensedLabe" runat="server" Text="Licensed"> </asp:Label>
                                             </td>
                                             <td style="width: 100px">
                                                 <asp:Label ID="LicensedLabel" runat="server" Text='<%# Eval("Licensed") %>'></asp:Label>
                                             </td>
                                         </tr>
                                         <tr>
                                             <td style="width: 100px">
                                             </td>
                                             <td style="width: 100px">
                                                 <asp:Label ID="InsuredLabe" runat="server" Text="Insured"> </asp:Label>
                                             </td>
                                             <td style="width: 100px">
                                                 <asp:Label ID="InsuredLabel" runat="server" Text='<%# Eval("Insured") %>'> </asp:Label>
                                             </td>
                                         </tr>
                                         <tr>
                                             <td style="width: 100px">
                                             </td>
                                             <td style="width: 100px">
                                                 <asp:Label ID="RelocationLabe" runat="server" Text="Relocation"></asp:Label>
                                             </td>
                                             <td style="width: 100px">
                                                 <asp:Label ID="RelocationLabel" runat="server" Text='<%# Eval("Relocation") %>'></asp:Label>
                                             </td>
                                         </tr>
                                     </table>
                                     <asp:LinkButton ID="EditLinkButton" runat="server" Font-Bold="True" ForeColor="#000040"
                                         Style="left: 287px; position: relative; top: -19px" Width="31px" 
                                         CommandName="select" CausesValidation="False">Edit</asp:LinkButton></asp:Panel>
                                 <cc1:RoundedCornersExtender ID="RoundedCornersExtender3" runat="server" TargetControlID="Panel5"
                                     BorderColor="Gray" Radius="10" Color="Silver">
                                 </cc1:RoundedCornersExtender>
                             </ItemTemplate>
                             <ItemStyle VerticalAlign="Top" />
                         </asp:DataList>
                         &nbsp; &nbsp;
                     <asp:SqlDataSource ID="SkillDataSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
            SelectCommand="SELECT Skills.CategoryID, Skills.JobID, Skills.CategoryName, Skills.JobTitle, (SELECT ExperienceValue FROM Experience WHERE (ExperienceID = Skills.Experience)) AS Experience, (SELECT crewnumberValue FROM CrewNumber WHERE (Skills.Crew = crewnumberID)) AS Crew, (SELECT LicensedValue FROM Licensed WHERE (Skills.Licensed = LicensedID)) AS Licensed, (SELECT InsuredValue FROM Insured WHERE (Skills.Insured = InsuredID)) AS Insured, (SELECT RelocationValue FROM Relocation WHERE (Skills.Relocation = RelocationID)) AS Relocation, Skills.SkillID FROM ProfessionalSkill INNER JOIN Skills ON ProfessionalSkill.SkillID = Skills.SkillID WHERE (ProfessionalSkill.ProID = @ProID)">
            <SelectParameters>
                <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" />
            </SelectParameters>
        </asp:SqlDataSource></ContentTemplate>
                     <Triggers>
                         <asp:AsyncPostBackTrigger ControlID="DeleteSkillButton" EventName="Click" />
                         <asp:AsyncPostBackTrigger ControlID="SaveSkillButton" EventName="Click" />
                         <asp:AsyncPostBackTrigger ControlID="CancelSkillButton" EventName="Click" />
                     </Triggers>
                 </asp:UpdatePanel>
             </ContentTemplate>
         </cc1:TabPanel>
         
         
         <cc1:TabPanel ID="TabPanel11" runat="server" HeaderText="TabPanel11">
             <HeaderTemplate>
                 WorkShop Profile
             </HeaderTemplate>
             
             <ContentTemplate>
                 <table style="z-index: 101; left: 0px; width: 100%; position: static; height: 79%;
                     top: 75px;" id="Table3">
                     <tr>
                         <td style="width: 160px; background-color: #ffffff; height: 452px;">
                             <asp:FormView ID="FormView2" runat="server" DataKeyNames="PhotoID" DataSourceID="ProfessionalWorkPhotoSqlDataSource"
                                 Style="position: relative; top: -7px; left: 4px;">
                                 <EditItemTemplate>
                                     PhotoID:
                                     <asp:Label ID="PhotoIDLabel2" runat="server" Text='<%# Eval("PhotoID") %>'></asp:Label><br />
                                     PhotoPath:
                                     <asp:TextBox ID="PhotoPathTextBox1" runat="server" Text='<%# Bind("PhotoPath") %>'>
                                     </asp:TextBox><br />
                                     Caption:
                                     <asp:TextBox ID="CaptionTextBox1" runat="server" Text='<%# Bind("Caption") %>'>
                                     </asp:TextBox><br />
                                     <asp:LinkButton ID="UpdateButton1" runat="server" CausesValidation="True" CommandName="Update"
                                         Text="Update">
                                     </asp:LinkButton>
                                     <asp:LinkButton ID="UpdateCancelButton1" runat="server" CausesValidation="False"
                                         CommandName="Cancel" Text="Cancel">
                                     </asp:LinkButton>
                                 </EditItemTemplate>
                                 <InsertItemTemplate>
                                     PhotoPath:
                                     <asp:TextBox ID="PhotoPathTextBox1" runat="server" Text='<%# Bind("PhotoPath") %>'>
                                     </asp:TextBox><br />
                                     Caption:
                                     <asp:TextBox ID="CaptionTextBox1" runat="server" Text='<%# Bind("Caption") %>'>
                                     </asp:TextBox><br />
                                     <asp:LinkButton ID="InsertButton1" runat="server" CausesValidation="True" CommandName="Insert"
                                         Text="Insert">
                                     </asp:LinkButton>
                                     <asp:LinkButton ID="InsertCancelButton1" runat="server" CausesValidation="False"
                                         CommandName="Cancel" Text="Cancel">
                                     </asp:LinkButton>
                                 </InsertItemTemplate>
                                 <ItemTemplate>
                                     <asp:ImageButton ID="ProfessionalWorkImageButton" runat="server" Height="308px" Style="z-index: 100;
                                         left: 60px; position: relative; top: 0px" Width="243px" CommandName="select"
                                         ImageUrl='<%# Eval("PhotoPath") %>' OnClick="ProfessionalWorkImageButton_Click" />
                                 </ItemTemplate>
                             </asp:FormView>
                             <asp:Panel ID="Panel21" runat="server" CssClass="BlueMenublock" Height="64px" Style="z-index: 101;
                                 left: 106px; position: relative; top: 24px" Width="121px" Font-Size="10pt">
                                 <ul>
                                     <li><a id="A11" href="#" onclick="SwitchTab(2)" style="font: smallcaption">Play SlideShow</a></li>
                                     <li><a id="A2" style="font: smallcaption" href="EditWorkPhoto.aspx">Edit Photo</a></li>
                                     <li><a id="A5" href="UploadProfessionalWorkPhoto.aspx" style="font: smallcaption">Add
                                         Photo</a></li>
                                     <li><a id="A6" href="EditWorkAlbum.aspx" style="font: smallcaption">Edit Album</a></li>
                                     <li><a href="RearrangeWorkPhotos.aspx" style="font: smallcaption;">Reorder Photo</a></li>
                                 </ul>
                             </asp:Panel>
                         </td>
                         <td style="width: 100px; height: 452px;" id="Td1">
                             <asp:UpdatePanel ID="UpdatePanel20" runat="server" UpdateMode="Conditional">
                                 <ContentTemplate>
                                     <asp:DetailsView ID="DetailsView22" runat="server" AutoGenerateRows="False" DataKeyNames="ProID"
                                         DataSourceID="ProfessionalDetailWorkSqlDatasource" Height="336px" Style="left: 107px;
                                         position: relative; top: 26px" Width="243px" BackColor="White" BorderColor="#336666"
                                         BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal"
                                         Font-Size="9pt">
                                         <FooterStyle BackColor="White" ForeColor="#333333" />
                                         <RowStyle BackColor="White" ForeColor="#333333" />
                                         <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                         <Fields>
                                             <asp:BoundField DataField="Shopaddress" HeaderText="Shop address" SortExpression="Shopaddress" />
                                             <asp:BoundField DataField="CountryName" HeaderText="Country" SortExpression="CountryName" />
                                             <asp:BoundField DataField="RegionName" HeaderText="Region" SortExpression="RegionName" />
                                             <asp:BoundField DataField="CityName" HeaderText="City" SortExpression="CityName" />
                                             <asp:BoundField DataField="Zipcode" HeaderText="Zipcode" SortExpression="Zipcode" />
                                             <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber" />
                                             <asp:TemplateField ShowHeader="False">
                                                 <EditItemTemplate>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                    
                                                     <asp:LinkButton ID="EditProfileButton1" runat="server" CausesValidation="False" ForeColor="#0000C0"
                                                         OnClick="LinkButton5_Click" Text="Edit" PostBackUrl="EditWorkShopProfile.aspx"></asp:LinkButton>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                         </Fields>
                                         <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                         <EditRowStyle BackColor="#804040" Font-Bold="True" ForeColor="White" Font-Size="8pt" />
                                         <EmptyDataTemplate>
                                             <asp:Label ID="Emptylabel" runat="server" Style="position: relative" Text="No data found"></asp:Label>&nbsp;<br />
                                             <br />
                                             <strong></strong>
                                             <asp:LinkButton ID="LinkButton3" runat="server" Font-Bold="False" ForeColor="#000040"
                                                 Style="position: relative" PostBackUrl="EditWorkShopProfile.aspx">Edit</asp:LinkButton>
                                         </EmptyDataTemplate>
                                         <FieldHeaderStyle BackColor="#E0E0E0" Width="45%" />
                                     </asp:DetailsView>
                                 </ContentTemplate>
                             </asp:UpdatePanel>
                             <br />
                             <br />
                             <br />
                             <br />
                             <br />
                             <br />
                         </td>
                     </tr>
                 </table>
                 <asp:SqlDataSource ID="ProfessionalWorkPhotoSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                     SelectCommand="SelectProfessionalWorkPhoto" SelectCommandType="StoredProcedure">
                     <SelectParameters>
                         <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
                 <asp:SqlDataSource ID="ProfessionalDetailWorkSqlDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                     SelectCommand="SELECT DISTINCT ProID, Shopaddress, CountryID, CountryName, RegionID, RegionName, CityID, CityName, Zipcode, PhoneNumber FROM ProfessionalOptional WHERE (ProID = @ProID)">
                     <SelectParameters>
                         <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </ContentTemplate>
         </cc1:TabPanel>
    

    
    
    
        </cc1:TabContainer>
       <div id="footer">
            <p>
                VMCH &#65533; 2010
    VMCH &#65533; 2010
              </div>
     <div id="sidebar2" class="sidebar">
                <img src="../../Images/imagegoogle.bmp" style="width: 120px; height: 600px" />
            </div>
            <div style="clear: both; height: 4px;">
                &nbsp;</div>
     </div>
                </div>
                
            <!-- end content -->
            <!-- start sidebars -->
           
            <!-- end sidebars -->
            
       
        <!-- end page -->
       </div>
    
    <div id="footer">
        <p>
            &copy;2009 All Rights Reserved. &nbsp;&bull;&nbsp; Design by l;&nbsp; Design by
            <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.</p>
    </div>
    
 
              <asp:Panel ID="Panel4" runat="server" Style="left: 189px; display: none; position: relative;
                top: 567px; background-color: tan; z-index: 100;" Height="374px" Width="485px" BorderColor="Black"
                BorderStyle="Solid" BorderWidth="3px">
                <cc1:ModalPopupExtender ID="WorkShopSlideShowModalPopupExtender" runat="server" PopupControlID="Panel4"
                    TargetControlID="Label3" DropShadow="false" BackgroundCssClass="modalBackground"
                    X="300" Y="150" RepositionMode="RepositionOnWindowResizeAndScroll" CancelControlID="Exit2">
                </cc1:ModalPopupExtender>
                &nbsp;
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>" DeleteCommand="DELETE FROM [ProfessionalWorkPhoto] WHERE [PhotoID] = @original_PhotoID AND [PhotoPath] = @original_PhotoPath AND [Caption] = @original_Caption AND [AlbumID] = @original_AlbumID AND [ProID] = @original_ProID AND [PhotoRank] = @original_PhotoRank"
                    InsertCommand="INSERT INTO [ProfessionalWorkPhoto] ([PhotoPath], [Caption], [AlbumID], [ProID], [PhotoRank]) VALUES (@PhotoPath, @Caption, @AlbumID, @ProID, @PhotoRank)"
                    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [PhotoID], [PhotoPath], [Caption], [AlbumID], [ProID], [PhotoRank] FROM [ProfessionalWorkPhoto] WHERE ([ProID] = @ProID) ORDER BY [PhotoRank], [Caption]"
                    UpdateCommand="UPDATE [ProfessionalWorkPhoto] SET [PhotoPath] = @PhotoPath, [Caption] = @Caption, [AlbumID] = @AlbumID, [ProID] = @ProID, [PhotoRank] = @PhotoRank WHERE [PhotoID] = @original_PhotoID AND [PhotoPath] = @original_PhotoPath AND [Caption] = @original_Caption AND [AlbumID] = @original_AlbumID AND [ProID] = @original_ProID AND [PhotoRank] = @original_PhotoRank">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="ProID" SessionField="ProID"
                            Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_PhotoID" Type="Int32" />
                        <asp:Parameter Name="original_PhotoPath" Type="String" />
                        <asp:Parameter Name="original_Caption" Type="String" />
                        <asp:Parameter Name="original_AlbumID" Type="Int32" />
                        <asp:Parameter Name="original_ProID" Type="Int32" />
                        <asp:Parameter Name="original_PhotoRank" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="PhotoPath" Type="String" />
                        <asp:Parameter Name="Caption" Type="String" />
                        <asp:Parameter Name="AlbumID" Type="Int32" />
                        <asp:Parameter Name="ProID" Type="Int32" />
                        <asp:Parameter Name="PhotoRank" Type="Int32" />
                        <asp:Parameter Name="original_PhotoID" Type="Int32" />
                        <asp:Parameter Name="original_PhotoPath" Type="String" />
                        <asp:Parameter Name="original_Caption" Type="String" />
                        <asp:Parameter Name="original_AlbumID" Type="Int32" />
                        <asp:Parameter Name="original_ProID" Type="Int32" />
                        <asp:Parameter Name="original_PhotoRank" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="PhotoPath" Type="String" />
                        <asp:Parameter Name="Caption" Type="String" />
                        <asp:Parameter Name="AlbumID" Type="Int32" />
                        <asp:Parameter Name="ProID" Type="Int32" />
                        <asp:Parameter Name="PhotoRank" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
                &nbsp;
                <asp:Image ID="Image2" runat="server" Height="243px" Style="left: 60px; position: absolute;
                    top: 44px" Width="364px" />
                <br />
                <asp:Button ID="PreviousButton2" runat="server" Style="left: 91px; position: absolute;
                    top: 299px" Text="Previous" Width="70px" />
                &nbsp;
                <asp:Button ID="PlayButton2" runat="server" Style="left: 206px; position: absolute;
                    top: 299px" Text="Play" Width="74px" />
                &nbsp;
                <asp:Button ID="NextButton2" runat="server" Style="left: 326px; position: absolute;
                    top: 299px" Text="Next" Width="76px" />
                <asp:Button ID="Exit2" runat="server" Style="left: 426px; position: absolute;
                    top: 338px" Text="Exit" Width="45px" />
                <br />
                
                
                <asp:Label ID="Label3" runat="server" Style="left: 715px; position: relative;
                top: 373px; z-index: 101;" Text=" " Width="33px"></asp:Label>
            </asp:Panel>
               
       
    <asp:Panel ID="PanelMaximumSkills" runat="server" Style="z-index: 112; left: 248px;
        position: absolute; top: 880px; display: none; background-color: silver; text-align: center;"
        Width="360px" BorderColor="Navy" BorderWidth="2px" Height="62px">
        <cc1:ModalPopupExtender ID="ModalPopupExtender14" runat="server" TargetControlID="Label2"
            PopupControlID="PanelMaximumSkills" X="350" Y="250" BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Label ID="Label11" runat="server" Style="position: relative" Text="You are allowed up to 5 skills"
                    Width="183px"></asp:Label><br />
                <asp:Button ID="SkillHideButton" runat="server" Height="26px" Style="left: -4px;
                    position: relative; top: 11px" Text="ok" Width="44px" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    
    
   <asp:Panel ID="ProfessionalPanel" runat="server" Style="display: none; position: relative;
        left: 185px; top: 2123px;" Height="660px" Width="491px" BackColor="White" BorderColor="Black"
        BorderStyle="Solid" BorderWidth="3px">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="IndustyPanel" runat="server" Height="56px" Style="left: 3px; position: absolute;
                    top: 3px; z-index: 100;" Width="485px" BackColor="White">
                    <asp:Label ID="Label1" runat="server" Style="position: absolute" Text="Industry:"
                        Font-Bold="True" ForeColor="Maroon"></asp:Label>
                    <asp:DropDownList ID="IndustryDropDownList" runat="server" Style="left: 183px; position: absolute;
                        top: 18px" Width="120px" DataSourceID="SqlDataSource20" DataTextField="CategoryName"
                        DataValueField="CategoryID" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource20" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                        SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
                    <cc1:RoundedCornersExtender ID="IndustryRoundedCornersExtender2" runat="server" BorderColor="64, 0, 0"
                        Enabled="True" TargetControlID="IndustyPanel">
                    </cc1:RoundedCornersExtender>
                </asp:Panel>
                <asp:Panel ID="SpecialtyPanel" runat="server" Height="308px" Style="left: 1px; position: absolute;
                    top: 75px" Width="487px" BorderColor="Maroon" BorderWidth="0px" Wrap="False"
                    BackColor="White" BackImageUrl="~/Images/whitebackground.bmp">
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                        SelectCommand="SELECT SkillID, CategoryID, JobID, CategoryName, JobTitle, Experience, Crew, Licensed, Insured, Relocation FROM Skills WHERE (SkillID = @SkillID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="SkillID" SessionField="SKILLID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <cc1:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" Enabled="True"
                        TargetControlID="SpecialtyPanel" BorderColor="64, 0, 0">
                    </cc1:RoundedCornersExtender>
                    <asp:Label ID="SpecialisationLabel" runat="server" Style="left: 4px; position: absolute;
                        top: 1px" Text="Specialisation:" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                    <asp:ListBox ID="SpecialtyListBox1" runat="server" Height="270px" Style="left: 6px;
                        position: absolute; top: 25px" Width="139px" DataSourceID="SqlDataSource21" DataTextField="JobTitle"
                        DataValueField="JobID" SelectionMode="Multiple" Font-Size="9pt"></asp:ListBox>
                    &nbsp;
                    <asp:ListBox ID="SpecialtyListBox3" runat="server" Height="270px" Style="left: 340px;
                        position: absolute; top: 25px" Width="139px" DataSourceID="SqlDataSource62" DataTextField="JobTitle"
                        DataValueField="JobID" SelectionMode="Multiple" Font-Size="9pt"></asp:ListBox>
                    &nbsp;
                    <asp:ListBox ID="SpecialtyListBox2" runat="server" Height="270px" Style="left: 173px;
                        position: absolute; top: 25px" Width="139px" DataSourceID="SqlDataSource61" DataTextField="JobTitle"
                        DataValueField="JobID" SelectionMode="Multiple" Font-Size="9pt"></asp:ListBox>
                    &nbsp;
                    <asp:SqlDataSource ID="SqlDataSource21" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                        SelectCommand="SELECT JobID, JobTitle, JobCategory FROM Jobs WHERE (JobCategory = @JobCategory) AND (JobRank BETWEEN 1 AND 15)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="IndustryDropDownList" DefaultValue="1" Name="JobCategory"
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource62" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                        SelectCommand="SELECT JobID, JobTitle, JobCategory FROM Jobs WHERE (JobCategory = @JobCategory) AND (JobID &gt;31)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="IndustryDropDownList" DefaultValue="1" Name="JobCategory"
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource61" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                        SelectCommand="SELECT JobID, JobTitle, JobCategory FROM Jobs WHERE (JobCategory = @JobCategory) AND (JobID BETWEEN 16 AND 30)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="IndustryDropDownList" DefaultValue="1" Name="JobCategory"
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="IndustryDropDownList" EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
        <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" TargetControlID="Panel1"
            PopupControlID="ProfessionalPanel" BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
        <asp:Panel ID="Panel1" runat="server" Height="226px" Style="left: 3px; position: absolute;
            top: 387px; z-index: 101;" Width="486px" BackColor="White">
            <asp:Label ID="requirementLabel" runat="server" Style="position: absolute" Text="Requirement:"
                Font-Bold="True" ForeColor="Maroon"></asp:Label>
            &nbsp;
            <cc1:RoundedCornersExtender ID="RoundedCornersExtender3" runat="server" BorderColor="64, 0, 0"
                TargetControlID="Panel1">
            </cc1:RoundedCornersExtender>
            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                <ContentTemplate>
                    <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource4" Width="121px"
                        RepeatColumns="1">
                        <ItemTemplate>
                            <asp:SqlDataSource ID="SqlDataSource30" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                SelectCommand="SELECT RelocationID, RelocationValue, LCID FROM Relocation WHERE (LCID = @LCID)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="LCID" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource31" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                SelectCommand="SELECT [ExperienceID], [ExperienceValue], [LCID] FROM [Experience] WHERE ([LCID] = @LCID)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="LCID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource32" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                SelectCommand="SELECT [crewnumberID], [crewnumberValue], [LCID] FROM [CrewNumber] WHERE ([LCID] = @LCID)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="LCID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource28" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                SelectCommand="SELECT [LicensedID], [LicensedValue], [LCID] FROM [Licensed] WHERE ([LCID] = @LCID)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="LCID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource29" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                SelectCommand="SELECT [InsuredID], [InsuredValue], [LCID] FROM [Insured] WHERE ([LCID] = @LCID)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="LCID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            &nbsp;
                            <asp:Table ID="RequirementTable" runat="server" Style="position: absolute; left: 117px;
                                top: 33px;" Width="287px" CellPadding="4" CellSpacing="4" BorderColor="Gray"
                                BorderStyle="Inset" BorderWidth="2px">
                                <asp:TableRow ID="ExperienceTableRow" runat="server">
                                    <asp:TableCell ID="TableCell7" runat="server" HorizontalAlign="Center">
                                        <asp:Label ID="ExperienceLabel" runat="server" Text="Experience"></asp:Label></asp:TableCell>
                                    <asp:TableCell ID="TableCell8" runat="server" HorizontalAlign="Center">
                                        <asp:DropDownList ID="ExperienceDropDownList" runat="server" DataSourceID="SqlDataSource31"
                                            DataTextField="ExperienceValue" DataValueField="ExperienceID" SelectedIndex='<%# Eval("Experience") %>'
                                            AutoPostBack="true">
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="CrewNumberTableRow" runat="server">
                                    <asp:TableCell ID="TableCell9" runat="server" HorizontalAlign="Center">
                                        <asp:Label ID="crewNumberLabel" runat="server" Text="Crew Number"></asp:Label></asp:TableCell>
                                    <asp:TableCell ID="TableCell10" runat="server" HorizontalAlign="Center">
                                        <asp:DropDownList ID="CrewNumberDropDownList" runat="server" DataSourceID="SqlDataSource32"
                                            DataTextField="crewnumberValue" DataValueField="crewnumberID" SelectedIndex='<%# Eval("Crew") %>'
                                            AutoPostBack="true">
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="LicensedTableRow" runat="server">
                                    <asp:TableCell ID="TableCell1" runat="server" HorizontalAlign="Center">
                                        <asp:Label ID="LicensedLabel" runat="server" Text="Licensed"></asp:Label></asp:TableCell>
                                    <asp:TableCell ID="TableCell2" runat="server" HorizontalAlign="Center">
                                        <asp:DropDownList ID="LicensedDropDownList" runat="server" DataSourceID="SqlDataSource28"
                                            DataTextField="LicensedValue" DataValueField="LicensedID" SelectedIndex='<%# Eval("Licensed") %>'
                                            AutoPostBack="true">
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="InsuredTableRow" runat="server">
                                    <asp:TableCell ID="TableCell3" runat="server" HorizontalAlign="Center">
                                        <asp:Label ID="InsuredLabel" runat="server" Text="Insured"></asp:Label></asp:TableCell>
                                    <asp:TableCell ID="TableCell4" runat="server" HorizontalAlign="Center">
                                        <asp:DropDownList ID="InsuredDropDownList" runat="server" DataSourceID="SqlDataSource29"
                                            DataTextField="InsuredValue" DataValueField="InsuredID" SelectedIndex='<%# Eval("Insured") %>'
                                            AutoPostBack="true">
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="RelocationTableRow" runat="server">
                                    <asp:TableCell ID="TableCell5" runat="server" HorizontalAlign="Center">
                                        <asp:Label ID="RelocationLabel" runat="server" Text="Relocation"></asp:Label></asp:TableCell>
                                    <asp:TableCell ID="TableCell6" runat="server" HorizontalAlign="Center">
                                        <asp:DropDownList ID="RelocationDropDownList" runat="server" DataSourceID="SqlDataSource30"
                                            DataTextField="RelocationValue" DataValueField="RelocationID" SelectedIndex='<%# Eval("Relocation") %>'
                                            AutoPostBack="true">
                                        </asp:DropDownList>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            &nbsp; &nbsp;&nbsp;
                        </ItemTemplate>
                    </asp:DataList>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
        </asp:Panel>
        &nbsp; &nbsp; &nbsp;
        <asp:Button ID="DeleteSkillButton" runat="server" Text="Delete" BorderColor="#400000"
            BorderStyle="Outset" BorderWidth="3px" Style="position: relative; top: 639px;
            left: 232px; z-index: 104;" />
        <asp:Button ID="SaveSkillButton" runat="server" Text="Save Skill" BorderColor="#400000"
            BorderStyle="Outset" BorderWidth="3px" Style="position: relative; top: 639px;
            left: 239px; z-index: 104;" />
        <asp:Button ID="CancelSkillButton" runat="server" Text="Cancel" BorderColor="#400000"
            BorderStyle="Outset" BorderWidth="3px" Style="position: relative; top: 639px;
            left: 246px; z-index: 103;" />
        
    </asp:Panel>

    
    
    
    
    
    
    <asp:Panel ID="BidPanel" runat="server" Height="392px" Style="display: block; left: 45px;
        position: relative; top: 2150px; z-index: 103;" Width="512px" BackColor="White">
        <asp:UpdatePanel ID="BidUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <cc1:ModalPopupExtender ID="BidModalPopupExtender" runat="server" TargetControlID="BidTargetedLabel"
                    PopupControlID="BidPanel" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>" DeleteCommand="DELETE FROM [Projects] WHERE [ProjectID] = @original_ProjectID AND (([HighestBid] = @original_HighestBid) OR ([HighestBid] IS NULL AND @original_HighestBid IS NULL)) AND (([HighestBidderID] = @original_HighestBidderID) OR ([HighestBidderID] IS NULL AND @original_HighestBidderID IS NULL)) AND (([HighestBidUsername] = @original_HighestBidUsername) OR ([HighestBidUsername] IS NULL AND @original_HighestBidUsername IS NULL)) AND [Posted] = @original_Posted"
                    InsertCommand="INSERT INTO [Projects] ([HighestBid], [HighestBidderID], [HighestBidUsername], [Posted]) VALUES (@HighestBid, @HighestBidderID, @HighestBidUsername, @Posted)"
                    OldValuesParameterFormatString="original_{0}" SelectCommand="SelectProjectPhoto"
                    UpdateCommand="UPDATE [Projects] SET [HighestBid] = @HighestBid, [HighestBidderID] = @HighestBidderID, [HighestBidUsername] = @HighestBidUsername, [Posted] = @Posted WHERE [ProjectID] = @original_ProjectID AND (([HighestBid] = @original_HighestBid) OR ([HighestBid] IS NULL AND @original_HighestBid IS NULL)) AND (([HighestBidderID] = @original_HighestBidderID) OR ([HighestBidderID] IS NULL AND @original_HighestBidderID IS NULL)) AND (([HighestBidUsername] = @original_HighestBidUsername) OR ([HighestBidUsername] IS NULL AND @original_HighestBidUsername IS NULL)) AND [Posted] = @original_Posted"
                    SelectCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ProjectID" Type="Int32" />
                        <asp:Parameter Name="original_HighestBid" Type="Double" />
                        <asp:Parameter Name="original_HighestBidderID" Type="Int32" />
                        <asp:Parameter Name="original_HighestBidUsername" Type="String" />
                        <asp:Parameter Name="original_Posted" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="HighestBid" Type="Double" />
                        <asp:Parameter Name="HighestBidderID" Type="Int32" />
                        <asp:Parameter Name="HighestBidUsername" Type="String" />
                        <asp:Parameter Name="Posted" Type="Int32" />
                        <asp:Parameter Name="original_ProjectID" Type="Int32" />
                        <asp:Parameter Name="original_HighestBid" Type="Double" />
                        <asp:Parameter Name="original_HighestBidderID" Type="Int32" />
                        <asp:Parameter Name="original_HighestBidUsername" Type="String" />
                        <asp:Parameter Name="original_Posted" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="HighestBid" Type="Double" />
                        <asp:Parameter Name="HighestBidderID" Type="Int32" />
                        <asp:Parameter Name="HighestBidUsername" Type="String" />
                        <asp:Parameter Name="Posted" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter Name="ProjectID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Panel ID="CurrentBidPanel" runat="server" Style="position: relative; left: 2px;
                    top: 20px;" Height="99%" Width="99%">
                    <asp:SqlDataSource ID="SqlDataSource55" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                        SelectCommand="SELECT ProjectID, HighestBid, HighestBidderID, HighestBidUsername, Status, (SELECT TimeLeft FROM ProjectRequirements WHERE (ProjectID = @ProjectID)) AS TimeLeft FROM Projects WHERE (ProjectID = @ProjectID)"
                        DeleteCommand="DELETE FROM [Projects] WHERE [ProjectID] = @original_ProjectID AND (([HighestBid] = @original_HighestBid) OR ([HighestBid] IS NULL AND @original_HighestBid IS NULL)) AND (([HighestBidderID] = @original_HighestBidderID) OR ([HighestBidderID] IS NULL AND @original_HighestBidderID IS NULL)) AND (([HighestBidUsername] = @original_HighestBidUsername) OR ([HighestBidUsername] IS NULL AND @original_HighestBidUsername IS NULL))"
                        InsertCommand="INSERT INTO [Projects] ([HighestBid], [HighestBidderID], [HighestBidUsername]) VALUES (@HighestBid, @HighestBidderID, @HighestBidUsername)"
                        OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Projects] SET [HighestBid] = @HighestBid, [HighestBidderID] = @HighestBidderID, [HighestBidUsername] = @HighestBidUsername WHERE [ProjectID] = @original_ProjectID AND (([HighestBid] = @original_HighestBid) OR ([HighestBid] IS NULL AND @original_HighestBid IS NULL)) AND (([HighestBidderID] = @original_HighestBidderID) OR ([HighestBidderID] IS NULL AND @original_HighestBidderID IS NULL)) AND (([HighestBidUsername] = @original_HighestBidUsername) OR ([HighestBidUsername] IS NULL AND @original_HighestBidUsername IS NULL))">
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
                    </asp:SqlDataSource>
                    <table style="left: 1px; width: 100%; position: relative; top: 0px; height: 100%;
                        background-color: #ffffff">
                        <tr>
                            <td style="width: 50%; height: 13px; text-align: center; background-color: #5d7b9d;">
                                <asp:Label ID="CurrentTimeLeftLabel" runat="server" Style="position: relative" Text="Time Left:"
                                    Font-Bold="True" ForeColor="White"></asp:Label>
                            </td>
                            <td style="width: 234px; height: 13px; text-align: center;">
                                <asp:Label ID="CurrentTimeLeftValue" runat="server" Height="26px" Style="position: relative"
                                    Width="100%" ForeColor="#5D7B9D" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; text-align: center;">
                                <asp:Image ID="ProjectImage" runat="server" Style="position: relative; top: 11px;"
                                    Width="146px" Height="166px" />
                            </td>
                            <td style="width: 234px; text-align: center; vertical-align: middle;">
                                &nbsp;
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
                                <asp:Label ID="CurrencyLabel" runat="server" Style="position: relative" Text="Currency:"
                                    Font-Bold="True" ForeColor="White"></asp:Label>
                            </td>
                            <td style="width: 234px; height: 21px; text-align: center; background-color: #5d7b9d;">
                                <asp:Label ID="AmountLabel" runat="server" Style="position: relative" Text="Amount:"
                                    Font-Bold="True" ForeColor="White"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 136px; height: 21px; text-align: center;">
                                <asp:DropDownList ID="CurrencyDropDownList" runat="server" Style="position: relative"
                                    DataSourceID="SqlDataSource156" DataTextField="CurrencyValue" DataValueField="CurrencyID"
                                    Width="100px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource156" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                    SelectCommand="SELECT [CurrencyID], [CurrencyValue] FROM [Currency]" InsertCommand="PlaceBid"
                                    InsertCommandType="StoredProcedure">
                                    <InsertParameters>
                                        <asp:Parameter Name="ProjectID" Type="Int32" />
                                        <asp:Parameter Name="BidderID" Type="Int32" />
                                        <asp:Parameter Name="BidderUserName" Type="String" />
                                        <asp:Parameter DbType="DateTime" Name="BidDate" />
                                        <asp:Parameter Name="AmountOffered" Type="Double" />
                                        <asp:Parameter Name="CurrencyID" Type="Int32" />
                                        <asp:Parameter Name="BidderRole" Type="String" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td style="width: 234px; height: 21px; text-align: center;">
                                <asp:TextBox ID="NewAmountTextBox" runat="server" Style="position: relative">&nbsp; </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 136px; height: 21px; text-align: center">
                                <cc1:ValidatorCalloutExtender ID="BidValidatorCalloutExtender" runat="server" TargetControlID="BidRequiredFieldValidator">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td style="width: 234px; height: 21px; text-align: center">
                                <asp:RequiredFieldValidator ID="BidRequiredFieldValidator" runat="server" ControlToValidate="NewAmountTextBox"
                                    Display="None" ErrorMessage="New Bid is required" Style="position: relative"></asp:RequiredFieldValidator>&nbsp;
                                <asp:CustomValidator ID="BidCustomValidator" runat="server" ErrorMessage="CustomValidator"
                                    OnServerValidate="BidCustomValidator_ServerValidate" Style="position: relative"
                                    SetFocusOnError="True"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 136px; height: 21px">
                                &nbsp;
                            </td>
                            <td style="width: 234px; height: 21px; text-align: right;">
                                <asp:Button ID="PlaceBidButton" runat="server" Style="position: relative" Text="Place Your Bid"
                                    BackColor="#5D7B9D" BorderColor="#400000" Font-Bold="True" ForeColor="White"
                                    OnClick="PlaceBidButton_Click" />
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
                                <asp:Button ID="BidOkButton" runat="server" Style="position: relative" Text="Cancel"
                                    CausesValidation="False" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Label ID="BidTargetedLabel" runat="server" Style="position: relative" Width="153px"></asp:Label>&nbsp;</ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Panel ID="BidPanelClosed" runat="server" Height="60px" Style="left: 45px; position: relative;
        top: 2350px; z-index: 103; width: 174px;" HorizontalAlign="Center">
        <asp:UpdatePanel ID="CloseProjectUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="ClosedProjectPanel" runat="server" BackColor="White">
                    <cc1:ModalPopupExtender ID="ClosedProjectModalPopupExtender" runat="server" TargetControlID="ClosedProjectLabel"
                        PopupControlID="BidPanelClosed" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                    <asp:Label ID="ClosedProjectLabel" runat="server" Style="position: relative; height: 54%;"
                        Text="This Project is Closed" Width="153px"></asp:Label>
                    <asp:Button ID="CloseProjectOkButton" runat="server" Text="Ok" CausesValidation="false"
                        OnClick="ClosedProject" />
                </asp:Panel>
                <cc1:RoundedCornersExtender ID="ClosedProjectRoundedCornersExtender" runat="server"
                    Enabled="True" TargetControlID="ClosedProjectPanel" BorderColor="Maroon" Color="Maroon">
                </cc1:RoundedCornersExtender>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Panel ID="DetailTransaction" runat="server" Height="150px" Style="display: none;
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
                    DataSourceID="SqlDataSource46846" Height="90%" Style="position: relative" Width="90%"
                    GridLines="None">
                    <Fields>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="PhaseStatusLabel" runat="server" Height="61px" Style="position: relative"
                                    Text='<%# Bind("PhaseStatus", "{0}") %>' Width="461px"></asp:Label><br />
                                <br />
                                <asp:LinkButton ID="PhaseInformationLabel" runat="server" Font-Bold="True" ForeColor="#000040"
                                    Style="position: relative" CausesValidation="False" OnClientClick="window.open('../../PhaseInformation.aspx','','width=400, height=200');">Click Here For Phase Information:</asp:LinkButton></ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource46846" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                    SelectCommand="SELECT [PhaseStatus] FROM [ProfessionalTransaction] WHERE ([TransactionID] = @TransactionID)">
                    <SelectParameters>
                        <asp:Parameter Name="TransactionID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="DetailTransactionTargetedLabel" runat="server" Style="position: relative"
                    Width="153px"></asp:Label><asp:LinkButton ID="CloseLinkButton" runat="server" CausesValidation="False"
                        Font-Bold="True" ForeColor="Black" Style="left: 267px; position: relative; top: 0px">Close</asp:LinkButton></ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Panel ID="MethodofPaymentPanel" runat="server" Height="192px" Style="display: none;
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
                                        Text="Options:"></asp:Label>
                                </td>
                                <td style="width: 100px">
                                    <asp:Image ID="CreditCardImage" runat="server" Height="29px" ImageUrl="~/Images/CreditCard/CreditCardLogo.jpg"
                                        Style="position: relative" Width="80px" />
                                </td>
                                <td style="width: 100px">
                                    <asp:Image ID="GoogleCheckOutImage" runat="server" Height="29px" ImageUrl="~/Images/CreditCard/GoogleCheckOut.jpg"
                                        Style="position: relative" Width="80px" />
                                </td>
                                <td style="width: 100px">
                                    <asp:Image ID="PayPalImage" runat="server" Height="29px" ImageUrl="~/Images/CreditCard/PaypalLogo.jpg"
                                        Style="position: relative" Width="80px" />
                                </td>
                                <td style="width: 100px">
                                    <asp:Image ID="BidPayImage" runat="server" Height="29px" ImageUrl="~/Images/CreditCard/BidpayLogo.jpg"
                                        Style="position: relative" Width="80px" />
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
                                    <asp:Label ID="FeesLabel" runat="server" Font-Bold="True" ForeColor="#400000" Style="position: relative"
                                        Text="Fees:"></asp:Label>
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
                                    <asp:LinkButton ID="CreditCardLinkButton" runat="server" ForeColor="#000040" Style="position: relative"
                                        Font-Bold="True">Go</asp:LinkButton>
                                </td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="GoogleLinkButton" runat="server" ForeColor="#000040" Style="position: relative"
                                        Font-Bold="True">Go</asp:LinkButton>
                                </td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="PayPalLinkButton" runat="server" ForeColor="#000040" Style="position: relative"
                                        Font-Bold="True">Go</asp:LinkButton>
                                </td>
                                <td style="width: 100px">
                                    <asp:LinkButton ID="BidPayLinkButton" runat="server" ForeColor="#000040" Style="position: relative"
                                        Font-Bold="True">Go</asp:LinkButton>
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
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px; text-align: right;">
                                    <asp:Button ID="CancelPayment" runat="server" Style="position: relative; left: 0px;
                                        top: 22px;" Text="Cancel" OnClick="CancelPayment_Click" CausesValidation="False" />
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
        <asp:GridView ID="ProjectCurrentStatusGridView" runat="server" DataSourceID="SqlDataSource55"
            Style="position: relative; vertical-align: middle; text-align: center;" AutoGenerateColumns="False"
            ShowHeader="False" GridLines="None" Width="50%">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <table style="width: 80%; position: relative; height: 113%; left: 0px; vertical-align: middle;
                            top: 4px; text-align: center;" cellspacing="0">
                            <tr>
                                <td style="width: 25%; background-color: #5d7b9d; height: 26px;">
                                    <asp:Label ID="ProjectIDLabel" runat="server" Style="position: relative" Text="ProjectID"
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
                                    <asp:Label ID="BidderLabel" runat="server" Style="position: relative" Text="Bidder"
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
                                    <asp:Label ID="HighestBidLabel" runat="server" Style="position: relative" Text="Highest Bid"
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
    </p>    
    

    
    
    
    
    
    
    
    
    
    
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
            top: 338px" Text="<%$ Resources:Resource, Close %>" Width="75px"  />
        <br />
        <asp:Label ID="TargetedControlLabel" runat="server" Style="left: 715px; position: relative;
            top: 373px; z-index: 101;" Text=" " Width="33px"></asp:Label>
        <asp:HiddenField ID="PlayHiddenField" runat="server" Value="<%$ Resources:Resource, Play %>" />
        <asp:HiddenField ID="StopHiddenField" runat="server" Value="<%$ Resources:Resource, Stop %>" />
    </asp:Panel>
    <div id="WelcomeProfessionalHeader" style="z-index: 111; left: 745px; width: 230px; position: absolute;
        top: 0px; height: 100px; bottom: 357px; text-align:center ">
        <asp:LoginView ID="ProfessionalLoginView" runat="server">
            <LoggedInTemplate>
                <asp:Label ID="WelcomeLabel" runat="server" Text="<%$ Resources:Resource, WelcomeBackLabel %>"></asp:Label>
                <asp:LoginName ID="LoginName" runat="server" Style="position: relative" Font-Bold="True"
                    ForeColor="Maroon" />
            </LoggedInTemplate>
        </asp:LoginView>
    </div>
    <div id="LoginDiv">
        <asp:LoginStatus ID="ProfessionalLoginStatus" runat="server" LogoutPageUrl="~/NotAuthenticated/Index.aspx"
            Style="left: 850px; position: absolute; top: 77px; z-index: 102;" />
    </div>
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
                        position: absolute; top: 256px" Width="274px" Font-Size="10pt">
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
                        position: absolute; top: 11px" Width="274px">
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
                                position: absolute; top: 10px" Width="227px">
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
                        top: -128px" Width="227px">
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
                        <asp:LinkButton ID="MoreProjectLinkButton" runat="server" Text="<%$ Resources:Resource, More %>"
                            Style="left: 760px; position: relative; top: 50px; width: 40px" CausesValidation="False"
                            OnClientClick="MoreProjectFireAnimation2();" Font-Bold="True" ForeColor="Maroon"></asp:LinkButton>
                        <asp:Button ID="OkButton" runat="server" Text="<%$ Resources:Resource, OkButton %>"
                            Style="left: 820px; position: relative; top: 50px; width: 40px" CausesValidation="False"
                            OnClick="OkButton_Click" OnClientClick="MoreProjectFireAnimation();" />
                    </asp:Panel>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
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
                        DataSourceID="ProfessionalOpenProjectDataSource" Style="position: relative; text-align: center;
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
                                        CommandName="select" Font-Bold="True" ForeColor="#400000" Style="position: relative"
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
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </asp:Panel>
                &nbsp;<br />
                <asp:ObjectDataSource ID="ProfessionalOpenProjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetProfessionalOpenProject" TypeName="ProfessionalOpenProjectDataSetTableAdapters.ProfessionalOpenProjectDataTableTableAdapter">
                    <SelectParameters>
                        <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
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
                    Width="480px" TextMode="MultiLine" ForeColor="#003366" MaxLength="1000" Rows="25"
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
                    ForeColor="Black" Style="left: 70%; position: relative; top: 0px" OnClientClick="MessageFireAnimation();"
                    Text="<%$ Resources:Resource, SubmitQuestion %>"></asp:LinkButton>
                <asp:LinkButton ID="CancelQuestion" runat="server" CausesValidation="False" Font-Bold="True"
                    ForeColor="Black" Style="left: 75%; position: relative; top: 0px" OnClientClick="MessageFireAnimation();"
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
                    Width="480px" TextMode="MultiLine" ForeColor="#003366" MaxLength="1000" Rows="25"
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
                    Font-Bold="True" ForeColor="Black" Style="left: 70%; position: relative; top: 0px"
                    OnClientClick="javascript: $find('ReplyMessageModalPopupExtender').hide();" Text="<%$ Resources:Resource, SubmitQuestion %>"></asp:LinkButton>
                <asp:LinkButton ID="CancelReplyEmailLinkButton" runat="server" CausesValidation="False"
                    Font-Bold="True" ForeColor="Black" Style="left: 75%; position: relative; top: 0px"
                    OnClientClick="javascript: $find('ReplyMessageModalPopupExtender').hide();" Text="<%$ Resources:Resource, CancelQuestion %>"></asp:LinkButton>
                <asp:Label ID="ReplyMessageTargetedLabel" runat="server" Style="position: relative"></asp:Label><br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    </form>
</body>
</html>
