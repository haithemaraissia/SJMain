<%@ Page Title="" Language="VB" MasterPageFile="~/NotAuthenticated/Plain.master" AutoEventWireup="false" CodeFile="NewsLetter.aspx.vb" Inherits="NotAuthenticated_NewsLetter" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link rel="stylesheet" href="../_assets/nivoslider/themes/default/default.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../_assets/nivoslider/themes/light/light.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../_assets/nivoslider/themes/dark/dark.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../_assets/nivoslider/themes/bar/bar.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../_assets/nivoslider/nivo-slider.css" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="wrapper">
        <div class="slider-wrapper theme-default">
            <div id="slider" class="nivoSlider">
                <img src="../_assets/nivoslider/images/toystory.jpg" data-thumb="images/NivoSlider/toystory.jpg"
                    alt="" />
                <a href="http://dev7studios.com">
                    <img src="../_assets/nivoslider/images/up.jpg" data-thumb="images/NivoSlider/up.jpg" alt=""
                        title="This is an example of a caption" /></a>
                <img src="../_assets/nivoslider/images/walle.jpg" data-thumb="images/NivoSlider/walle.jpg" alt=""
                    data-transition="slideInLeft" />
                <img src="../_assets/nivoslider/images/nemo.jpg" data-thumb="images/NivoSlider/nemo.jpg" alt=""
                    title="#htmlcaption" />
            </div>
            <div id="htmlcaption" class="nivo-html-caption">
                <strong>This</strong> is an example of a <em>HTML</em> caption with <a href="#">a link</a>.
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../_assets/nivoslider/scripts/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="../_assets/nivoslider/jquery.nivo.slider.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $('#slider').nivoSlider();
        });
    </script>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Account/Register.aspx">SignUp Now!!</asp:HyperLink>
</asp:Content>


