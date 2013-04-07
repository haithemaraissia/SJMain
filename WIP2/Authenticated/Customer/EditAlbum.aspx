<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EditAlbum.aspx.vb" Inherits="_EditAlbum"
    Culture="auto:en-US" UICulture="auto" %>

<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../../common/CustomerTemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../../common/TemplateMainLowerButtons.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <link href="../themes/BlueMenublockStyleSheet.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../../_assets/css/TemplateStyleSheet.css" type="text/css" />
    <link type="text/css" rel="stylesheet" />
    <style type="text/css">
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
    </style>
</head>
<body>
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
    <form id="form1" runat="server">
    <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <div id="wrapper" style="padding: 25px">
        <table align="center" id="">
            <tr>
                <td>
                    <table align="center">
                        <tr>
                            <td style="width: 115px">
                            </td>
                            <td>
                                <asp:Panel ID="GlobalAlbumPanel" Style="z-index: 101; width: 699px; position: relative;
                                    height: 615px; background-color: #ffffff;" runat="server">
                                    <cc1:RoundedCornersExtender ID="AlbumRoundedCornersExtender" runat="server" BorderColor="0, 51, 102"
                                        TargetControlID="GlobalAlbumPanel" Color="0, 51, 102">
                                    </cc1:RoundedCornersExtender>
                                    <asp:Panel ID="AlbumPanel" runat="server" Height="28px" Style="left: 382px; position: absolute;
                                        top: 10px; z-index: 104;" Width="310px" BackColor="#cccccc">
                                        <asp:UpdatePanel ID="EditAlbumUpdatePanel" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:DropDownList ID="AlbumDropDownList" runat="server" AutoPostBack="True" Style="position: relative;
                                                    left: 3px; top: 1px;" DataSourceID="CustomerAlbumObjectDataSource" DataTextField="AlbumCaption"
                                                    DataValueField="AlbumID" Width="150px">
                                                </asp:DropDownList>
                                                <asp:LinkButton ID="EditAlbumName" runat="server" Font-Underline="False" Style="position: relative;
                                                    left: 35px;" ForeColor="Maroon" Font-Bold="True" onmouseover="this.style.textDecoration = 'underline';"
                                                    onmouseout="this.style.textDecoration = 'none';" Text="<%$ Resources:Resource, EditAlbum %>"></asp:LinkButton><br />
                                                <asp:ObjectDataSource ID="CustomerAlbumObjectDataSource" runat="server" DeleteMethod="DeleteCustomerAlbum"
                                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetCustomerPicture"
                                                    TypeName="CustomerPhotoDataSetTableAdapters.CustomerAlbumTableAdapter" UpdateMethod="UpdateCustomerAlbum">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="CustomerID" Type="Int32" />
                                                        <asp:Parameter Name="AlbumID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="AlbumID" Type="Int32" />
                                                        <asp:Parameter Name="CustomerID" Type="Int32" />
                                                        <asp:Parameter Name="NewCaption" Type="String" />
                                                    </UpdateParameters>
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="CustomerID" SessionField="CustomerId" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="SaveAlbum" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="DeleteAlbum" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <cc1:RoundedCornersExtender ID="EditAlbumRoundedCornersExtender" runat="server" Color="Maroon"
                                            Radius="3" TargetControlID="AlbumPanel" BorderColor="Maroon">
                                        </cc1:RoundedCornersExtender>
                                    </asp:Panel>
                                    <asp:Panel ID="PhotoPanel" runat="server" Height="105px" Style="left: 3px; position: absolute;
                                        top: -145px; z-index: 103;" Width="403px">
                                        <asp:UpdatePanel ID="PhotoUpdatePanel" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:DataList ID="PhotoDataList" runat="server" DataKeyField="PhotoID" DataSourceID="PhotoListObjectDataSource"
                                                    Height="83px" OnSelectedIndexChanged="PhotoDataList_SelectedIndexChanged" RepeatColumns="3"
                                                    CellPadding="20" CellSpacing="20" RepeatDirection="Horizontal" Style="left: 0px;
                                                    position: absolute; top: 177px; z-index: 101;" Width="597px">
                                                    <ItemTemplate>
                                                        <div id="ItemTemplateDiv" onmouseover="this.style.background='#BFC8D3';" onmouseout="this.style.background='white';"
                                                            style="height: 113px; width: 160px;">
                                                            <asp:ImageButton ID="PhotoImageButton" runat="server" Height="90px" ImageUrl='<%# Eval("PhotoPath", "{0}") %>'
                                                                Style="left: 32px; position: relative; top: 10px" Width="90px" />
                                                            <asp:LinkButton ID="editLinkButton" runat="server" CommandName="select" Font-Size="11pt"
                                                                Font-Strikeout="False" Font-Underline="False" Style="left: 40px; position: relative;
                                                                top: -12px" CausesValidation="False" Font-Bold="True" ForeColor="#003366" onmouseover="this.style.textDecoration = 'underline';"
                                                                onmouseout="this.style.textDecoration = 'none';" Text="<%$ Resources:Resource, Edit %>"></asp:LinkButton><br />
                                                            <asp:Label ID="CaptionLabel" runat="server" Font-Size="8pt" Style="left: 53px; position: relative;
                                                                top: 5px" Text='<%# Eval("Caption") %>'></asp:Label><br />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                <asp:ObjectDataSource ID="PhotoListObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetCustomerAlbumPhoto" TypeName="CustomerPhotoDataSetTableAdapters.CustomerPhotoTableAdapter">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="CustomerID" SessionField="CustomerId" Type="Int32" />
                                                        <asp:ControlParameter ControlID="AlbumDropDownList" Name="AlbumID" PropertyName="SelectedValue"
                                                            Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="AlbumDropDownList" EventName="SelectedIndexChanged" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </asp:Panel>
                                
                                <asp:Panel ID="ModifyAlbumPanel" runat="server" BackColor="Silver" BorderColor="Maroon"
                                    BorderStyle="Solid" BorderWidth="3px" Height="120px" Style="display: none;" Width="325px">
                                    <asp:UpdatePanel ID="ModifyAlbumUpdatePanel" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <cc1:ModalPopupExtender ID="ModifyAlbumModalPopupExtender" runat="server" TargetControlID="AddnewAlbumLabel"
                                                PopupControlID="ModifyAlbumPanel" BackgroundCssClass="modalBackground">
                                            </cc1:ModalPopupExtender>
                                            <asp:Label ID="AddnewAlbumLabel" runat="server" Style="position: absolute; left: 9px;
                                                top: 16px;" Text="<%$ Resources:Resource, AlbumNameLabel %>"></asp:Label>
                                            <asp:TextBox ID="AddAlbumTextbox" runat="server" Style="position: absolute; left: 105px;
                                                top: 15px;" CausesValidation="True" Text="<%$ Resources:Resource, NewAlbumLabel %>"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="NewAlbumRequiredFieldValidator" runat="server" ControlToValidate="AddAlbumTextbox"
                                                Display="Dynamic" ErrorMessage="<%$ Resources:Resource, AlbumNameRequiredValidator %>"
                                                Font-Bold="True" Font-Size="11pt" Style="left: 102px; position: absolute; top: 38px"
                                                Width="170px"></asp:RequiredFieldValidator>
                                            <asp:CustomValidator ID="AddNewAlbumCustomValidator" runat="server" ControlToValidate="AddAlbumTextbox"
                                                ErrorMessage="<%$ Resources:Resource, AlbumNameCustomValidator %>" OnServerValidate="AddNewAlbumCustomValidator_ServerValidate"
                                                Style="left: 48px; position: absolute; top: 58px" Width="260px" Display="Dynamic"
                                                Font-Bold="True" SetFocusOnError="True"></asp:CustomValidator>
                                            <asp:Button ID="CancelAlbum" runat="server" Style="position: absolute; left: 12px;
                                                top: 87px;" Text="<%$ Resources:Resource, Cancel %>" Font-Bold="true" Width="85px"
                                                OnClick="CancelAlbum_Click" CausesValidation="False" />
                                            <asp:Button ID="SaveAlbum" runat="server" Style="position: absolute; left: 126px;
                                                top: 87px;" Width="85px" Text="<%$ Resources:Resource, Save %>" Font-Bold="true"
                                                OnClick="SaveAlbum_Click" />
                                            <asp:Button ID="DeleteAlbum" runat="server" Style="position: absolute; left: 237px;
                                                top: 87px;" Width="85px" Text="<%$ Resources:Resource, Delete %>" Font-Bold="true"
                                                CausesValidation="False" OnClick="DeleteAlbum_Click" />
                                            <br />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="EditAlbumName" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                            </td>
                            <td>
                                <asp:Panel ID="CustomerProfileMenu" CssClass="BlueMenublock" runat="server" Height="70px"
                                    Style="z-index: 0; left: 20px; position: relative; top: 0px; height: 120px; width: 115px;
                                    text-align: center" Width="115px" Font-Size="12pt">
                                    <ul>
                                        <li>
                                            <asp:HyperLink ID="EditPhotoHyperLink" runat="server"  NavigateUrl="EditPhoto.aspx"
                                                Text="<%$ Resources:Resource, EditPhoto %>"></asp:HyperLink>
                                        </li>
                                        <li>
                                            <asp:HyperLink ID="UploadCustomerPhotoHyperLink" runat="server" NavigateUrl="UploadCustomerPhoto.aspx"
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
                                            <asp:LinkButton ID="BackToProfile" runat="server" PostBackUrl="CustomerProfile.aspx"
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
    <asp:Panel ID="PanelEditPhoto" runat="server" Height="324px" Style="display: none;
                                    background-color: tan; " Width="385px" HorizontalAlign="Center">
                                    <asp:UpdatePanel ID="EditPhotoUpdatePanel" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="TargetedLabel" runat="server" Style="position: relative; left: 7px;
                                                top: 8px; z-index: 101;" Text=" "></asp:Label>
                                            <cc1:ModalPopupExtender ID="EditPhotoModalPopUpExtender" runat="server" TargetControlID="TargetedLabel"
                                                PopupControlID="PanelEditPhoto" DropShadow="true" BackgroundCssClass="modalBackground">
                                            </cc1:ModalPopupExtender>
                                            <asp:ObjectDataSource ID="PhotoObjectDataSource" runat="server" DeleteMethod="DeleteCustomerSpecificPhoto"
                                                SelectMethod="GetSpecificPhoto" TypeName="CustomerPhotoDataSetTableAdapters.CustomerPhotoTableAdapter"
                                                UpdateMethod="UpdateCustomerPhoto" OldValuesParameterFormatString="original_{0}">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="CustomerID" Type="Int32" />
                                                    <asp:Parameter Name="PhotoID" Type="Int32" />
                                                </DeleteParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="PhotoID" Type="Int32" />
                                                    <asp:Parameter Name="NewCaption" Type="String" />
                                                </UpdateParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="PhotoDataList" Name="PhotoID" PropertyName="SelectedValue"
                                                        Type="Int32" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:DetailsView ID="EditPhotoDetailView" runat="server" AutoGenerateRows="False"
                                                DataKeyNames="PhotoID" DataSourceID="PhotoObjectDataSource" DefaultMode="Edit"
                                                Font-Size="8pt" GridLines="None" Height="15px" Style="left: 35px; position: absolute;
                                                top: 26px; z-index: 101;" Width="165px">
                                                <Fields>
                                                    <asp:BoundField DataField="PhotoID" HeaderText="<%$ Resources:Resource, PhotoID %>"
                                                        InsertVisible="False" ReadOnly="True" SortExpression="PhotoID" Visible="False" />
                                                    <asp:TemplateField>
                                                        <EditItemTemplate>
                                                            <asp:Image ID="PhotoImage" runat="server" ImageUrl='<%# Bind("PhotoPath", "{0}") %>'
                                                                Style="position: relative" Width="205px" />
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Image ID="PhotoImage1" runat="server" Height="200px" ImageAlign="Top" ImageUrl='<%# Bind("PhotoPath", "{0}") %>'
                                                                Width="205px" />
                                                        </ItemTemplate>
                                                        <ControlStyle Height="200px" Width="250px" />
                                                        <ItemStyle Height="200px" Width="250px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="<%$ Resources:Resource, CaptionLabel %>" SortExpression="Caption">
                                                        <EditItemTemplate>
                                                            <br />
                                                            &nbsp;&nbsp;
                                                            <asp:TextBox ID="CaptionTextBox" runat="server" Text='<%# Bind("Caption") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="CaptionRequiredFieldValidator" runat="server" ControlToValidate="CaptionTextBox"
                                                                ErrorMessage="<%$ Resources:Resource, CaptionRequiredFieldValidator %>" SetFocusOnError="True"
                                                                Style="position: relative" Width="154px"></asp:RequiredFieldValidator>
                                                        </EditItemTemplate>
                                                        <InsertItemTemplate>
                                                            <asp:TextBox ID="CaptionTextBox" runat="server" Text='<%# Bind("Caption") %>'></asp:TextBox>
                                                        </InsertItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="CaptionLabel" runat="server" Text='<%# Bind("Caption") %>' Font-Bold="True"
                                                                Font-Size="12pt"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <EditItemTemplate>
                                                            <asp:LinkButton ID="SaveLinkButton" runat="server" Font-Size="12pt" Font-Underline="False"
                                                                OnClick="SaveLinkButton_Click" Style="position: relative" Text="<%$ Resources:Resource, Save %>"></asp:LinkButton>
                                                            &nbsp;&nbsp;&nbsp;
                                                            <asp:LinkButton ID="CancelLinkButton" runat="server" Font-Size="12pt" Font-Underline="False"
                                                                OnClick="CancelLinkButton_Click" Style="position: relative" Text="<%$ Resources:Resource, Cancel %>" ></asp:LinkButton>
                                                            &nbsp;&nbsp;&nbsp;
                                                            <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandName="delete" Font-Size="12pt"
                                                                Font-Underline="False" OnClick="DeleteLinkButton_Click" Style="position: relative"
                                                                Text="<%$ Resources:Resource, Delete %>" ></asp:LinkButton>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                </Fields>
                                            </asp:DetailsView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>
    </form>
</body>
</html>
