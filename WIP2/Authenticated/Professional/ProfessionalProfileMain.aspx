<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProfessionalProfileMain.aspx.vb"
    Inherits="UserProfile" %>
<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="~/common/MainUpperButtons.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    



    <script language="javascript" type="text/javascript">

//function HideSkill()
//{
//$find('ModalPopupExtender14').hide();
//}
function fireanimation()
    {
document.getElementById('LoadingPanel').style.visibility ='visible';
 $find('ModalPopupExtender10').show();
document.body.style.overflow =  'visible';
}

    function refresh() 
{ 
    window.location.reload(); 
} 
// <!CDATA[

function TABLE1_onclick() {

}

function ChangePSfunction()
{

//document.getElementById('ChangePassword1').setAttribute(visible,true);
//var key = document.getElementById('ChangePassword1');
$find('ModalPopupExtender5').show();
//document.getElementById('Password').style.visibility = 'visible';
document.body.style.overflow =  'visible';
window.confirm(key);
}

function SwitchTab(  number )
{
if (number == 1)
{
$find('ModalPopupExtender1').show();
$find('ModalPopupExtender2').hide();

document.body.style.overflow =  'visible';

//document.getElementById(number).style.display = 'none' ;
//document.getElementById('PhotoLayer').style.borderRight ='Black';
//document.getElementById('AlbumLayer').style.visibility ='visible';
//window.confirm('test');
//document.getElementById('AddPhotoLink').style.backgroundColor ='#CCCCCC';
//document.getElementById('AddPhotoLink').style.color ='Black';


//document.getElementById('PhotoLayer').style.visibility ='visible';
//document.getElementById('AlbumLayer').style.visibility = 'hidden' ;
//document.getElementById('ArrangeLayer').style.visibility = 'hidden' ;

             
//document.getElementById('AlbumTab').style.backgroundColor ='White';
//document.getElementById('AlbumTab').style.borderColor = 'Blue';
//document.getElementById('PhotoTab').style.backgroundColor ='Grey';




}
//border-right: #99ccff thin solid; border-top: #99ccff thin solid; z-index: 102;
//            left: 45px; border-left: #99ccff thin solid; width: 684px; border-bottom: #99ccff thin solid;
//            position: relative; top: -117px; height: 392px"

if (number == 9)
{
$find('ModalPopupExtender2').show();
$find('ModalPopupExtender1').hide();
document.body.style.overflow =  'visible';
}

if (number == 2)
{
//window.confirm('test');
//document.getElementById('PhotoLayer').style.visibility = 'hidden' ;
//document.getElementById('AlbumLayer').style.visibility = 'visible';
//document.getElementById('ArrangeLayer').style.visibility = 'hidden' ;


//document.body.style.overflow =  'visible';
//$find('ModalPopupExtender1').hide();
//$find('ModalPopupExtender3').show();
//document.getElementById('Panel4').style.visibility = 'hidden' ;
//document.getElementById('Panel5').style.visibility = 'hidden' ;
//document.getElementById('Panel6').style.visibility = 'hidden';




}

if ( number == 3)
{
//document.getElementById('PhotoLayer').style.visibility = 'hidden' ;
//document.getElementById('AlbumLayer').style.visibility = 'hidden' ;
//document.getElementById('ArrangeLayer').style.visibility = 'visible';
//window.confirm('test');
}



}

    function fireanimation()
    {
document.getElementById('LoadingPanel').style.visibility ='visible';
 $find('ModalPopupExtender10').show();
document.body.style.overflow =  'visible';
//$find('ModalPopupExtender10').hide();

    }
