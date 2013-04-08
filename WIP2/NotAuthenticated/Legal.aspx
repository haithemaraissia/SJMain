<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Legal.aspx.vb" Inherits="NotAuthenticated_Legal" %>

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
        hr
        {
            border: 0;
            height: 1px;
            border-bottom: 1px dotted #939393;
            margin-top: 15px;
            margin-bottom: 15px;
            text-align: left;
        }
        P
        {
            text-indent: 0pt;
        }
        hr
        {
            margin: 12px 0;
        }
        .docrow
        {
            width: 850px;
            clear: both;
            padding: 3px 0;
        }
        .doclink
        {
            width: 260px;
            margin-left: 220px;
            float: left;
        }
        .docupdate
        {
            float: left;
            color: #999;
            font-size: 11px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server"></UpperNavigationButtons:NavigationButtons>
    <asp:AjaxScriptManager ID="ScriptManager1" runat="server"></asp:AjaxScriptManager>
    <div id="wrapper" style="padding: 25px">
        <table align="center" id="TemplateGlobalTable">
            <tr>
                <td>
                    <div>
                        <h1 id="H2HowDoesitWork">Terms of Service</h1>
                    </div>
                    <div id="main-wrapper">
                        <div id="main">
                            <div id="content">
                                <div>
                                    <a id="main-content"></a>
                                    <div>
                                        <div id="block-system-main">
                                            <div>
                                                <div>
                                                    <div>
                                                        <p>
                                                            This page and the documents linked below are collectively referred to as the &quot;Terms
                                                            of Service.&quot;<br />
                                                            Use of this website constitutes acknowledgment and acceptance of all applicable
                                                            provisions of the Terms of Service.</p>
                                                        <p>
                                                            &nbsp;</p>
                                                        <div class="docrow">
                                                            <div class="doclink">
                                                                <a href="https://www.elance.com/p/legal/user-agreement.pdf">User Agreement</a></div>
                                                            <div class="docupdate">
                                                                (updated October 31, 2012)</div>
                                                            <div class="clear">
                                                            </div>
                                                        </div>
                                                        <div class="docrow">
                                                            <div class="doclink">
                                                                <a href="https://www.elance.com/p/legal/privacy-policy.html">Privacy Policy</a></div>
                                                            <div class="docupdate">
                                                                (updated October 31, 2012)</div>
                                                            <div class="clear">
                                                            </div>
                                                        </div>
                                                        <p>
                                                        </p>
                                                        <div style="text-align: center">
                                                            <hr size="1" width="275" />
                                                        </div>
                                                        <p>
                                                            &nbsp;</p>
                                                        <p>
                                                            &nbsp;</p>
                                                        <p>
                                                            &nbsp;</p>
                                                        <p>
                                                            &nbsp;</p>
                                                        <p>
                                                            &nbsp;</p>
                                                        <p>
                                                            &nbsp;</p>
                                                        <p>
                                                            &nbsp;</p>
                                                        <p>
                                                            [You need a <a href="http://get.adobe.com/reader/">pdf reader</a> to view
                                                            the above documents.]</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="footer">
                        <span>
                            <div id="IWantToWork" >
                                Get Started Now »</div>
                        </span>
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
