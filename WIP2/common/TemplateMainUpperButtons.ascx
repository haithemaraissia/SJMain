<%@ Control Language="VB" AutoEventWireup="false" CodeFile="TemplateMainUpperButtons.ascx.vb"
    Inherits="common.Wip2RightCleanSideJob2008FromInetpubCleanSidejob2008CommonMainUpperButtons2" %>
    <link rel="stylesheet" media="all" type="text/css" href="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/_assets/css/menu_style.css" />
    <link rel="stylesheet" href="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/_assets/css/MainUpperButtonsTemplateStyleSheet.css" type="text/css" media="screen" />
    <link type="text/css" href="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/_assets/css/fg.menu.css" media="screen" rel="stylesheet" />
    <link type="text/css" href="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/_assets/themes/theme/ui.all.css" media="screen" rel="stylesheet" />
    <script type="text/javascript" src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/_assets/piecemaker/web/scripts/swfobject/swfobject.js"></script>
    <script type="text/javascript" src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/scripts/HomeScript.js"></script>
    <script type="text/javascript" src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/scripts/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/scripts/fg.menu.js"></script>
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
<style type="text/css">
    #H2SideJob
    {
        text-align: center;
        position: relative;
        color: #fff;
        margin: 0 -12px 0px -12px;
        padding: 10px 0;
        text-shadow: 0 1px rgba(0,0,0,.8);
        background: #6C798C;
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
    #H2SideJob:before, #H2SideJob:after
    {
        border-style: solid;
        border-color: transparent;
        bottom: -10px;
    }
    #H2SideJob:before
    {
        border-width: 0 10px 10px 0;
        border-right-color: #222;
        left: 0;
    }
    #H2SideJob:after
    {
        border-width: 0 0 10px 10px;
        border-left-color: #222;
        right: 0;
    }
    
    #nav-menu ul
    {
        list-style: none;
        padding: 0;
        margin: 0;
        font-family: Andy;
        font-size: large;
        height: 38px;
    }
    
    #nav-menu li
    {
        float: left;
        margin: 0;
        height: 37px;
    }
    
    
    .nav-menu a
{
        background-image: url('http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/MenuList/bg-bubplastic-h-red 2.gif');
        height: 2em;
        line-height: 2em;
        float: left;
        width: 9em;
        display: block;
        border: 0.1em solid #dcdce9;
        color: #FFFFFF;
        text-decoration: none;
        text-align: center;
    }
    
    
    .selected a
    {
        background-image: url('http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/MenuList/bg-bubplastic-button2.gif');
        height: 2em;
        line-height: 2em;
        float: left;
        width: 9em;
        display: block;
        border: 0.1em solid #dcdce9;
        color: #0d2474;
        text-decoration: none;
        text-align: center;
    }
    
    .nav-menu  a:hover
    {
        background-image: url('http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/MenuList/bg-bubplastic-h-gray2.gif');
        height: 2em;
        line-height: 2em;
        float: left;
        width: 9em;
        display: block;
        border: 0.1em solid #dcdce9;
        color: #0d2474;
        text-decoration: none;
        text-align: center;
    }
    
    /* Hide from IE5-Mac \*/
    #nav-menu li a
    {
        float: none;
    }
    /* End hide */
    
    #nav-menu
    {
        width: 58.4em;
        height: 36px;
    }
     #Language li a
     {
     }
</style>
<div style=" background-color: #800000; text-align: center">
    <div>
        <table align="center">
            <tr>
                <td>
                    <h2 id="H2HowDoesitWork" style="width: 960px;" align="center">
                        <asp:Label ID="HowDoesitWorkLabel" runat="server" Text="Side Job" Font-Bold="True"
                            Font-Size="Large" 
                            style="font-size: xx-large; font-family: Andy; color: #FFFFFF;"></asp:Label></h2>
                </td>
            </tr>
        </table>
    </div>
    <div style="background-color: #800000; margin: -5px auto; width: 100%; height: 40px;">
        <table align="center">
            <tr>
                <td>
                    <div style=" margin: 0px 0px 0px 4.2em">
                        <div id="nav-menu" >
                            <ul>
                                <li class="selected"><a href="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/NotAuthenticated/Index.aspx">
                                    <asp:Label ID="HomeLabel" runat="server" Text="<%$ Resources:Resource, Home %>"></asp:Label></a></li>
                                <li class="nav-menu"><a href="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/NotAuthenticated/FindJob.aspx">
                                    <asp:Label ID="FindJobLabel" runat="server" Text="<%$ Resources:Resource, FindJob %>"></asp:Label></a></li>
                                <li class="nav-menu"><a href="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Authenticated/PostProject.aspx">
                                    <asp:Label ID="PostProjectabel" runat="server" Text="<%$ Resources:Resource, PostProject %>"></asp:Label></a></li>
                                <li class="nav-menu"><a href="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/NotAuthenticated/FindProfessional.aspx">
                                    <asp:Label ID="ProfessionalLabel" runat="server" Text="<%$ Resources:Resource, Professional %>"></asp:Label></a></li>
                                <li class="nav-menu"><a href="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/NotAuthenticated/Help.aspx">
                                    <asp:Label ID="HelpLabel" runat="server" Text="<%$ Resources:Resource, Help %>"></asp:Label></a></li>
                                   
                                <li>
                                <div id="Language">
                                      <a tabindex="0" href="#search-engines" class="fg-button fg-button-icon-right ui-widget ui-state-default ui-corner-all"
                                            id="flat" dir="ltr"><span class="ui-icon ui-icon-triangle-1-s"></span>
                                            <img id="selected" alt="earth" border="0" longdesc="earth" src="http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/flags/earth.png"
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
                                           
                                        </div>
                                </li>
                                </ul>
                            
                        </div>
                        
                        
                                
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </div>
