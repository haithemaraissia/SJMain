<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Index.aspx.vb" Inherits="Index"
    Culture="auto:en-us" UICulture="auto:en-us" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="~/common/MainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainLowerButtons.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title runat="server" title="<%$ Resources:Resource, HomeTitle %>"></title>
    <link rel="stylesheet" media="all" type="text/css" href="../_assets/css/menu_style.css" />
    <link rel="stylesheet" href="../_assets/css/HomeStyleSheet.css" type="text/css" media="screen" />
    <link type="text/css" href="../_assets/css/fg.menu.css" media="screen" rel="stylesheet" />
    <link type="text/css" href="../_assets/themes/theme/ui.all.css" media="screen" rel="stylesheet" />
    <script type="text/javascript" src="../_assets/piecemaker/web/scripts/swfobject/swfobject.js"></script>
    <script type="text/javascript" src="../scripts/HomeScript.js"></script>
    <script type="text/javascript" src="../scripts/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="../scripts/fg.menu.js"></script>
    <script type="text/javascript">
        $(function () {
            // BUTTONS
            $('.fg-button').hover(
    		function () { $(this).removeClass('ui-state-default').addClass('ui-state-focus'); },
    		function () { $(this).removeClass('ui-state-focus').addClass('ui-state-default'); }
    	);
            // MENUS    	
            $('#flat').menu({
                content: $('#flat').next().html(), // grab content from this page
                showSpeed: 400
            });
        });
    </script>
    <meta property="og:url" content="http://www.my-side-job.com" />
    <link rel="canonical" href="http://www.my-side-job.com" />
</head>
<body>
    <form id="form1" runat="server">
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
</UpperNavigationButtons:NavigationButtons>
    <div id="wrapper">
