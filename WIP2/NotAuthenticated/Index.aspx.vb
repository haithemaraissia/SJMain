Imports System.Threading
Imports System.Globalization
Imports System
Imports System.Linq
Imports SidejobModel

Partial Class Index
    Inherits BasePage

    Protected Overrides Sub InitializeCulture()

        Dim lang As String = Request.QueryString("l")
        If lang IsNot Nothing Or lang <> "" Then
            Thread.CurrentThread.CurrentUICulture = New CultureInfo(lang)
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang)
            Session("LCID") = lang
        Else
            If Session("LCID") IsNot Nothing Or Session("LCID") <> "" Then
                Thread.CurrentThread.CurrentUICulture = New CultureInfo(Session("LCID").ToString())
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Session("LCID").ToString())
            End If
        End If

    End Sub

    Protected Sub SEOSiteMap()
        Page.Title = Resources.Resource.HomeTitle.ToString

        Dim nl1 As New Literal
        nl1.Text = Environment.NewLine
        Dim Title As HtmlMeta = New HtmlMeta()
        Title.Name = "title"
        Title.Content = Resources.Resource.HomeTitle.ToString
        Page.Header.Controls.AddAt(1, Title)

        Dim description As New HtmlMeta()
        description.Name = "description"
        description.Content = Resources.Resource.HomeDescription.ToString
        Page.Header.Controls.AddAt(2, description)

        Dim keywords As New HtmlMeta()
        keywords.Name = "keywords"
        keywords.Content = Resources.Resource.HomeKeywords.ToString
        Page.Header.Controls.AddAt(3, keywords)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        SEOSiteMap()
        Dim lang As String = Request.QueryString("l")
        selected.Src = "http://www.my-side.job.com/Images/flags/earth.png"

        If lang IsNot Nothing Or lang <> "" Then

            Select Case lang

                Case "en-US"
                    selected.Src = "http://www.my-side.job.com/Images/flags/US.png"

                Case "fr"
                    selected.Src = "http://www.my-side.job.com/Images/flags/FR.png"

                Case "es"
                    selected.Src = "http://www.my-side.job.com/Images/flags/ES.png"

                Case "zh-CN"
                    selected.Src = "http://www.my-side.job.com/Images/flags/CN.png"

                Case "ru"
                    selected.Src = "http://www.my-side.job.com/Images/flags/RU.png"

                Case "ar"
                    selected.Src = "http://www.my-side.job.com/Images/flags/AE.png"

                Case "ja"
                    selected.Src = "http://www.my-side.job.com/Images/flags/JP.png"

                Case "de"
                    selected.Src = "http://www.my-side.job.com/Images/flags/DE.png"
            End Select

        End If

        If Not Page.IsPostBack Then
            GetTopProfessional()
            GetTopProject()
        End If

    End Sub

    Protected Sub GetTopProfessional()

        Using context As New SidejobEntities()

            Dim query = From pg In context.ProfessionalGenerals _
             Join pai In context.ProfessionalAdditionalInformations On pg.ProID Equals pai.ProID _
             Order By pai.MoneyEarned, pai.ProjectCompleted, pai.WorkAccomplished, pai.Rank, pai.Points, pai.Reputation _
                      Select New With {pg.ProID, .UserName = pg.UserName.Substring(0, 6), pg.PhotoPath}

            Dim results = query.Take(3).ToList()
            TopProfessionalDataList.DataSource = results
            TopProfessionalDataList.DataBind()
        End Using

    End Sub

    Protected Sub GetTopProject()

        Dim results = New TopProject(2) {}
        Using context As New SidejobEntities()
            Dim currenttimequery = From pr In context.ProjectRequirements _
             Join p In context.Projects On pr.ProjectID Equals p.ProjectID _
             Where (p.StatusInt = 0) AndAlso (pr.EndDate >= DateTime.Now) _
             Order By p.ProjectID Descending

            If currenttimequery.Count() > 3 Then
                Dim checkcurrentimequery = currenttimequery.ToList()
                Dim queryresults = checkcurrentimequery.Take(3).ToList()
                For i As Integer = 0 To results.Length - 1
                    results(i) = New TopProject(Integer.Parse(queryresults(i).pr.ProjectID.ToString(CultureInfo.InvariantCulture)), queryresults(i).pr.ProjectTitle, "")
                Next
            Else
                Dim notimequery = From pr In context.ProjectRequirements _
                 Join p In context.Projects On pr.ProjectID Equals p.ProjectID _
                 Where (p.StatusInt = 0) _
                 Order By p.ProjectID Descending

                If notimequery.Count() > 3 Then
                    Dim checknotimequery = notimequery.ToList()
                    Dim queryresults = checknotimequery.Take(3).ToList()
                    For i As Integer = 0 To results.Length - 1
                        results(i) = New TopProject(Integer.Parse(queryresults(i).pr.ProjectID.ToString(CultureInfo.InvariantCulture)), queryresults(i).pr.ProjectTitle, "")
                    Next
                Else
                    Dim allprojects = From pr In context.ProjectRequirements _
                     Join p In context.Projects On pr.ProjectID Equals p.ProjectID _
                     Order By p.ProjectID Descending
                    Dim allprojectquery = allprojects.ToList()
                    Dim queryresults = allprojectquery.Take(3).ToList()
                    For i As Integer = 0 To results.Length - 1
                        results(i) = New TopProject(Integer.Parse(queryresults(i).pr.ProjectID.ToString(CultureInfo.InvariantCulture)), queryresults(i).pr.ProjectTitle, "")
                    Next
                End If
            End If
            ProjectPhoto(results)
            TopProjectDataList.DataSource = results
            TopProjectDataList.DataBind()
        End Using

    End Sub

    Public Sub ProjectPhoto(results As TopProject())

        Using context As New SidejobEntities()
            For i As Integer = 0 To 2
                Dim projectID As Integer = results(i).ProjectID
                Dim minimunPhotoRank = From ph In context.ProjectPhotoes _
                 Where ph.PhotoRank <> -1 AndAlso ph.ProjectID = projectID _
                    Order By ph.PhotoRank Descending

                Dim photopath = From ph In context.ProjectPhotoes _
                                Where ph.PhotoRank = -1 AndAlso ph.ProjectID = projectID
                If minimunPhotoRank.Any() Then
                    Dim rank As Integer = Integer.Parse(minimunPhotoRank.First().PhotoRank.ToString(CultureInfo.InvariantCulture))
                    photopath = From ph In context.ProjectPhotoes _
     Where ph.PhotoRank = rank AndAlso ph.ProjectID = projectID
                End If
                Dim firstOrDefault = photopath.FirstOrDefault()
                If firstOrDefault IsNot Nothing Then
                    results(i).SetPath(firstOrDefault.PhotoPath.ToString(CultureInfo.InvariantCulture))
                Else
                    Const projectMissingPrimaryPicture As String = "http://www.my-side-job.com/Images/NoWorkShopImage.jpg"
                    results(i).SetPath(projectMissingPrimaryPicture)
                End If
            Next
        End Using

    End Sub
