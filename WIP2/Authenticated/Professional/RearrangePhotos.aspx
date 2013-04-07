<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RearrangePhotos.aspx.vb"
    Inherits="RearrangePhotos" Culture="auto:en-US" UICulture="auto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../../common/CustomerTemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../../common/TemplateMainLowerButtons.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <link href="../themes/BlueMenublockStyleSheet.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../../_assets/css/TemplateStyleSheet.css" type="text/css" />
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:AjaxScriptManager ID="ScriptManager1" runat="server">
        </asp:AjaxScriptManager>
        <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
        </UpperNavigationButtons:NavigationButtons>
        <div id="wrapper">
            <table align="center" id="">
                <tr>
                    <td>
                        <table align="center" style="padding-top: 15px; padding-bottom: 15px">
                            <tr>
                                <td style="width: 115px">
                                </td>
                                <td>
                                    <asp:Panel ID="GlobalRearrangePanel" runat="server" Height="610px" Width="746px"
                                        Style="z-index: 101; position: relative; top: 0px; width: 699px; height: 610px">
                                        <asp:Panel ID="AlbumPanel" runat="server" Height="28px" Width="290px" BackColor="#cccccc"
                                            Style="position: relative; z-index: 104; left: 6px; top: 45px">
                                            <asp:Label ID="AlbumName" runat="server" Font-Size="11pt" Text="<%$ Resources:Resource, AlbumNameLabel %>"
                                                Style="left: 8px; position: relative; top: 1px; z-index: 100;"></asp:Label>
                                            <asp:ObjectDataSource ID="AlbumObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetProfessionalPicture" TypeName="ProfessionalPhotoDataSetTableAdapters.ProfessionalAlbumTableAdapter">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:DropDownList ID="AlbumDropDownList" runat="server" DataSourceID="AlbumObjectDataSource"
                                                DataTextField="AlbumCaption" DataValueField="AlbumID" AutoPostBack="True" Style="position: relative;
                                                left: 50px; top: 1px; z-index: 105;" Width="150px">
                                            </asp:DropDownList>
                                        </asp:Panel>
                                        <cc1:RoundedCornersExtender ID="AlbumPanel_RoundedCornersExtender" runat="server"
                                            Color="Maroon" Enabled="True" BorderColor="Maroon" Radius="3" TargetControlID="AlbumPanel">
                                        </cc1:RoundedCornersExtender>
                                        <asp:Panel ID="RearrangePanel" runat="server" Height="560px" Style="position: relative;
                                            background-color: #ffffff; z-index: 5;" Width="699px">
                                            <asp:UpdatePanel ID="RearrangeUpdatePanel" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:DataList ID="RearrangeDataList" runat="server" DataKeyField="PhotoID" DataSourceID="RearrangeObjectDataSource"
                                                        RepeatColumns="3" RepeatDirection="Horizontal" Width="480px" BorderColor="Gray"
                                                        BorderWidth="0px" CellPadding="20" CellSpacing="10" OnSelectedIndexChanged="RearrangeDataList_SelectedIndexChanged"
                                                        Style="left: 14px; position: absolute; top: 45px; height: 512px;" ItemStyle-VerticalAlign="Top">
                                                        <ItemTemplate>
                                                            <div id="ItemTemplateDiv" onmouseover="this.style.background='#BFC8D3';" onmouseout="this.style.background='white';"
                                                                style="height: 120px; width: 165px; left: 10px; top: 10px">
                                                                <asp:TextBox ID="RankTextBox" runat="server" BackColor="#E0E0E0" OnTextChanged="RankTextBox_TextChanged"
                                                                    ReadOnly="True" Style="left: 5px; position: relative; top: -65px" Text='<%# Eval("PhotoRank", "{0}") %>'
                                                                    Width="15px"></asp:TextBox>
                                                                <asp:ImageButton ID="PhotoImage" runat="server" Height="90px" ImageUrl='<%# Eval("PhotoPath", "{0}") %>'
                                                                    Style="left: 10px; position: relative; top: 6px" Width="90px" />
                                                                <asp:LinkButton ID="EditLinkButton" runat="server" CommandName="select" Font-Size="10pt"
                                                                    Font-Strikeout="False" Font-Underline="False" Style="left: 12px; position: relative;
                                                                    top: -65px" ForeColor="Red" onmouseover="this.style.textDecoration = 'underline';" CausesValidation="false" 
                                                                    onmouseout="this.style.textDecoration = 'none';" Text="<%$ Resources:Resource, Edit %>"></asp:LinkButton><br />
                                                                <div id="CaptionDiv" style="text-align: center; width: 160px;">
                                                                    <asp:Label ID="CaptionLabel" runat="server" Font-Size="10pt" Style="position: relative;
                                                                        top: 4px" Text='<%# Eval("Caption") %>'></asp:Label>
                                                                </div>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="RankRequiredFieldValidator" runat="server" ControlToValidate="RankTextBox"
                                                                    Display="Dynamic" ErrorMessage="<%$ Resources:Resource, RankRequiredFieldValidator %>"
                                                                    Font-Size="10pt" Style="left: 0px; position: relative; top: -8px"></asp:RequiredFieldValidator>
                                                                <asp:RangeValidator ID="RankRangeValidator" runat="server" ControlToValidate="RankTextBox"
                                                                    Display="Dynamic" ErrorMessage="<%$ Resources:Resource, RankRangeValidator %>"
                                                                    Font-Size="10pt" MaximumValue="1000" MinimumValue="0" Style="left: 0px; position: relative;
                                                                    top: -8px" Type="Integer"></asp:RangeValidator>
                                                            </div>
                                                        </ItemTemplate>
                                                        <SeparatorStyle BackColor="#400000" BorderColor="Maroon" BorderWidth="1px" />
                                                        <SelectedItemTemplate>
                                                           <div id="ItemTemplateDiv" 
                                                                style="height: 120px; width: 165px; left: 10px; top: 10px; background-color: #E0E0E0">
                                                                <asp:TextBox ID="RankTextBox" runat="server" BackColor="#E0E0E0" OnTextChanged="RankTextBox_TextChanged"
                                                                    ReadOnly="True" Style="left: 5px; position: relative; top: -65px" Text='<%# Eval("PhotoRank", "{0}") %>'
                                                                    Width="15px"></asp:TextBox>
                                                                <asp:ImageButton ID="PhotoImage" runat="server" Height="90px" ImageUrl='<%# Eval("PhotoPath", "{0}") %>'
                                                                    Style="left: 10px; position: relative; top: 6px" Width="90px" />
                                                                <br />
                                                                <div id="CaptionDiv" style="text-align: center; width: 160px;">
                                                                    <asp:Label ID="CaptionLabel" runat="server" Font-Size="10pt" Style="position: relative;
                                                                        top: 4px" Text='<%# Eval("Caption") %>'></asp:Label>
                                                                </div>
                                                                <br />
                                                              
                                                            </div>
                                                        </SelectedItemTemplate>
                                                    </asp:DataList>
                                                    <asp:ObjectDataSource ID="RearrangeObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                        SelectMethod="GetAllProfessionalPhoto" TypeName="ProfessionalPhotoDataSetTableAdapters.ReorderProfessionalPhotoTableAdapter"
                                                        UpdateMethod="UpdateRank">
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="CurrentRank" Type="Int32" />
                                                            <asp:Parameter Name="PhotoID" Type="Int32" />
                                                        </UpdateParameters>
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="AlbumDropDownList" Name="AlbumID" PropertyName="SelectedValue"
                                                                Type="Int32" />
                                                            <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="AlbumDropDownList" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                        <cc1:RoundedCornersExtender ID="RearrangePanelRoundedCornersExtender" runat="server"
                                            BorderColor="0, 51, 102" TargetControlID="RearrangePanel" Color="0, 51, 102"
                                            Radius="5">
                                        </cc1:RoundedCornersExtender>
                                        <asp:Panel ID="ActionsPanel" runat="server" Style="text-align: center">
                                            <asp:LinkButton ID="CancelButton" runat="server" Font-Bold="True" ForeColor="DarkRed"
                                                Text="<%$ Resources:Resource, Cancel %>" BorderColor="Maroon" BorderStyle="Outset"
                                                BorderWidth="1px" Style="left: 550px; position: absolute; top: 54px; z-index: 103;"
                                                Width="100px" Height="20px" CssClass="UnderlineLink" ></asp:LinkButton>
                                            <asp:LinkButton ID="SaveButton" runat="server" Height="20px" Font-Bold="True" ForeColor="DarkRed"
                                                Text="<%$ Resources:Resource, Save %>" Style="left: 436px; position: absolute;
                                                top: 54px; z-index: 104;" BorderColor="Maroon" BorderStyle="Outset" BorderWidth="1px"
                                                Width="100px" CssClass="UnderlineLink" ></asp:LinkButton>
                                        </asp:Panel>
                                    </asp:Panel>
                                </td>
                                <td>
                                    <asp:Panel ID="ProfessionalProfileMenu" CssClass="BlueMenublock" runat="server" Height="70px"
                                        Style="z-index: 0; left: 20px; position: relative; top: -20px; height: 120px;
                                        width: 115px; text-align: center" Width="115px" Font-Size="12pt">
                                        <ul>
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
                                            <li>
                                                <asp:LinkButton ID="BackToProfile" runat="server" PostBackUrl="ProfessionalProfile.aspx"
                                                    Text="<%$ Resources:Resource, BackToProfileLinkButton%>"></asp:LinkButton>
                                            </li>
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
    </div>
    </form>
</body>
</html>