<table align="center" id="GlobalTable">
        <tr>
            <td class="LeftColumn">
                <table style="width: 150px">
                    <tr>
                        <td style="width: 150px;">
                            <h2 id="H2Category">
                                <asp:Label ID="CategoryLabel" runat="server" Text="<%$ Resources:Resource, Category %>"
                                    Font-Bold="True" Font-Size="Large"></asp:Label></h2>
                            <div class="menu bubplastic vertical red">
                                <ul>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="WaiterHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=1&jid=5"
                                            Text="<%$ Resources:Resource, Waiter %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="BakerHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=1&jid=33"
                                            Text="<%$ Resources:Resource, Baker %>" runat="server" Style="height: 22px; vertical-align: middle;
                                            padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="HouseKeeperHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=2&jid=79"
                                            Text="<%$ Resources:Resource, HouseKeeper %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="FisherHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=3&jid=113"
                                            Text="<%$ Resources:Resource, Fisher %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="ComedianHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=4&jid=195"
                                            Text="<%$ Resources:Resource, Comedian %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="RooferHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=5&jid=201"
                                            Text="<%$ Resources:Resource, Roofer %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="TeacherHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=6&jid=281"
                                            Text="<%$ Resources:Resource, Teacher %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="EconomistHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=7&jid=315"
                                            Text="<%$ Resources:Resource, Economist %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="LegislatorHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=8&jid=353"
                                            Text="<%$ Resources:Resource, Legislator %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="PsychiatristHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=9&jid=420"
                                            Text="<%$ Resources:Resource, Psychiatrist %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="EditorHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=10&jid=454"
                                            Text="<%$ Resources:Resource, Editor %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="LumberjackHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=11&jid=534"
                                            Text="<%$ Resources:Resource, Lumberjack %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="GeoscientistHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=12&jid=554"
                                            Text="<%$ Resources:Resource, Geoscientist %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="ZoologistHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=13&jid=621"
                                            Text="<%$ Resources:Resource, Zoologist %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="ConciergeHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=14&jid=674"
                                            Text="<%$ Resources:Resource, Concierge %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="CashierHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=15&jid=690"
                                            Text="<%$ Resources:Resource, Cashier %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="TaxiDriverHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=16&jid=774"
                                            Text="<%$ Resources:Resource, Taxi Driver %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="CosmologistHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=17&jid=801"
                                            Text="<%$ Resources:Resource, Cosmologist %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="LibrarianHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=18&jid=870"
                                            Text="<%$ Resources:Resource, Librarian %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="EmbalmerHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=19&jid=896"
                                            Text="<%$ Resources:Resource, Embalmer %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                             <li><span class="menu_r">
                                        <asp:HyperLink ID="ElectricianHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=5&jid=214"
                                            Text="<%$ Resources:Resource, Electrician %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                             <li><span class="menu_r">
                                        <asp:HyperLink ID="WPFDeveloperHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=10&jid=487"
                                            Text="<%$ Resources:Resource, WPFDeveloper %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                             <li><span class="menu_r">
                                        <asp:HyperLink ID="TellerHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=7&jid=323"
                                            Text="<%$ Resources:Resource, Teller %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                             <li><span class="menu_r">
                                        <asp:HyperLink ID="ActorHyperLink" NavigateUrl="ProfessionalResult.aspx?m=basicskill&ind=4&jid=165"
                                            Text="<%$ Resources:Resource, Actor %>" runat="server" Style="height: 22px;
                                            vertical-align: middle; padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                </ul>
                                <br />
                            </div>
                            <div class="menu bubplastic customvertical customblue">
                                <ul>
                                    <li><span class="menu_r">
                                        <asp:HyperLink ID="MoreProfessionalHyperLink" NavigateUrl="FindProfessional.aspx"
                                            Text="<%$ Resources:Resource, More> %>" runat="server" Style="height: 22px; vertical-align: middle;
                                            padding-top: 5px; margin-right: -5px"></asp:HyperLink></span></li>
                                </ul>
                                <br class="clearit" />
                            </div>
                            <div style="background-color: #800000; margin-left: 0px; margin-right: -2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #800000; border-right: 1px solid #800000;">
                            </div>
                            <div style="background-color: #800000; margin-left: 0px; margin-right: -2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #800000; border-right: 1px solid #800000;">
                            </div>
                            <div style="background-color: #800000; margin-left: 1px; margin-right: -1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #800000; border-right: 1px solid #800000;">
                            </div>
                            <div style="background-color: #800000; margin-left: 1px; margin-right: -1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #800000; border-right: 1px solid #800000;">
                            </div>
                            <div style="background-color: #800000; margin-left: 2px; margin-right: 0px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #800000; border-right: 1px solid #800000;">
                            </div>
                            <div style="background-color: #800000; margin-left: 3px; margin-right: 1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #800000; border-right: 1px solid #800000;">
                            </div>
                            <div style="background-color: #800000; margin-left: 4px; margin-right: 2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 4px solid #800000; border-right: 4px solid #800000;">
                            </div>
                            <div style="background-color: #800000; margin-left: 8px; margin-right: 6px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #800000; border-right: 1px solid #800000;">
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="MiddleColumn">
                <table>
                    <tr>
                        <td>
                            <center>
                                <div id="piecemaker">
                                    <p>
                                        Need to Install Flash Playerv>
                            </center>
                            <%-- <div id="wrapper">
                           <div style="height: 358px">
                                    <div class="slider-wrapper theme-pascal">
                                        <div class="ribbon">
                                        </div>
                                        <div id="nivoslider-373" class="nivoSlider" style="width: 630px; height: 285px;">
                                            <img src="../Images/NivoSlider/walle.jpg" title="#nivoslider-373-caption-0" alt="" />
                                            <img src="../Images/NivoSlider/walle.jpg" alt="" />
                                            <img src="../Images/NivoSlider/walle.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div id="nivoslider-373-caption-0" class="nivo-html-caption">
                                        Some Title</div>
                                    <script type="text/javascript" src="../scripts/jquery-1.6.1.min.js"></script>
                                    <script type="text/javascript" src="../scripts/jquery.nivo.slider.pack.js"></script>
                                    <script type="text/javascript">
                                        $(function ($) {
                                            $(document).ready(function () {
                                                $("#nivoslider-373").nivoSlider({
                                                    effect: "sliceUpDown",
                                                    slices: 8,
                                                    boxCols: 8,
                                                    boxRows: 4,
                                                    animSpeed: 2000,
                                                    pauseTime: 5000,
                                                    startSlide: 0,
                                                    directionNav: true,
                                                    directionNavHide: true,
                                                    controlNav: true,
                                                    controlNavThumbs: false,
                                                    controlNavThumbsFromRel: true,
                                                    keyboardNav: true,
                                                    pauseOnHover: true,
                                                    manualAdvance: false
                                                });
//                                                $('#nivoslider-373').data('nivoslider').stop();
                                            })
                                        })
                                    </script>
                                </div>
                                                       </div>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellspacing="20px" cellpadding="10px" style="width: 560px">
                                <tr>
                                    <td class="CustomColumn">
                                        <h2 id="H2Benefits" runat="server">
                                            <asp:Label ID="BenefitsLabel" runat="server" Text="<%$ Resources:Resource, Benefits %>"
                                                Font-Bold="True" Font-Size="Large"></asp:Label></h2>
                                        <div style="background-color: #FFFFFF; margin: 0px;">
                                            <ul style="background-color: #FFFFFF; margin: 0px;">
                                                <li class="Andy" style="padding-left: 40px; padding-top: 10px">*
                                                    <asp:Label ID="FreeLabel" runat="server" Text="<%$ Resources:Resource, Free %>"></asp:Label></li>
                                                <li class="Andy" style="padding-left: 40px; padding-top: 10px">*
                                                    <asp:Label ID="SecureLabel" runat="server" Text="<%$ Resources:Resource, Secure %>"></asp:Label></li>
                                                <li class="Andy" style="padding-left: 40px; padding-top: 10px">*
                                                    <asp:Label ID="ReliableLabel" runat="server" Text="<%$ Resources:Resource, Reliable %>"></asp:Label></li>
                                            </ul>
                                            <div style="text-align: right">
                                                <button id="MoreBenefitButton" type="button" runat="server" onmouseover="style.backgroundColor='#336600';"
                                                    onmouseout="style.backgroundColor='#003300';" style="background-color: #003300;
                                                    color: #FFFFFF;" onclick="window.location='Benefits.aspx';">
                                                    <asp:Label ID="MoreBenefitLabel" runat="server" Text="<%$ Resources:Resource, More> %>"></asp:Label>
                                                </button>
                                            </div>
                                        </div>
                                        <div style="background-color: #003366; margin-left: 0px; margin-right: -2px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                                        </div>
                                        <div style="background-color: #003366; margin-left: 0px; margin-right: -2px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                                        </div>
                                        <div style="background-color: #003366; margin-left: 1px; margin-right: -1px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                                        </div>
                                        <div style="background-color: #003366; margin-left: 1px; margin-right: -1px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                                        </div>
                                        <div style="background-color: #003366; margin-left: 2px; margin-right: 0px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                                        </div>
                                        <div style="background-color: #003366; margin-left: 3px; margin-right: 1px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                                        </div>
                                        <div style="background-color: #003366; margin-left: 4px; margin-right: 2px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 4px solid #003366; border-right: 4px solid #003366;">
                                        </div>
                                        <div style="background-color: #003366; margin-left: 8px; margin-right: 6px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                                        </div>
                                    </td>
                                    <td class="CustomColumn">
                                        <h2 id="H2HowDoesitWork">
                                            <asp:Label ID="HowDoesitWorkLabel" runat="server" Text="<%$ Resources:Resource, HowDoesitWork? %>"
                                                Font-Bold="True" Font-Size="Large"></asp:Label></h2>
                                        <div style="background-color: #FFFFFF; margin: 0px;">
                                            <ul style="background-color: #FFFFFF; margin: 0px;">
                                                <li class="Andy" style="padding-left: 40px; padding-top: 10px">*
                                                    <asp:Label ID="PostProjectLabel" runat="server" Text="<%$ Resources:Resource, PostProject %>"></asp:Label></li>
                                                <li class="Andy" style="padding-left: 40px; padding-top: 10px">*
                                                    <asp:Label ID="MakeBidsLabel" runat="server" Text="<%$ Resources:Resource, MakeBids %>"></asp:Label></li>
                                                <li class="Andy" style="padding-left: 40px; padding-top: 10px">*
                                                    <asp:Label ID="GenerateContractLabel" runat="server" Text="<%$ Resources:Resource, GenerateContract %>"></asp:Label></li>
                                            </ul>
                                            <div style="text-align: right">
                                                <button type="button" id="MoreWorkButton" style="background-color: #800000; color: #FFFFFF;"
                                                    onmouseover="style.backgroundColor='#D90000';" onmouseout="style.backgroundColor='#800000';"
                                                    onclick="window.location='HowDoesitWork.aspx';">
                                                    <asp:Label ID="MoreWorkLabel" runat="server" Text="<%$ Resources:Resource, More> %>"></asp:Label>
                                                </button>
                                            </div>
                                        </div>
                                        <div style="background-color: #003366; margin-left: 0px; margin-right: -2px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                                        </div>
                                        <div style="background-color: #003366; margin-left: 0px; margin-right: -2px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                                        </div>
                                        <div style="background-color: #003366; margin-left: 1px; margin-right: -1px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                                        </div>
                                        <div style="background-color: #003366; margin-left: 1px; margin-right: -1px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                                        </div>
                                        <div style="background-color: #003366; margin-left: 2px; margin-right: 0px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                                        </div>
                                        <div style="background-color: #003366; margin-left: 3px; margin-right: 1px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                                        </div>
                                        <div style="background-color: #003366; margin-left: 4px; margin-right: 2px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 4px solid #003366; border-right: 4px solid #003366;">
                                        </div>
                                        <div style="background-color: #003366; margin-left: 8px; margin-right: 6px; height: 1px;
                                            font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="RightColumn">
                <table style="height: 620px">
                    <tr>
                        <td valign="top">
                            <div style="background-color: #6C798C; margin-left: 4px; margin-right: 2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 4px solid #6C798C; border-right: 4px solid #6C798C;">
                            </div>
                            <div style="background-color: #6C798C; margin-left: 3px; margin-right: 1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #6C798C; border-right: 1px solid #6C798C;">
                            </div>
                            <div style="background-color: #6C798C; margin-left: 2px; margin-right: 0px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #6C798C; border-right: 1px solid #6C798C;">
                            </div>
                            <div style="background-color: #6C798C; margin-left: 1px; margin-right: -1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #6C798C; border-right: 1px solid #6C798C;">
                            </div>
                            <div style="background-color: #6C798C; margin-left: 1px; margin-right: -1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #6C798C; border-right: 1px solid #6C798C;">
                            </div>
                            <div style="background-color: #6C798C; margin-left: 0px; margin-right: -2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #6C798C; border-right: 1px solid #6C798C;">
                            </div>
                            <div style="background-color: #6C798C; margin-left: 0px; margin-right: -2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #6C798C; border-right: 1px solid #6C798C;">
                            </div>
                            <table id="SignTable" cellspacing="20" border="0" style="border-collapse: collapse;
                                width: 100%; text-align: center; background-color: White; overflow: auto; border-style: solid;
                                border-left: 1px solid SlateGray; border-right: 1px solid SlateGray;" runat="server">
                                <tr>
                                    <td>
                                        <button id="SignInButton" type="button" style="background-color: #003366; color: #FFFFFF;"
                                            onmouseover="style.backgroundColor='#006699';" onmouseout="style.backgroundColor='#003366';"
                                            onclick="window.location='SignIn.aspx';">
                                            <asp:Label ID="SignInLabel" runat="server" Text="<%$ Resources:Resource, SignIn %>"></asp:Label></button>
                                    </td>
                                    <td>
                                        <button id="SignUpButton" type="button" onclick="window.location='SignUp.aspx';"
                                            onmouseover="style.backgroundColor='#336600';" onmouseout="style.backgroundColor='#003300';"
                                            style="background-color: #003300; color: #FFFFFF;" runat="server">
                                            <asp:Label ID="SignUpLabel" runat="server" Text="<%$ Resources:Resource, SignUp %>"></asp:Label></button>
                                    </td>
                                    <td>
                                        <a tabindex="0" href="#search-engines" class="fg-button fg-button-icon-right ui-widget ui-state-default ui-corner-all"
                                            id="flat"><span class="ui-icon ui-icon-triangle-1-s"></span>
                                            <img id="selected" alt="earth" border="0" longdesc="earth" src="http://my-side-job.com/Images/flags/earth.png"
                                                runat="server" /></a>
                                        <div id="search-engines" class="hidden" style="width:165px; color:White">
                                           <ul>
                                                <li><a id ="EnglishLanguageLink" href="?l=en-US" runat="server"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/US.png" <asp:Label ID="EnglishLabel" ForeColor="White" runat="server" Text="<%$ Resources:Resource, English %>" Font-Size="Smaller"></asp:Label>  </></a></li>
                                                <li><a id ="FrenchLanguageLink" href="?l=fr"  runat="server"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/FR.png" <asp:Label ID="FrenchLabel" runat="server" Text="<%$ Resources:Resource, French %>" Font-Size="Smaller"></asp:Label>  </></a></li>
                                                <li><a id ="SpanishLanguageLink" href="?l=es" runat="server"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/ES.png"  <asp:Label ID="SpanishLabel" runat="server" Text="<%$ Resources:Resource, Spanish %>" Font-Size="Smaller"></asp:Label>  </></a></li>
                                                <li><a id ="ChineseLanguageLink"  runat="server" href="?l=zh-CN"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/CN.png"  <asp:Label ID="ChineseLabel" runat="server" Text="<%$ Resources:Resource, Chinese %>" Font-Size="Smaller"></asp:Label>  </></a></li>
                                                <li><a id ="RussianLanguageLink" href="?l=ru"  runat="server"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/RU.png"  <asp:Label ID="RussianLabel" runat="server" Text="<%$ Resources:Resource, Russian %>" Font-Size="Smaller"></asp:Label></>  </a></li>
                                                <li><a id ="ArabicLanguageLink" href="?l=ar" runat="server"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/AE.png" <asp:Label ID="ArabicLabel" runat="server" Text="<%$ Resources:Resource, Arabic %>" Font-Size="Smaller"></asp:Label></>  </a></li>
                                                <li><a id ="JapaneseLanguageLink" href="?l=ja" runat="server"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/JP.png" <asp:Label ID="JapaneseLabel" runat="server" Text="<%$ Resources:Resource, Japanese %>" Font-Size="Smaller"></asp:Label></>  </a></li>
                                                <li><a id ="GermanLanguageLink" href="?l=de"  runat="server"><img src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/DE.png" <asp:Label ID="GermanLabel" runat="server" Text="<%$ Resources:Resource, German %>" Font-Size="Smaller"></asp:Label></>  </a></li> </ul>  
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div style="background-color: #6C798C; margin-left: 0px; margin-right: -2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #6C798C; border-right: 1px solid #6C798C;">
                            </div>
                            <div style="background-color: #6C798C; margin-left: 0px; margin-right: -2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #6C798C; border-right: 1px solid #6C798C;">
                            </div>
                            <div style="background-color: #6C798C; margin-left: 1px; margin-right: -1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #6C798C; border-right: 1px solid #6C798C;">
                            </div>
                            <div style="background-color: #6C798C; margin-left: 1px; margin-right: -1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #6C798C; border-right: 1px solid #6C798C;">
                            </div>
                            <div style="background-color: #6C798C; margin-left: 2px; margin-right: 0px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #6C798C; border-right: 1px solid #6C798C;">
                            </div>
                            <div style="background-color: #6C798C; margin-left: 3px; margin-right: 1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #6C798C; border-right: 1px solid #6C798C;">
                            </div>
                            <div style="background-color: #6C798C; margin-left: 4px; margin-right: 2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 4px solid #6C798C; border-right: 4px solid #6C798C;">
                            </div>
                            <div style="background-color: #6C798C; margin-left: 8px; margin-right: 6px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #6C798C; border-right: 1px solid #6C798C;">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h2 id="H2LatestProjects">
                                <asp:Label ID="LatestProjectsLabel" runat="server" Text="<%$ Resources:Resource, LatestProjects %>"
                                    Font-Bold="True" Font-Size="Large"></asp:Label></h2>
                            <div style="background-color: #FFFFFF; text-align: center; border-right-style: solid;
                                border-left-style: solid; border-right-width: 2px; border-left-width: 2px; border-right-color: #003300;
                                border-left-color: #003300;">
                                <asp:DataList ID="TopProjectDataList" runat="server" DataKeyField="ProjectID" 
                                    Width="178px" HorizontalAlign="Center" CellSpacing="4">
                                    <ItemTemplate>
                                        <div style="text-align: center" id="GreenLink">
                                            <asp:ImageButton ID="ProjectImageButton" runat="server" Height="50px" Width="50px"
                                                ImageUrl='<%# Eval("PhotoPath") %>' PostBackUrl='<%# "../Authenticated/ViewProject.aspx?PRID=" + Eval("ProjectID", "{0}") %>' />
                                            <br />
                                            <asp:HyperLink ID="ProjectIDHyperLink" runat="server" NavigateUrl='<%# "../Authenticated/ViewProject.aspx?PRID=" + Eval("ProjectID", "{0}") %>'
                                                Text='<%# Eval("ProjectTitle", "{0}") %>'   Font-Bold="True" Font-Underline="False"></asp:HyperLink>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                                <div style="text-align: right">
                                    <button id="MoreProjectButton" type="button" runat="server" onmouseover="style.backgroundColor='#336600';"
                                        onmouseout="style.backgroundColor='#003300';" style="background-color: #003300;
                                        color: #FFFFFF;" onclick="window.location='FindJob.aspx';">
                                        <asp:Label ID="MoreProjectsLabel" runat="server" Text="<%$ Resources:Resource, More> %>"></asp:Label>
                                    </button>
                                </div>
                            </div>
                            <div style="background-color: #003300; margin-left: 0px; margin-right: -2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003300; border-right: 1px solid #003300;">
                            </div>
                            <div style="background-color: #003300; margin-left: 0px; margin-right: -2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003300; border-right: 1px solid #003300;">
                            </div>
                            <div style="background-color: #003300; margin-left: 1px; margin-right: -1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003300; border-right: 1px solid #003300;">
                            </div>
                            <div style="background-color: #003300; margin-left: 1px; margin-right: -1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003300; border-right: 1px solid #003300;">
                            </div>
                            <div style="background-color: #003300; margin-left: 2px; margin-right: 0px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003300; border-right: 1px solid #003300;">
                            </div>
                            <div style="background-color: #003300; margin-left: 3px; margin-right: 1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003300; border-right: 1px solid #003300;">
                            </div>
                            <div style="background-color: #003300; margin-left: 4px; margin-right: 2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 4px solid #003300; border-right: 4px solid #003300;">
                            </div>
                            <div style="background-color: #003300; margin-left: 8px; margin-right: 6px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003300; border-right: 1px solid #003300;">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h2 id="H2TopProfessional">
                                <asp:Label ID="TopProfessionalLabel" runat="server" Text="<%$ Resources:Resource, TopProfessional %>"
                                    Font-Bold="True" Font-Size="Large"></asp:Label></h2>
                            <div style="background-color: #FFFFFF; text-align: center; border-right-style: solid;
                                border-left-style: solid; border-right-width: 2px; border-left-width: 2px; border-right-color: #003366;
                                border-left-color: #003366;">
                                <asp:DataList ID="TopProfessionalDataList" runat="server" DataKeyField="ProID" 
                                    Width="178px" HorizontalAlign="Center" CellSpacing="4">
                                    <ItemTemplate>
                                        <div style="text-align: center" id="BlueLink">
                                            <asp:ImageButton ID="ProfessionalImageButton" runat="server" Height="50px" Width="50px"
                                                ImageUrl='<%# Eval("PhotoPath") %>' PostBackUrl='<%# "../Authenticated/ViewProfessionalProfile.aspx?PID=" + Eval("ProID", "{0}") %>' />
                                            <br />
                                            <asp:HyperLink ID="ProfessionalIDHyperLink" runat="server" NavigateUrl='<%# "../Authenticated/ViewProfessionalProfile.aspx?PID=" + Eval("ProID", "{0}") %>'
                                                Text='<%# Eval("UserName", "{0}") %>'   Font-Bold="True" Font-Underline="False"></asp:HyperLink>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                                <div style="text-align: right">
                                    <button id="MoreProfessionalButton" type="button" runat="server" style="background-color: #003366;
                                        color: #FFFFFF;" onmouseover="style.backgroundColor='#006699';" onmouseout="style.backgroundColor='#003366';"
                                        onclick="window.location='FindProfessional.aspx';">
                                        <asp:Label ID="MoreProfessionalLabel" runat="server" Text="<%$ Resources:Resource, More> %>"></asp:Label>
                                    </button>
                                </div>
                            </div>
                            <div style="background-color: #003366; margin-left: 0px; margin-right: -2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                            </div>
                            <div style="background-color: #003366; margin-left: 0px; margin-right: -2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                            </div>
                            <div style="background-color: #003366; margin-left: 1px; margin-right: -1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                            </div>
                            <div style="background-color: #003366; margin-left: 1px; margin-right: -1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                            </div>
                            <div style="background-color: #003366; margin-left: 2px; margin-right: 0px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                            </div>
                            <div style="background-color: #003366; margin-left: 3px; margin-right: 1px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                            </div>
                            <div style="background-color: #003366; margin-left: 4px; margin-right: 2px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 4px solid #003366; border-right: 4px solid #003366;">
                            </div>
                            <div style="background-color: #003366; margin-left: 8px; margin-right: 6px; height: 1px;
                                font-size: 1px; overflow: hidden; border-left: 1px solid #003366; border-right: 1px solid #003366;">
                            </div>
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
