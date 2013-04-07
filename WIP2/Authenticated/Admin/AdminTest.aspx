<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdminTest.aspx.vb" Inherits="Authenticated_Admin_AdminTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProjectID"
            DataSourceID="SqlDataSource1" Style="position: relative">
            <Columns>
                <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" ReadOnly="True" SortExpression="ProjectID" />
                <asp:BoundField DataField="DateFinished" HeaderText="DateFinished" SortExpression="DateFinished" />
                <asp:BoundField DataField="PosterID" HeaderText="PosterID" SortExpression="PosterID" />
                <asp:BoundField DataField="PosterRole" HeaderText="PosterRole" SortExpression="PosterRole" />
                <asp:BoundField DataField="BidderID" HeaderText="BidderID" SortExpression="BidderID" />
                <asp:BoundField DataField="BidderRole" HeaderText="BidderRole" SortExpression="BidderRole" />
                <asp:BoundField DataField="HighestBid" HeaderText="HighestBid" SortExpression="HighestBid" />
                <asp:BoundField DataField="Currency" HeaderText="Currency" SortExpression="Currency" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SideJobConnectionString %>"
            SelectCommand="SELECT [ProjectID], [DateFinished], [PosterID], [PosterRole], [BidderID], [BidderRole], [HighestBid], [Currency], [Status] FROM [ProjectComplete]">
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Style="position: relative" Text="Label"></asp:Label><br />
        <br />
        <asp:Label ID="Label2" runat="server" Style="position: relative" Text="Label"></asp:Label><br />
        <br />
        <asp:Label ID="Label3" runat="server" Style="position: relative" Text="Label"></asp:Label></div>
    </form>
</body>
</html>
