<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PDTSuccess.aspx.cs" Inherits="Authenticated_Customer_Paypal_PDTSuccess" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../../../common/CustomerTemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../../../common/TemplateMainLowerButtons.ascx" %>
<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <script type="text/javascript" src="../../../scripts/jquery-1.5.2.js"></script>
    <link rel="stylesheet" href="../../../_assets/css/TemplateStyleSheet.css" type="text/css"
        media="screen" />
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
    <script type="text/javascript">
        var timer = null;
        function auto_reload() {
            window.location.reload();
        }
    </script>
</head>
<body onload="timer = setTimeout('auto_reload()',10000);">
    <form id="form1" runat="server">
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
     </UpperNavigationButtons:NavigationButtons>
    <asp:AjaxScriptManager ID="ScriptManager1" runat="server">
        
 </asp:AjaxScriptManager>
    <div id="wrapper" style="padding: 25px; vertical-align: middle">
        <table align="center" id="TemplateGlobalTable" style="vertical-align: middle">
            <tr align="center">
                <td style="padding-bottom: 15px">
                    <asp:Panel ID="ResponsePayment" runat="server" Height="160px" Width="400px" Style="text-align: right;
                        padding: 10px" BackColor="White">
                        <table style="align:center; vertical-align:middle">
                            <tr>
                                <td>
                                    <asp:Label ID="HiddenLabel" runat="server" Text="<%$ Resources:Resource, Waiting %>"></asp:Label> 
                                </td>
                            </tr>

                        </table>
                       
                    </asp:Panel>
                    <cc1:RoundedCornersExtender ID="Response_RoundedCornersExtender" runat="server"
                        BorderColor="Maroon" Color="Maroon" Enabled="True" Radius="20" TargetControlID="ResponsePayment">
                    </cc1:RoundedCornersExtender>
</td></tr>

            <tr>
                <td style="padding-bottom: 15px">
                    <div id="BackToProfile" style=" text-align:right">
                        <asp:LinkButton ID="BackToProfileLinkButton" runat="server" 
                            Text="<%$ Resources:Resource, BackToProfileLinkButton%>" Font-Bold="True" 
                            ForeColor="#003366"></asp:LinkButton>
                    </div>
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
