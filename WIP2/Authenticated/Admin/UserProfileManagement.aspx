<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UserProfileManagement.aspx.vb" Inherits="Authenticated_Admin_UserProfileManagement" %>
<%--<%@ Register Assembly="System.Web.Ajax" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
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
                Customer Portfolio Change<br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerID"
                              DataSourceID="SqlDataSource1" Style="position: relative">
                    <Columns>
                        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />
                        <asp:BoundField DataField="About" HeaderText="About" SortExpression="About" />
                        <asp:BoundField DataField="SpecialNotes" HeaderText="SpecialNotes" SortExpression="SpecialNotes" />
                        <asp:BoundField DataField="Modified" HeaderText="Modified" SortExpression="Modified" />
                        <asp:TemplateField HeaderText="Accept">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="AcceptChange" Text="Accept" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
                                   SelectCommand="SELECT [CustomerID], [About], [SpecialNotes], [Modified] FROM [CustomerPortfolio] WHERE ([Modified] = @Modified)" OldValuesParameterFormatString="original_{0}">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="Modified" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <hr />
                <br />
                <br />
                Professional Portfolio Change<br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ProID"
                              DataSourceID="SqlDataSource2" Style="position: relative">
                    <Columns>
                        <asp:BoundField DataField="ProID" HeaderText="ProID" ReadOnly="True" SortExpression="ProID" />
                        <asp:BoundField DataField="About" HeaderText="About" SortExpression="About" />
                        <asp:BoundField DataField="SpecialNotes" HeaderText="SpecialNotes" SortExpression="SpecialNotes" />
                        <asp:BoundField DataField="Modified" HeaderText="Modified" SortExpression="Modified" />
                        <asp:TemplateField HeaderText="Accept">
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" CausesValidation="false" 
                                            CommandName="AcceptChange" Text="Accept"  />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
            
                                   SelectCommand="SELECT ProID, About, SpecialNotes, Modified FROM ProfessionalPortfolio WHERE (Modified = @Modified)" 
                                   OldValuesParameterFormatString="original_{0}">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="Modified" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
    
    
            </div>
        </form>
    </body>
</html>