End Class

Public Class TopProfessional
    Public Sub New(id As Integer, name As String)
        ProID = id
        UserName = name
    End Sub
    Public Property ProID() As Integer
        Get
            Return _mProID
        End Get
        Set(value As Integer)
            _mProID = value
        End Set
    End Property
    Private _mProID As Integer
    Public Property UserName() As String
        Get
            Return _mUserName
        End Get
        Set(value As String)
            _mUserName = value
        End Set
    End Property
    Private _mUserName As String
    Public Property PhotoPath() As String
        Get
            Return _mPhotoPath
        End Get
        Set(value As String)
            _mPhotoPath = value
        End Set
    End Property
    Private _mPhotoPath As String
End Class

Public Class TopProject
    Public Sub New(id As Integer, title As String, path As String)
        ProjectID = id
        ProjectTitle = title
        PhotoPath = path
    End Sub
    Public Sub SetPath(path As String)
        PhotoPath = path
    End Sub
    Public Property ProjectID() As Integer
        Get
            Return _mProjectID
        End Get
        Set(value As Integer)
            _mProjectID = value
        End Set
    End Property
    Private _mProjectID As Integer
    Public Property ProjectTitle() As String
        Get
            Return _mProjectTitle
        End Get
        Set(value As String)
            _mProjectTitle = value
        End Set
    End Property
    Private _mProjectTitle As String
    Public Property PhotoPath() As String
        Get
            Return _mPhotoPath
        End Get
        Set(value As String)
            _mPhotoPath = value
        End Set
    End Property
    Private _mPhotoPath As String
End Class

