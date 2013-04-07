<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PostProjectDescription.aspx.vb"
    Inherits="Authenticated_Professional_PostProject" Culture="auto:en-US" UICulture="auto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc2" %>
<%@ Register Namespace="CommentAjaxControl2" TagPrefix="CustomEditor2" %>
<%@ Register Namespace="CommentAjaxControl" TagPrefix="CustomEditor" %>
<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainLowerButtons.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title id="Title1" runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <script type="text/javascript" src="../scripts/jquery-1.5.2.js"></script>
    <link rel="stylesheet" href="../_assets/css/TemplateStyleSheet.css" type="text/css"
        media="screen" />
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
    <script type="text/javascript">

        function fireanimation() {
            document.getElementById('LoadingPanel').style.visibility = 'visible';
            $find('DelayModalPopUpExtender').show();
            document.body.style.overflow = 'visible';
        }

        function disableBackButton() {
            window.history.forward();
        }
        setTimeout("disableBackButton()", 0);

    </script>
    <link href="themes/opera/tabs3.css" rel="stylesheet" type="text/css" />
    <link href="themes/BlueMenublockStyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=70);
            -moz-opacity: 0.7;
            -khtml-opacity: 0.7;
            opacity: 0.7;
            z-index: 200;
        }
    </style>
</head>
<body onload="disableBackButton();">
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
    <form id="form1" runat="server">
                <div id="wrapper" style="padding: 25px">
    <div align="center">
        <asp:AjaxScriptManager ID="AjaxScriptManager1" runat="server">
        </asp:AjaxScriptManager>
        <br />
        <br />
        <asp:Panel ID="EditDescriptionPanel" runat="server" Height="450px" Style="display: block;
            z-index: 103;" Width="700px" BorderStyle="Double" BorderColor="white" BorderWidth="3px"
            BackColor="#cccccc">
            <CustomEditor:CustomEditor ID="EditDescriptionEditor" runat="server" Width="700px"
                Height="450px" />
            <asp:LinkButton ID="UpdateDescription" runat="server" CausesValidation="False" Font-Bold="True"
                ForeColor="Black" Style="left: 35%; position: relative; top: 3px" OnClientClick="fireanimation();" CssClass="UnderlineLink"
                Text="<%$ Resources:Resource, Update %>"></asp:LinkButton>
            <asp:LinkButton ID="CancelDescription" runat="server" CausesValidation="False" Font-Bold="True"
                ForeColor="Black" Style="left: 42%; position: relative; top: 3px" OnClientClick="fireanimation();" CssClass="UnderlineLink"
                Text="<%$ Resources:Resource, Cancel %>"></asp:LinkButton>
            <br />
        </asp:Panel>
        <div id="LoadingDiv" style="height: 100px; z-index: 200;">
            <asp:UpdatePanel ID="DelayUpdatePanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <cc1:ModalPopupExtender ID="DelayModalPopUpExtender" runat="server" BackgroundCssClass="modalBackground"
                        PopupControlID="LoadingPanel" TargetControlID="LoadingPanel" RepositionMode="RepositionOnWindowResize">
                    </cc1:ModalPopupExtender>
                    <asp:Panel ID="LoadingPanel" runat="server" Height="45px" Style="display: none; z-index: 200;"
                        Width="186px" BackColor="Silver">
                        <asp:Label ID="LoadingLabel" runat="server" Font-Bold="True" ForeColor="Black" Style="left: 63px;
                            position: absolute; top: 25px" Text="<%$ Resources:Resource, Loading %>"></asp:Label>
                        <img src="../_assets/img/uploading.gif" alt="uploadingimages" style="left: 0px; position: relative;
                            top: -9px" />
                    </asp:Panel>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    </div>
    <div class="cleaner">
    </div>
    <LowerNavigationButtons:NavigationButtons ID="MainLowerNavigationButtons" runat="server" />
    </form>
</body>
</html>
