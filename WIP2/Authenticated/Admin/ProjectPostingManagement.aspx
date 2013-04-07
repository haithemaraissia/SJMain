<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProjectPostingManagement.aspx.vb" Inherits="Authenticated_Admin_UserProfileManagement" %>
<%--<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <br />
        DO all the authentication here and maybe send an email to yourself, check video61
        you can even add argument to the selectede button<br />
        <br />
        THIS IS ALSO TRUE FOR THE APPROVAL OF THE POSTING OF THE PROJECT<br />
        <br />
        <br />
        Project Posting Change<br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"  >
        <ContentTemplate>
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProjectID"
            DataSourceID="SqlDataSource1" Style="position: relative">
            <Columns>
             
                <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" 
                    SortExpression="ProjectID" ReadOnly="True" />
                <asp:BoundField DataField="LCID" HeaderText="LCID" SortExpression="LCID" />
                <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" 
                    SortExpression="JobTitle" />
                <asp:BoundField DataField="ProjectTitle" HeaderText="ProjectTitle" 
                    SortExpression="ProjectTitle" />
                <asp:BoundField DataField="StartDate" HeaderText="StartDate" 
                    SortExpression="StartDate" />
                <asp:BoundField DataField="EndDate" HeaderText="EndDate" 
                    SortExpression="EndDate" />
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    SortExpression="Description" />
                <asp:BoundField DataField="SpecialNotes" HeaderText="SpecialNotes" 
                    SortExpression="SpecialNotes" />
                <asp:BoundField DataField="Address" HeaderText="Address" 
                    SortExpression="Address" />
                <asp:BoundField DataField="DatePosted" HeaderText="DatePosted" 
                    SortExpression="DatePosted" />
                <asp:TemplateField HeaderText="Accept">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="false" 
                            CommandName="select" Text="Accept" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
            
            SelectCommand="SELECT [ProjectID], [LCID], [JobTitle], [ProjectTitle], [StartDate], [EndDate], [Description], [SpecialNotes], [Address], [DatePosted] FROM [PendingProject]" 
            OldValuesParameterFormatString="original_{0}" 
            DeleteCommand="AcceptProject" DeleteCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="ProjectID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
        
        </ContentTemplate>
        </asp:UpdatePanel>
      
    
    </div>
    </form>
</body>
</html>
