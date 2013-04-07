<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Help.aspx.vb" Inherits="NotAuthenticated_Template"
    Culture="auto:en-us" UICulture="auto:en-us" %>

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
        .SmallP
        {
            font-family: "Times New Roman", Times, serif;
            font-size: small;
        }
        .BoldStyle
        {
            color: #003366;
            font-weight: bold;
        }
/* beta - a free web template by spyka webmaster
   http://www.spyka.net
*/


/* paragraphs */
p {
	margin:2px 0 15px 0;
	line-height:1.3em;
}

/* links 
a {
	color:#202020;
	border-bottom:1px dotted #333333;
	text-decoration:none;
}
a:hover {
	border-bottom:1px solid #333333;
}
*/
/* lists */
ul, ol {
	margin:0 0 5px 30px;
}

.AccordionHeader
{
    background-color: #325479;
    padding: 8px 8px 8px 3px;
    text-align: center;
}
.AccordionHeader a
{
    color: #ffffff;
    padding: 0px 8px 8px 0px;
    text-align: center;
    text-decoration:none;
}
.AccordionHeader a:hover
{
    color: #ffffff;
    padding: 0px 8px 8px 0px;
    text-align: center;
    text-decoration:underline;
}
.AccordionSelected
{
    background-color: #1D2F43;
    color: #FFFFFF;
    padding: 8px 8px 8px 3px;
    text-align: center;
    text-decoration:none;
}
.AccordionSelected a
{
    color: #ffffff;
    padding: 0px 8px 8px 0px;
      text-align: center;
      text-decoration:none;
}
.AccordionContent
{
    border: 3px solid #1D2F43;
}

