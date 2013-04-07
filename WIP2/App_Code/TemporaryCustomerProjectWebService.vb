Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Collections

<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
<System.Web.Script.Services.ScriptService()> _
Public Class TemporaryCustomerProjectWebService
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function HelloWorld() As String
        Return "Hello World"
    End Function

    <WebMethod()> _
    Public Function GetSlidesTest() As AjaxControlToolkit.Slide()
        Dim mySlides(1) As AjaxControlToolkit.Slide
        mySlides(0) = New AjaxControlToolkit.Slide("http://127.0.0.1/IMAGES/Haithem100/Haithem1.JPG", "name", "descrpt")
        mySlides(1) = New AjaxControlToolkit.Slide("http://127.0.0.1/IMAGES/Haithem100/IMG3.JPG", "name", " descp")
        Return mySlides
    End Function


    <WebMethod()> _
    Public Function GetSlides() As AjaxControlToolkit.Slide()
        ''Get the number of images
        Dim number As Integer
        number = PostJobData.NumberofImages


        If number = 0 Then
            Dim mySlides(0) As AjaxControlToolkit.Slide
            mySlides(0) = New AjaxControlToolkit.Slide("http://127.0.0.1/IMAGES/Haithem100/Haithem1.JPG", "name", "descrpt")
            Return mySlides
        Else
            Dim mySlides(1) As AjaxControlToolkit.Slide
            mySlides(0) = New AjaxControlToolkit.Slide("http://127.0.0.1/IMAGES/Haithem100/Haithem1.JPG", "name", "descrpt")
            mySlides(1) = New AjaxControlToolkit.Slide("http://127.0.0.1/IMAGES/Haithem100/IMG3.JPG", "name", " descp")
            Return mySlides
        End If
        '' Assing the number of slide
        'Dim mySlides(number) As AjaxControlToolkit.Slide

        ' ''Checking the case that the numberofimages is equal to 0
        ' ''Specify a picture for male user , female use , or other in add pictures
        'If number = 0 Then
        '    ''No image for the Project
        '    mySlides(0) = New AjaxControlToolkit.Slide("http://127.0.0.1/IMAGES/UserImage.jpg", "", "Add Pictures")

        'Else

        '    Dim i As Integer

        '    For i = 0 To number - 1
        '        mySlides(i) = New AjaxControlToolkit.Slide(PostJobData._PathImageList.Item(i).ToString, "name ", CustomerData._CaptionImageList.Item(i).ToString)
        '    Next

        'End If

    End Function
End Class



'Public Class MyData
Public Class PostJobData
    Private Shared _Path As String
    Private Shared _Url As String
    Private Shared _NumberofImages As Integer
    Public Shared _PathImageList As ArrayList = New ArrayList
    Public Shared _CaptionImageList As ArrayList = New ArrayList
    ' Public Shared Gender As Integer
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