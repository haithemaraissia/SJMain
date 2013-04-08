<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SiteMap.aspx.vb" Inherits="NotAuthenticated_Template"  Culture="auto:en-us" UICulture="auto:en-us" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainLowerButtons.ascx" %>
<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <script type="text/javascript" src="../scripts/jquery-1.5.2.js"></script>
    <link rel="stylesheet" href="../_assets/css/TemplateStyleSheet.css" type="text/css"
        media="screen" />
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
    <asp:AjaxScriptManager ID="ScriptManager1" runat="server">
    </asp:AjaxScriptManager>

    <div id="wrapper" style="padding: 25px">
        <table align="center" id="TemplateGlobalTable">
            <tr>
                <td>
                    <div class="style2">
                        SITEMAP<br />
                        <br />
                        <br />
&nbsp;</div>
                    <table class="style1">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                Client</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                Customer</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                Post Project</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                Find Job</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                Benefits</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                Benefits</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                HowDoesitWork</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                HowsDoesItWork</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                Profile</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                Profile</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <table style="text-align: center"class="style1">
                        <tr>
                            <td >
                                My-Side-Job</td>
                        </tr>
                        <tr>
                            <td>
                                About</td>
                        </tr>
                        <tr>
                            <td>
                                Help</td>
                        </tr>
                        <tr>
                            <td>
                                Product</td>
                        </tr>
                        <tr>
                            <td>
                                Contact US</td>
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
