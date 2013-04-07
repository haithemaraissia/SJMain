<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Benefits.aspx.vb" Inherits="WIP2_RightCleanSideJOB2008FromInetpub_CleanSIDEJOB2008_NotAuthenticated_Benefits" %>
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

</head>
<style type="text/css">
 
    ul
    {
        list-style-type: none;
    }
    li a
    {
       
        color: White;
    }
    li a:hover
    {
        background-color: White;
        color: black;
    }
    button:hover
    {
        cursor: pointer;
    }
    
    /* blue pill (inspired by iTunes)
*******************************************************************************/button.blue-pill
    {
        background-color: #a5b8da;
        background-image: linear-gradient(top, #a5b8da, #7089b3);
        border-top: 1px solid #758fba;
        border-right: 1px solid #6c84ab;
        border-bottom: 1px solid #5c6f91;
        border-left: 1px solid #6c84ab;
        -webkit-border-radius: 18px;
        -moz-border-radius: 18px;
        -ms-border-radius: 18px;
        -o-border-radius: 18px;
        border-radius: 18px;
        -webkit-box-shadow: inset 0 1px 0 0 #aec3e5;
        -moz-box-shadow: inset 0 1px 0 0 #aec3e5;
        -ms-box-shadow: inset 0 1px 0 0 #aec3e5;
        -o-box-shadow: inset 0 1px 0 0 #aec3e5;
        box-shadow: inset 0 1px 0 0 #aec3e5;
        color: #fff;
        line-height: 1;
        padding: 8px 0;
        text-align: center;
        text-shadow: 0 -1px 1px #64799e;
        text-transform: uppercase;
        width: 69px;
        font-style: normal;
        font-variant: normal;
        font-weight: bold;
        font-size: 11px;
        font-family: "Lucida Grande" , "Lucida Sans Unicode" , "Lucida Sans" , Geneva, Verdana, sans-serif;
        height: 6px;
    }
    button.blue-pill:hover
    {
        background-color: #9badcc;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #9badcc), color-stop(100%, #687fa6));
        background-image: -webkit-linear-gradient(top, #9badcc, #687fa6);
        background-image: -moz-linear-gradient(top, #9badcc, #687fa6);
        background-image: -ms-linear-gradient(top, #9badcc, #687fa6);
        background-image: -o-linear-gradient(top, #9badcc, #687fa6);
        background-image: linear-gradient(top, #9badcc, #687fa6);
        border-top: 1px solid #6d86ad;
        border-right: 1px solid #647a9e;
        border-bottom: 1px solid #546685;
        border-left: 1px solid #647a9e;
        -webkit-box-shadow: inset 0 1px 0 0 #a5b9d9;
        -moz-box-shadow: inset 0 1px 0 0 #a5b9d9;
        -ms-box-shadow: inset 0 1px 0 0 #a5b9d9;
        -o-box-shadow: inset 0 1px 0 0 #a5b9d9;
        box-shadow: inset 0 1px 0 0 #a5b9d9;
        cursor: pointer;
    }
    button.blue-pill:active
    {
        border: 1px solid #546685;
        -webkit-box-shadow: inset 0 0 8px 2px #7e8da6, 0 1px 0 0 #eeeeee;
        -moz-box-shadow: inset 0 0 8px 2px #7e8da6, 0 1px 0 0 #eeeeee;
        -ms-box-shadow: inset 0 0 8px 2px #7e8da6, 0 1px 0 0 #eeeeee;
        -o-box-shadow: inset 0 0 8px 2px #7e8da6, 0 1px 0 0 #eeeeee;
        box-shadow: inset 0 0 8px 2px #7e8da6, 0 1px 0 0 #eeeeee;
    }
    
    #CustomerTable
    {
        background-color: White;
        border: 5px solid #C0C0C0;
        width:960px;
        height:280px;
        margin:0 auto;
    }
    
    table
    {
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        border-color: Silver;
        border-width: 5px;
        border-radius: 10px;
    }
    
    #wrapper
    {
    	padding-top:20px
    }
    
    
    
    
    #H2Customer{
	position:relative;
	color:#fff;
	background:#f43059;
	font-size:1.5em;
	float:left;
	clear:both;
	padding:10px 10px 10px 20px;
	margin-left:-20px;
	margin-bottom:20px;
	text-shadow:0 -1px #d0284b, 0 1px #f96080;

	-moz-box-shadow:2px 2px 0 rgba(0,0,0,0.1);
	-webkit-box-shadow:2px 2px 0 rgba(0,0,0,0.1);
	-o-box-shadow:2px 2px 0 rgba(0,0,0,0.1);
	box-shadow:2px 2px 0 rgba(0,0,0,0.1);
        top: -20px;
        left: 0px;
        width: 458px;
    }
#H2Customer:before{
	content:" ";
	background:url(../_assets/img/ribbonred.png);
	display:block;
	width:10px;
	height:10px;
	position:absolute;
	bottom:0;
	left:0;
	margin-bottom:-10px;
	z-index:-1;
}

#ProfessionalWrapper
{
	 background-color: White;
        border: 5px solid #C0C0C0;
        width:960px;
        height:280px;
        margin:40px auto;
}




</style>
<body>
    <form id="form1" runat="server">
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>

  <%--   <div id="wrapper" style="padding: 10px">
        <table align="center" id="TemplateGlobalTable">
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>--%>

    <div id="CustomerAdjustment" style="margin-top:35px">
    
    <div id="CustomerTable">
     
 <h2 id="H2Customer">
                                            <asp:Label ID="HowDoesitWorkLabel" runat="server" Text="<%$ Resources:Resource, HowDoesitWork? %>"
                                                Font-Bold="True" Font-Size="Large"></asp:Label></h2><br /><br /><br />
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

    </div>

</div>


 <div id="ProfessionalAdjustment" style="margin-top:25px">

<div id="ProfessionalWrapper" style="margin-bottom:25px">

         <td>
 <h2 id="H2Customer">
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, HowDoesitWork? %>"
                                                Font-Bold="True" Font-Size="Large"></asp:Label></h2><br /><br /><br />
                                        <div style="background-color: #FFFFFF; margin: 0px;">
                                            <ul style="background-color: #FFFFFF; margin: 0px;">
                                                <li class="Andy" style="padding-left: 40px; padding-top: 10px">*
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, PostProject %>"></asp:Label></li>
                                                <li class="Andy" style="padding-left: 40px; padding-top: 10px">*
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, MakeBids %>"></asp:Label></li>
                                                <li class="Andy" style="padding-left: 40px; padding-top: 10px">*
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, GenerateContract %>"></asp:Label></li>
                                            </ul>
                                            <div style="text-align: right">
                                                <button type="button" id="Button1" style="background-color: #800000; color: #FFFFFF;"
                                                    onmouseover="style.backgroundColor='#D90000';" onmouseout="style.backgroundColor='#800000';"
                                                    onclick="window.location='HowDoesitWork.aspx';">
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, More> %>"></asp:Label>
                                                </button>
                                            </div>

                                            </div>
        &nbsp;</div>
 </div>
    
    <div class="cleaner">
    </div>
    <LowerNavigationButtons:NavigationButtons ID="MainLowerNavigationButtons" runat="server" />
    </form>


</body>
</html>
