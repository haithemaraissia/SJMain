
Imports System.Threading
Imports System.Globalization
Imports System.Linq
Imports SidejobModel

Namespace NotAuthenticated

    Partial Class LockedUser
        Inherits Page
        Private _language As Integer
        Public Property Language() As Integer
            Get
                Return _language
            End Get
            Set(ByVal value As Integer)
                value = _language
            End Set
        End Property

        Protected Sub SEO()
            Page.Title = Resources.Resource.SignUpTitle.ToString
            Page.MetaDescription = Resources.Resource.SignUpDescription.ToString
            Page.MetaKeywords = Resources.Resource.SignUpKeywords.ToString
        End Sub

        Protected Overrides Sub InitializeCulture()
            Utility.InitializeAllCulture(Session("LCID"), Request.QueryString("l"))
            ActivateLanguage()
        End Sub

        Protected Sub ActivateLanguage()
            Select Case Thread.CurrentThread.CurrentUICulture.TwoLetterISOLanguageName.ToString
                Case "en"
                    ''English
                    _language = 1

                Case "fr"
                    '"French
                    _language = 2
            End Select
        End Sub

        Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

            Dim valid As Boolean = False
            Dim role As String = ""
            Dim currentid As String = ""

            If Not (Request.QueryString("r") Is Nothing) Then
                If Request.QueryString("r").ToString() <> "" Then
                    role = Request.QueryString("r").ToString()
                    If Not (Request.QueryString("ID") Is Nothing) Then
                        If Request.QueryString("ID").ToString() <> "" Then
                            currentid = Request.QueryString("ID").ToString()
                            valid = True
                        End If
                    End If

                End If
            End If

            If (valid = True) Then
                If (role = "CUS") Then
                    Using sidejobcontext = New SidejobEntities()
                        Dim customer = (From c In sidejobcontext.Customers
                                                    Where c.CustomerID = currentid
                                                    Select c).First()
                        If Not (customer Is Nothing) Then
                            UsernameLabel.Text = customer.UserName
                        End If
                    End Using
                End If

                If (role = "PRO") Then
                    Using sidejobcontext = New SidejobEntities()
                        Dim professional = (From c In sidejobcontext.Professionals
                                                    Where c.ProID = currentid
                                                    Select c).First()
                        If Not (professional Is Nothing) Then
                            UsernameLabel.Text = professional.UserName
                        End If
                    End Using
                End If
                UserID.Text = currentid
            End If
            SEO()
        End Sub
    End Class
End Namespace