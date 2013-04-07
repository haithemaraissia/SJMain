<%@ Control Language="VB" AutoEventWireup="false" CodeFile="MainUpperButtons.ascx.vb"
    Inherits="MainUpperButtons" %>
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
    
    #nav-menu li a
    {
        background-image: url('../Images/MenuList/bg-bubplastic-h-red 2.gif');
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
    
    #nav-menu li.selected a
    {
        background-image: url('../Images/MenuList/bg-bubplastic-button2.gif');
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
    
    #nav-menu li a:hover
    {
        background-image: url('../Images/MenuList/bg-bubplastic-h-gray2.gif');
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
        width: 55.2em;
        height: 36px;
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
                                <li class="selected"><a href="Index.aspx"><asp:Label ID="HomeLabel" runat="server" Text="<%$ Resources:Resource, Home %>" ></asp:Label></a></li>
                                <li><a href="FindJob.aspx"><asp:Label ID="FindJobLabel" runat="server" Text="<%$ Resources:Resource, FindJob %>" ></asp:Label></a></li>
                                <li><a href="../Authenticated/PostProject.aspx" ><asp:Label ID="PostProjectabel" runat="server" Text="<%$ Resources:Resource, PostProject %>" ></asp:Label></a></li>
                                <li><a href="FindProfessional.aspx"><asp:Label ID="ProfessionalLabel" runat="server" Text="<%$ Resources:Resource, Professional %>" ></asp:Label></a></li>
                                <li><a href="Help.aspx"><asp:Label ID="HelpLabel" runat="server" Text="<%$ Resources:Resource, Help %>" ></asp:Label></a></li>
                            </ul>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </div>
