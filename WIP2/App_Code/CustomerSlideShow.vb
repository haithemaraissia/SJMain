Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Collections

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<System.Web.Script.Services.ScriptService()> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class CustomerSlideShow
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function GetSlides() As AjaxControlToolkit.Slide()

        Dim mySlides(CustomerData._PathImageList.Count - 1) As AjaxControlToolkit.Slide

        Dim i As Integer

        For i = 0 To CustomerData._PathImageList.Count - 1
            mySlides(i) = New AjaxControlToolkit.Slide(CustomerData._PathImageList.Item(i).ToString, "", CustomerData._CaptionImageList.Item(i).ToString)
        Next

        Return mySlides
    End Function


End Class


Public Class CustomerData
    Private Shared _Path As String
    Private Shared _Url As String
    Private Shared _NumberofImages As Integer
    Public Shared _PathImageList As ArrayList
    Public Shared _CaptionImageList As ArrayList
    Public Shared Gender As Integer

    Public Shared Property NumberofImages() As Integer
        Get
            Return _NumberofImages

        End Get
        Set(ByVal value As Integer)
            _NumberofImages = value

        End Set
    End Property

    Public Shared Property ImagePath() As String
        Get
            Return _Path
        End Get
        Set(ByVal value As String)
            _Path = value
        End Set
    End Property

    Public Shared Property Url() As String
        Get
            Return _Url
        End Get
        Set(ByVal value As String)
            _Url = value
        End Set
    End Property


End Class
