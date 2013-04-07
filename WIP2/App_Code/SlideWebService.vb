Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Collections


<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
<System.Web.Script.Services.ScriptService()> _
Public Class SlideWebService
    Inherits System.Web.Services.WebService

    '<WebMethod()> _
    'Public Function GetSlides(ByVal ImagePath As Array) As AjaxControlToolkit.Slide()
    '    Dim mySlides(ImagePath.Length) As AjaxControlToolkit.Slide
    '    Dim i As Integer
    '    For i = 0 To ImagePath.Length - 1 Step i + 1

    '        mySlides(i) = New AjaxControlToolkit.Slide(ImagePath(i), "Name", "Caption")





    '    Next


    '    Return mySlides


    'End Function


    'Public Function GetSlides(ByVal numberofimages As Integer, ByVal path As String) As AjaxControlToolkit.Slide()
    <WebMethod()> _
    Public Function GetSlides(ByVal numberofimages As Integer) As AjaxControlToolkit.Slide()

        '   Dim test() As String

        Dim rootPath As String = Server.MapPath("~")
        'rootPath

        '' Assing the number of slide
        Dim mySlides(numberofimages) As AjaxControlToolkit.Slide

        ''Perform Split function
        'Dim pathstring() As String

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
        '    Dim di As New DirectoryInfo(MyData.ImagePath)
        '    Dim s(di.GetFiles.Length - 1) As AjaxControlToolkit.Slide
        '    Dim x As Integer = 0
        '    For Each fi As FileInfo In di.GetFiles()
        '        s(x) = New AjaxControlToolkit.Slide(MyData.Url & fi.Name, "", Path.GetFileNameWithoutExtension(fi.Name))
        '        x += 1
        '    Next
        '    Return s
        'End Function



        ''Get the number of images
        ' Dim number As Integer
        ' number = CustomerData.NumberofImages


        '' Assing the number of slide
        Dim mySlides(CustomerData._PathImageList.Count - 1) As AjaxControlToolkit.Slide

        ''Checking the case that the numberofimages is equal to 0
        ''Specify a picture for male user , female use , or other in add pictures
        'If number = 0 Then
        '    ''Case Female 
        '    ''Female picture
        '    ''If CustomerData.Gender = 1 Then
        '    mySlides(0) = New AjaxControlToolkit.Slide("http://127.0.0.1/Side/Images/female_user_icon.jpg", "", "Add Pictures")
        '    ''Otherwise male picture
        '    ''Else
        '    mySlides(0) = New AjaxControlToolkit.Slide("http://127.0.0.1/Side/Images/female_user_icon.jpg", "", "Add Pictures")
        '    ''End if
        'End If
        Dim i As Integer


        For i = 0 To CustomerData._PathImageList.Count - 1


            ' Dim name As String
            ' name = "name of image" & i
            ' Dim caption As String
            ' caption = "caption of image " & i

            '    'test = path.Split(",")
            '    'FinalPath &= test(i).ToString

            '    'pathstring = Split(path.ToString, ",")
            '    'mySlides(i) = New AjaxControlToolkit.Slide(pathstring(i).ToString, "Name", "Caption")
            mySlides(i) = New AjaxControlToolkit.Slide(CustomerData._PathImageList.Item(i).ToString, "", CustomerData._CaptionImageList.Item(i).ToString)
        Next


        'Dim mySlides(3) As AjaxControlToolkit.Slide

        'For i = 0 To 3
        '    Dim name As String
        '    name = "name of image" & i
        '    'test = path.Split(",")
        '    'FinalPath &= test(i).ToString

        '    'pathstring = Split(path.ToString, ",")
        '    'mySlides(i) = New AjaxControlToolkit.Slide(pathstring(i).ToString, "Name", "Caption")
        '    mySlides(i) = New AjaxControlToolkit.Slide(CustomerData.ImagePath, name.ToString, "Caption")
        'Next
        'mySlides(0) = New AjaxControlToolkit.Slide(CustomerData.ImagePath, "name1", "caption1:")
        'mySlides(1) = New AjaxControlToolkit.Slide(CustomerData.ImagePath, "name2", "caption2:")
        'mySlides(2) = New AjaxControlToolkit.Slide(CustomerData.ImagePath, "name3", "caption3:")
        'mySlides(3) = New AjaxControlToolkit.Slide(CustomerData.ImagePath, "name4", "caption4:")



        'Dim mySlides2(1) As AjaxControlToolkit.Slide
        'mySlides2(0) = New AjaxControlToolkit.Slide(CustomerData.ImagePath.ToString, "Name2", "Caption2")
        'mySlides2(1) = New AjaxControlToolkit.Slide(CustomerData.ImagePath.ToString, "Name3", "Caption3")

        Return mySlides
    End Function
End Class


'Public Class MyData
Public Class CustomerData1
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