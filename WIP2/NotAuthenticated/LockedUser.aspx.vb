
Imports System.Threading
Imports System.Globalization
Imports System.Linq
Imports SidejobModel

Namespace NotAuthenticated

    Partial Class LockedUser
        Inherits Page

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

        Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

            Dim valid As Boolean = False
            Dim role As String = ""
            Dim currentid As String = ""

            If Not (Request.QueryString("role") Is Nothing) Then
                If Request.QueryString("role").ToString() <> "" Then
                    role = Request.QueryString("role").ToString()
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
        End Sub
    End Class
End Namespace