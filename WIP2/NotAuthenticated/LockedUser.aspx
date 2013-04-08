<%@ Page Title="" Language="VB" MasterPageFile="~/NotAuthenticated/Plain.master"
    AutoEventWireup="false" CodeFile="LockedUser.aspx.vb" Inherits="NotAuthenticated.LockedUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <p>
        <asp:Label ID="DearLabel" runat="server" Text="<%$ Resources:Resource, Dear%>"></asp:Label>
        <span class="DarkRed">
            <asp:Label ID="UsernameLabel" runat="server" Text="" 
            style="color: #800000; font-weight: 700;"></asp:Label></span><asp:Label
                ID="CommaLabel" runat="server" Text="<%$ Resources:Resource, Comma%>"></asp:Label>
        <br />
        <br />
    </p>
    <p>
        <asp:Label ID="OurRecordsIndicatethatyouraccounthasbeenlockedLabel" runat="server"
            Text="<%$ Resources:Resource, OurRecordsIndicatethatyouraccounthasbeenlocke%>"></asp:Label>
    </p>
    <p>
        <br />
        <asp:Label ID="IfyouLiketoResolveIssueLabel" runat="server" Text="<%$ Resources:Resource, IfyouliketoResolveIssue%>"></asp:Label>
    </p>
    <p>
        <br />
        <asp:Label ID="IDLabel" runat="server" Text="<%$ Resources:Resource, ID:%>" 
            style="color: #800000; font-weight: 700"></asp:Label>&nbsp;<asp:Label
            ID="UserID" runat="server" Text=""></asp:Label>
    </p>
    <p>
        <br />
        <asp:Label ID="ThankYouLabel" runat="server" Text="<%$ Resources:Resource, ThankYou%>"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <br />
    </p>
</asp:Content>
