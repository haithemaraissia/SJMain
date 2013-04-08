<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AboutUS.aspx.vb" Inherits="NotAuthenticated_Template"
    Culture="auto:en-us" UICulture="auto:en-us" %>

<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainLowerButtons.ascx" %>
<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
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
        .button
        {
            display: inline-block;
        }
        .button.prominent
        {
            box-shadow: 0 3px rgba(191, 6, 49, 69%), 0 -4px rgba(191, 6, 49, 0.1) inset;
            font-size: 16px;
            padding: 8px 16px 12px;
        }
        .headerstyle
        {
            color: #800000;
            font-family: "Palatino Linotype";
            font-size: x-large;
            text-align: right;
        }
        .MainHeaderStyle
        {
            width: 259px;
            color: #800000;
            font-family: "Palatino Linotype";
            font-size: x-large;
            text-align: center;
            height: 80px;
        }
        .AboutHeader:after, .AboutHeader:before
        {
            content: '';
            position: absolute;
        }
        .AboutHeader
        {
            text-align: center;
            position: relative;
            color: #fff;
            margin: 0 -12px 0px -12px;
            padding: 10px 0;
            text-shadow: 0 1px rgba(0,0,0,.8);
            background: #327E04;
            background-image: -moz-linear-gradient(rgba(255,255,255,.3), rgba(255,255,255,0));
            background-image: -webkit-linear-gradient(rgba(255,255,255,.3), rgba(255,255,255,0));
            background-image: -o-linear-gradient(rgba(255,255,255,.3), rgba(255,255,255,0));
            background-image: -ms-linear-gradient(rgba(255,255,255,.3), rgba(255,255,255,0));
            background-image: linear-gradient(rgba(255,255,255,.3), rgba(255,255,255,0));
            -moz-box-shadow: 0 2px 0 rgba(0,0,0,.3);
            -webkit-box-shadow: 0 2px 0 rgba(0,0,0,.3);
            box-shadow: 0 2px 0 rgba(0,0,0,.3);
            clear: both;
        }
        .AboutHeader:before, .AboutHeader:after
        {
            border-style: solid;
            border-color: transparent;
            bottom: -10px;
        }
        .AboutHeader:before
        {
            border-width: 0 10px 10px 0;
            border-right-color: #222;
            left: 0;
        }
        .AboutHeader:after
        {
            border-width: 0 0 10px 10px;
            border-left-color: #222;
            right: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
    <asp:AjaxScriptManager ID="ScriptManager1" runat="server"/>
        <div id="wrapper" style="padding: 25px">
        <table align="center" id="TemplateGlobalTable">
            <tr>
                <td>
                    &nbsp;
                    <table  style="width:100%" cellpadding="10px">
                        <tr>
                            <td class="MainHeaderStyle">
                                <h2 class="AboutHeader">
                                    Our Story</h2>
                            </td>
                            <td>
                                My-Side-Job was created as a simple and effective way to facilitate the direct interaction
                                between clients and professional. We strive to provide open market by eliminating
                                middle agents.<br />
                                Clients get lots of great work done fast and affordably. Professional get directly
                                compiscated. No middle agent in between. This is the model of our core services.
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br />
                        </tr>
                        <tr>
                            <td class="headerstyle">
                                <h2 class="AboutHeader">
                                    Clients
                                </h2>
                            </td>
                            <td>
                                As 1,000,000+ active clients will gladly tell you, My-Side-Job is where awesome
                                work gets done right away, at the right price. My-Side-Job gives you instant access
                                to the best professional around the world. Whether you need roofers, plumbers, handymen,
                                mechanics, doctors or dentists. With over 2 million active professional , you can
                                choice the best and most skilled one for your project.
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br />
                        </tr>
                        <tr>
                            <td class="headerstyle">
                                <h2 class="AboutHeader">
                                    Professionals</h2>
                            </td>
                            <td>
                                My Side-Jobs is for anyone who enjoy getting paid for doing great work. Be your
                                own boss and enjoy a great lifestyle by choosing the right project that you want
                                to work on. Get hired for interesting jobs whether you’re at home or on a white
                                sandy beach. With over 500,000 active projects, your opportunities to make money
                                is endless.
                            </td>
                        </tr>
                        <tr>
                            <td class="headerstyle" colspan="2">
                                <br />
                                <asp:Button ID="Button2" runat="server" CssClass="button prominent" Text="Join US"
                                    PostBackUrl="#" />
                                <br />
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
