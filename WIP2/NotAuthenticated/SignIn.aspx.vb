
Imports System.Linq
Imports SidejobModel

Namespace NotAuthenticated
    Partial Class SignIn
        Inherits Page

        Protected Sub LoginButtonClick(ByVal sender As Object, ByVal e As EventArgs)
            Response.Expires = 0

            Dim role As DropDownList = CType(Login1.FindControl("RoleDropDownList"), DropDownList)
            Login1.DestinationPageUrl = "~/Authenticated/" + role.SelectedItem.ToString + "/" + role.SelectedItem.ToString + "Profile.aspx"

            If role.SelectedIndex = 0 Then
                If IsLockedCustomer() Then
                    Login1.DestinationPageUrl = "LockedUser.aspx?r=CUS&ID=" + Utility.GetUserInformation("CUS")
                Else
                    ReturnURL(role)
                End If
            End If

            If role.SelectedIndex = 1 Then
                If IsLockedProfessional() Then
                    Login1.DestinationPageUrl = "LockedUser.aspx?r=PRO&ID=" + Utility.GetUserInformation("PRO")
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
            If Membership.GetUser() IsNot Nothing Then
                Dim userKey = Membership.GetUser().ProviderUserKey
                Dim test = Utility.GetCustomerID(CType(userKey, Guid))

                Using sidejobcontext = New SidejobEntities()
                    Dim locked = (From c In sidejobcontext.LockedCustomers
                            Where c.CustomerID = Utility.GetCustomerID(CType(userKey, Guid))
                            Select c).FirstOrDefault()
                    If locked Is Nothing Then
                        flag = True
                    End If
                End Using
            End If
            Return flag
        End Function

        Public Function IsLockedProfessional() As Boolean
            Dim flag As Boolean = False
            If Membership.GetUser() IsNot Nothing Then
                Dim userKey = Membership.GetUser().ProviderUserKey
                Using sidejobcontext = New SidejobEntities()
                    Dim locked = (From c In sidejobcontext.LockedProfessionals
                            Where c.ProID = Utility.GetProfessionalID(CType(userKey, Guid))
                            Select c).FirstOrDefault()
                    If locked Is Nothing Then
                        flag = True
                    End If
                End Using
            End If
            Return flag
        End Function
    End Class
End Namespace