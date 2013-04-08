
Imports System.Linq
Imports SidejobModel
Imports System.Threading

Namespace NotAuthenticated
    Partial Class SignIn
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
            Title.Text = Resources.Resource.SignUpTitle.ToString
            Page.Title = Resources.Resource.SignUpTitle.ToString
            Page.MetaDescription = Resources.Resource.SignUpDescription.ToString
            Page.MetaKeywords = Resources.Resource.SignUpKeywords.ToString

            metaTitle.Content = Resources.Resource.SignUpTitle.ToString
            metaKeyword.Content = Resources.Resource.SignUpKeywords.ToString
            MetaDescription.Content = Resources.Resource.SignUpDescription.ToString
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

        Protected Sub LoginButtonClick(ByVal sender As Object, ByVal e As EventArgs)
            Response.Expires = 0

            Dim role As DropDownList = CType(Login1.FindControl("RoleDropDownList"), DropDownList)
            Login1.DestinationPageUrl = "~/Authenticated/" + role.SelectedItem.ToString + "/" + role.SelectedItem.ToString + "Profile.aspx"

            If role.SelectedIndex = 0 Then
                If IsLockedCustomer() Then
                    Login1.DestinationPageUrl = "LockedUser.aspx?r=CUS&ID=" + Utility.GetUserInformation("Customer")
                Else
                    ReturnURL(role)
                End If
            End If

            If role.SelectedIndex = 1 Then
                If IsLockedProfessional() Then
                    Login1.DestinationPageUrl = "LockedUser.aspx?r=PRO&ID=" + Utility.GetUserInformation("Professional")
                Else
                    ReturnURL(role)
                End If
            End If

        End Sub

        Private Sub ReturnURL(ByVal role As DropDownList)
            Dim returnUrl = HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"))
            If (returnUrl Is Nothing) Then
                Login1.DestinationPageUrl = "~/Authenticated/" + role.SelectedItem.ToString + "/" + role.SelectedItem.ToString + "Profile.aspx"
            Else
                Login1.DestinationPageUrl = returnUrl
            End If
        End Sub

        Public Function IsLockedCustomer() As Boolean
            Dim flag As Boolean = False
            Dim userId As String
            If Membership.GetUser(Login1.UserName) IsNot Nothing Then
                userId = Membership.GetUser(Login1.UserName).ProviderUserKey.ToString()
                If userId IsNot Nothing Then
                    Dim userKey = Membership.GetUser(Login1.UserName).ProviderUserKey
                    Dim customerid = Utility.GetCustomerID(CType(userKey, Guid))

                    Using sidejobcontext = New SidejobEntities()
                        Dim locked = (From c In sidejobcontext.LockedCustomers
                                Where c.CustomerID = customerid
                                Select c).FirstOrDefault()
                        If locked IsNot Nothing Then
                            flag = True
                        End If
                    End Using
                End If
            End If
            Return flag
        End Function

        Public Function IsLockedProfessional() As Boolean
            Dim flag As Boolean = False
            Dim userId As String
            If Membership.GetUser(Login1.UserName) IsNot Nothing Then
                userId = Membership.GetUser(Login1.UserName).ProviderUserKey.ToString()
                If userId IsNot Nothing Then
                    Dim userKey = Membership.GetUser(Login1.UserName).ProviderUserKey
                    Dim professionalid = Utility.GetProfessionalID(CType(userKey, Guid))
                    Using sidejobcontext = New SidejobEntities()
                        Dim locked = (From c In sidejobcontext.LockedProfessionals
                                Where c.ProID = professionalid
                                Select c).FirstOrDefault()
                        If locked IsNot Nothing Then
                            flag = True
                        End If
                    End Using
                End If
            End If
            Return flag
        End Function

    End Class
End Namespace