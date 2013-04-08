
Imports System.Linq
Imports System.IO
Imports System.Net
Imports System.Net.Mail
Imports System.Globalization
Imports SidejobModel
Imports System.Threading

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
        If (role = "Customer") Then
            Return GetCustomerID(GetUserID())
        End If
        If (role = "Professional") Then
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
            Dim professionalid = Convert.ToInt32(GetProfessionalID(GetUserID()))
            Return (From c In context.ProfessionalGenerals
                                     Where c.ProID = professionalid
                                    Select c).FirstOrDefault()

        End Using

    End Function

    Public Shared Function GetProfessionalProperties() As Professional

        Using context = New SidejobEntities()
            Dim userId = GetUserID()
            Return (From c In context.Professionals
                                     Where c.UserID = userId
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
                                      Select c.JobTitle).FirstOrDefault()

                Case 2
                    Return (From c In context.JobsFrs
                                    Where c.JobID = jobId
                                    Select c.JobTitle).FirstOrDefault()
                Case 3
                    Return (From c In context.JobsSps
                                    Where c.JobID = jobId
                                    Select c.JobTitle).FirstOrDefault()
                Case Else
                    Return (From c In context.Jobs
                                    Where c.JobID = jobId
                                    Select c.JobTitle).FirstOrDefault()
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



    Public Shared Sub InitializeAllCulture(ByVal lcid As Object, ByVal lang As String)

        If lang IsNot Nothing Or lang <> "" Then
            Thread.CurrentThread.CurrentUICulture = New CultureInfo(lang)
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang)
            lcid = lang
        Else
            Try
                If lcid IsNot Nothing Or lcid <> "" Then
                    Thread.CurrentThread.CurrentUICulture = New CultureInfo(lcid.ToString())
                    Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lcid.ToString())
                End If
            Catch ex As Exception
            Finally
                Thread.CurrentThread.CurrentUICulture = New CultureInfo("en-US")
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("en-US")
            End Try
        End If

    End Sub

    'Protected Overrides Sub InitializeCulture()
    '    Public shared 

    '    Dim lang As String = Request.QueryString("l")
    '    If lang IsNot Nothing Or lang <> "" Then
    '        Thread.CurrentThread.CurrentUICulture = New CultureInfo(lang)
    '        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang)
    '        Session("LCID") = lang
    '    Else
    '        Try
    '            If Session("LCID") IsNot Nothing Or Session("LCID") <> "" Then
    '                Thread.CurrentThread.CurrentUICulture = New CultureInfo(Session("LCID").ToString())
    '                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Session("LCID").ToString())
    '            End If
    '        Catch ex As Exception
    '        Finally
    '            Thread.CurrentThread.CurrentUICulture = New CultureInfo("en-US")
    '            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("en-US")
    '        End Try

    '    End If

    '    ActivateLanguage()
    'End Sub

    Public Shared Function RemoveQuerystringVar(ByVal strURL As String, ByVal querystringKey As String) As String
        Dim re As New Regex("(.*)(\?|&)" + querystringKey + "=[^&]+?(&)(.*)", RegexOptions.IgnoreCase)
        strURL = re.Replace(strURL + "&", "$1$2$4")
        strURL = Mid(strURL, 1, (strURL.Length - 1))
        Return strURL
    End Function





























    Public Shared Sub DeleteCustomer()
        Using sidejobcontext = New SidejobEntities()
            Dim customerid = Integer.Parse(GetCustomerID(GetUserID()))

            'CustomerAdditionalInformations
            Dim cai = (From c In sidejobcontext.CustomerAdditionalInformations
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (cai Is Nothing) Then
                sidejobcontext.DeleteObject(cai)
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



            'CustomerInvitationReceiveds
            Dim cir = (From c In sidejobcontext.CustomerInvitationReceiveds
                           Where c.CustomerID = customerid
                           Select c).ToList()
            If Not (cir.Count <= 0) Then
                For Each ccir In cir
                    sidejobcontext.DeleteObject(ccir)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'CustomerInvitationSents
            Dim cis = (From c In sidejobcontext.CustomerInvitationSents
                           Where c.CustomerID = customerid
                           Select c).ToList()
            If Not (cis.Count <= 0) Then
                For Each ccis In cis
                    sidejobcontext.DeleteObject(ccis)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'CustomerIPNs
            Dim cip = (From c In sidejobcontext.CustomerIPNs
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (cip Is Nothing) Then
                sidejobcontext.DeleteObject(cip)
                sidejobcontext.SaveChanges()
            End If



            'CustomerLostBids
            Dim clb = (From c In sidejobcontext.CustomerLostBids
                           Where c.CustomerID = customerid
                           Select c).ToList()
            If Not (clb.Count <= 0) Then
                For Each cclb In clb
                    sidejobcontext.DeleteObject(cclb)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'CustomerMessages
            Dim cm = (From c In sidejobcontext.CustomerMessages
                           Where c.CustomerID = customerid
                           Select c).ToList()
            If Not (cm.Count <= 0) Then
                For Each ccm In cm
                    sidejobcontext.DeleteObject(ccm)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'CustomerMessageInboxes
            Dim cmi = (From c In sidejobcontext.CustomerMessageInboxes
                           Where c.CustomerID = customerid
                           Select c).ToList()
            If Not (cmi.Count <= 0) Then
                For Each ccmi In cmi
                    sidejobcontext.DeleteObject(ccmi)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'CustomerMessageOutboxes
            Dim cmb = (From c In sidejobcontext.CustomerMessageOutboxes
                           Where c.CustomerID = customerid
                           Select c).ToList()
            If Not (cmb.Count <= 0) Then
                For Each ccmb In cmb
                    sidejobcontext.DeleteObject(ccmb)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'CustomerMessageSaveds
            Dim cms = (From c In sidejobcontext.CustomerMessageSaveds
                           Where c.CustomerID = customerid
                           Select c).ToList()
            If Not (cms.Count <= 0) Then
                For Each ccms In cms
                    sidejobcontext.DeleteObject(ccms)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'CustomerOpenProjectsTemps
            Dim copt = (From c In sidejobcontext.CustomerOpenProjectsTemps
                         Where c.CustomerID = customerid
                         Select c).ToList()
            If Not (copt.Count <= 0) Then
                For Each ccopt In copt
                    sidejobcontext.DeleteObject(ccopt)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerPaymentDues
            Dim cpd = (From c In sidejobcontext.CustomerPaymentDues
             Where c.CustomerID = customerid
             Select c).ToList()
            If Not (cpd.Count <= 0) Then
                For Each ccpd In cpd
                    sidejobcontext.DeleteObject(ccpd)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerPhotoes
            Dim cppt = (From c In sidejobcontext.CustomerPhotoes
             Where c.CustomerID = customerid
             Select c).ToList()
            If Not (cppt.Count <= 0) Then
                For Each ccppt In cppt
                    sidejobcontext.DeleteObject(ccppt)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerPictures
            Dim cpicture = (From c In sidejobcontext.CustomerPictures
             Where c.CustomerID = customerid
             Select c).ToList()
            If Not (cpicture.Count <= 0) Then
                For Each ccpicture In cpicture
                    sidejobcontext.DeleteObject(ccpicture)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerPortfolios
            Dim cportfolio = (From c In sidejobcontext.CustomerPortfolios
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (cportfolio Is Nothing) Then
                sidejobcontext.DeleteObject(cportfolio)
                sidejobcontext.SaveChanges()
            End If


            'CustomerProjects
            Dim cp = (From c In sidejobcontext.CustomerProjects
             Where c.CustomerID = customerid
             Select c).ToList()
            If Not (cp.Count <= 0) Then
                For Each ccp In cp
                    sidejobcontext.DeleteObject(ccp)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerProjectTemps
            Dim cpt = (From c In sidejobcontext.CustomerProjectTemps
             Where c.CustomerID = customerid
             Select c).ToList()
            If Not (cpt.Count <= 0) Then
                For Each ccpt In cpt
                    sidejobcontext.DeleteObject(ccpt)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerRatings
            Dim crating = (From c In sidejobcontext.CustomerRatings
             Where c.CustomerID = customerid
             Select c).ToList()
            If Not (crating.Count <= 0) Then
                For Each ccrating In crating
                    sidejobcontext.DeleteObject(ccrating)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerRevokedBids
            Dim crb = (From c In sidejobcontext.CustomerRevokedBids
             Where c.CustomerID = customerid
             Select c).ToList()
            If Not (crb.Count <= 0) Then
                For Each ccrb In copt
                    sidejobcontext.DeleteObject(ccrb)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerSpecificInformations
            Dim csi = (From c In sidejobcontext.CustomerSpecificInformations
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (csi Is Nothing) Then
                sidejobcontext.DeleteObject(csi)
                sidejobcontext.SaveChanges()
            End If



            'CustomerStartingPayments
            Dim csp = (From c In sidejobcontext.CustomerStartingPayments
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (csp.Count <= 0) Then
                For Each ccsp In csp
                    sidejobcontext.DeleteObject(ccsp)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'CustomerSuccesfulIPN
            Dim csuccessfulipn = (From c In sidejobcontext.CustomerSuccesfulIPNs
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (csuccessfulipn.Count <= 0) Then
                For Each ccsipn In csuccessfulipn
                    sidejobcontext.DeleteObject(ccsipn)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerSuccessfulPDT
            Dim cspdt = (From c In sidejobcontext.CustomerSuccessfulPDTs
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (cspdt.Count <= 0) Then
                For Each ccspdt In cspdt
                    sidejobcontext.DeleteObject(ccspdt)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerSuspiciousIPN
            Dim csipn = (From c In sidejobcontext.CustomerSuspiciousIPNs
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (csipn.Count <= 0) Then
                For Each ccsipn In csipn
                    sidejobcontext.DeleteObject(ccsipn)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerTempWatchLists
            Dim ctwl = (From c In sidejobcontext.CustomerTempWatchLists
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (ctwl.Count <= 0) Then
                For Each cctwl In ctwl
                    sidejobcontext.DeleteObject(cctwl)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerTransactions
            Dim ctransaction = (From c In sidejobcontext.CustomerTransactions
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (ctransaction.Count <= 0) Then
                For Each cctransaction In ctransaction
                    sidejobcontext.DeleteObject(cctransaction)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerTransactionHistories
            Dim cth = (From c In sidejobcontext.CustomerTransactionHistories
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (cth.Count <= 0) Then
                For Each ccth In cth
                    sidejobcontext.DeleteObject(ccth)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'CustomerTransactionPendings
            Dim ctp = (From c In sidejobcontext.CustomerTransactionPendings
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (ctp.Count <= 0) Then
                For Each cctp In ctp
                    sidejobcontext.DeleteObject(cctp)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerVerifiedIPNs
            Dim cvipn = (From c In sidejobcontext.CustomerVerifiedIPNs
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (cvipn.Count <= 0) Then
                For Each ccvipn In cvipn
                    sidejobcontext.DeleteObject(ccvipn)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerWatchLists
            Dim cwl = (From c In sidejobcontext.CustomerWatchLists
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (cwl.Count <= 0) Then
                For Each ccwl In cwl
                    sidejobcontext.DeleteObject(ccwl)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'CustomerWinBids
            Dim cwb = (From c In sidejobcontext.CustomerWinBids
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (cwb.Count <= 0) Then
                For Each ccwb In cwb
                    sidejobcontext.DeleteObject(ccwb)
                    sidejobcontext.SaveChanges()
                Next
            End If

            'Customer
            Dim customer = (From c In sidejobcontext.Customers
                           Where c.CustomerID = customerid
                           Select c).FirstOrDefault()
            If Not (customer Is Nothing) Then
                sidejobcontext.DeleteObject(customer)
                sidejobcontext.SaveChanges()
            End If


            'LookUpCustomer
            Dim luc = (From c In sidejobcontext.LookUpRoles
                          Where c.CustomerId = customerid
                          Select c).FirstOrDefault()
            If Not (luc Is Nothing) Then
                sidejobcontext.DeleteObject(luc)
                sidejobcontext.SaveChanges()
            End If


            ''LockedCustomer
            Dim loc = (From c In sidejobcontext.LockedCustomers
                Where c.CustomerID = customerid
                Select c).FirstOrDefault()
            If Not (loc Is Nothing) Then
                sidejobcontext.DeleteObject(loc)
                sidejobcontext.SaveChanges()
            End If


            'ArchivedCustomerPayment
            Dim acp = (From c In sidejobcontext.ArchivedCustomerPayments
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (acp.Count <= 0) Then
                For Each cacp In acp
                    sidejobcontext.DeleteObject(acp)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ArchievedCustomerPaymentDue
            Dim acpd = (From c In sidejobcontext.ArchivedCustomerPaymentDues
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (acpd.Count <= 0) Then
                For Each cacpd In acpd
                    sidejobcontext.DeleteObject(cacpd)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ArchievedCustomerSuccessfulIPN
            Dim acsi = (From c In sidejobcontext.ArchivedCustomerSuccesfulIPNs
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (acsi.Count <= 0) Then
                For Each cacsi In acsi
                    sidejobcontext.DeleteObject(cacsi)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ArchivdCustomerSuccessfulPDT
            Dim acsp = (From c In sidejobcontext.ArchivedCustomerSuccessfulPDTs
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (acsp.Count <= 0) Then
                For Each cacsp In acsp
                    sidejobcontext.DeleteObject(cacsp)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'RefundCustomerSuccessfulPDT
            Dim rcsp = (From c In sidejobcontext.RefundCustomerSuccessfulPDTs
            Where c.CustomerID = customerid
            Select c).ToList()
            If Not (rcsp.Count <= 0) Then
                For Each crcsp In rcsp
                    sidejobcontext.DeleteObject(crcsp)
                    sidejobcontext.SaveChanges()
                Next
            End If



        End Using
    End Sub















    Public Shared Sub DeleteProfessional()
        Using sidejobcontext = New SidejobEntities()
            Dim proID = Integer.Parse(GetProfessionalID(GetUserID()))

            'ProfessionalAdditionalInformations
            Dim pai = (From c In sidejobcontext.ProfessionalAdditionalInformations
                           Where c.ProID = proID
                           Select c).FirstOrDefault()
            If Not (pai Is Nothing) Then
                sidejobcontext.DeleteObject(pai)
                sidejobcontext.SaveChanges()
            End If



            'ProfessionalComments
            Dim pc = (From c In sidejobcontext.ProfessionalComments
                           Where c.ProID = proID
                           Select c).FirstOrDefault()
            If Not (pc Is Nothing) Then
                sidejobcontext.DeleteObject(pc)
                sidejobcontext.SaveChanges()
            End If



            'ProfessionalCommentReceiveds
            Dim pcr = (From c In sidejobcontext.ProfessionalCommentReceiveds
                           Where c.ProID = proID
                           Select c).FirstOrDefault()
            If Not (pcr Is Nothing) Then
                sidejobcontext.DeleteObject(pcr)
                sidejobcontext.SaveChanges()
            End If



            'ProfessionalCommentReceivedSummaries
            Dim pcrs = (From c In sidejobcontext.ProfessionalCommentReceivedSummaries
                           Where c.ProID = proID
                           Select c).FirstOrDefault()
            If Not (pcrs Is Nothing) Then
                sidejobcontext.DeleteObject(pcrs)
                sidejobcontext.SaveChanges()
            End If



            'ProfessionalSents
            Dim pcs = (From c In sidejobcontext.ProfessionalCommentSents
                           Where c.ProID = proID
                           Select c).FirstOrDefault()
            If Not (pcs Is Nothing) Then
                sidejobcontext.DeleteObject(pcs)
                sidejobcontext.SaveChanges()
            End If



            'ProfessionalCompletedTransactions
            Dim pct = (From c In sidejobcontext.ProfessionalCompletedTransactions
                           Where c.ProID = proID
                           Select c).FirstOrDefault()
            If Not (pct Is Nothing) Then
                sidejobcontext.DeleteObject(pct)
                sidejobcontext.SaveChanges()
            End If



            'ProfessionalContracts
            Dim pcontract = (From c In sidejobcontext.ProfessionalContracts
                           Where c.ProID = proID
                           Select c).FirstOrDefault()
            If Not (pcontract Is Nothing) Then
                sidejobcontext.DeleteObject(pcontract)
                sidejobcontext.SaveChanges()
            End If



            'ProfessionalEvents
            Dim pe = (From c In sidejobcontext.ProfessionalEvents
                           Where c.ProID = proID
                           Select c).FirstOrDefault()
            If Not (pe Is Nothing) Then
                sidejobcontext.DeleteObject(pe)
                sidejobcontext.SaveChanges()
            End If



            'ProfessionalFavorites
            Dim pf = (From c In sidejobcontext.ProfessionalFavorites
                           Where c.ProID = proID
                           Select c).FirstOrDefault()
            If Not (pf Is Nothing) Then
                sidejobcontext.DeleteObject(pf)
                sidejobcontext.SaveChanges()
            End If



            'ProfessionalGeneral
            Dim pg = (From c In sidejobcontext.ProfessionalGenerals
                           Where c.ProID = proID
                           Select c).FirstOrDefault()
            If Not (pg Is Nothing) Then
                sidejobcontext.DeleteObject(pg)
                sidejobcontext.SaveChanges()
            End If



            'ProfessionalHackedPDTs
            Dim phpdt = (From c In sidejobcontext.ProfessionalHackedPDTs
                           Where c.ProID = proID
                           Select c).FirstOrDefault()
            If Not (phpdt Is Nothing) Then
                sidejobcontext.DeleteObject(phpdt)
                sidejobcontext.SaveChanges()
            End If



            'ProfessionalBids
            Dim pb = (From c In sidejobcontext.ProfessionalBids
            Where c.ProID = proID
            Select c).ToList()
            If Not (pb.Count <= 0) Then
                For Each ppb In pb
                    Dim bidID As Integer = ppb.BidID

                    'ProfessionalHistoryBid
                    Dim phb = (From c In sidejobcontext.ProfessionalBids
                    Where c.BidID = bidID
                    Select c).FirstOrDefault()
                    sidejobcontext.DeleteObject(phb)
                    sidejobcontext.SaveChanges()

                    'ProfessionalBid
                    sidejobcontext.DeleteObject(ppb)
                    sidejobcontext.SaveChanges()

                    'Bid
                    Dim bid = (From c In sidejobcontext.Bids
                    Where c.BidID = bidID
                    Select c).FirstOrDefault()
                    sidejobcontext.DeleteObject(bid)
                    sidejobcontext.SaveChanges()

                Next
            End If


            'ProfessionalInvitationReceiveds
            Dim pir = (From c In sidejobcontext.ProfessionalInvitationReceiveds
                           Where c.ProID = proID
                           Select c).ToList()
            If Not (pir.Count <= 0) Then
                For Each ppir In pir
                    sidejobcontext.DeleteObject(ppir)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'ProfessionalInvitationSents
            Dim pis = (From c In sidejobcontext.ProfessionalInvitationSents
                           Where c.ProID = proID
                           Select c).ToList()
            If Not (pis.Count <= 0) Then
                For Each pcis In pis
                    sidejobcontext.DeleteObject(pcis)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'ProfessionalIPNs
            Dim pip = (From c In sidejobcontext.ProfessionalIPNs
                           Where c.ProID = proID
                           Select c).FirstOrDefault()
            If Not (pip Is Nothing) Then
                sidejobcontext.DeleteObject(pip)
                sidejobcontext.SaveChanges()
            End If



            'ProfessionalMessages
            Dim pm = (From c In sidejobcontext.ProfessionalMessages
                           Where c.ProID = proID
                           Select c).ToList()
            If Not (pm.Count <= 0) Then
                For Each pcm In pm
                    sidejobcontext.DeleteObject(pcm)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'ProfessionalMessageInboxes
            Dim pmi = (From c In sidejobcontext.ProfessionalMessageInboxes
                           Where c.ProID = proID
                           Select c).ToList()
            If Not (pmi.Count <= 0) Then
                For Each pcmi In pmi
                    sidejobcontext.DeleteObject(pcmi)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'ProfessionalMessageOutboxes
            Dim pmb = (From c In sidejobcontext.ProfessionalMessageOutboxes
                           Where c.ProID = proID
                           Select c).ToList()
            If Not (pmb.Count <= 0) Then
                For Each pcmb In pmb
                    sidejobcontext.DeleteObject(pcmb)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'ProfessionalMessageSaveds
            Dim pms = (From c In sidejobcontext.ProfessionalMessageSaveds
                           Where c.ProID = proID
                           Select c).ToList()
            If Not (pms.Count <= 0) Then
                For Each pcms In pms
                    sidejobcontext.DeleteObject(pcms)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'ProfessionalOpenProjectsTemps
            Dim popt = (From c In sidejobcontext.ProfessionalOpenProjectsTemps
                         Where c.ProID = proID
                         Select c).ToList()
            If Not (popt.Count <= 0) Then
                For Each pcopt In popt
                    sidejobcontext.DeleteObject(pcopt)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalPaymentDues
            Dim ppd = (From c In sidejobcontext.ProfessionalPaymentDues
             Where c.ProID = proID
             Select c).ToList()
            If Not (ppd.Count <= 0) Then
                For Each pcpd In ppd
                    sidejobcontext.DeleteObject(pcpd)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalPhotoes
            Dim pppt = (From c In sidejobcontext.ProfessionalPhotoes
             Where c.ProID = proID
             Select c).ToList()
            If Not (pppt.Count <= 0) Then
                For Each pcppt In pppt
                    sidejobcontext.DeleteObject(pcppt)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalPictures
            Dim ppicture = (From c In sidejobcontext.ProfessionalPictures
             Where c.ProID = proID
             Select c).ToList()
            If Not (ppicture.Count <= 0) Then
                For Each pcpicture In ppicture
                    sidejobcontext.DeleteObject(pcpicture)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalPortfolios
            Dim pportfolio = (From c In sidejobcontext.ProfessionalPortfolios
                           Where c.ProID = proID
                           Select c).FirstOrDefault()
            If Not (pportfolio Is Nothing) Then
                sidejobcontext.DeleteObject(pportfolio)
                sidejobcontext.SaveChanges()
            End If


            'ProfessionalProjects
            Dim pp = (From c In sidejobcontext.ProfessionalProjects
             Where c.ProID = proID
             Select c).ToList()
            If Not (pp.Count <= 0) Then
                For Each pcp In pp
                    sidejobcontext.DeleteObject(pcp)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalProjectTemps
            Dim ppt = (From c In sidejobcontext.ProfessionalProjectTemps
             Where c.ProID = proID
             Select c).ToList()
            If Not (ppt.Count <= 0) Then
                For Each pcpt In ppt
                    sidejobcontext.DeleteObject(pcpt)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalRatings
            Dim prating = (From c In sidejobcontext.ProfessionalRatings
             Where c.ProID = proID
             Select c).ToList()
            If Not (prating.Count <= 0) Then
                For Each pprating In prating
                    sidejobcontext.DeleteObject(pprating)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalRevokedBids
            Dim prb = (From c In sidejobcontext.ProfessionalRevokedBids
             Where c.ProID = proID
             Select c).ToList()
            If Not (prb.Count <= 0) Then
                For Each pprb In popt
                    sidejobcontext.DeleteObject(pprb)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalSpecificInformations
            Dim psi = (From c In sidejobcontext.ProfessionalSpecificInformations
                           Where c.ProID = proID
                           Select c).FirstOrDefault()
            If Not (psi Is Nothing) Then
                sidejobcontext.DeleteObject(psi)
                sidejobcontext.SaveChanges()
            End If



            'ProfessionalStartingPayments
            Dim psp = (From c In sidejobcontext.ProfessionalStartingPayments
            Where c.ProID = proID
            Select c).ToList()
            If Not (psp.Count <= 0) Then
                For Each ppsp In psp
                    sidejobcontext.DeleteObject(ppsp)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'ProfessionalSuccesfulIPN
            Dim psuccessfulipn = (From c In sidejobcontext.ProfessionalSuccesfulIPNs
            Where c.ProID = proID
            Select c).ToList()
            If Not (psuccessfulipn.Count <= 0) Then
                For Each ppsipn In psuccessfulipn
                    sidejobcontext.DeleteObject(ppsipn)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalSuccessfulPDT
            Dim pspdt = (From c In sidejobcontext.ProfessionalSuccessfulPDTs
            Where c.ProID = proID
            Select c).ToList()
            If Not (pspdt.Count <= 0) Then
                For Each ppsdt In pspdt
                    sidejobcontext.DeleteObject(ppsdt)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalSuspiciousIPN
            Dim psipn = (From c In sidejobcontext.ProfessionalSuspiciousIPNs
            Where c.ProID = proID
            Select c).ToList()
            If Not (psipn.Count <= 0) Then
                For Each ppsipn In psipn
                    sidejobcontext.DeleteObject(ppsipn)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalTempWatchLists
            Dim ptwl = (From c In sidejobcontext.ProfessionalTempWatchLists
            Where c.ProID = proID
            Select c).ToList()
            If Not (ptwl.Count <= 0) Then
                For Each pptwl In ptwl
                    sidejobcontext.DeleteObject(pptwl)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalTransactions
            Dim ptransaction = (From c In sidejobcontext.ProfessionalTransactions
            Where c.ProID = proID
            Select c).ToList()
            If Not (ptransaction.Count <= 0) Then
                For Each pptransaction In ptransaction
                    sidejobcontext.DeleteObject(pptransaction)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalTransactionHistories
            Dim pth = (From c In sidejobcontext.ProfessionalTransactionHistories
            Where c.ProID = proID
            Select c).ToList()
            If Not (pth.Count <= 0) Then
                For Each ppth In pth
                    sidejobcontext.DeleteObject(ppth)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'ProfessionalTransactionPendings
            Dim ptp = (From c In sidejobcontext.ProfessionalTransactionPendings
            Where c.ProID = proID
            Select c).ToList()
            If Not (ptp.Count <= 0) Then
                For Each pptp In ptp
                    sidejobcontext.DeleteObject(pptp)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalVerifiedIPNs
            Dim pvipn = (From c In sidejobcontext.ProfessionalVerifiedIPNs
            Where c.ProID = proID
            Select c).ToList()
            If Not (pvipn.Count <= 0) Then
                For Each ppvipn In pvipn
                    sidejobcontext.DeleteObject(ppvipn)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalWatchLists
            Dim pwl = (From c In sidejobcontext.ProfessionalWatchLists
            Where c.ProID = proID
            Select c).ToList()
            If Not (pwl.Count <= 0) Then
                For Each ppwl In pwl
                    sidejobcontext.DeleteObject(ppwl)
                    sidejobcontext.SaveChanges()
                Next
            End If









            'ProfessionalWorkPhotoes
            Dim ppphoto = (From c In sidejobcontext.ProfessionalWorkPhotoes
             Where c.ProID = proID
             Select c).ToList()
            If Not (ppphoto.Count <= 0) Then
                For Each ccpphoto In ppphoto
                    sidejobcontext.DeleteObject(ccpphoto)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalProjectPictures
            Dim pppicture = (From c In sidejobcontext.ProfessionalWorkPictures
             Where c.ProID = proID
             Select c).ToList()
            If Not (pppicture.Count <= 0) Then
                For Each pcppicture In pppicture
                    sidejobcontext.DeleteObject(pcppicture)
                    sidejobcontext.SaveChanges()
                Next
            End If



            'ProfessionalWorkTemp
            Dim pwt = (From c In sidejobcontext.ProfessionalWorkTemps
            Where c.ProID = proID
            Select c).FirstOrDefault()
            If Not (pwt Is Nothing) Then
                sidejobcontext.DeleteObject(pwt)
                sidejobcontext.SaveChanges()
            End If


            'ProfessionalOptional
            Dim po = (From c In sidejobcontext.ProfessionalOptionals
                          Where c.ProID = proID
                          Select c).FirstOrDefault()
            If Not (po Is Nothing) Then
                sidejobcontext.DeleteObject(po)
                sidejobcontext.SaveChanges()
            End If



            'LookUpProfessional
            Dim lup = (From c In sidejobcontext.LookUpRoles
                          Where c.ProfessionalId = proID
                          Select c).FirstOrDefault()
            If Not (lup Is Nothing) Then
                sidejobcontext.DeleteObject(lup)
                sidejobcontext.SaveChanges()
            End If


            ''LockedProfessional
            Dim lop = (From c In sidejobcontext.LockedProfessionals
                Where c.ProID = proID
                Select c).FirstOrDefault()
            If Not (lop Is Nothing) Then
                sidejobcontext.DeleteObject(lop)
                sidejobcontext.SaveChanges()
            End If


            'ArchivedProfessionalPayment
            Dim app = (From c In sidejobcontext.ArchivedProfessionalPayments
            Where c.ProID = proID
            Select c).ToList()
            If Not (app.Count <= 0) Then
                For Each papp In app
                    sidejobcontext.DeleteObject(papp)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ArchievedProfessionalPaymentDue
            Dim appd = (From c In sidejobcontext.ArchivedProfessionalPaymentDues
            Where c.ProID = proID
            Select c).ToList()
            If Not (appd.Count <= 0) Then
                For Each pappd In appd
                    sidejobcontext.DeleteObject(pappd)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ArchievedProfessionalSuccessfulIPN
            Dim apsi = (From c In sidejobcontext.ArchivedProfessionalSuccesfulIPNs
            Where c.ProID = proID
            Select c).ToList()
            If Not (apsi.Count <= 0) Then
                For Each papsi In apsi
                    sidejobcontext.DeleteObject(papsi)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ArchivdProfessionalSuccessfulPDT
            Dim apsp = (From c In sidejobcontext.ArchivedProfessionalSuccessfulPDTs
            Where c.ProID = proID
            Select c).ToList()
            If Not (apsp.Count <= 0) Then
                For Each papsp In apsp
                    sidejobcontext.DeleteObject(papsp)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'RefundProfessionalSuccessfulPDT
            Dim rcsp = (From c In sidejobcontext.RefundProfessionalSuccessfulPDTs
            Where c.ProID = proID
            Select c).ToList()
            If Not (rcsp.Count <= 0) Then
                For Each prcsp In rcsp
                    sidejobcontext.DeleteObject(prcsp)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'TopPRofessional
            Dim tp = (From c In sidejobcontext.TopProfessionals
            Where c.ProID = proID
            Select c).FirstOrDefault()
            If Not (tp Is Nothing) Then
                sidejobcontext.DeleteObject(tp)
                sidejobcontext.SaveChanges()
            End If


            'ProfessionalWinBids
            Dim pwb = (From c In sidejobcontext.ProfessionalWinBids
            Where c.ProID = proID
            Select c).ToList()
            If Not (pwb.Count <= 0) Then
                For Each ppwb In pwb
                    sidejobcontext.DeleteObject(ppwb)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalLostBids
            Dim plb = (From c In sidejobcontext.ProfessionalLostBids
            Where c.ProID = proID
            Select c).ToList()
            If Not (plb.Count <= 0) Then
                For Each pplb In plb
                    sidejobcontext.DeleteObject(pplb)
                    sidejobcontext.SaveChanges()
                Next
            End If


            'ProfessionalSkill
            Dim ps = (From c In sidejobcontext.ProfessionalSkills
               Where c.ProID = proID
               Select c).ToList()
            If Not (ps.Count <= 0) Then
                For Each pps In ps
                    'Skills
                    Dim specificskillid As Integer = pps.SkillID
                    Dim sk = (From c In sidejobcontext.Skills
                              Where c.SkillID = specificskillid
                              Select c).FirstOrDefault()
                    sidejobcontext.DeleteObject(sk)
                    sidejobcontext.SaveChanges()

                    'ProfessionalSkill
                    sidejobcontext.DeleteObject(pps)
                    sidejobcontext.SaveChanges()
                Next
            End If
            'Skill



            'Professional
            Dim professional = (From c In sidejobcontext.Professionals
                           Where c.ProID = proID
                           Select c).FirstOrDefault()
            If Not (professional Is Nothing) Then
                sidejobcontext.DeleteObject(professional)
                sidejobcontext.SaveChanges()
            End If
        End Using
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