// ]]>

    </script>

    <link href="../themes/opera/tabs.css" rel="stylesheet" type="text/css" />
    <link href="../themes/BlueMenublockStyleSheet.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="../themes/detailgrid.css" rel="stylesheet" />
    <style type="text/css">
        TR.updated TD
        {
        	background-color:yellow;
        }
        .modalBackground 
        {
	        background-color:Gray;
	        filter:alpha(opacity=70);
	        opacity:0.7;
        }
 
        .updateProgress
        {
            border-width:1px; 
            border-style:solid; 
            background-color:#FFFFFF; 
            position:absolute; 
            width:130px; 
            height:50px;    
        }
        .updateProgressMessage
        {
            margin:3px; 
            font-family:Trebuchet MS; 
            font-size:small; 
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <%--<body style="position: absolute; ">--%>
    <UpperNavigationButtons:NavigationButtons ID="MainUpperNavigationButtons" runat="server">
    </UpperNavigationButtons:NavigationButtons>
    
    <form id="form1" runat="server">
        <div style="overflow: visible">
            &nbsp;
            <asp:AjaxScriptManager ID="ScriptManager2" runat="server">
            </asp:AjaxScriptManager>
             <asp:SqlDataSource ID="ProfessionalDetailProfileSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT DISTINCT ProID, FirstName, LastName, UserName, Address, Country, HomePhoneNumber, MobilePhoneNumber, Age, Gender, EmailAddress, Zipcode, Region FROM ProfessionalGeneral WHERE (ProID = @ProID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="ProID" SessionField="ProID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            <asp:SqlDataSource ID="ProfessionalDetailWorkSqlDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                SelectCommand="SELECT DISTINCT [ProID], [Shopaddress], [CountryCode], [Region], [City], [Zipcode], [PhoneNumber] FROM [ProfessionalOptional] WHERE ([ProID] = @ProID)">
                <SelectParameters>
                    <asp:SessionParameter Name="ProID" SessionField="ProId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
                
            <asp:SqlDataSource ID="ProfessionalPhotoSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                SelectCommand="SelectProfessionalPhoto" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="ProID" SessionField="ProID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            
                    <asp:SqlDataSource ID="ProfessionalWorkPhotoSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                SelectCommand="SelectProfessionalWorkPhoto" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="ProID" SessionField="ProID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SkillDataSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                SelectCommand="SELECT Skills.CategoryID, Skills.JobID, Skills.CategoryName, Skills.JobTitle, (SELECT ExperienceValue FROM Experience WHERE (ExperienceID = Skills.Experience)) AS Experience, (SELECT crewnumberValue FROM CrewNumber WHERE (Skills.Crew = crewnumberID)) AS Crew, (SELECT LicensedValue FROM Licensed WHERE (Skills.Licensed = LicensedID)) AS Licensed, (SELECT InsuredValue FROM Insured WHERE (Skills.Insured = InsuredID)) AS Insured, (SELECT RelocationValue FROM Relocation WHERE (Skills.Relocation = RelocationID)) AS Relocation, Skills.SkillID FROM ProfessionalSkill INNER JOIN Skills ON ProfessionalSkill.SkillID = Skills.SkillID WHERE (ProfessionalSkill.ProID = @ProID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="ProID" SessionField="ProID" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                    SelectCommand="SELECT SkillID, CategoryID, JobID, CategoryName, JobTitle, Experience, Crew, Licensed, Insured, Relocation FROM Skills WHERE (SkillID = @SkillID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="SkillID" SessionField="SKILLID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
            <asp:Panel ID="ProfessionalPanel" runat="server" Style="  display:none; position: relative; left: 185px; 
                top: 2123px; " Height="660px" Width="491px" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px">
                 <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                <asp:Panel ID="IndustyPanel" runat="server" Height="56px" Style="left: 3px; position: absolute;
                    top: 3px; z-index: 100;" Width="485px" BackColor="White">
                    <asp:Label ID="IndustryLabel" runat="server" Style="position: absolute" Text="Industry:"
                        Font-Bold="True" ForeColor="Maroon"></asp:Label>
                        
                   <asp:DropDownList ID="IndustryDropDownList" runat="server" Style="left: 183px; position: absolute;
                        top: 18px" Width="120px" 
                        DataSourceID="SqlDataSource20" 
                        DataTextField="CategoryName"
                        DataValueField="CategoryID" 
                        AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource20" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                        SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
                    <cc1:RoundedCornersExtender ID="IndustryRoundedCornersExtender2" runat="server" BorderColor="64, 0, 0"
                        Enabled="True" TargetControlID="IndustyPanel">
                    </cc1:RoundedCornersExtender>
                    
                   
        
                </asp:Panel>
                
               
                        <asp:Panel ID="SpecialtyPanel" runat="server" Height="308px" Style="left: 1px; position: absolute;
                            top: 75px" Width="487px" BorderColor="Maroon" BorderWidth="0px" Wrap="False"
                            BackColor="White" BackImageUrl="~/Images/whitebackground.bmp">
                            
                            <cc1:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" Enabled="True"
                                TargetControlID="SpecialtyPanel" BorderColor="64, 0, 0">
                            </cc1:RoundedCornersExtender>
                            <asp:Label ID="SpecialisationLabel" runat="server" Style="left: 4px; position: absolute;
                                top: 1px" Text="Specialisation:" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                            <asp:ListBox ID="SpecialtyListBox1" runat="server" Height="270px" Style="left: 6px;
                                position: absolute; top: 25px" Width="139px" DataSourceID="SqlDataSource21" DataTextField="JobTitle"
                                DataValueField="JobID" SelectionMode="Multiple" Font-Size="9pt"></asp:ListBox>
                            &nbsp;
                            <asp:ListBox ID="SpecialtyListBox3" runat="server" Height="270px" Style="left: 340px;
                                position: absolute; top: 25px" Width="139px" DataSourceID="SqlDataSource62" DataTextField="JobTitle"
                                DataValueField="JobID" SelectionMode="Multiple" Font-Size="9pt"></asp:ListBox>
                            &nbsp;
                            <asp:ListBox ID="SpecialtyListBox2" runat="server" Height="270px" Style="left: 173px;
                                position: absolute; top: 25px" Width="139px" DataSourceID="SqlDataSource61" DataTextField="JobTitle"
                                DataValueField="JobID" SelectionMode="Multiple" Font-Size="9pt"></asp:ListBox>
                            &nbsp;
                            <asp:SqlDataSource ID="SqlDataSource21" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                SelectCommand="SELECT JobID, JobTitle, JobCategory FROM Jobs WHERE (JobCategory = @JobCategory) AND (JobRank BETWEEN 1 AND 15)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="IndustryDropDownList" DefaultValue="1" Name="JobCategory"
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource62" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                SelectCommand="SELECT JobID, JobTitle, JobCategory FROM Jobs WHERE (JobCategory = @JobCategory) AND (JobID &gt;31)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="IndustryDropDownList" DefaultValue="1" Name="JobCategory"
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource61" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                SelectCommand="SELECT JobID, JobTitle, JobCategory FROM Jobs WHERE (JobCategory = @JobCategory) AND (JobID BETWEEN 16 AND 30)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="IndustryDropDownList" DefaultValue="1" Name="JobCategory"
                                        PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="IndustryDropDownList" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
        
               <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" TargetControlID="Panel1"
                PopupControlID="ProfessionalPanel" BackgroundCssClass="modalBackground"  >
            </cc1:ModalPopupExtender>
                <asp:Panel ID="requirementPanel" runat="server" Height="226px" Style="left: 3px;
                    position: absolute; top: 387px; z-index: 101;" Width="486px" BackColor="White">
                  
                    
                      <asp:Label ID="requirementLabel" runat="server" Style="position: absolute" Text="Requirement:"
                        Font-Bold="True" ForeColor="Maroon"></asp:Label>
                    &nbsp;
                    <cc1:RoundedCornersExtender ID="RoundedCornersExtender3" runat="server" BorderColor="64, 0, 0"
                        TargetControlID="requirementPanel">
                    </cc1:RoundedCornersExtender>
     
               
                   <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                    <ContentTemplate>
                    
                    <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource4" Width="121px" RepeatColumns="1">
                    <ItemTemplate>
                    
                    
                    
                    <asp:SqlDataSource ID="SqlDataSource30" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                        SelectCommand="SELECT RelocationID, RelocationValue, LCID FROM Relocation WHERE (LCID = @LCID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="LCID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource31" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                        SelectCommand="SELECT [ExperienceID], [ExperienceValue], [LCID] FROM [Experience] WHERE ([LCID] = @LCID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="LCID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource32" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                        SelectCommand="SELECT [crewnumberID], [crewnumberValue], [LCID] FROM [CrewNumber] WHERE ([LCID] = @LCID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="LCID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource28" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                        SelectCommand="SELECT [LicensedID], [LicensedValue], [LCID] FROM [Licensed] WHERE ([LCID] = @LCID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="LCID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource29" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                        SelectCommand="SELECT [InsuredID], [InsuredValue], [LCID] FROM [Insured] WHERE ([LCID] = @LCID)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="LCID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                        &nbsp;
                    <asp:Table ID="RequirementTable" runat="server" Style="position: absolute; left: 117px;
                        top: 33px;" Width="287px" CellPadding="4" CellSpacing="4" BorderColor="Gray"
                        BorderStyle="Inset" BorderWidth="2px">
                        <asp:TableRow ID="ExperienceTableRow" runat="server">
                            <asp:TableCell ID="TableCell7" runat="server" HorizontalAlign="Center">
                                <asp:Label ID="ExperienceLabel" runat="server" Text="Experience"></asp:Label></asp:TableCell>
                            <asp:TableCell ID="TableCell8" runat="server" HorizontalAlign="Center">
                                <asp:DropDownList ID="ExperienceDropDownList" runat="server" 
                                    DataSourceID="SqlDataSource31"
                                    DataTextField="ExperienceValue" 
                                    DataValueField="ExperienceID" 
                                    SelectedIndex='<%# Eval("Experience") %>'
                                    AutoPostBack="true">
                                </asp:DropDownList></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="CrewNumberTableRow" runat="server">
                            <asp:TableCell ID="TableCell9" runat="server" HorizontalAlign="Center">
                                <asp:Label ID="crewNumberLabel" runat="server" Text="Crew Number"></asp:Label></asp:TableCell>
                            <asp:TableCell ID="TableCell10" runat="server" HorizontalAlign="Center">
                                <asp:DropDownList ID="CrewNumberDropDownList" runat="server" 
                                DataSourceID="SqlDataSource32"
                                DataTextField="crewnumberValue" 
                                DataValueField="crewnumberID"
                                SelectedIndex='<%# Eval("Crew") %>'
                                AutoPostBack = "true">
                                </asp:DropDownList></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="LicensedTableRow" runat="server">
                            <asp:TableCell ID="TableCell1" runat="server" HorizontalAlign="Center">
                                <asp:Label ID="LicensedLabel" runat="server" Text="Licensed"></asp:Label></asp:TableCell>
                            <asp:TableCell ID="TableCell2" runat="server" HorizontalAlign="Center">
                                <asp:DropDownList ID="LicensedDropDownList" runat="server" 
                                    DataSourceID="SqlDataSource28"
                                    DataTextField="LicensedValue" 
                                    DataValueField="LicensedID" 
                                    SelectedIndex='<%# Eval("Licensed") %>'
                                    AutoPostBack="true" >
                                </asp:DropDownList></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="InsuredTableRow" runat="server">
                            <asp:TableCell ID="TableCell3" runat="server" HorizontalAlign="Center">
                                <asp:Label ID="InsuredLabel" runat="server" Text="Insured"></asp:Label></asp:TableCell>
                            <asp:TableCell ID="TableCell4" runat="server" HorizontalAlign="Center">
                                <asp:DropDownList ID="InsuredDropDownList" runat="server" 
                                    DataSourceID="SqlDataSource29"
                                    DataTextField="InsuredValue" 
                                    DataValueField="InsuredID"
                                    SelectedIndex='<%# Eval("Insured") %>'
                                    AutoPostBack="true">
                                </asp:DropDownList></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="RelocationTableRow" runat="server">
                            <asp:TableCell ID="TableCell5" runat="server" HorizontalAlign="Center">
                                <asp:Label ID="RelocationLabel" runat="server" Text="Relocation"></asp:Label></asp:TableCell>
                            <asp:TableCell ID="TableCell6" runat="server" HorizontalAlign="Center">
                                <asp:DropDownList ID="RelocationDropDownList" runat="server" 
                                    DataSourceID="SqlDataSource30"
                                    DataTextField="RelocationValue" 
                                    DataValueField="RelocationID"
                                    SelectedIndex='<%# Eval("Relocation") %>'
                                    AutoPostBack="true">
                                </asp:DropDownList>
                              </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                        &nbsp; &nbsp;&nbsp;
                    </ItemTemplate>
                    </asp:DataList>                    
                    </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    
                </asp:Panel>
                
               &nbsp; &nbsp; &nbsp;
               
                <asp:Button ID="DeleteSkillButton" runat="server" Text="Delete"  
               BorderColor="#400000" BorderStyle="Outset" BorderWidth="3px" Style="position: relative; top: 639px; left: 232px; z-index: 104;" />
               
               <asp:Button ID="SaveSkillButton" runat="server" Text="Save Skill"  
               BorderColor="#400000" BorderStyle="Outset" BorderWidth="3px" Style="position: relative; top: 639px; left: 239px; z-index: 104;" />
               
                 <asp:Button ID="CancelSkillButton" runat="server" Text="Cancel"  
               BorderColor="#400000" BorderStyle="Outset" BorderWidth="3px" Style="position: relative; top: 639px; left: 246px; z-index: 103;" />
            </asp:Panel>
            <div style="z-index: 110; left: 39px; width: 411px; position: absolute; top: 102px;
                height: 108px">
               
                
                <cc1:TabContainer ID="ProfileTabContainer" runat="server" ActiveTabIndex="3" Height="541px"
                    Width="910px" EnableTheming="True" BorderWidth="0px" CssClass="opera" BackColor="White">
                   
                    <cc1:TabPanel ID="EventTab" runat="server" HeaderText="Event">
                        <ContentTemplate>
                            <br />
                            <table style="width: 100%; height: 98%">
                                <tr>
                                    <td style="width: 53px; text-align: left">
                                        <strong><span style="color: #333399">
                                            <asp:Label ID="Label9" runat="server" Style="position: relative" Text="My Events" Width="129px"></asp:Label>
                                        </span></strong></td>
                                    <td style="width: 104px; text-align: left">
                                        <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="DarkSlateGray"
                                            Style="position: relative; left: 10px; top: 1px;" Text="My Status"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 53%; height: 2%; text-align: left; vertical-align: top;" colspan="1">
                          
                                    
                                        <asp:GridView ID="EventGrid" runat="server" AllowPaging="True" 
                                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Type" 
                                            DataSourceID="EventDataSource" ForeColor="#333333" GridLines="None" Style="position: relative;
                                            left: 0px; top: 17px; z-index: 100;" Width="424px"  >
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="EventSelectorCheckBox" runat="server" 
                                                            Style="position: relative" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="EventId" HeaderText="EventId" InsertVisible="False" 
                                                    ReadOnly="True" SortExpression="EventId" Visible="False">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Event Description" HeaderText="Event Description" 
                                                    SortExpression="Event Description">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:ButtonField CommandName="EventViewCommand" 
                                                    Text="&lt;B&gt;View&lt;/B&gt;" />
                                                <asp:TemplateField HeaderText="Type" SortExpression="Type" Visible="False">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Type") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" 
                                                    Visible="False" />
                                                    
                                            </Columns>
                 
                                            
                                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"  />
                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="EventDataSource" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>" 
                                            SelectCommand="SELECT Events.EventID, Events.EventDescription AS [Event Description], Events.DateEvent AS Date, ProfessionalEvent.Type FROM Events INNER JOIN ProfessionalEvent ON Events.EventID = ProfessionalEvent.EventID WHERE (ProfessionalEvent.ProID = CAST(@ProID AS int)) ORDER BY Date">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="ProID" SessionField="ProID" 
                                                    Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td colspan="1" style="width: 104px; height: 2px; text-align: left">
                                        Number of projects<br />
                                        Number of bids<br />
                                        Reputation:<br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 53px; height: 84px; vertical-align: bottom;">
                                    <asp:Panel ID ="EventPanel" runat="server" style="position:relative; left: 0px; top: 0px;" Width="397px">
                                    <asp:LinkButton ID="EventDeleteButton" runat="server" BackColor="Silver" 
                                            BorderColor="Maroon" BorderStyle="Ridge" Font-Size="8pt" ForeColor="Black" 
                                            style="position: relative; z-index: 100" Text=" Delete Events " CausesValidation="False"></asp:LinkButton>
                                        <asp:LinkButton ID="EventCheckAll" runat="server" BackColor="Silver" 
                                            BorderColor="Maroon" BorderStyle="Ridge" Font-Size="8pt" ForeColor="Black" 
                                            style="z-index: 101; left: 8px; position: relative; top: 0px" 
                                            Text=" Check All " CausesValidation="False"></asp:LinkButton>
                                        <asp:LinkButton ID="EventUncheckAll" runat="server" BackColor="Silver" 
                                            BorderColor="Maroon" BorderStyle="Ridge" Font-Size="8pt" ForeColor="Black" 
                                            style="z-index: 102; left: 18px; position: relative; top: 0px" 
                                            Text=" Uncheck All " CausesValidation="False"></asp:LinkButton>
                                         <br />
                                    </asp:Panel>
                                        
                                       
                                      
                                     
                                        <asp:Label ID="EventLabel" runat="server" 
                                            Style="position: relative; z-index: 106; left: -144px; top: 12px;" Text="Label" Width="81px"></asp:Label>
                                       
                                            </td>
                                    <td style="width: 104px; height: 84px">
                                    </td>
                                </tr>
                                
                            </table>
                        </ContentTemplate>
                    </cc1:TabPanel>
                 
                    
                    <cc1:TabPanel ID="TabPanel9" runat="server" HeaderText="TabPanel9">
                        <HeaderTemplate>
                            Profile
                        </HeaderTemplate>
                        <ContentTemplate>
     <table style="z-index: 101; left: 0px; width: 100%; position: static; height: 79%; top: 75px;"
                                id="Table2" >
                                <tr>
                                    <td style="width: 160px; background-color: #ffffff; height: 452px;" rowspan="2">
                                          <asp:FormView ID="FormView1" runat="server" DataKeyNames="PhotoID" DataSourceID="ProfessionalPhotoSqlDataSource"
                                            Style="position: relative; top: -38px; left: -2px;">
                                            <EditItemTemplate>
                                                PhotoID:
                                                <asp:Label ID="PhotoIDLabel1" runat="server" Text='<%# Eval("PhotoID") %>'></asp:Label><br />
                                                PhotoPath:
                                                <asp:TextBox ID="PhotoPathTextBox" runat="server" Text='<%# Bind("PhotoPath") %>'>
                                                </asp:TextBox><br />
                                                Caption:
                                                <asp:TextBox ID="CaptionTextBox" runat="server" Text='<%# Bind("Caption") %>'>
                                                </asp:TextBox><br />
                                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                                    Text="Update">
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                    Text="Cancel">
                                                </asp:LinkButton>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                PhotoPath:
                                                <asp:TextBox ID="PhotoPathTextBox" runat="server" Text='<%# Bind("PhotoPath") %>'>
                                                </asp:TextBox><br />
                                                Caption:
                                                <asp:TextBox ID="CaptionTextBox" runat="server" Text='<%# Bind("Caption") %>'>
                                                </asp:TextBox><br />
                                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                    Text="Insert">
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                    Text="Cancel">
                                                </asp:LinkButton>
                                            </InsertItemTemplate>
                                            <ItemTemplate> <asp:ImageButton ID="ProfessionalImageButton" runat="server" Height="308px"
                                            Style="z-index: 100; left: 60px; position:relative; top: 0px" Width="243px" CommandName="select" ImageUrl='<%# Eval("PhotoPath") %>' OnClick="ProfessionalImageButton_Click"   />
                                            </ItemTemplate>
                                        </asp:FormView>
                                       
                                        <asp:Panel ID="Panel2" runat="server" CssClass="BlueMenublock" Height="64px" Style="z-index: 101;
                                            left: 106px; position: relative; top: 18px" Width="121px" Font-Size="10pt">
                <ul> 
                 <li><a id="A3" href="#" onclick="SwitchTab(1)" style="font: smallcaption">Play SlideShow</a></li>
              <li><a id="editPhotoLink" href="EditPhoto.aspx"  style="font: smallcaption;">EditPhoto </a></li>
                    <li><a id="AddPhotoLink"  href="UploadProfessionalPhoto.aspx"  style="font: smallcaption"> Add Photo</a></li>
                    <li><a id="editAlbumLink" href="EditAlbum.aspx"  style="font: smallcaption"> Edit Album</a></li>
                    <li><a id ="ArrangePhotoLink" href="RearrangePhotos.aspx"  style="font: smallcaption;">Rearrange Images</a></li>
                        
                         
                </ul>


                                        </asp:Panel>
                                      
                                      
                                        </td>
                                    <td style="width: 100px; height: 452px;" rowspan="2"
                                        id="Td2">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="ProID"
                                                    DataSourceID="ProfessionalDetailProfileSqlDataSource" Height="336px" Style="left: 102px;
                                                    position: relative; top: 19px" Width="243px" BackColor="White" BorderColor="#336666"
                                                    BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal"
                                                    Font-Size="9pt">
                                                    <FooterStyle BackColor="White" ForeColor="#333333" />
                                                    <RowStyle BackColor="White" ForeColor="#333333" />
                                                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                                    <Fields>
                                                        <asp:BoundField DataField="ProID" HeaderText="Professional" ReadOnly="True" SortExpression="ProID" />
                                                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                                                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                                                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                                        <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                                                        <asp:BoundField DataField="Region" HeaderText="State/Region" SortExpression="Region" />
                                                        <asp:BoundField DataField="Zipcode" HeaderText="Zipcode" SortExpression="Zipcode" />
                                                        <asp:BoundField DataField="HomePhoneNumber" HeaderText="HomePhoneNumber" SortExpression="HomePhoneNumber" />
                                                        <asp:BoundField DataField="MobilePhoneNumber" HeaderText="MobilePhoneNumber" SortExpression="MobilePhoneNumber" />
                                                        <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                                                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                                        <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" SortExpression="EmailAddress" />
                                                        <asp:TemplateField ShowHeader="False">
                                                            <EditItemTemplate>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <%-- OnClientClick="SwitchTab(2)"--%>
                                                                <asp:LinkButton ID="EditProfileButton" runat="server" CausesValidation="False" ForeColor="#0000C0"
                                                                    OnClick="LinkButton1_Click" Text="Edit" PostBackUrl="EditProfile.aspx"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Fields>
                                                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                                    <EditRowStyle BackColor="#804040" Font-Bold="True" ForeColor="White" Font-Size="8pt" />
                                                </asp:DetailsView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                 
                                 
                                 
                                 
                                        <br />
                                        <asp:Panel ID="Panel6" runat="server" CssClass="BlueMenublock" Height="26px" Style="z-index: 101;
                                            left: 102px; position: relative; top: 50px" Width="121px" Font-Size="10pt">
                                            <ul>
                                                <li><a id="A9" href="#" onclick="ChangePSfunction()" style="font: smallcaption">Change
                                                    Password</a></li>
                                            </ul>
                                        </asp:Panel>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel5" runat="server" HeaderText="TabPanel5">
                        <HeaderTemplate>
                            Portfolio
                        </HeaderTemplate>
                        <ContentTemplate>
     <div id="Div" style="left: 0px; width: 100px; position: absolute; top: 10px;
            height: 100px">
         <br />
                            <asp:Label ID="AboutMeLabel" runat="server" Font-Bold="True" ForeColor="#400000"
                                Style="position: relative; top: 24px;" Text="About:"></asp:Label>
       
     
      
                            <asp:UpdatePanel ID="UpdatePanel10" runat="server" UpdateMode="Conditional">

                
                 <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="UpdatePortfolioLinkButton" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="CancelPortfolioLinkButton" EventName="Click" />
                   </Triggers>
                   
                     <ContentTemplate>
                        
                     </div>
                </ContentTemplate>    
            </asp:UpdatePanel>
                            <asp:DataList ID="DataList1" runat="server" DataKeyField="ProID" DataSourceID="SqlDataSource2"
                                Style="position: relative">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Style="left: 181px; position: relative;
                                        top: 0px" Text="Successful Portfolio update. The administrator approval decision will be available within 24 hours." Visible='<%# Eval("Modified") %>' Width="381px" ForeColor="Maroon"></asp:Label>
                                                               <asp:Panel ID="AboutPanel" runat="server" Height="157px" Style="left: 69px; position: relative;
                                top: 0px" Width="535px" Wrap="False">
                                <asp:TextBox ID="AboutTextBox" runat="server" Height="148px" Style="position: relative; left: 2px;"
                                    TextMode="MultiLine" Width="526px" MaxLength="1000" CausesValidation="True" Text='<%# Eval("About", "{0}") %>'></asp:TextBox></asp:Panel>
                            <br />
                            <br />
                            <asp:Label ID="SpecialNotesLabel" runat="server" Font-Bold="True" ForeColor="#400000"
                                Style="position: relative" Text="Special Notes:"></asp:Label>&nbsp;
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" InvalidChars="+-*/=)(*&^%$#@!~`\|\]}[{&quot;':;?/"
                                        TargetControlID="AboutTextBox" FilterMode="InvalidChars">
                                    </cc1:FilteredTextBoxExtender>
                                    <br />
                            <br />
                            <asp:Panel ID="SpecialNotesPanel" runat="server" Height="174px" Style="left: 69px;
                                position: relative" Width="533px">
                                <asp:TextBox ID="SpecialNotesTextBox" runat="server" Height="162px" Style="position: relative"
                                    TextMode="MultiLine" Width="526px" MaxLength="1000" Text='<%# Eval("SpecialNotes", "{0}") %>'></asp:TextBox></asp:Panel>
                            <cc1:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" BorderColor="Black"
                                Radius="12" TargetControlID="AboutPanel" Color="Black" Enabled="True">
                            </cc1:RoundedCornersExtender>
                           
                            <cc1:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" BorderColor="Black"
                                Radius="12" TargetControlID="SpecialNotesPanel"  Color="Black" Enabled="True" >
                            </cc1:RoundedCornersExtender> 
                                </ItemTemplate>
                            </asp:DataList>
                             <asp:LinkButton ID="UpdatePortfolioLinkButton" runat="server" Font-Bold="True" ForeColor="Maroon"
                                Style="left: 656px; position: relative" OnClick="UpdatePortfolioLinkButton_Click" CausesValidation="False">Update</asp:LinkButton>
                            <asp:LinkButton ID="CancelPortfolioLinkButton" runat="server" Font-Bold="True" ForeColor="Maroon"
                                Style="left: 689px; position: relative" CausesValidation="False">Cancel</asp:LinkButton>
                            <br />
                            <br />

                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                SelectCommand="SELECT [ProID], [About], [SpecialNotes], [Modified] FROM [ProfessionalPortfolio] WHERE ([ProID] = @ProID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="ProID" SessionField="ProID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                        
                        
                        
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel10" runat="server" HeaderText="TabPanel10">
                        <HeaderTemplate>
                            Skills
                        </HeaderTemplate>
                        <ContentTemplate>                           
                         <asp:Panel ID="PanelAddSkill" runat="server" CssClass="BlueMenublock" Height="10px" Style="z-index: 101;
                                            left: 761px; position: relative; top:100px" Width="100px" Font-Size="10pt">
                                            <ul>
                                                <li>
                                                    <asp:LinkButton ID="LinkButton4" runat="server" Font-Bold="True" Font-Size="Small" Width="76px" OnClick="LinkButton4_Click" >Add Skill</asp:LinkButton>
                                                </li>
                                            </ul>
                             </asp:Panel>
                            <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                             
                            <asp:DataList ID="DataList2" runat="server" DataSourceID="SkillDataSqlDataSource"
                                RepeatColumns="2" Style="position: relative; top: 0px;" CellSpacing="5" Height="515px" Width="818px" DataKeyField="SkillID">
                                <ItemTemplate>
                                    <asp:Panel ID="Panel5" runat="server" Width="327px" Height="155px">
                                    
                                        <table style="width: 100%; position: relative; height: 70%; top:0px; left: 0px;">
                                            <tr>
                                                <td colspan="3" style="background-color: #003366">
                                                 <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Eval("JobTitle") %>' Font-Bold="True" ForeColor="White" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px">
                                                </td>
                                                <td style="width: 100px">  
                                                <asp:Label ID="CategoryLabel" runat="server" Text="Industry"></asp:Label>
                                                </td>
                                                <td style="width: 100px">
                                                <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px">
                                                </td>
                                                <td style="width: 100px">
                                                <asp:Label ID="ExperienceLabe" runat="server" Text="Experience"></asp:Label>
                                                </td>
                                                <td style="width: 100px">
                                                <asp:Label ID="ExperienceLabel" runat="server" Text='<%# Eval("Experience") %>'></asp:Label>    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px">
                                                </td>
                                                <td style="width: 100px">
                                                <asp:Label ID="CrewNumberlabel" runat="server" Text="Crew Number"></asp:Label>
                                                </td>
                                                <td style="width: 100px">
                                                <asp:Label ID="CrewLabel" runat="server" Text='<%# Eval("Crew") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px">
                                                </td>
                                                <td style="width: 100px"><asp:Label ID="LicensedLabe" runat="server" Text="Licensed"> </asp:Label>
                                                </td>
                                                <td style="width: 100px"><asp:Label ID="LicensedLabel" runat="server" Text='<%# Eval("Licensed") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px">
                                                </td>
                                                <td style="width: 100px"><asp:Label ID="InsuredLabe" runat="server" Text="Insured"> </asp:Label>
                                                </td>
                                                <td style="width: 100px"><asp:Label ID="InsuredLabel" runat="server" Text='<%# Eval("Insured") %>'> </asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px">
                                                </td>
                                                <td style="width: 100px"><asp:Label ID="RelocationLabe" runat="server" Text="Relocation"></asp:Label>
                                                </td>
                                                <td style="width: 100px"><asp:Label ID="RelocationLabel" runat="server" Text='<%# Eval("Relocation") %>'></asp:Label>
                                                </td>
                                            </tr>
                                           
                                        </table>
                                        <asp:LinkButton ID="EditLinkButton" runat="server" Font-Bold="True" ForeColor="#000040"
                                            Style="left: 287px; position: relative; top: -19px" Width="31px" CommandName="select">Edit</asp:LinkButton></asp:Panel>
                                    <cc1:RoundedCornersExtender ID="RoundedCornersExtender3" runat="server" TargetControlID="Panel5" BorderColor="Gray" Radius="10" Color="Silver">
                                    </cc1:RoundedCornersExtender>
                                   
                                </ItemTemplate>
                            </asp:DataList>

                                &nbsp; &nbsp;
                         </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DeleteSkillButton" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="SaveSkillButton" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="CancelSkillButton" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel11" runat="server" HeaderText="TabPanel11">
                        <HeaderTemplate>
                            WorkShop Profile
                        </HeaderTemplate>
                        <ContentTemplate>
     <table style="z-index: 101; left: 0px; width: 100%; position: static; height: 79%; top: 75px;"
                                id="Table3" >
                                <tr>
                                    <td style="width: 160px; background-color: #ffffff; height: 452px;" rowspan="2">
                                          <asp:FormView ID="FormView2" runat="server" DataKeyNames="PhotoID" DataSourceID="ProfessionalWorkPhotoSqlDataSource"
                                            Style="position: relative; top: -7px; left: 4px;">
                                            <EditItemTemplate>
                                                PhotoID:
                                                <asp:Label ID="PhotoIDLabel2" runat="server" Text='<%# Eval("PhotoID") %>'></asp:Label><br />
                                                PhotoPath:
                                                <asp:TextBox ID="PhotoPathTextBox1" runat="server" Text='<%# Bind("PhotoPath") %>'>
                                                </asp:TextBox><br />
                                                Caption:
                                                <asp:TextBox ID="CaptionTextBox1" runat="server" Text='<%# Bind("Caption") %>'>
                                                </asp:TextBox><br />
                                                <asp:LinkButton ID="UpdateButton1" runat="server" CausesValidation="True" CommandName="Update"
                                                    Text="Update">
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="UpdateCancelButton1" runat="server" CausesValidation="False" CommandName="Cancel"
                                                    Text="Cancel">
                                                </asp:LinkButton>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                PhotoPath:
                                                <asp:TextBox ID="PhotoPathTextBox1" runat="server" Text='<%# Bind("PhotoPath") %>'>
                                                </asp:TextBox><br />
                                                Caption:
                                                <asp:TextBox ID="CaptionTextBox1" runat="server" Text='<%# Bind("Caption") %>'>
                                                </asp:TextBox><br />
                                                <asp:LinkButton ID="InsertButton1" runat="server" CausesValidation="True" CommandName="Insert"
                                                    Text="Insert">
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="InsertCancelButton1" runat="server" CausesValidation="False" CommandName="Cancel"
                                                    Text="Cancel">
                                                </asp:LinkButton>
                                            </InsertItemTemplate>
                                            <ItemTemplate> <asp:ImageButton ID="ProfessionalWorkImageButton" runat="server" Height="308px"
                                            Style="z-index: 100; left: 60px; position:relative; top: 0px" Width="243px" CommandName="select" ImageUrl='<%# Eval("PhotoPath") %>' OnClick="ProfessionalWorkImageButton_Click"   />
                                            </ItemTemplate>
                                        </asp:FormView>
                                       
                                        <asp:Panel ID="Panel21" runat="server" CssClass="BlueMenublock" Height="64px" Style="z-index: 101;
                                            left: 106px; position: relative; top: 24px" Width="121px" Font-Size="10pt">
                                           <ul>
                                                <li><a id="A11" href="#" onclick="SwitchTab(9)" style="font: smallcaption">Play SlideShow</a></li>
                                                <li><a id="A2" style="font: smallcaption" href="EditWorkPhoto.aspx">Edit Photo</a></li>
                                                <li><a id="A5" href="UploadProfessionalWorkPhoto.aspx" style="font: smallcaption">Add Photo</a></li>
                                                <li><a id="A6" href="EditWorkAlbum.aspx" style="font: smallcaption">Edit Album</a></li>
                                                <li><a href="RearrangeWorkPhotos.aspx" style="font: smallcaption;">Reorder Photo</a></li>
                                            </ul>
                                        </asp:Panel>
                                      
                                      
                                        </td>
                                    <td style="width: 100px; height: 452px;" rowspan="2"
                                        id="Td1">
                                        <asp:UpdatePanel ID="UpdatePanel20" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:DetailsView ID="DetailsView22" runat="server" AutoGenerateRows="False" DataKeyNames="ProID"
                                                    DataSourceID="ProfessionalDetailWorkSqlDatasource" Height="336px" Style="left: 107px;
                                                    position: relative; top: 26px" Width="243px" BackColor="White" BorderColor="#336666"
                                                    BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal"
                                                    Font-Size="9pt">
                                                    <FooterStyle BackColor="White" ForeColor="#333333" />
                                                    <RowStyle BackColor="White" ForeColor="#333333" />
                                                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                                    <Fields>



                                                        <asp:BoundField DataField="ShopAddress" HeaderText="Address"
 SortExpression="Address" />                 
                                                        <asp:BoundField DataField="Countrycode" HeaderText="Country"
 SortExpression="Countrycode" />               
                                                        <asp:BoundField DataField="Region" HeaderText="State/Region" SortExpression="Region" />

                                                        <asp:BoundField DataField="City" HeaderText="City"
 SortExpression="City" />  

                                                        <asp:BoundField DataField="Zipcode" HeaderText="Zipcode" SortExpression="Zipcode" />

                                                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber" />
    
                                                        <asp:TemplateField ShowHeader="False">
                                                            <EditItemTemplate>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <%-- OnClientClick="SwitchTab(2)"--%>
                                                                <asp:LinkButton ID="EditProfileButton1" runat="server" CausesValidation="False" ForeColor="#0000C0"
                                                                    OnClick="LinkButton5_Click" Text="Edit" PostBackUrl="EditWorkShopProfile.aspx"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Fields>
                                                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                                    <EditRowStyle BackColor="#804040" Font-Bold="True" ForeColor="White" Font-Size="8pt" />
                                                    <EmptyDataTemplate>
                                                        <asp:Label ID="Emptylabel" runat="server" Style="position: relative" Text="No data found"></asp:Label>&nbsp;<br />
                                                        <br />
                                                        <strong></strong>
                                                        <asp:LinkButton ID="LinkButton3" runat="server" Font-Bold="False" ForeColor="#000040"
                                                            Style="position: relative" PostBackUrl="EditWorkShopProfile.aspx">Edit</asp:LinkButton>
                                                    </EmptyDataTemplate>
                                                </asp:DetailsView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                 
                                 
                                 
                                 
                                        <br />
                                        
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel12" runat="server" HeaderText="TabPanel12">
                        <HeaderTemplate>
                            Promotion
                        </HeaderTemplate>
                    </cc1:TabPanel>
                    
                    <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                        <ContentTemplate>
                            <table style="width: 100%; position: relative; height: 100%; left: 0px; top: 0px;">
                                <tr>
                                    <td rowspan="2" style="width: 95px; background-color:gainsboro ; vertical-align: top; text-align: center;">
                                        
                                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                        <ContentTemplate>
                                     
            
                                            <table style="position: relative; left: 0px; top: 0px;">
                                                <tr>
                                                    <td style="">                             
                                                    <asp:LinkButton ID="InboxLinkButton" runat="server" Font-Bold="True" ForeColor="Black"
                                                        Style="position: relative;" CausesValidation="False">Inbox</asp:LinkButton>
                                                        <br /><br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style=""> 
                                                    <asp:LinkButton ID="OutboxLinkButton" runat="server" Font-Bold="True" ForeColor="Black"
                                                        Style="position: relative; " CausesValidation="False">Outbox</asp:LinkButton>
                                                        <br /><br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style=""><asp:LinkButton ID="SavedLinkButton" runat="server" Font-Bold="True" ForeColor="Black"
                                                        Style="position: relative; " CausesValidation="False">Saved</asp:LinkButton>
                                                        <br /><br />
                                                    </td>
                                                </tr>
                                            </table>
                                      
                                                   
                                              
                                                    
                                        </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="SelectedIndexChanged" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                                   
                                  
                                    </td>
                                    <td style="width: 100px; height: 202px; background-color: lightslategray;" valign="top">
                                        <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>   
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                                            AutoGenerateColumns="False" DataKeyNames="MessageID" DataSourceID="ProfessionalInboxSqlDataSource"
                                            ForeColor="Black" Style="position: relative; left: 1px;" GridLines="None" BackColor="LemonChiffon" BorderColor="Tan" BorderWidth="1px" CellPadding="2" Width="705px" OnRowDataBound="GridView1_RowDataBound" OnPreRender="GridView1_PreRender">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="MessageSelectorCheckBox" runat="server" Style="position: relative" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="MessageID" HeaderText="Message #" ReadOnly="True" SortExpression="MessageID">
                                                    <ControlStyle ForeColor="Black" />
                                                    <HeaderStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="SenderName" HeaderText="SenderName" SortExpression="SenderName">
                                                    <HeaderStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date">
                                                    <HeaderStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                                    <HeaderStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:BoundField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="ViewLinkButton" runat="server" CausesValidation="False" CommandName="Select"
                                                            ForeColor="#0000C0" Text="<b>View</b> " ></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle ForeColor="Black" />
                                                </asp:TemplateField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                                            ForeColor="Maroon" Text="<b>Delete</b>" CommandArgument='<%# Eval("MessageID") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle VerticalAlign="Middle" BackColor="Tan" Font-Bold="True" />
                                            <FooterStyle BackColor="Tan" />
                                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="Lavender" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="LemonChiffon" ForeColor="Black" BorderColor="BurlyWood" BorderWidth="1px" />
                                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                            <EmptyDataTemplate>
                                                <asp:Label ID="Label7" runat="server" Style="position: relative" Text="No Data Available"></asp:Label>
                                            </EmptyDataTemplate>
                                            <RowStyle Font-Bold="False" />
                                        </asp:GridView> 
                                        </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="InboxLinkButton" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="OutboxLinkButton" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="SavedLinkButton" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <br />
                                        <asp:SqlDataSource ID="ProfessionalInboxSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                            InsertCommand="INSERT INTO [ProfessionalMessageInbox] ([MessageID], [SenderName], [Date], [Title]) VALUES (@MessageID, @SenderName, @Date, @Title)"
                                            SelectCommand="SELECT MessageID, SenderName, Date, Title, Checked FROM ProfessionalMessageInbox WHERE (ProID = @ProID) ORDER BY Checked, Date">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="ProID" SessionField="ProID" Type="Int32" />
                                            </SelectParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="MessageID" Type="Int32" />
                                                <asp:Parameter Name="SenderName" Type="String" />
                                                <asp:Parameter DbType="Date" Name="Date" />
                                                <asp:Parameter Name="Title" Type="String" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="ProfessionalOutboxSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                            DeleteCommand="DELETE FROM [ProfessionalMessageOutbox] WHERE [MessageID] = @MessageID"
                                            InsertCommand="INSERT INTO [ProfessionalMessageOutbox] ([MessageID], [SenderName], [Date], [Title]) VALUES (@MessageID, @SenderName, @Date, @Title)"
                                            SelectCommand="SELECT [MessageID], [SenderName], [Date], [Title] FROM [ProfessionalMessageOutbox] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date], [MessageID]"
                                            UpdateCommand="UPDATE [ProfessionalMessageOutbox] SET [SenderName] = @SenderName, [Date] = @Date, [Title] = @Title WHERE [MessageID] = @MessageID">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="ProID" SessionField="ProID" Type="Int32" />
                                            </SelectParameters>
                                            <DeleteParameters>
                                                <asp:Parameter Name="MessageID" Type="Int32" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="SenderName" Type="String" />
                                                <asp:Parameter DbType="Date" Name="Date" />
                                                <asp:Parameter Name="Title" Type="String" />
                                                <asp:Parameter Name="MessageID" Type="Int32" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="MessageID" Type="Int32" />
                                                <asp:Parameter Name="SenderName" Type="String" />
                                                <asp:Parameter DbType="Date" Name="Date" />
                                                <asp:Parameter Name="Title" Type="String" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                        &nbsp;
                                        <asp:Panel runat="server" ID="MessageNavigationPanel" Height="20px" style="position:relative; left: 1px; top: 20px; vertical-align: bottom;" Width="434px"> 
                                        <asp:Button ID="SelectAllButton" runat="server" Style="position: relative" Text="Select All" CausesValidation="False" BackColor="White" BorderColor="#FF8000" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="#400000" />&nbsp;
                                        &nbsp;<asp:Button ID="DeselectAllButton" runat="server" Style="position: relative; left: 8px; top: 0px;" Text="Deselect All" CausesValidation="False" BackColor="White" BorderColor="#FF8000" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="#400000" />&nbsp;&nbsp; &nbsp;
                                        <asp:Button ID="DeleteButton" runat="server" Style="position: relative" Text="Delete" CausesValidation="False" BackColor="White" BorderColor="#FF8000" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="#400000" />
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</asp:Panel>
                                        
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; height: 267px; border-top: navy thick solid; background-color: #f7f7de;">
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                                                            
                                        <asp:DetailsView ID="DetailsView1" runat="server"
                                            Height="250px" Style="position: relative; top: 0px; left: -1px;" Width="567px" AutoGenerateRows="False" DataSourceID="ProfessionalDetailInobxMessageSqlDataSource" BackColor="#F7F7DE" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" >
                                            <Fields>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label8" runat="server" Style="position: relative" Text="Description" Font-Bold="True" ForeColor="Black"></asp:Label><br />
                                                        <asp:TextBox ID="TextBox2" runat="server" Height="160px" Style="position: relative;
                                                            top: 0px" Width="700px" Text='<%# Bind("Description", "{0}") %>' ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp;
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Fields>
                                            <FooterStyle BackColor="#CCCC99" />
                                            <RowStyle BackColor="#F7F7DE" />
                                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                            <AlternatingRowStyle BackColor="#F7F7DE" />
                                        </asp:DetailsView>
                                        &nbsp;&nbsp;
                                            <asp:LinkButton ID="ReplyLinkButton" runat="server" CausesValidation="False" Font-Bold="True"
                                                ForeColor="#400000" Style="position: relative" Visible="False" >Reply</asp:LinkButton>
                                            &nbsp;
                                            <asp:LinkButton ID="SaveLinkButton" runat="server" CausesValidation="False" Font-Bold="True"
                                                ForeColor="#400000" OnClick="SaveLinkButton_Click" Style="position: relative" Visible="False" OnClientClick="fireanimation();">Save</asp:LinkButton>
                                       <asp:SqlDataSource ID="ProfessionalDetailInobxMessageSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>" SelectCommand="SELECT  [Description] FROM [ProfessionalMessageInbox] WHERE (([ProID] = @ProID) AND ([MessageID] = @MessageID))">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="ProID" SessionField="ProID" Type="Int32" />
                                                <asp:ControlParameter ControlID="GridView1" Name="MessageID" PropertyName="SelectedValue"
                                                    Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>  
                                        </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="SelectedIndexChanged" />
                                            </Triggers>
                                      </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <HeaderTemplate>
                            Message
                        </HeaderTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                        <ContentTemplate>
                            <table style="width: 100%; position: relative; height: 100%">
                                <tr>
                                    <td style="width: 100px">
                                    </td>
                                    <td style="width: 100px">
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                    </td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                    </td>
                                    <td style="width: 100px">
                                        <div style="z-index: 101; left: -256px; width: 100px; position: relative; top: -125px;
                                            height: 100px">
                                            Bids Different from Customer and Professional<br />
                                            Bids for Customer :</div>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <asp:SqlDataSource ID="ProfessionalBidDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                SelectCommand="SELECT [NumberofBids], [ProjectID], [HighestBidderID], [HighestBidderName], [HistoryBidID], [HighestBidDate] FROM [ProfessionalBid] WHERE ([ProID] = @ProID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="ProID" SessionField="ProID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                        <HeaderTemplate>
                            Project
                        </HeaderTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                        <HeaderTemplate>
                            Bids
                        </HeaderTemplate>
                        <ContentTemplate><table style="width: 100%; position: relative; height: 100%">
                            <tr>
                                <td style="width: 166px">
                                </td>
                                <td style="width: 100px">
                                    Favourite Professional:
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 166px">
                                </td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 166px">
                                </td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                            <div style="z-index: 101; left: -136px; width: 100px; position: relative; top: 20px;
                                height: 100px">
                                For customer:<br />
                                Favourtite Professional<br />
                                For professional<br />
                                Favoutire Customer<br />
                                Favourite Projects</div>
                            <br />
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4">
                        <HeaderTemplate>
                            Favourite
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table style="width: 100%; position: relative; height: 100%">
                                <tr>
                                    <td style="width: 166px">
                                    </td>
                                    <td style="width: 100px">
                                        Favourite Professional:
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 166px">
                                    </td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 166px">
                                    </td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                            </table>
                            <div style="z-index: 101; left: -136px; width: 100px; position: relative; top: 20px;
                                height: 100px">
                                For customer:<br />
                                Favourtite Professional<br />
                                For professional<br />
                                Favoutire Customer<br />
                                Favourite Projects</div>
                            <br />
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel6" runat="server" HeaderText="TabPanel6" BackColor="AliceBlue"
                        BorderColor="Black" BorderStyle="Double" BorderWidth="10px" CssClass="StyleSheet.css">
                        <HeaderTemplate>
                            QuikWatch
                        </HeaderTemplate>
                        <ContentTemplate>
                        
                            
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel7" runat="server" HeaderText="TabPanel7">
                        <HeaderTemplate>
                            Transaction
                        </HeaderTemplate>
                        <ContentTemplate>
                            <span style="color: background"><span style="color: maroon; border-left-color: blue;
                                border-bottom-color: blue; border-top-style: dashed; border-top-color: blue;
                                border-right-style: dashed; border-left-style: dashed; border-right-color: blue;
                                border-bottom-style: dashed;">xcvcxv </span></span>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="TabPanel8" runat="server" HeaderText="TabPanel8">
                        <HeaderTemplate>
                            Account
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table style="width: 100%; position: relative; height: 100%">
                                <tr>
                                    <td colspan="2" rowspan="3" style="vertical-align: top; text-align: left">
                                        <br />
                                        <asp:Label ID="Label111" runat="server" Font-Bold="True" ForeColor="Navy" Style="left: 289px;
                                            position: relative; top: -1px" Text="Managing Your Account" Width="173px"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" Font-Bold="True"
                                            ForeColor="#400000" Style="left: -2px; position: relative; top: 9px">Delete Account</asp:LinkButton>
                                        <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Are you sure you want to delete your account>"
                                            TargetControlID="LinkButton1" Enabled="True" >
                                        </cc1:ConfirmButtonExtender>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="#400000" Style="left: -7px;
                                            position: relative; top: 18px" Text="Contact Customer Service" Width="188px"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label2" runat="server" Style="left: -2px; position: relative; top: 8px"
                                            Text="We are very pleased to answer any question that you might have. Please call us at 1800.SideJob"
                                            Width="641px"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" ForeColor="Navy" Style="left: 299px;
                                            position: relative; top: 28px" Text="Please Chose a category"></asp:Label>
                                        <asp:DropDownList ID="DropDownList1" runat="server" Style="left: 311px; position: relative;
                                            top: 30px">
  <asp:ListItem Value="1"></asp:ListItem>
                                            <asp:ListItem Value="2"></asp:ListItem>
                                             <asp:ListItem Value="3"></asp:ListItem>
                                             <asp:ListItem Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="#400000" Style="left: 2px;
                                            position: relative; top: -12px" Text="Email Customer Service" Width="194px"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="TextBox3" runat="server" Height="184px" Style="left: 2px; position: relative;
                                            top: 7px" Width="655px"></asp:TextBox>
                                        <br />
                                        <br />
                                        <asp:Button ID="Button1" runat="server" Style="left: 552px; position: relative; top: 9px"
                                            Text="Send Message" Width="111px" />
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td colspan="2" rowspan="1" style="vertical-align: top">
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ContentTemplate>
                    </cc1:TabPanel>
                    
                </cc1:TabContainer>
                &nbsp;
                
                <asp:Panel ID="ChangePasswordPanel" runat="server" Style="z-index: 112; left: 199px;
                    position: absolute; top: 921px; display: none; background-color: silver;" Width="360px"
                    BorderColor="Navy" BorderWidth="2px">
                    <cc1:ModalPopupExtender ID="ModalPopupExtender5" runat="server" TargetControlID="TargetedControlLabel"
                        PopupControlID="ChangePasswordPanel" X="350" Y="250" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                    <asp:ChangePassword ID="ChangePassword3" runat="server">
                        <SuccessTemplate>
                            <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse; width: 355px;">
                                <tr>
                                    <td style="height: 105px">
                                        <table border="0" cellpadding="0">
                                            <tr>
                                                <td align="center" colspan="2" style="height: 19px; text-align: center">
                                                    <span style="color: #990000"><strong>
                                                    Change Password Complete</strong></span></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 369px; height: 38px; text-align: center">
                                                    Your password has been changed!</td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <br />
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                                    <asp:Button ID="ContinuePushButton" runat="server" CausesValidation="False" CommandName="Continue"
                                                        Text="Continue" style="z-index: 100; left: 262px; position: absolute; top: 80px" />
                                    </td>
                                </tr>
                            </table>
                        </SuccessTemplate>
                        <ChangePasswordTemplate>
                            <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse">
                                <tr>
                                    <td style="height: 266px">
                                        <table border="0" cellpadding="0">
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <span style="color: #660000"><strong>Change Your Password<br />
                                                        <br />
                                                    </strong></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Password:</asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword"
                                                        ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ChangePassword3">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
                                                        ErrorMessage="New Password is required." ToolTip="New Password is required."
                                                        ValidationGroup="ChangePassword3">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
                                                        ErrorMessage="Confirm New Password is required." ToolTip="Confirm New Password is required."
                                                        ValidationGroup="ChangePassword3">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
                                                        ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry."
                                                        ValidationGroup="ChangePassword3"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color: red">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="height: 24px">
                                                    <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword"
                                                        OnClick="ChangePasswordPushButton_Click" Text="Change Password" ValidationGroup="ChangePassword3" />
                                                </td>
                                                <td style="height: 24px">
                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                    <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                        Text="Cancel"  />
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </ChangePasswordTemplate>
                    </asp:ChangePassword>
                   
                </asp:Panel>
                &nbsp; &nbsp;
          
               
            </div>     
            
              <asp:Panel ID="Panel4" runat="server" Style="left: 189px; display: none; position: relative;
                top: 567px; background-color: tan; z-index: 100;" Height="374px" Width="485px" BorderColor="Black"
                BorderStyle="Solid" BorderWidth="3px">
                <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="Panel4"
                    TargetControlID="TargetedControlLabel" DropShadow="false" BackgroundCssClass="modalBackground"
                    X="300" Y="150" RepositionMode="RepositionOnWindowResizeAndScroll" CancelControlID="ExitButton">
                </cc1:ModalPopupExtender>
                &nbsp;
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>" DeleteCommand="DELETE FROM [ProfessionalWorkPhoto] WHERE [PhotoID] = @original_PhotoID AND [PhotoPath] = @original_PhotoPath AND [Caption] = @original_Caption AND [AlbumID] = @original_AlbumID AND [ProID] = @original_ProID AND [PhotoRank] = @original_PhotoRank"
                    InsertCommand="INSERT INTO [ProfessionalWorkPhoto] ([PhotoPath], [Caption], [AlbumID], [ProID], [PhotoRank]) VALUES (@PhotoPath, @Caption, @AlbumID, @ProID, @PhotoRank)"
                    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [PhotoID], [PhotoPath], [Caption], [AlbumID], [ProID], [PhotoRank] FROM [ProfessionalWorkPhoto] WHERE ([ProID] = @ProID) ORDER BY [PhotoRank], [Caption]"
                    UpdateCommand="UPDATE [ProfessionalWorkPhoto] SET [PhotoPath] = @PhotoPath, [Caption] = @Caption, [AlbumID] = @AlbumID, [ProID] = @ProID, [PhotoRank] = @PhotoRank WHERE [PhotoID] = @original_PhotoID AND [PhotoPath] = @original_PhotoPath AND [Caption] = @original_Caption AND [AlbumID] = @original_AlbumID AND [ProID] = @original_ProID AND [PhotoRank] = @original_PhotoRank">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="ProID" SessionField="ProID"
                            Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_PhotoID" Type="Int32" />
                        <asp:Parameter Name="original_PhotoPath" Type="String" />
                        <asp:Parameter Name="original_Caption" Type="String" />
                        <asp:Parameter Name="original_AlbumID" Type="Int32" />
                        <asp:Parameter Name="original_ProID" Type="Int32" />
                        <asp:Parameter Name="original_PhotoRank" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="PhotoPath" Type="String" />
                        <asp:Parameter Name="Caption" Type="String" />
                        <asp:Parameter Name="AlbumID" Type="Int32" />
                        <asp:Parameter Name="ProID" Type="Int32" />
                        <asp:Parameter Name="PhotoRank" Type="Int32" />
                        <asp:Parameter Name="original_PhotoID" Type="Int32" />
                        <asp:Parameter Name="original_PhotoPath" Type="String" />
                        <asp:Parameter Name="original_Caption" Type="String" />
                        <asp:Parameter Name="original_AlbumID" Type="Int32" />
                        <asp:Parameter Name="original_ProID" Type="Int32" />
                        <asp:Parameter Name="original_PhotoRank" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="PhotoPath" Type="String" />
                        <asp:Parameter Name="Caption" Type="String" />
                        <asp:Parameter Name="AlbumID" Type="Int32" />
                        <asp:Parameter Name="ProID" Type="Int32" />
                        <asp:Parameter Name="PhotoRank" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
                &nbsp;
                <asp:Image ID="Image2" runat="server" Height="243px" Style="left: 60px; position: absolute;
                    top: 44px" Width="364px" />
                <br />
                <asp:Button ID="PreviousButton2" runat="server" Style="left: 91px; position: absolute;
                    top: 299px" Text="Previous" Width="70px" />
                &nbsp;
                <asp:Button ID="PlayButton2" runat="server" Style="left: 206px; position: absolute;
                    top: 299px" Text="Play" Width="74px" />
                &nbsp;
                <asp:Button ID="NextButton2" runat="server" Style="left: 326px; position: absolute;
                    top: 299px" Text="Next" Width="76px" />
                <asp:Button ID="Exit2" runat="server" Style="left: 426px; position: absolute;
                    top: 338px" Text="Exit" Width="45px" />
                <br />
            </asp:Panel>
               
            <asp:Panel ID="Panel3" runat="server" Style="left: 189px; display: none; position: relative;
                top: 664px; background-color: tan; z-index: 100;" Height="374px" Width="485px" BorderColor="Black"
                BorderStyle="Solid" BorderWidth="3px">
                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel3"
                    TargetControlID="TargetedControlLabel" DropShadow="false" BackgroundCssClass="modalBackground"
                    X="300" Y="150" RepositionMode="RepositionOnWindowResizeAndScroll" CancelControlID="ExitButton">
                </cc1:ModalPopupExtender>
                &nbsp;
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>" DeleteCommand="DELETE FROM [ProfessionalPhoto] WHERE [PhotoID] = @original_PhotoID AND [PhotoPath] = @original_PhotoPath AND [Caption] = @original_Caption AND [AlbumID] = @original_AlbumID AND [ProID] = @original_ProID AND [PhotoRank] = @original_PhotoRank"
                    InsertCommand="INSERT INTO [ProfessionalPhoto] ([PhotoPath], [Caption], [AlbumID], [ProID], [PhotoRank]) VALUES (@PhotoPath, @Caption, @AlbumID, @ProID, @PhotoRank)"
                    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [PhotoID], [PhotoPath], [Caption], [AlbumID], [ProID], [PhotoRank] FROM [ProfessionalPhoto] WHERE ([ProID] = @ProID) ORDER BY [PhotoRank], [Caption]"
                    UpdateCommand="UPDATE [ProfessionalPhoto] SET [PhotoPath] = @PhotoPath, [Caption] = @Caption, [AlbumID] = @AlbumID, [ProID] = @ProID, [PhotoRank] = @PhotoRank WHERE [PhotoID] = @original_PhotoID AND [PhotoPath] = @original_PhotoPath AND [Caption] = @original_Caption AND [AlbumID] = @original_AlbumID AND [ProID] = @original_ProID AND [PhotoRank] = @original_PhotoRank">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="ProID" SessionField="ProID"
                            Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_PhotoID" Type="Int32" />
                        <asp:Parameter Name="original_PhotoPath" Type="String" />
                        <asp:Parameter Name="original_Caption" Type="String" />
                        <asp:Parameter Name="original_AlbumID" Type="Int32" />
                        <asp:Parameter Name="original_ProID" Type="Int32" />
                        <asp:Parameter Name="original_PhotoRank" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="PhotoPath" Type="String" />
                        <asp:Parameter Name="Caption" Type="String" />
                        <asp:Parameter Name="AlbumID" Type="Int32" />
                        <asp:Parameter Name="ProID" Type="Int32" />
                        <asp:Parameter Name="PhotoRank" Type="Int32" />
                        <asp:Parameter Name="original_PhotoID" Type="Int32" />
                        <asp:Parameter Name="original_PhotoPath" Type="String" />
                        <asp:Parameter Name="original_Caption" Type="String" />
                        <asp:Parameter Name="original_AlbumID" Type="Int32" />
                        <asp:Parameter Name="original_ProID" Type="Int32" />
                        <asp:Parameter Name="original_PhotoRank" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="PhotoPath" Type="String" />
                        <asp:Parameter Name="Caption" Type="String" />
                        <asp:Parameter Name="AlbumID" Type="Int32" />
                        <asp:Parameter Name="ProID" Type="Int32" />
                        <asp:Parameter Name="PhotoRank" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
                &nbsp;
                <asp:Image ID="Image1" runat="server" Height="243px" Style="left: 60px; position: absolute;
                    top: 44px" Width="364px" />
                <br />
                <asp:Button ID="PreviousButton" runat="server" Style="left: 91px; position: absolute;
                    top: 299px" Text="Previous" Width="70px" />
                &nbsp;
                <asp:Button ID="PlayButton" runat="server" Style="left: 206px; position: absolute;
                    top: 299px" Text="Play" Width="74px" />
                &nbsp;
                <asp:Button ID="NextButton" runat="server" Style="left: 326px; position: absolute;
                    top: 299px" Text="Next" Width="76px" />
                <asp:Button ID="ExitButton" runat="server" Style="left: 426px; position: absolute;
                    top: 338px" Text="Exit" Width="45px" />
                <br />
            </asp:Panel>
            &nbsp;<asp:Label ID="TargetedControlLabel" runat="server" Style="left: 715px; position: relative;
                top: 373px; z-index: 101;" Text=" " Width="33px"></asp:Label>&nbsp;
            <div style="z-index: 111; left: 776px; width: 100px; position: absolute; top: 59px;
                height: 100px">
                &nbsp;
                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        Weclome<asp:LoginName ID="LoginName1" runat="server" Style="position: relative" />
                    </LoggedInTemplate>
                    <AnonymousTemplate>
                        <asp:Label ID="Label6" runat="server" Style="position: relative" Text="Label"></asp:Label>
                        <asp:LoginName ID="LoginName1" runat="server" Style="position: relative" />
                    </AnonymousTemplate>
                </asp:LoginView>
            &nbsp; &nbsp;
            &nbsp; &nbsp;
            &nbsp; &nbsp;
            </div>
            <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutPageUrl="~/NotAuthenticated/Index.aspx" Style="left: 910px;
                position: absolute; top: 77px; z-index: 102;" />
            <asp:Label ID="Label1" runat="server" Text="Label12356" Width="144px" Style="left: 42px;
                position: relative; top: -145px; z-index: 103;"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
            <asp:Panel ID="Panel1" runat="server" Height="38px" Style="left: 889px; position: absolute;
                top: 29px; z-index: 104;" Width="140px">
                <asp:DropDownList ID="RolesDropDownList" runat="server" Style="position: relative;
                    left: 8px; top: 8px;">
                    <asp:ListItem Selected="True" Value="0">Switch to Customer View</asp:ListItem>
                    <asp:ListItem Value="1">Switch to Professional View</asp:ListItem>
                </asp:DropDownList></asp:Panel>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
       
        <br />
        <br />
       
       <div id="LoadingDiv" style="left: 0px; width: 100px; position: absolute; top: 0px;
            height: 100px">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <cc1:ModalPopupExtender ID="ModalPopupExtender10" runat="server" BackgroundCssClass="modalBackground"
                        PopupControlID="LoadingPanel" TargetControlID="LoadingPanel" RepositionMode="RepositionOnWindowResize">
                    </cc1:ModalPopupExtender>
                    &nbsp; &nbsp;
                    <asp:Panel ID="LoadingPanel" runat="server" Height="45px" Style="display: none; left: 36px;
                        position: absolute; top: 48px" Width="196px" BackColor="Silver">
                        &nbsp;
                        <asp:Label ID="Label100" runat="server" Font-Bold="True" ForeColor="Black" Style="left: 63px;
                            position: absolute; top: 25px" Text="Loading.."></asp:Label>
                        <img src="../../_assets/img/uploading.gif" style="left: 0px; position: relative; top: -9px" /></asp:Panel>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
            
            
            
                  <asp:Panel ID="PanelMaximumSkills" runat="server" Style="z-index: 112; left: 248px;
                    position: absolute; top: 880px; display: none; background-color: silver; text-align: center;" Width="360px"
                    BorderColor="Navy" BorderWidth="2px" Height="62px">
                    <cc1:ModalPopupExtender ID="ModalPopupExtender14" runat="server" TargetControlID="TargetedControlLabel"
                        PopupControlID="PanelMaximumSkills" X="350" Y="250" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                      <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                      <ContentTemplate>
                      
                      <asp:Label ID="Label11" runat="server" Style="position: relative" Text="You are allowed up to 5 skills"
                          Width="183px"></asp:Label><br />
                      <asp:Button ID="SkillHideButton" runat="server" Height="26px"
                          Style="left: -4px; position: relative; top: 11px" Text="ok" Width="44px" />
                      </ContentTemplate>
                      </asp:UpdatePanel>
                    </asp:Panel>
        </div>
                    
      
    </form>
</body>
</html>
