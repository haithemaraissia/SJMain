<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Authenticated_Contracts_Default" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Button ID="Button1" runat="server" Text="Button" />
    </div>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana"  Visible="false"
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="Authenticated\Contracts\Report.rdlc">
           <DataSources>
                <rsweb:ReportDataSource DataSourceId="CustomerContractObjectDataSource" 
                    Name="ContractDataSet" />
                <rsweb:ReportDataSource DataSourceId="CustomerContractDescriptionObjectDataSource" 
                    Name="ContractDescriptionDataSet" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    
    <asp:ObjectDataSource ID="CustomerContractObjectDataSource" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetContract" 
            TypeName="ContractDataSetTableAdapters.ContractTableAdapter">
           <SelectParameters>
               <asp:Parameter Name="ContractID" Type="Int32" />
           </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="CustomerContractDescriptionObjectDataSource" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetContractDescription" 
            TypeName="ContractDataSetTableAdapters.ContractDescriptionTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="LCID" SessionField="LCID" 
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
