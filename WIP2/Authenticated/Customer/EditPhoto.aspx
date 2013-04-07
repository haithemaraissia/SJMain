<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EditPhoto.aspx.vb" Inherits="EditPhoto"
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
     <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
    <style type="text/css">
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
    </style>
    <script type="text/javascript">
        function fireanimation() {
            document.getElementById('LoadingPanel').style.visibility = 'visible';
            $find('DelayModalPopUpExtender').show();
            document.body.style.overflow = 'visible';
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:AjaxScriptManager ID="ScriptManager1" runat="server">
        </asp:AjaxScriptManager>    
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
        <div id="LoadingDiv" style="left: 212px; width: 100px; position: absolute; top: 267px;
            height: 100px">
            <asp:UpdatePanel ID="DelayModalUpdatePanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <cc1:ModalPopupExtender ID="DelayModalPopUpExtender" runat="server" BackgroundCssClass="modalBackground"
                        PopupControlID="LoadingPanel" TargetControlID="LoadingPanel" RepositionMode="RepositionOnWindowResize">
                    </cc1:ModalPopupExtender>
                    &nbsp; &nbsp;
                    <asp:Panel ID="LoadingPanel" runat="server" Height="45px" Style="display: none;" Width="196px">
                        &nbsp;
                        <asp:Label ID="LoadingLabel" runat="server" Font-Bold="True" ForeColor="DarkRed"
                            Style="left: 63px; position: absolute; top: 25px" Text="<%$ Resources:Resource, Loading %>"></asp:Label>
                        <img src="../../Images/uploading.gif" style="left: 0px; position: relative; top: -9px" />
                    </asp:Panel>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>



         <div id="wrapper" style="padding: 25px">
        <table align="center" id="TemplateGlobalTable">
            <tr>
                <td>
                  <table align="center" >
    <tr>
    <td style="width:115px"></td>
    <td>
        <asp:Panel ID="EditPhotoLayer" runat="server" Style="z-index: 101;width: 600px;
            position: relative; height: 424px; background-color: white; text-align: center">
            <br />
            <asp:UpdatePanel ID="PhotoUpdatePanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:ObjectDataSource ID="CustomerPhotoObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetCustomerPhoto" TypeName="CustomerPhotoDataSetTableAdapters.SelectCustomerPhotoTableAdapter"
                        DeleteMethod="DeleteCustomerPhotoByID" UpdateMethod="UpdateCustomerPhoto">
                        <DeleteParameters>
                            <asp:SessionParameter Name="CustomerID" SessionField="CustomerId" Type="Int32" />
                            <asp:Parameter Name="PhotoID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="PhotoID" Type="Int32" />
                            <asp:Parameter Name="NewCaption" Type="String" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="CustomerID" SessionField="CustomerId" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:DetailsView ID="PhotoDetailsView" runat="server" AutoGenerateRows="False" DataKeyNames="PhotoID"
                        DataSourceID="CustomerPhotoObjectDataSource" DefaultMode="Edit" Font-Size="8pt"
                        GridLines="None" Height="288px" Style="left: 123px; position: absolute; top: 32px"
                        Width="338px">
                        <Fields>
                            <asp:BoundField DataField="PhotoID" HeaderText="PhotoID" InsertVisible="False" ReadOnly="True"
                                SortExpression="PhotoID" Visible="False" />
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <asp:ImageButton ID="PhotoImageButton" runat="server" Height="294px" Style="position: relative;
                                        top: -8px; left: 13px;" Width="314px" ImageUrl='<%# Bind("PhotoPath", "{0}") %>' /><br />
                                    <br />
                                    <span style="font-size: 12pt">
                                        <asp:Label ID="CaptionLabel" runat="server" Text="<%$ Resources:Resource, CaptionLabel %>"
                                            Font-Size="Medium" Style="position: relative; left: 20px"></asp:Label>
                                        <asp:TextBox ID="CaptionTextBox" runat="server" BackColor="#E0E0E0" Style="position: relative;
                                            left: 30px" Text='<%# Bind("Caption", "{0}") %>' Width="131px"></asp:TextBox></span>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <EditItemTemplate>
                                    <br />
                                    &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                                    <asp:LinkButton ID="SaveLinkButton" runat="server" Font-Size="12pt" Font-Underline="False"
                                        OnClick="SaveLinkButton_Click" Style="position: relative" OnClientClick="fireanimation()"
                                        Text="<%$ Resources:Resource, Save %>" Font-Bold="True" ForeColor="DarkRed"></asp:LinkButton>&nbsp;&nbsp;&nbsp;
                                    &nbsp; &nbsp;
                                    <asp:LinkButton ID="CancelLinkButton" runat="server" Font-Size="12pt" Font-Underline="False"
                                        OnClick="CancelLinkButton_Click" Style="position: relative" Font-Bold="True"
                                        ForeColor="DarkRed" Text="<%$ Resources:Resource, Cancel %>"></asp:LinkButton>
                                    &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
                                    <asp:LinkButton ID="DeleteLinkButton" runat="server" Font-Size="12pt" Font-Underline="False"
                                        OnClick="DeleteLinkButton_Click" Style="position: relative" Font-Bold="True"
                                        ForeColor="DarkRed" Text="<%$ Resources:Resource, Delete %>"></asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                        <EmptyDataTemplate>
                            &nbsp;
                        </EmptyDataTemplate>
                    </asp:DetailsView>
                    <br />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ConfirmButton" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
        </asp:Panel>
        </td>
    <td>
        <asp:Panel ID="CustomerProfileMenu" CssClass="BlueMenublock" runat="server" Height="70px"
            Style="z-index: 0; left:20px; position:relative ; top: 0px; height: 120px;
            width: 115px; text-align: center" Width="115px" Font-Size="12pt">
            <ul>
                <li>
                    <asp:HyperLink ID="EditPhotoHyperLink" runat="server" NavigateUrl="EditPhoto.aspx"
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
        <cc1:RoundedCornersExtender ID="EditPhotoLayerRoundedCornersExtender" runat="server"
            BorderColor="0, 51, 102" TargetControlID="EditPhotoLayer" Color="0, 51, 102">
        </cc1:RoundedCornersExtender>
        <asp:Panel ID="DeletePhotoPanel" runat="server" BackColor="#E0E0E0" Height="80px"
            Style="display: none;" Width="345px"
            BorderColor="MidnightBlue" BorderStyle="Solid" BorderWidth="3px">
            <asp:UpdatePanel ID="DeletePhotoUpdatePanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <cc1:ModalPopupExtender ID="DeletePhotoModalPopUpExtender" runat="server" TargetControlID="ConfirmationLabel"
                        PopupControlID="DeletePhotoPanel" BackgroundCssClass="modalBackground" >
                    </cc1:ModalPopupExtender>
                    <asp:Label ID="ConfirmationLabel" runat="server" Style="position: absolute; left: 8px;
                        top: 12px;" Text="<%$ Resources:Resource, ConfirmationLabel %>" Width="334px"></asp:Label>
                    <asp:Button ID="ConfirmButton" runat="server" Style="left: 66px; position: absolute;
                        top: 50px" Text="<%$ Resources:Resource, OkButton %>" Width="100px" CommandName="delete" />
                    <asp:Button ID="CancelButton" runat="server" Style="left: 183px; position: absolute;
                        top: 50px" Text="<%$ Resources:Resource, Cancel %>" Width="100px" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        </td>
        </tr>
        </table>
                </td>
            </tr>
        </table>
    </div>



    
    </div>
     <div class="cleaner">
    </div>
    <LowerNavigationButtons:NavigationButtons ID="MainLowerNavigationButtons" runat="server" />
    </form>
</body>
</html>
