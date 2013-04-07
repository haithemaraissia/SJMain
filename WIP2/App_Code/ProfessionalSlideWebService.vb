Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Collections

<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
<System.Web.Script.Services.ScriptService()> _
Public Class ProfessionalSlideWebService
    Inherits System.Web.Services.WebService


    <WebMethod()> _
    Public Function GetSlides2(ByVal numberofimages As Integer) As AjaxControlToolkit.Slide()

        '   Dim test() As String

        Dim rootPath As String = Server.MapPath("~")
        'rootPath

        '' Assing the number of slide
        Dim mySlides(numberofimages) As AjaxControlToolkit.Slide

        ''Perform Split function
        ' Dim pathstring() As String

        Dim i As Integer
        For i = 0 To numberofimages - 1
            'test = path.Split(",")
            'FinalPath &= test(i).ToString

            'pathstring = Split(path.ToString, ",")
            'mySlides(i) = New AjaxControlToolkit.Slide(pathstring(i).ToString, "Name", "Caption")
            mySlides(i) = New AjaxControlToolkit.Slide("..//IMAGES/HAITHEM100/Haithem1.JPG", "Name", "Caption")
        Next



        Return mySlides
    End Function


    <WebMethod()> _
    Public Function GetSlides() As AjaxControlToolkit.Slide()

        '  Dim number As Integer


        Dim mySlides(ProfessionalData._PathImageList.Count - 1) As AjaxControlToolkit.Slide


        Dim i As Integer


        For i = 0 To ProfessionalData._PathImageList.Count - 1



            mySlides(i) = New AjaxControlToolkit.Slide(ProfessionalData._PathImageList.Item(i).ToString, "", ProfessionalData._CaptionImageList.Item(i).ToString)
        Next


        Return mySlides
    End Function



    <WebMethod()> _
    Public Function GetWorkSlides() As AjaxControlToolkit.Slide()

        ' Dim number As Integer


        Dim mySlides(ProfessionalWorkData._PathWorkImageList.Count - 1) As AjaxControlToolkit.Slide


        Dim i As Integer


        For i = 0 To ProfessionalWorkData._PathWorkImageList.Count - 1



            mySlides(i) = New AjaxControlToolkit.Slide(ProfessionalWorkData._PathWorkImageList.Item(i).ToString, "", ProfessionalWorkData._CaptionWorkImageList.Item(i).ToString)
        Next


        Return mySlides
    End Function
End Class


'Public Class MyData
Public Class ProfessionalData
    Private Shared _Path As String
    Private Shared _Url As String
    Private Shared _NumberofImages As Integer
    Public Shared _PathImageList As ArrayList
    Public Shared _CaptionImageList As ArrayList
    Public Shared Gender As Integer
    ''Gender :
    ''Male
    ''Female
    ''Don't know . In this case it is a male

    'Public Sub addItem(ByVal myvalue As String)


    '    _Listofimages.Add(myvalue)

    'End Sub

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



Public Class ProfessionalWorkData

    Public Shared _PathWorkImageList As ArrayList
    Public Shared _CaptionWorkImageList As ArrayList



End Class