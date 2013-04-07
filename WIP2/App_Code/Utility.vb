
Imports System.Linq
Imports System.IO
Imports System.Net
Imports System.Net.Mail
Imports SidejobModel

Public Class Utility

    Public Enum Message
        Contact
    End Enum


    Public Shared Function Login() As String
        Return String.Format("~/NotAuthenticated/SignIn.aspx?ReturnUrl={0}", HttpContext.Current.Request.Url.AbsoluteUri)
    End Function

    Public Sub ValidateUser()
        Dim user = Membership.GetUser()
        If user Is Nothing Then
            Login()
        End If
    End Sub
    Public Shared Function GetUserID() As Guid
        Dim user = Membership.GetUser()
        If user IsNot Nothing Then
            Dim userKey = user.ProviderUserKey

            If userKey IsNot Nothing Then
                Dim userID = DirectCast(userKey, Guid)
                Return userID
            Else
                Login()
                Return Nothing
            End If
        Else
            Login()
            Return Nothing
        End If

    End Function

    Public Shared Function GetUserInformation(role As String) As String
        If (Role = "Customer") Then
            Return GetCustomerID(GetUserID())
        End If
        If (Role = "Professional") Then
            Return GetProfessionalID(GetUserID())
        End If
        Return "0"
    End Function

    Public Shared Function GetCustomerID(ByVal guid As Guid) As String

        Using context = New SidejobEntities()
            Try
                Return (From c In context.Customers
                                        Where c.UserID = guid
                                        Select c.CustomerID).FirstOrDefault().ToString

            Catch ex As Exception
                Return "0"
            End Try

        End Using

    End Function

    Public Shared Function GetCustomerGeneralProperties() As CustomerGeneral

        Using context = New SidejobEntities()
            Dim customerid = Convert.ToInt32(GetCustomerID(GetUserID()))
            Return (From c In context.CustomerGenerals
                                    Where c.CustomerID = customerid
                                    Select c).FirstOrDefault()

        End Using

    End Function

    Public Shared Function GetCustomerProperties() As Customer

        Using context = New SidejobEntities()
            Dim userId = GetUserID()
            Return (From c In context.Customers
                                    Where c.UserID = userId
                                    Select c).FirstOrDefault()

        End Using

    End Function

    Public Shared Function GetProfessionalID(ByVal guid As Guid) As String

        Using context = New SidejobEntities()
            Try
                Return (From c In context.Professionals
                                        Where c.UserID = guid
                                        Select c.ProID).FirstOrDefault().ToString

            Catch ex As Exception
                Return "0"
            End Try

        End Using

    End Function

    Public Shared Function GetProfessionalGeneralProperties() As ProfessionalGeneral

        Using context = New SidejobEntities()

            Return (From c In context.ProfessionalGenerals
                                     Where c.ProID = Convert.ToInt32(GetProfessionalID(GetUserID()))
                                    Select c).FirstOrDefault()

        End Using

    End Function

    Public Shared Function GetProfessionalProperties() As Professional

        Using context = New SidejobEntities()

            Return (From c In context.Professionals
                                     Where c.UserID = GetUserID()
                                    Select c).FirstOrDefault()

        End Using

    End Function

    Public Shared Function GetNextSkillId() As Integer

        Dim skillID As Integer
        Using context = New SidejobEntities()
            Try
                Dim max = context.ProfessionalSkills.OrderByDescending(Function(s) s.SkillID).FirstOrDefault()
                If max Is Nothing Then
                    skillID = 0
                Else
                    skillID = max.SkillID + 1
                End If
                Return skillID

            Catch ex As Exception
                Return 0
            End Try

        End Using

    End Function

    Public Shared Function GetJobTitle(ByVal jobId As Integer, ByVal lcid As Integer) As String

        Using context = New SidejobEntities()
            Select Case (lcid)

                Case 1
                    Return (From c In context.Jobs
                                      Where c.JobID = jobId
                                      Select c.JobCategory).FirstOrDefault()

                Case 2
                    Return (From c In context.JobsFrs
                                    Where c.JobID = jobId
                                    Select c.JobCategory).FirstOrDefault()
                Case 3
                    Return (From c In context.JobsSps
                                    Where c.JobID = jobId
                                    Select c.JobCategory).FirstOrDefault()
                Case Else
                    Return (From c In context.Jobs
                                    Where c.JobID = jobId
                                    Select c.JobCategory).FirstOrDefault()
            End Select
        End Using
    End Function

    Public Shared Function GetCategoryName(ByVal categoryId As Integer, ByVal lcid As Integer) As String

        Using context = New SidejobEntities()
            Select Case (lcid)

                Case 1
                    Return (From c In context.Categories
                                      Where c.CategoryID = categoryId
                                      Select c.CategoryName).FirstOrDefault()

                Case 2
                    Return (From c In context.CategoriesFrs
                                      Where c.CategoryID = categoryId
                                      Select c.CategoryName).FirstOrDefault()
                Case 3
                    Return (From c In context.CategoriesSps
                                      Where c.CategoryID = categoryId
                                      Select c.CategoryName).FirstOrDefault()
                Case Else
                    Return (From c In context.Categories
                                      Where c.CategoryID = categoryId
                                      Select c.CategoryName).FirstOrDefault()
            End Select
        End Using

    End Function

    Public Shared Function GetHtmlFrom(url As String) As String
        Dim wc = New WebClient()
        Dim resStream = wc.OpenRead(url)
        If resStream IsNot Nothing Then
            Dim sr = New StreamReader(resStream, Encoding.[Default])
            Return sr.ReadToEnd()
        End If
        Return "null"
    End Function

    Public Shared Function GetLCID(lang As String) As Integer
        Select Case lang

            Case "en-US"
                Return 1

            Case "fr"
                Return 2

            Case "es"
                Return 3

            Case "zh-CN"
                Return 4

            Case "ru"
                Return 5

            Case "ar"
                Return 6

            Case "ja"
                Return 7

            Case "de"
                Return 8
            Case Else
                Return 1
        End Select

    End Function

    Public Shared Function GetLanguage(langid As Integer) As String
        Select Case langid

            Case 1
                Return "en-US"

            Case 2
                Return "fr"

            Case 3
                Return "es"

            Case 4
                Return "zh-CN"

            Case 5
                Return "ru"

            Case 6
                Return "ar"

            Case 7
                Return "ja"

            Case 8
                Return "de"
            Case Else
                Return "en-US"
        End Select

    End Function































    Public Sub DeleteCustomer(customerid As Integer)
        Using sidejobcontext = New SidejobEntities()

            'Customer
            Dim customer = (From c In sidejobcontext.Customers
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (customer Is Nothing) Then
                sidejobcontext.DeleteObject(customer)
                sidejobcontext.SaveChanges()
            End If



            'CustomerAdditionalInformations
            Dim cai = (From c In sidejobcontext.CustomerAdditionalInformations
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (cai Is Nothing) Then
                sidejobcontext.DeleteObject(cai)
                sidejobcontext.SaveChanges()
            End If



            'CustomerBids
            Dim cb = (From c In sidejobcontext.CustomerBids
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (cb Is Nothing) Then
                sidejobcontext.DeleteObject(cb)
                sidejobcontext.SaveChanges()
            End If



            'CustomerComments
            Dim cc = (From c In sidejobcontext.CustomerComments
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (cc Is Nothing) Then
                sidejobcontext.DeleteObject(cc)
                sidejobcontext.SaveChanges()
            End If



            'CustomerCommentReceiveds
            Dim ccr = (From c In sidejobcontext.CustomerCommentReceiveds
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (ccr Is Nothing) Then
                sidejobcontext.DeleteObject(ccr)
                sidejobcontext.SaveChanges()
            End If



            'CustomerCommentReceivedSummaries
            Dim ccrs = (From c In sidejobcontext.CustomerCommentReceivedSummaries
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (ccrs Is Nothing) Then
                sidejobcontext.DeleteObject(ccrs)
                sidejobcontext.SaveChanges()
            End If



            'CustomerSents
            Dim ccs = (From c In sidejobcontext.CustomerCommentSents
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (ccs Is Nothing) Then
                sidejobcontext.DeleteObject(ccs)
                sidejobcontext.SaveChanges()
            End If



            'CustomerCompletedTransactions
            Dim cct = (From c In sidejobcontext.CustomerCompletedTransactions
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (cct Is Nothing) Then
                sidejobcontext.DeleteObject(cct)
                sidejobcontext.SaveChanges()
            End If



            'CustomerContracts
            Dim ccontract = (From c In sidejobcontext.CustomerContracts
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (ccontract Is Nothing) Then
                sidejobcontext.DeleteObject(ccontract)
                sidejobcontext.SaveChanges()
            End If



            'CustomerEvents
            Dim ce = (From c In sidejobcontext.CustomerEvents
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (ce Is Nothing) Then
                sidejobcontext.DeleteObject(ce)
                sidejobcontext.SaveChanges()
            End If



            'CustomerFavorites
            Dim cf = (From c In sidejobcontext.CustomerFavorites
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (cf Is Nothing) Then
                sidejobcontext.DeleteObject(cf)
                sidejobcontext.SaveChanges()
            End If



            'CustomerGeneral
            Dim cg = (From c In sidejobcontext.CustomerGenerals
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (cg Is Nothing) Then
                sidejobcontext.DeleteObject(cg)
                sidejobcontext.SaveChanges()
            End If



            'CustomerHackedPDTs
            Dim chpdt = (From c In sidejobcontext.CustomerHackedPDTs
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (chpdt Is Nothing) Then
                sidejobcontext.DeleteObject(chpdt)
                sidejobcontext.SaveChanges()
            End If


            '''''''''''''''''''''''''''''''''''CustomerBids''''''''''''''''''''Fix it
            '    Dim cb = (From c In sidejobcontext.CustomerHistoryBids
            '                   Where c.CustomerID = customerid
            '                   Select c).FirstOrDefault()
            '    If Not (cb Is Nothing) Then
            '        sidejobcontext.DeleteObject(cb)
            '        sidejobcontext.SaveChanges()
            '    End If
            '    ''''''''''''''''''''''''''''''''''''''''''''''''''

            '    'CustomerInvitationReceiveds
            '    Dim cir = (From c In sidejobcontext.CustomerInvitationReceiveds
            '                   Where c.CustomerID = customerid
            '                   Select c).FirstOrDefault()
            '    If Not (cir Is Nothing) Then
            '        sidejobcontext.DeleteObject(cir)
            '        sidejobcontext.SaveChanges()
            '    End If


            '    'CustomerInvitationSents
            '    Dim cis = (From c In sidejobcontext.CustomerInvitationSents
            '                   Where c.CustomerID = customerid
            '                   Select c).FirstOrDefault()
            '    If Not (cb Is Nothing) Then
            '        sidejobcontext.DeleteObject(cis)
            '        sidejobcontext.SaveChanges()
            '    End If


            '    'CustomerIPNs
            '    Dim cip = (From c In sidejobcontext.CustomerIPNs
            '                   Where c.CustomerID = customerid
            '                   Select c).FirstOrDefault()
            '    If Not (cip Is Nothing) Then
            '        sidejobcontext.DeleteObject(cip)
            '        sidejobcontext.SaveChanges()
            '    End If


            '    'CustomerLostBids
            '    Dim clb = (From c In sidejobcontext.CustomerLostBids
            '                   Where c.CustomerID = customerid
            '                   Select c).FirstOrDefault()
            '    If Not (clb Is Nothing) Then
            '        sidejobcontext.DeleteObject(clb)
            '        sidejobcontext.SaveChanges()
            '    End If


            '    'CustomerMessages
            '    Dim cm = (From c In sidejobcontext.CustomerMessages
            '                   Where c.CustomerID = customerid
            '                   Select c).FirstOrDefault()
            '    If Not (cm Is Nothing) Then
            '        sidejobcontext.DeleteObject(cm)
            '        sidejobcontext.SaveChanges()
            '    End If


            '    'CustomerMessageInboxes
            '    Dim cmi = (From c In sidejobcontext.CustomerMessageInboxes
            '                   Where c.CustomerID = customerid
            '                   Select c).FirstOrDefault()
            '    If Not (cmi Is Nothing) Then
            '        sidejobcontext.DeleteObject(cmi)
            '        sidejobcontext.SaveChanges()
            '    End If


            '    'CustomerMessageOutboxes
            '    Dim cmb = (From c In sidejobcontext.CustomerMessageOutboxes
            '                   Where c.CustomerID = customerid
            '                   Select c).FirstOrDefault()
            '    If Not (cmb Is Nothing) Then
            '        sidejobcontext.DeleteObject(cmb)
            '        sidejobcontext.SaveChanges()
            '    End If


            '    'CustomerMessageSaveds
            '    Dim cms = (From c In sidejobcontext.CustomerMessageSaveds
            '                   Where c.CustomerID = customerid
            '                   Select c).FirstOrDefault()
            '    If Not (cms Is Nothing) Then
            '        sidejobcontext.DeleteObject(cms)
            '        sidejobcontext.SaveChanges()
            '    End If
            '
        End Using
    End Sub





    Public Sub DeleteProfessional(professionalid As Integer)
    End Sub













    Public Shared Sub SendEmail(fromUserName As String,
                            fromUserNameEmailAddress As String,
                            lcid As Integer,
                            subject As String,
                            Optional toUserName As String = "Admin",
                            Optional toUserNameEmailAddress As String = "",
                            Optional message As String = "",
                            Optional templateUrl As String = "",
                            Optional messageType As Message = Message.Contact,
                            Optional role As String = "",
                            Optional id As Integer = 0)

        Dim url As String = ""
        If templateUrl <> "" Then
            url = templateUrl + "?&l=" + GetLanguage(lcid) + "&msg=" + message + "&id" + id.ToString()
        End If
        If toUserNameEmailAddress = "" Then
            toUserNameEmailAddress = "postmaster@my-side-job.com"
        End If
        Dim mailMsg = New MailMessage(New MailAddress(fromUserNameEmailAddress), New MailAddress(toUserNameEmailAddress)) With { _
         .BodyEncoding = Encoding.[Default], _
         .Subject = subject, _
         .Body = GetHtmlFrom(url), _
         .Priority = MailPriority.High, _
         .IsBodyHtml = True _
        }
        Dim smtpMail = New SmtpClient()
        Dim basicAuthenticationInfo = New NetworkCredential("postmaster@my-side-job.com", "haithem759163")
        smtpMail.Host = "mail.my-side-job.com"
        smtpMail.UseDefaultCredentials = False
        smtpMail.Credentials = basicAuthenticationInfo
        Try
            smtpMail.Send(mailMsg)
        Catch generatedExceptionName As Exception
            ''Included in the emailproblem
            Throw
        End Try
    End Sub


End Class
