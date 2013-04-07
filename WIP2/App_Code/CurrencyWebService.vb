Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Net

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class CurrencyWebService
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function Convert(amount As Decimal, fromCurrency As String, toCurrency As String) As Decimal
        Dim web As New WebClient()
        Dim url As String = String.Format("http://www.google.com/ig/calculator?hl=en&q={2}{0}%3D%3F{1}", fromCurrency.ToUpper(), toCurrency.ToUpper(), amount)
        Dim response As String = web.DownloadString(url)
        Dim regex As New Regex("rhs: \""(\d*.\d*)")
        Dim rate As Decimal = System.Convert.ToDecimal(regex.Match(response).Groups(1).Value)
        Return rate
    End Function


End Class