/* generic classes */
.bold {
	font-weight:bold;
}
.clear {
	clear:both;
}
.selected
{
    color: #ffffff;
    background-color: #1D2F43;
    font-weight: bold;
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
                        <cc1:Accordion ID="Accordion1" runat="server" SelectedIndex="0" FadeTransitions="true"
                            FramesPerSecond="40" TransitionDuration="250" AutoSize="None" HeaderCssClass="AccordionHeader"
                            HeaderSelectedCssClass="AccordionSelected" 
                            ContentCssClass="AccordionContent" Height="528px" Width="960px" >
                            <Panes>
                                <cc1:AccordionPane runat="server" ID="sfewrfw">
                                    <Header>
                                        <a href="" onclick="return false;">System Requirement</a>
                                    </Header>
                                    <Content>
                                        <div>
                                            <p class="SmallP">
                                                <span class="BoldStyle">Operating Systems: </span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Microsoft Windows® XP with Service Pack 2 (SP2)
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Windows Vista™
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Windows 7
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Windows 2008 Server
                                                <br />
                                                <br />
                                                <span class="BoldStyle">Environments: </span>
                                                <br />
                                                &nbsp;&nbsp; .NET Framework 3.5 or later<br />
                                                &nbsp;&nbsp;&nbsp; Visual Studio® 2005 extensions for .NET Framework 2.0 November
                                                2006 CTP
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Visual Studio® 2008, Visual Studio® 2010
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Microsoft® Expression® Blend Crystal Report® v.10 License</p>
                                        </div>
                                    </Content>
                                </cc1:AccordionPane>
                                <cc1:AccordionPane runat="server" ID="AccordionPane1">
                                    <Header>
                                        <a href="" onclick="return false;">Application Installation</a>
                                    </Header>
                                    <Content>
                                        <div>
                                            <p class="SmallP">
                                                <span class="BoldStyle">Demo Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Click on Download Tab
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Click on Download Button
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Save the Executable File
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Run the Executable File
                                                <br />
                                                <br />
                                                <span class="BoldStyle">Full Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Click on Download Tab
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Click on Download Button
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Save and Extract the Zip File
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Open Project with Visual Studio
                                            </p>
                                        </div>
                                    </Content>
                                </cc1:AccordionPane>
                                <cc1:AccordionPane runat="server" ID="AccordionPane2">
                                    <Header>
                                        <a href="" onclick="return false;">Product Customization</a>
                                    </Header>
                                    <Content>
                                        <div>
                                            <p class="SmallP">
                                                <span class="BoldStyle">Demo Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Not Applicable
                                                <br />
                                                <br />
                                                <span class="BoldStyle">Full Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Tab Management support User Configuration
                                                <br />
                                                &nbsp;&nbsp;&nbsp;IBank Interface allows you to Add or Remove Banks
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Reports Configuration is accomodated in Crystal Report
                                                <br />
                                                <br />
                                                <span class="BoldStyle">Custom:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp; VMC can be <a href="Customize.aspx" title="Customize Product"
                                                    style="color: Blue;">Customized</a> based on your defined function
                                                <br />
                                            </p>
                                        </div>
                                    </Content>
                                </cc1:AccordionPane>
                                <cc1:AccordionPane runat="server" ID="AccordionPane3">
                                    <Header>
                                        <a href="" onclick="return false;">Version Download</a>
                                    </Header>
                                    <Content>
                                        <div>
                                            <p class="SmallP">
                                                <span class="BoldStyle">Demo Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Free to Use
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Support Mortgage Comparison
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Support Data Validation
                                                <br />
                                                <br />
                                                <span class="BoldStyle">Full Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp;License is Required
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Available for Purchase
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Mortgage Comparison
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Data Validation
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Report Analysis
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Buisness Functionality Integration
                                                <br />
                                            </p>
                                        </div>
                                    </Content>
                                </cc1:AccordionPane>
                                <cc1:AccordionPane runat="server" ID="AccordionPane4">
                                    <Header>
                                        <a href="" onclick="return false;">Product Customization</a>
                                    </Header>
                                    <Content>
                                        <div>
                                            <p class="SmallP">
                                                <span class="BoldStyle">Demo Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Not Applicable
                                                <br />
                                                <br />
                                                <span class="BoldStyle">Full Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Tab Management support User Configuration
                                                <br />
                                                &nbsp;&nbsp;&nbsp;IBank Interface allows you to Add or Remove Banks
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Reports Configuration is accomodated in Crystal Report
                                                <br />
                                                <br />
                                                <span class="BoldStyle">Custom:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp; VMC can be <a href="Customize.aspx" title="Customize Product"
                                                    style="color: Blue;">Customized</a> based on your defined function
                                                <br />
                                            </p>
                                        </div>
                                    </Content>
                                </cc1:AccordionPane>
                                <cc1:AccordionPane runat="server" ID="AccordionPane5">
                                    <Header>
                                        <a href="" onclick="return false;">Version Download</a>
                                    </Header>
                                    <Content>
                                        <div>
                                            <p class="SmallP">
                                                <span class="BoldStyle">Demo Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Free to Use
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Support Mortgage Comparison
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Support Data Validation
                                                <br />
                                                <br />
                                                <span class="BoldStyle">Full Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp;License is Required
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Available for Purchase
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Mortgage Comparison
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Data Validation
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Report Analysis
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Buisness Functionality Integration
                                                <br />
                                            </p>
                                        </div>
                                    </Content>
                                </cc1:AccordionPane>
                                                                <cc1:AccordionPane runat="server" ID="AccordionPane6">
                                    <Header>
                                        <a href="" onclick="return false;">Product Customization</a>
                                    </Header>
                                    <Content>
                                        <div>
                                            <p class="SmallP">
                                                <span class="BoldStyle">Demo Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Not Applicable
                                                <br />
                                                <br />
                                                <span class="BoldStyle">Full Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Tab Management support User Configuration
                                                <br />
                                                &nbsp;&nbsp;&nbsp;IBank Interface allows you to Add or Remove Banks
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Reports Configuration is accomodated in Crystal Report
                                                <br />
                                                <br />
                                                <span class="BoldStyle">Custom:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp; VMC can be <a href="Customize.aspx" title="Customize Product"
                                                    style="color: Blue;">Customized</a> based on your defined function
                                                <br />
                                            </p>
                                        </div>
                                    </Content>
                                </cc1:AccordionPane>
                                <cc1:AccordionPane runat="server" ID="AccordionPane7">
                                    <Header>
                                        <a href="" onclick="return false;">Version Download</a>
                                    </Header>
                                    <Content>
                                        <div>
                                            <p class="SmallP">
                                                <span class="BoldStyle">Demo Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Free to Use
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Support Mortgage Comparison
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Support Data Validation
                                                <br />
                                                <br />
                                                <span class="BoldStyle">Full Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp;License is Required
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Available for Purchase
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Mortgage Comparison
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Data Validation
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Report Analysis
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Buisness Functionality Integration
                                                <br />
                                            </p>
                                        </div>
                                    </Content>
                                </cc1:AccordionPane>
                                                                <cc1:AccordionPane runat="server" ID="AccordionPane8">
                                    <Header>
                                        <a href="" onclick="return false;">Product Customization</a>
                                    </Header>
                                    <Content>
                                        <div>
                                            <p class="SmallP">
                                                <span class="BoldStyle">Demo Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Not Applicable
                                                <br />
                                                <br />
                                                <span class="BoldStyle">Full Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Tab Management support User Configuration
                                                <br />
                                                &nbsp;&nbsp;&nbsp;IBank Interface allows you to Add or Remove Banks
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Reports Configuration is accomodated in Crystal Report
                                                <br />
                                                <br />
                                                <span class="BoldStyle">Custom:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp; VMC can be <a href="Customize.aspx" title="Customize Product"
                                                    style="color: Blue;">Customized</a> based on your defined function
                                                <br />
                                            </p>
                                        </div>
                                    </Content>
                                </cc1:AccordionPane>
                                <cc1:AccordionPane runat="server" ID="AccordionPane9">
                                    <Header>
                                        <a href="" onclick="return false;">Version Download</a>
                                    </Header>
                                    <Content>
                                        <div>
                                            <p class="SmallP">
                                                <span class="BoldStyle">Demo Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Free to Use
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Support Mortgage Comparison
                                                <br />
                                                &nbsp;&nbsp;&nbsp; Support Data Validation
                                                <br />
                                                <br />
                                                <span class="BoldStyle">Full Version:</span>
                                                <br />
                                                &nbsp;&nbsp;&nbsp;License is Required
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Available for Purchase
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Mortgage Comparison
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Data Validation
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Report Analysis
                                                <br />
                                                &nbsp;&nbsp;&nbsp;Support Buisness Functionality Integration
                                                <br />
                                            </p>
                                        </div>
                                    </Content>
                                </cc1:AccordionPane>
                            </Panes>
                        </cc1:Accordion>
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
