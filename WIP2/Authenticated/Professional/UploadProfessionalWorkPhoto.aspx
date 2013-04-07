<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UploadProfessionalWorkPhoto.aspx.vb"
    Inherits="Authenticated_AsynchUpload" Culture="auto:en-US" UICulture="auto" %>

<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../../common/CustomerTemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../../common/TemplateMainLowerButtons.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <script type="text/javascript">
        function uploadError(sender, args) {
            $get("SucessLabel").style.display = 'none';
            $get("FailureLabel").style.display = 'block';
            $get("ErrorFileTypeLabel").style.display = 'block';
            $get("ErrorFileSizeLabel").style.display = 'block';
        }

        function uploadComplete(sender, args) {

            var completeSuccess = true;

            /*Validation for file extension*/
            var fileName = args.get_fileName();

            // extract and store the file extension into another variable
            var fileExtension = fileName.substr(fileName.length - 3, 3);

            // array of allowed file type extensions
            // peg for jpeg  iff for tiff
            var validFileExtensions = new Array("jpg", "gif", "peg", "png", "bmp", "iff");

            var flag = false;
            // loop over the valid file extensions to compare them with uploaded file
            for (var index = 0; index < validFileExtensions.length; index++) {
                if (fileExtension.toLowerCase() == validFileExtensions[index].toString().toLowerCase()) {
                    flag = true;
                }
            }

            /*Validation for file size*/
            if (parseInt(args.get_length()) >= 4096000) {
                completeSuccess = false;
                flag = false
                return;
            }
            /*Validation for file size*/

            if (flag == false) {
                $get("SucessLabel").style.display = 'none';
                $get("FailureLabel").style.display = 'block';
                $get("ErrorFileTypeLabel").style.display = 'block';
                completeSuccess = false;
                return;

            }

            if (flag == true) {
                $get("SucessLabel").style.display = 'block';
                $get("FailureLabel").style.display = 'none';
                $get("ErrorFileSizeLabel").style.display = 'none';
                $get("ErrorFileTypeLabel").style.display = 'none';
                window.location.reload();
            }
        }

        function clearContents() {
            var AsyncFileUpload = $get("<%=AsyncFileUpload1.ClientID%>");
            var txts = AsyncFileUpload.getElementsByTagName("input");

            for (var i = 0; i < txts.length; i++) {
                if (txts[i].type == "text") {
                    txts[i].value = "";
                    txts[i].style.backgroundColor = "white";
                }
            }
            $get('CaptionTextBox2').value = "";
        }
        window.onload = clearContents;
    </script>
    <link href="../themes/BlueMenublockStyleSheet.css" rel="stylesheet" type="text/css" />
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:AjaxScriptManager ID="AjaxScriptManager1" runat="server">
        </asp:AjaxScriptManager>
        <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
        </UpperNavigationButtons:NavigationButtons>
        <div id="wrapper" style="padding: 25px">
            <table align="center" id="TemplateGlobalTable">
                <tr>
                    <td>
                        <table align="center">
                            <tr>
                                <td style="width: 115px">
                                </td>
                                <td>
                                    <asp:Panel ID="AsynUploadPanel" runat="server" Width="600px" Height="468px" BackColor="White"
                                        Style="z-index: 1; position: relative; top: 0px">
                                        <br />
                                        <cc1:AsyncFileUpload OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete"
                                            runat="server" ID="AsyncFileUpload1" Width="300px" UploaderStyle="Modern" UploadingBackColor="#CCFFFF"
                                            ThrobberID="myThrobber" FailedValidation="False" BorderWidth="0px" />
                                        &nbsp;
                                        <asp:Label ID="CaptionLabel" runat="server" Text="<%$ Resources:Resource, PostProjectCaptionLabel %>"
                                            BackColor="#666666" BorderColor="#333333" BorderStyle="Ridge" Font-Bold="True"
                                            Font-Size="Small" ForeColor="White" Style="z-index: 1; position: absolute; top: 25px;
                                            left: 358px"></asp:Label>
                                        <asp:TextBox ID="CaptionTextBox2" runat="server" MaxLength="50" Width="133px" Style="z-index: 1;
                                            position: absolute; top: 25px; left: 427px"></asp:TextBox>
                                        &nbsp;
                                        <asp:Label runat="server" ID="myThrobber" Style="display: none; top: 80px; z-index: 1;
                                            width: 190px; height: 19px; position: absolute; left: 9px; right: 386px;" Width="190px">
                  <img  alt="" src="../../Images/uploading.gif" />
                                        </asp:Label>
                                        <asp:Panel ID="PicturePanel" runat="server" Width="311px" Height="331px" Style="z-index: 1;
                                            position: absolute; top: 80px; left: 140px; overflow: hidden">
                                            <asp:UpdatePanel ID="PictureUpdatePanel" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:ListView ID="ProfessionalListView" runat="server" DataKeyNames="PhotoID" DataSourceID="ProfessionalWorkShopPhotoDataSource"
                                                        Style="z-index: 2">
                                                        <ItemTemplate>
                                                            <asp:Image ID="ProfessionalPhotoImage" runat="server" Height="280px" ImageUrl='<%# Eval("PhotoPath", "{0}") %>'
                                                                Style="position: relative; top: -1px; left: -1px" Width="240px" />
                                                            <asp:LinkButton ID="RemoveLinkButton" runat="server" CausesValidation="False" CommandName="Select"
                                                                ForeColor="Navy" Style="left: 247px; position: absolute; top: 130px" Text="<%$ Resources:Resource, PostProjectRemoveLinkButton %>"></asp:LinkButton>
                                                            <br />
                                                            <asp:Label ID="CaptionLabel" runat="server" Style="position: relative; left: 122px;
                                                                top: -5px; z-index: 102;" Text='<%# Bind("Caption", "{0}") %>' Width="309px"
                                                                Height="5px"></asp:Label>
                                                        </ItemTemplate>
                                                        <LayoutTemplate>
                                                            <asp:Panel ID="ListViewPanel" runat="server" Width="355px" Height="360px">
                                                                <table id="ListViewTable" runat="server">
                                                                    <tr id="ListViewRow" runat="server">
                                                                        <td id="ListViewColumn" runat="server">
                                                                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                                                                <tr id="itemPlaceholder" runat="server">
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </LayoutTemplate>
                                                    </asp:ListView>
                                                    <asp:ObjectDataSource ID="ProfessionalWorkShopPhotoDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                                                        SelectMethod="GetData" TypeName="ProfessionalWorkShopPhotoDataSetTableAdapters.SELECTALLProfessionalWorkPhotoTableAdapter">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="ProID" SessionField="ProfessionalID" Type="Int32" DefaultValue="109" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                    <asp:Panel ID="ListViewPagingPanel" runat="server" BackColor="#003366" Style="position: relative;
                                                        top: -48px; z-index: 1; text-align: center" Font-Bold="True" HorizontalAlign="Justify"
                                                        Width="311">
                                                        <asp:DataPager ID="ListViewDataPager" runat="server" PageSize="1" PagedControlID="ProfessionalListView">
                                                            <Fields>
                                                                <asp:NumericPagerField ButtonType="Link" />
                                                            </Fields>
                                                        </asp:DataPager>
                                                    </asp:Panel>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                        <cc1:RoundedCornersExtender ID="PicturePanel_RoundedCornersExtender" runat="server"
                                            BorderColor="#003366" Color="#003366" Enabled="True" TargetControlID="PicturePanel"
                                            Radius="8">
                                        </cc1:RoundedCornersExtender>
                                        <asp:Label runat="server" ID="SucessLabel" Style="display: none; position: relative;
                                            top: 15px; z-index: 1; left: 210px" Width="20px">
                  <img alt="" src="../../Images/GreenCheckMark.gif"width="20px" />
                                        </asp:Label>
                                        <asp:Label runat="server" ID="FailureLabel" Style="display: none; position: relative;
                                            z-index: 1; top: 15px; left: 210px" Width="20px">
                  <img alt="" src="../../Images/RedCheckMark.gif"  width="20px" />
                                        </asp:Label>
                                        <asp:Label runat="server" ID="ErrorFileTypeLabel" Style="display: none; overflow: visible;
                                            text-align: center; z-index: 2; top: -10px;" Width="113px" Text="<%$ Resources:Resource, ProjectRequirementContentTypeLabel %>"
                                            ForeColor="Maroon" Font-Bold="True" Height="52px" Font-Names="Times New Roman"
                                            Font-Size="Small"></asp:Label>
                                        <asp:Label runat="server" ID="ErrorFileSizeLabel" Style="display: none; position: relative;
                                            z-index: 100; top: 30px; left: 0px; text-align: center" Width="100px" Text="<%$ Resources:Resource, ProjectRequirementContentSizeLabel %>"
                                            ForeColor="Maroon" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Small"></asp:Label>
                                        <cc1:FilteredTextBoxExtender ID="CaptionFilteredTextBoxExtender" runat="server" InvalidChars="+-*/=)(*&amp;^%$#@!~`\|\]}[{&quot;':;?/&lt;&gt;"
                                            TargetControlID="CaptionTextBox2" FilterMode="InvalidChars" Enabled="True">
                                        </cc1:FilteredTextBoxExtender>
                                    </asp:Panel>
                                </td>
                                <td>
                                    <asp:Panel ID="ProfessionalWorkShopProfileMenu" CssClass="BlueMenublock" runat="server"
                                        Height="70px" Style="z-index: 0; left: 20px; position: relative; top: 0px; height: 120px;
                                        width: 115px; text-align: center" Width="115px" Font-Size="12pt">
                                        <ul>
                                            <li>
                                                <asp:HyperLink ID="EditPhotoHyperLink" runat="server" NavigateUrl="EditWorkPhoto.aspx"
                                                    Text="<%$ Resources:Resource, EditPhoto %>"></asp:HyperLink>
                                            </li>
                                            <li>
                                                <asp:HyperLink ID="UploadProfessionalPhotoHyperLink" runat="server" NavigateUrl="UploadProfessionalWorkPhoto.aspx"
                                                    Text="<%$ Resources:Resource, AddPhoto %>"></asp:HyperLink>
                                            </li>
                                            <li>
                                                <asp:HyperLink ID="EditAlbumHyperLink" runat="server" NavigateUrl="EditWorkAlbum.aspx"
                                                    Text="<%$ Resources:Resource, EditAlbum %>"></asp:HyperLink>
                                            </li>
                                            <li>
                                                <asp:HyperLink ID="ReorderPhotoHyperLink" runat="server" NavigateUrl="RearrangeWorkPhotos.aspx"
                                                    Text="<%$ Resources:Resource, ReorderPhoto %>"></asp:HyperLink>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="BackToProfile" runat="server" PostBackUrl="ProfessionalProfile.aspx"
                                                    Text="<%$ Resources:Resource, BackToProfileLinkButton%>"></asp:LinkButton>
                                            </li>
                                        </ul>
                                    </asp:Panel>
                                    <cc1:RoundedCornersExtender ID="AsynUploadPanel_RoundedCornersExtender" runat="server"
                                        Enabled="True" TargetControlID="AsynUploadPanel" Color="0, 51, 102" BorderColor="0, 51, 102"
                                        Radius="5">
                                    </cc1:RoundedCornersExtender>
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
    </form>
</body>
</html>
