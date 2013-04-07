
Imports System.Data.SqlClient
Imports System.Data
Imports System.Net.Mail
Imports System.Globalization
Imports System.Threading

Partial Class NotAuthenticated_testprofessionalresults
    Inherits System.Web.UI.Page

    Public Experience As String
    Public Licensed As String
    Public Crew As String
    Public Insured As String
    Public Relocation As String
    Public MHA As String
    Public ProjectCompleted As String
    Public Reputation As String
    Public Industry As String
    Public JobTitle() As String
    Public Zipcode As String
    Public Flag As String
    Public CustomZipCode As String
    Public _language As Integer
    Public DefaultSelection As String = "SELECT ProfessionalSkill.ProID, ProfessionalGeneral.UserName, ProfessionalGeneral.CountryName," + _
                             "  (SELECT Path FROM CountriesUpdate WHERE (CountryId = ProfessionalGeneral.CountryID)) AS CountryFlag, ProfessionalGeneral.RegionName," + _
                             " Skills.CategoryID, Skills.CategoryName, Skills.JobID,  Skills.JobTitle, ProfessionalAdditionalInformation.Rank, ProfessionalAdditionalInformation.Points," + _
                             " ProfessionalAdditionalInformation.Reputation,  ProfessionalAdditionalInformation.ProjectCompleted, ProfessionalAdditionalInformation.MoneyEarned, ProfessionalAdditionalInformation.ProjectCompleted" + _
                             " + ProfessionalAdditionalInformation.ProjectCanceled AS TotalProject, SUBSTRING(ProfessionalPortfolio.About, 0,  100) AS About, ProfessionalRating.IntRate,ProfessionalGeneral.PhotoPath" + _
                             " FROM  Skills INNER JOIN" + _
                             " ProfessionalSkill ON Skills.SkillID = ProfessionalSkill.SkillID INNER JOIN" + _
                             " ProfessionalGeneral ON ProfessionalSkill.ProID = ProfessionalGeneral.ProID INNER JOIN" + _
                             " ProfessionalAdditionalInformation ON ProfessionalGeneral.ProID = ProfessionalAdditionalInformation.ProID INNER JOIN" + _
                             " ProfessionalPortfolio ON ProfessionalGeneral.ProID = ProfessionalPortfolio.ProID INNER JOIN" + _
                             " ProfessionalRating ON ProfessionalGeneral.ProID = ProfessionalRating.ProID" + _
                             " WHERE(ProfessionalPortfolio.Modified = 0) "

    Public Property Language() As Integer
        Get
            Return _language
        End Get
        Set(ByVal value As Integer)
            value = _language
        End Set
    End Property

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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            Try

                If Not (Session("ProfessionalQuery") Is Nothing) Then

                    ProfessionalResultSqlDataSource.SelectCommand = Session("ProfessionalQuery").ToString

                    If Len(Request.QueryString("m")) <> 0 Then

                        Dim SearchProfessionalTableAdapter As New SearchProfessionalDataSetTableAdapters.DefaultSearchDataTableTableAdapter
                        Dim SearchProfessionalDataTable As New SearchProfessionalDataSet.DefaultSearchDataTableDataTable

                        Select Case (Request.QueryString("m").ToString())

                            Case "advanced"
                                If Not (Session("Experience").ToString() Is Nothing) Then
                                    ExperienceDropDownList.SelectedIndex = Session("Experience").ToString()
                                Else
                                    ExperienceDropDownList.SelectedIndex = 0
                                End If

                                If Not (Session("Licensed").ToString() Is Nothing) Then
                                    LicensedDropDownList.SelectedIndex = Session("Licensed").ToString
                                Else
                                    LicensedDropDownList.SelectedIndex = 0
                                End If

                                If Not (Session("Crew").ToString() Is Nothing) Then
                                    CrewNumberDropDownList.SelectedIndex = Session("Crew").ToString
                                Else
                                    CrewNumberDropDownList.SelectedIndex = 0
                                End If

                                If Not (Session("Insured").ToString() Is Nothing) Then
                                    InsuredDropDownList.SelectedIndex = Session("Insured").ToString
                                Else
                                    InsuredDropDownList.SelectedIndex = 0
                                End If

                                If Not (Session("Relocation").ToString() Is Nothing) Then
                                    RelocationDropDownList.SelectedIndex = Session("Relocation").ToString
                                Else
                                    RelocationDropDownList.SelectedIndex = 0
                                End If

                                If Not (Session("MustHaveAccomplishement").ToString() Is Nothing) Then
                                    AccomplishementMustHaveDropDownList.SelectedIndex = Session("MustHaveAccomplishement").ToString
                                Else
                                    AccomplishementMustHaveDropDownList.SelectedIndex = 0
                                End If

                                If Not (Session("Reputation").ToString() Is Nothing) Then
                                    ReputationTargetTextBox.Text = Session("Reputation").ToString
                                Else
                                    ReputationTargetTextBox.Text = 0
                                End If

                                If Not (Session("ProjectCompleted").ToString() Is Nothing) Then
                                    ProjectsCompletedTargetTextBox.Text = Session("ProjectCompleted").ToString
                                Else
                                    ProjectsCompletedTargetTextBox.Text = 0
                                End If

                                If Not (Request.QueryString("zip") Is Nothing) Then
                                    FromTextBox.Text = Request.QueryString("zip").ToString()
                                End If

                            Case "basicusername"
                                Dim UserName As String = Request.QueryString("un").ToString()
                                SearchProfessionalTableAdapter.FillByUsername(SearchProfessionalDataTable, UserName.ToString())
                                If SearchProfessionalDataTable.Rows.Count = 0 Then
                                    ProfessionalResultSqlDataSource.SelectCommand = "SELECT ProfessionalSkill.ProID, ProfessionalGeneral.UserName, ProfessionalGeneral.CountryName," + _
                                         "  (SELECT Path FROM CountriesUpdate WHERE (CountryId = ProfessionalGeneral.CountryID)) AS CountryFlag, ProfessionalGeneral.RegionName," + _
                                         " Skills.CategoryID, Skills.CategoryName, Skills.JobID,  Skills.JobTitle, ProfessionalAdditionalInformation.Rank, ProfessionalAdditionalInformation.Points," + _
                                         " ProfessionalAdditionalInformation.Reputation,  ProfessionalAdditionalInformation.ProjectCompleted, ProfessionalAdditionalInformation.MoneyEarned, ProfessionalAdditionalInformation.ProjectCompleted" + _
                                         " + ProfessionalAdditionalInformation.ProjectCanceled AS TotalProject, SUBSTRING(ProfessionalPortfolio.About, 0,  100) AS About, ProfessionalRating.IntRate, ProfessionalGeneral.PhotoPath" + _
                                         " FROM  Skills INNER JOIN" + _
                                         " ProfessionalSkill ON Skills.SkillID = ProfessionalSkill.SkillID INNER JOIN" + _
                                         " ProfessionalGeneral ON ProfessionalSkill.ProID = ProfessionalGeneral.ProID INNER JOIN" + _
                                         " ProfessionalAdditionalInformation ON ProfessionalGeneral.ProID = ProfessionalAdditionalInformation.ProID INNER JOIN" + _
                                         " ProfessionalPortfolio ON ProfessionalGeneral.ProID = ProfessionalPortfolio.ProID INNER JOIN" + _
                                         " ProfessionalRating ON ProfessionalGeneral.ProID = ProfessionalRating.ProID" + _
                                         " WHERE(ProfessionalGeneral.ProID = -100)"
                                Else
                                    ProfessionalResultSqlDataSource.SelectCommand = Session("ProfessionalQuery").ToString

                                End If

                            Case "custom"
                                Dim ProID As String = Request.QueryString("custom").ToString()
                                SearchProfessionalTableAdapter.FillCustom(SearchProfessionalDataTable, ProID.ToString())

                                If SearchProfessionalDataTable.Rows.Count = 0 Then
                                    ProfessionalResultSqlDataSource.SelectCommand = "SELECT ProfessionalSkill.ProID, ProfessionalGeneral.UserName, ProfessionalGeneral.CountryName," + _
                                         "  (SELECT Path FROM CountriesUpdate WHERE (CountryId = ProfessionalGeneral.CountryID)) AS CountryFlag, ProfessionalGeneral.RegionName," + _
                                         " Skills.CategoryID, Skills.CategoryName, Skills.JobID,  Skills.JobTitle, ProfessionalAdditionalInformation.Rank, ProfessionalAdditionalInformation.Points," + _
                                         " ProfessionalAdditionalInformation.Reputation,  ProfessionalAdditionalInformation.ProjectCompleted, ProfessionalAdditionalInformation.MoneyEarned, ProfessionalAdditionalInformation.ProjectCompleted" + _
                                         " + ProfessionalAdditionalInformation.ProjectCanceled AS TotalProject, SUBSTRING(ProfessionalPortfolio.About, 0,  100) AS About, ProfessionalRating.IntRate, ProfessionalGeneral.PhotoPath" + _
                                         " FROM  Skills INNER JOIN" + _
                                         " ProfessionalSkill ON Skills.SkillID = ProfessionalSkill.SkillID INNER JOIN" + _
                                         " ProfessionalGeneral ON ProfessionalSkill.ProID = ProfessionalGeneral.ProID INNER JOIN" + _
                                         " ProfessionalAdditionalInformation ON ProfessionalGeneral.ProID = ProfessionalAdditionalInformation.ProID INNER JOIN" + _
                                         " ProfessionalPortfolio ON ProfessionalGeneral.ProID = ProfessionalPortfolio.ProID INNER JOIN" + _
                                         " ProfessionalRating ON ProfessionalGeneral.ProID = ProfessionalRating.ProID" + _
                                         " WHERE(ProfessionalGeneral.ProID = -100)"
                                Else
                                    ProfessionalResultSqlDataSource.SelectCommand = Session("ProfessionalQuery").ToString

                                End If

                            Case "basicskill"
                                ProfessionalResultSqlDataSource.SelectCommand = Session("ProfessionalQuery").ToString

                        End Select
                        ProfessionalResultSqlDataSource.DataBind()
                        ProfessionalResultGridView.DataBind()
                    Else
                        ProfessionalResultSqlDataSource.SelectCommand = Session("ProfessionalQuery").ToString
                        ProfessionalResultSqlDataSource.DataBind()
                        ProfessionalResultGridView.DataBind()
                    End If

                End If
                GetAttribute()
                CustomSelection()
            Catch ex As Exception
                ProfessionalResultSqlDataSource.SelectCommand = "SELECT ProfessionalSkill.ProID, ProfessionalGeneral.UserName, ProfessionalGeneral.CountryName," + _
                              "  (SELECT Path FROM CountriesUpdate WHERE (CountryId = ProfessionalGeneral.CountryID)) AS CountryFlag, ProfessionalGeneral.RegionName," + _
                              " Skills.CategoryID, Skills.CategoryName, Skills.JobID,  Skills.JobTitle, ProfessionalAdditionalInformation.Rank, ProfessionalAdditionalInformation.Points," + _
                              " ProfessionalAdditionalInformation.Reputation,  ProfessionalAdditionalInformation.ProjectCompleted, ProfessionalAdditionalInformation.MoneyEarned, ProfessionalAdditionalInformation.ProjectCompleted" + _
                              " + ProfessionalAdditionalInformation.ProjectCanceled AS TotalProject, SUBSTRING(ProfessionalPortfolio.About, 0,  100) AS About, ProfessionalRating.IntRate,ProfessionalGeneral.PhotoPath" + _
                              " FROM  Skills INNER JOIN" + _
                              " ProfessionalSkill ON Skills.SkillID = ProfessionalSkill.SkillID INNER JOIN" + _
                              " ProfessionalGeneral ON ProfessionalSkill.ProID = ProfessionalGeneral.ProID INNER JOIN" + _
                              " ProfessionalAdditionalInformation ON ProfessionalGeneral.ProID = ProfessionalAdditionalInformation.ProID INNER JOIN" + _
                              " ProfessionalPortfolio ON ProfessionalGeneral.ProID = ProfessionalPortfolio.ProID INNER JOIN" + _
                              " ProfessionalRating ON ProfessionalGeneral.ProID = ProfessionalRating.ProID" + _
                              " WHERE(ProfessionalPortfolio.Modified = 0) AND ProfessionalGeneral.UserName = 'Nothing'"

                ProfessionalResultSqlDataSource.DataBind()
            End Try
            ActivateLanguage()
            CustomZipCode = ""
        End If
        AdjustListBoxStyles()

    End Sub

    Public Sub GetAttribute()

        If Not (Request.QueryString("ex") Is Nothing) Then
            Experience = Request.QueryString("ex").ToString()
        End If

        If Not (Request.QueryString("li") Is Nothing) Then
            Licensed = Request.QueryString("li").ToString()
        End If

        If Not (Request.QueryString("cr") Is Nothing) Then
            Crew = Request.QueryString("cr").ToString()
        End If

        If Not (Request.QueryString("in") Is Nothing) Then
            Insured = Request.QueryString("in").ToString()
        End If

        If Not (Request.QueryString("re") Is Nothing) Then
            Relocation = Request.QueryString("re").ToString()
        End If

        If Not (Request.QueryString("mha") Is Nothing) Then
            MHA = Request.QueryString("mha").ToString()
        End If

        If Not (Request.QueryString("rep") Is Nothing) Then
            Reputation = Request.QueryString("rep").ToString()
        End If

        If Not (Request.QueryString("cp") Is Nothing) Then
            ProjectCompleted = Request.QueryString("cp").ToString()
        End If
        If Not (Request.QueryString("zip") Is Nothing) Then
            Zipcode = Request.QueryString("zip").ToString()
        End If
        If Not (Request.QueryString("flag") Is Nothing) Then
            Flag = Request.QueryString("flag").ToString()
        End If

        If Not (Request.QueryString("ind") Is Nothing) Then
            Industry = Request.QueryString("ind").ToString()
        End If

        If Not (Request.QueryString("jid") Is Nothing) Then
            Dim values As String
            values = Request.QueryString("jid").ToString()
            JobTitle = values.Split(",")
        End If

    End Sub

    Protected Sub ProfessionalResultGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim Role As String = ""
        Dim UserID As String = ""

        Dim CustomerInvitationTableAdpater As New SearchProfessionalDataSetTableAdapters.CustomerInvitationDataTableTableAdapter
        Dim CustomerInvitationDataTable As New SearchProfessionalDataSet.CustomerInvitationDataTableDataTable

        Dim ProfessionalInvitationTableAdpater As New SearchProfessionalDataSetTableAdapters.ProfessionalInvitationDataTableTableAdapter
        Dim ProfessionalInvitationDataTable As New SearchProfessionalDataSet.ProfessionallnvitationDataTableDataTable

        If User.Identity.IsAuthenticated = False Then
            Me.ModalLoginUpdatePanel.Show()
        Else
            Dim guidStringUser As Guid = New Guid(Membership.GetUser.ProviderUserKey().ToString())

            If User.IsInRole("Customer") Then
                Role = "CUS"
                Dim GetCustomerAdapter As New GetUserIDTableAdapters.LookUpRolesTableAdapter
                Dim CustomerTable As New GetUserID.LookUpRolesDataTable
                GetCustomerAdapter.FillCustomerID(CustomerTable, guidStringUser.ToString())
                UserID = CustomerTable.Item(0).CustomerId.ToString

            ElseIf User.IsInRole("Professional") Then
                Role = "PRO"
                Dim GetProfessionalAdapter As New GetUserIDTableAdapters.LookUpProRolesTableAdapter
                Dim ProfessionalTable As New GetUserID.LookUpProRolesDataTable
                GetProfessionalAdapter.FillProfessionalID(ProfessionalTable, guidStringUser.ToString())
                UserID = ProfessionalTable.Item(0).ProfessionalId.ToString
            End If

            If Session("Favorite") = True Then
                Session("Favorite") = False
                Me.ProfessionalResultSqlDataSource.InsertParameters(0).DefaultValue = ProfessionalResultGridView.SelectedPersistedDataKey.Value.ToString()
                Me.ProfessionalResultSqlDataSource.InsertParameters(1).DefaultValue = UserID.ToString()
                Me.ProfessionalResultSqlDataSource.InsertParameters(2).DefaultValue = Role.ToString()
                Me.ProfessionalResultSqlDataSource.Insert()
            End If

            If Session("InvitetoProject") = True Then
                Session("InvitetoProject") = False
                InvitationGridView.DataSource = CustomerInvitationDataTable
                InvitationGridView.DataBind()
                InvitationUpdatePanel.Update()
                LoadingModalPopupExtender.Hide()
                InvitationModalPopupExtender.Show()
            End If

            If Session("Question") = True Then
                Session("Question") = False
                Me.LoadingModalPopupExtender.Hide()
                MessageModalPopupExtender.Show()
            End If

        End If
    End Sub

    Protected Sub ProfessionalResultGridView_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        If Page.IsPostBack = False Then
            Me.ProfessionalResultGridView.SelectedIndex = 1
        End If
    End Sub

    Protected Sub GoToProfileLinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles GoToProfileLinkButton2.Click
        LoadingModalPopupExtender.Show()
        MessageModalPopupExtender.Hide()
        LoadingModalPopupExtender.Hide()
    End Sub

    Protected Sub AskQuestion(ByVal sender As Object, ByVal e As System.EventArgs) Handles AskQuestionLinkButton.Click

        MessageModalPopupExtender.Show()
        LoadingModalPopupExtender.Hide()

        '' SendEmail()
        Dim senderid As String
        Dim receiverid As String
        Dim message As String
        Dim sendername As String
        Dim receivername As String = ""
        Dim senderemail As String = ""
        Dim receiveremail As String
        Dim senderRole As String

        Dim guidStringUser As Guid = New Guid(Membership.GetUser.ProviderUserKey().ToString())

        If User.IsInRole("Customer") Then

            ''CustomerID 
            Dim GetCustomerIDAdapter As New GetUserIDTableAdapters.LookUpRolesTableAdapter
            Dim CustomerIDTable As New GetUserID.LookUpRolesDataTable
            GetCustomerIDAdapter.FillCustomerID(CustomerIDTable, guidStringUser.ToString())
            Dim CustomerID As String = CustomerIDTable.Item(0).CustomerId.ToString

            ''Customer General 
            Dim CustomerInformationAdapter As New GetUserInformationTableAdapters.CustomerGeneralTableAdapter
            Dim CustomerInformationTable As New GetUserInformation.CustomerGeneralDataTable
            CustomerInformationAdapter.FillCustomerInformation(CustomerInformationTable, CustomerID.ToString)

            ''Sender Information
            senderid = CustomerID.ToString()
            senderemail = CustomerInformationTable.Item(0).EmailAddress.ToString()
            sendername = CustomerInformationTable.Item(0).UserName.ToString()
            'MailMessage.isbodyhtml = True ( convert the content into html) see the send email function
            message = MessageCustomEditor.Content.ToString()
            senderRole = 0

        End If

        If User.IsInRole("Professional") Then

            ''ProfessionalID 
            Dim GetProfessionalIDAdapter As New GetUserIDTableAdapters.LookUpProRolesTableAdapter
            Dim ProfessionalIDTable As New GetUserID.LookUpProRolesDataTable
            GetProfessionalIDAdapter.FillProfessionalID(ProfessionalIDTable, guidStringUser.ToString())
            Dim ProfessionalID As String = ProfessionalIDTable.Rows(0).Item(0).ToString

            ''Professional General 
            Dim ProfessionalInformationAdapter As New GetUserInformationTableAdapters.ProfessionalGeneralTableAdapter
            Dim ProfessionalInformationTable As New GetUserInformation.ProfessionalGeneralDataTable
            ProfessionalInformationAdapter.FillProfessionalInformation(ProfessionalInformationTable, ProfessionalID.ToString)

            ''Sender Information
            senderid = ProfessionalID.ToString()
            senderemail = ProfessionalInformationTable.Item(0).EmailAddress.ToString()
            sendername = ProfessionalInformationTable.Item(0).UserName.ToString()
            'MailMessage.isbodyhtml = True ( convert the content into html) see the send email function
            message = MessageCustomEditor.Content.ToString()
            senderRole = 1

        End If

        ''Receiver always a professional
        receiverid = ProfessionalResultGridView.SelectedPersistedDataKey.Value.ToString()

        ''Professional General 
        Dim ReceiverInformationAdapter As New GetUserInformationTableAdapters.ProfessionalGeneralTableAdapter
        Dim ReceiverInformationTable As New GetUserInformation.ProfessionalGeneralDataTable
        ReceiverInformationAdapter.FillProfessionalInformation(ReceiverInformationTable, receiverid.ToString)
        receiveremail = ReceiverInformationTable.Item(0).EmailAddress.ToString()
        receivername = ReceiverInformationTable.Item(0).UserName.ToString()

        ''Database
        Dim AskQuestionAdpater As New GetUserInformationTableAdapters.AskQuestionTableAdapter
        Title = sendername.ToString + " " + Resources.Resource.AskedYouAQuestion.ToString()
        Dim LCID As String = _language.ToString
        Dim QuestionDate As String = Date.UtcNow.ToShortDateString.ToString + " " + Date.UtcNow.ToShortTimeString.ToString
        AskQuestionAdpater.AskQuestion(senderid.ToString(), sendername.ToString(), senderemail.ToString(), receiverid.ToString(), receivername.ToString(), receiveremail.ToString(), message.ToString(), Title.ToString(), LCID.ToString(), QuestionDate.ToString(), senderRole.ToString())

        ''email
        SendEmail(sendername.ToString(), senderemail.ToString(), Title.ToString(), message.ToString(), receivername.ToString(), receiveremail.ToString())
        MessageCustomEditor.Content = ""
        MessageUpdatePanel.Update()
        LoadingModalPopupExtender.Hide()

    End Sub

    Protected Sub SendEmail(ByVal Sender As String, ByVal SenderEmail As String, ByVal Subject As String, ByVal Body As String, ByVal Receiver As String, ByVal ReceiverEmail As String)

        Dim strFrom = SenderEmail.ToString
        Dim strTo = ReceiverEmail.ToString
        Dim MailMsg As New MailMessage(New MailAddress(strFrom.Trim()), New MailAddress(strTo))
        MailMsg.BodyEncoding = Encoding.Default
        Dim SubjectConstruction = Sender + " " + Resources.Resource.AskedYouAQuestion.ToString()
        MailMsg.Subject = SubjectConstruction.ToString
        MailMsg.Body = Body.ToString
        MailMsg.Priority = MailPriority.High
        MailMsg.IsBodyHtml = True
        Dim SmtpMail As New SmtpClient
        Dim basicAuthenticationInfo As New System.Net.NetworkCredential("postmaster@programmingfundamental.com", "haithem759163")
        SmtpMail.Host = "mail.programmingfundamental.com"
        SmtpMail.UseDefaultCredentials = False
        SmtpMail.Credentials = basicAuthenticationInfo
        SmtpMail.Send(MailMsg)

    End Sub

    Protected Sub GoToProfileLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        LoadingModalPopupExtender.Show()
        If User.IsInRole("Customer") Then
            Response.Redirect("../Authenticated/Customer/CustomerProfile.aspx")
        End If

        If User.IsInRole("Professional") Then
            Response.Redirect("../Authenticated/Professional/ProfessionalProfile.aspx")
        End If

    End Sub

    Protected Sub CancelLoginButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ProfessionalResultGridView.SelectedIndexChanged
        ModalLoginUpdatePanel.Hide()
    End Sub

    Protected Sub LoginButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If User.Identity.IsAuthenticated = False Then
            ModalLoginUpdatePanel.Show()
        End If
    End Sub

    Public Sub AdjustListBoxStyles()

        For i = 0 To IndustryListBox.Items.Count - 1
            IndustryListBox.Items(i).Attributes("class") = "dir"
        Next

        For i = 0 To StateListBox.Items.Count - 1
            StateListBox.Items(i).Attributes("class") = "dir"
        Next

        For i = 0 To CityListBox.Items.Count - 1
            CityListBox.Items(i).Attributes("class") = "dir"
        Next

    End Sub

    Public Sub CustomSelection()

        Dim IndustryJobsTableAdapter As New SearchProfessionalDataSetTableAdapters.IndustryJobsTableAdapter
        Dim ProfessionalCountryTableAdapter As New SearchProfessionalDataSetTableAdapters.ProfessionalCountryTableAdapter
        Dim ProfessionalRegionTableAdapter As New SearchProfessionalDataSetTableAdapters.ProfessionalRegionTableAdapter

        Dim IndustryJobsDataTable As New SearchProfessionalDataSet.IndustryJobsDataTable
        Dim StatesDataTable As New SearchProfessionalDataSet.ProfessionalCountryDataTable
        Dim CitiesJobsDataTable As New SearchProfessionalDataSet.ProfessionalRegionDataTable

        IndustryJobsTableAdapter.FillJobsByIndustry(IndustryJobsDataTable)
        IndustryListBox.DataSource = IndustryJobsDataTable
        IndustryListBox.DataBind()

        ProfessionalCountryTableAdapter.FillProfessionalCountry(StatesDataTable)
        StateListBox.DataSource = StatesDataTable
        StateListBox.DataBind()

        ProfessionalRegionTableAdapter.FillProfessionalRegion(CitiesJobsDataTable)
        CityListBox.DataSource = CitiesJobsDataTable
        CityListBox.DataBind()

        IndustryListBox.SelectedIndex = -1
        StateListBox.SelectedIndex = -1
        CityListBox.SelectedIndex = -1

    End Sub

    Protected Sub IndustryListBox_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles IndustryListBox.SelectedIndexChanged

        LoadingModalPopupExtender.Show()
        Session("ProfessionalQuery") = "SELECT ProfessionalSkill.ProID, ProfessionalGeneral.UserName, ProfessionalGeneral.CountryName," + _
                            "  (SELECT Path FROM CountriesUpdate WHERE (CountryId = ProfessionalGeneral.CountryID)) AS CountryFlag, ProfessionalGeneral.RegionName," + _
                            " Skills.CategoryID, Skills.CategoryName, Skills.JobID,  Skills.JobTitle, ProfessionalAdditionalInformation.Rank, ProfessionalAdditionalInformation.Points," + _
                            " ProfessionalAdditionalInformation.Reputation,  ProfessionalAdditionalInformation.ProjectCompleted, ProfessionalAdditionalInformation.MoneyEarned, ProfessionalAdditionalInformation.ProjectCompleted" + _
                            " + ProfessionalAdditionalInformation.ProjectCanceled AS TotalProject, SUBSTRING(ProfessionalPortfolio.About, 0,  100) AS About, ProfessionalRating.IntRate,ProfessionalGeneral.PhotoPath" + _
                            " FROM  Skills INNER JOIN" + _
                            " ProfessionalSkill ON Skills.SkillID = ProfessionalSkill.SkillID INNER JOIN" + _
                            " ProfessionalGeneral ON ProfessionalSkill.ProID = ProfessionalGeneral.ProID INNER JOIN" + _
                            " ProfessionalAdditionalInformation ON ProfessionalGeneral.ProID = ProfessionalAdditionalInformation.ProID INNER JOIN" + _
                            " ProfessionalPortfolio ON ProfessionalGeneral.ProID = ProfessionalPortfolio.ProID INNER JOIN" + _
                            " ProfessionalRating ON ProfessionalGeneral.ProID = ProfessionalRating.ProID" + _
                            " WHERE(ProfessionalPortfolio.Modified = 0) AND (Skills.CategoryID = " + IndustryListBox.SelectedValue.ToString() + ")"
        ProfessionalResultSqlDataSource.SelectCommand = Session("ProfessionalQuery").ToString()
        ProfessionalResultSqlDataSource.DataBind()
        ProfessionalResultGridView.DataBind()
        StateListBox.SelectedIndex = -1
        CityListBox.SelectedIndex = -1
        ProfessionalResultUpdatePanel.Update()
        LoadingModalPopupExtender.Hide()

    End Sub

    Protected Sub CityListBox_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles CityListBox.SelectedIndexChanged

        LoadingModalPopupExtender.Show()
        Session("ProfessionalQuery") = "SELECT ProfessionalSkill.ProID, ProfessionalGeneral.UserName, ProfessionalGeneral.CountryName," + _
                            "  (SELECT Path FROM CountriesUpdate WHERE (CountryId = ProfessionalGeneral.CountryID)) AS CountryFlag, ProfessionalGeneral.RegionName," + _
                            " Skills.CategoryID, Skills.CategoryName, Skills.JobID,  Skills.JobTitle, ProfessionalAdditionalInformation.Rank, ProfessionalAdditionalInformation.Points," + _
                            " ProfessionalAdditionalInformation.Reputation,  ProfessionalAdditionalInformation.ProjectCompleted, ProfessionalAdditionalInformation.MoneyEarned, ProfessionalAdditionalInformation.ProjectCompleted" + _
                            " + ProfessionalAdditionalInformation.ProjectCanceled AS TotalProject, SUBSTRING(ProfessionalPortfolio.About, 0,  100) AS About, ProfessionalRating.IntRate,ProfessionalGeneral.PhotoPath" + _
                            " FROM  Skills INNER JOIN" + _
                            " ProfessionalSkill ON Skills.SkillID = ProfessionalSkill.SkillID INNER JOIN" + _
                            " ProfessionalGeneral ON ProfessionalSkill.ProID = ProfessionalGeneral.ProID INNER JOIN" + _
                            " ProfessionalAdditionalInformation ON ProfessionalGeneral.ProID = ProfessionalAdditionalInformation.ProID INNER JOIN" + _
                            " ProfessionalPortfolio ON ProfessionalGeneral.ProID = ProfessionalPortfolio.ProID INNER JOIN" + _
                            " ProfessionalRating ON ProfessionalGeneral.ProID = ProfessionalRating.ProID" + _
                            " WHERE(ProfessionalPortfolio.Modified = 0) AND (ProfessionalGeneral.RegionID = " + CityListBox.SelectedValue.ToString() + ")"
        ProfessionalResultSqlDataSource.SelectCommand = Session("ProfessionalQuery").ToString()
        ProfessionalResultSqlDataSource.DataBind()
        ProfessionalResultGridView.DataBind()
        IndustryListBox.SelectedIndex = -1
        StateListBox.SelectedIndex = -1
        ProfessionalResultUpdatePanel.Update()
        LoadingModalPopupExtender.Hide()

    End Sub

    Protected Sub StateListBox_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles StateListBox.SelectedIndexChanged

        LoadingModalPopupExtender.Show()
        Session("ProfessionalQuery") = "SELECT ProfessionalSkill.ProID, ProfessionalGeneral.UserName, ProfessionalGeneral.CountryName," + _
                            "  (SELECT Path FROM CountriesUpdate WHERE (CountryId = ProfessionalGeneral.CountryID)) AS CountryFlag, ProfessionalGeneral.RegionName," + _
                            " Skills.CategoryID, Skills.CategoryName, Skills.JobID,  Skills.JobTitle, ProfessionalAdditionalInformation.Rank, ProfessionalAdditionalInformation.Points," + _
                            " ProfessionalAdditionalInformation.Reputation,  ProfessionalAdditionalInformation.ProjectCompleted, ProfessionalAdditionalInformation.MoneyEarned, ProfessionalAdditionalInformation.ProjectCompleted" + _
                            " + ProfessionalAdditionalInformation.ProjectCanceled AS TotalProject, SUBSTRING(ProfessionalPortfolio.About, 0,  100) AS About, ProfessionalRating.IntRate,ProfessionalGeneral.PhotoPath" + _
                            " FROM  Skills INNER JOIN" + _
                            " ProfessionalSkill ON Skills.SkillID = ProfessionalSkill.SkillID INNER JOIN" + _
                            " ProfessionalGeneral ON ProfessionalSkill.ProID = ProfessionalGeneral.ProID INNER JOIN" + _
                            " ProfessionalAdditionalInformation ON ProfessionalGeneral.ProID = ProfessionalAdditionalInformation.ProID INNER JOIN" + _
                            " ProfessionalPortfolio ON ProfessionalGeneral.ProID = ProfessionalPortfolio.ProID INNER JOIN" + _
                            " ProfessionalRating ON ProfessionalGeneral.ProID = ProfessionalRating.ProID" + _
                            " WHERE(ProfessionalPortfolio.Modified = 0) AND (ProfessionalGeneral.CountryID = " + StateListBox.SelectedValue.ToString() + ")"
        ProfessionalResultSqlDataSource.SelectCommand = Session("ProfessionalQuery").ToString()
        ProfessionalResultSqlDataSource.DataBind()
        ProfessionalResultGridView.DataBind()
        IndustryListBox.SelectedIndex = -1
        CityListBox.SelectedIndex = -1
        ProfessionalResultUpdatePanel.Update()
        LoadingModalPopupExtender.Hide()

    End Sub

    Protected Sub ProfessionalResultGridView_PageIndexChanged(sender As Object, e As System.EventArgs) Handles ProfessionalResultGridView.PageIndexChanged
        ProfessionalResultSqlDataSource.SelectCommand = Session("ProfessionalQuery").ToString()
    End Sub

    Protected Sub ProfessionalResultGridView_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles ProfessionalResultGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            '' e.Row.Cells[1].ColumnSpan=2;
            e.Row.Cells(0).ColumnSpan = 4
            e.Row.Cells(0).Text = Resources.Resource.Page.ToString() & "  " & (ProfessionalResultGridView.PageIndex + 1) & "  " & Resources.Resource.of.ToString() & "  " & ProfessionalResultGridView.PageCount
            e.Row.Cells.RemoveAt(1)
            e.Row.Cells.RemoveAt(2)
            e.Row.Cells.RemoveAt(3)

        End If
    End Sub
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''Page Clean Up''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''INVITATION''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    Protected Sub InviteToProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("InvitetoProject") = True
    End Sub

    Protected Sub InvitationGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.InvitationGridView.SelectedIndex = -1
        Me.LoadingModalPopupExtender.Hide()
    End Sub

    Protected Sub InvitationGridView_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles InvitationGridView.PageIndexChanging
        InvitationModalPopupExtender.Show()
    End Sub

    Protected Sub InvitationGridView_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles InvitationGridView.Sorting
        InvitationModalPopupExtender.Show()
    End Sub

    Protected Sub InviteToProject(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim SenderID As String
        Dim ReceiverID As String
        Dim ProjectID As String
        Dim SenderRole As Integer
        Dim Title As String
        Dim Message As String
        Dim LCIDInvitation As String
        Dim DateEvent As String
        Dim senderName As String
        Dim senderemail As String
        Dim receiverName As String
        Dim receiveremail As String

        Dim guidStringUser As Guid = New Guid(Membership.GetUser.ProviderUserKey().ToString())

        If User.IsInRole("Customer") Then

            ''CustomerID 
            Dim GetCustomerIDAdapter As New GetUserIDTableAdapters.LookUpRolesTableAdapter
            Dim CustomerIDTable As New GetUserID.LookUpRolesDataTable
            GetCustomerIDAdapter.FillCustomerID(CustomerIDTable, guidStringUser.ToString())

            ''Sender ID
            SenderID = CustomerIDTable.Item(0).CustomerId.ToString

            ''Customer General 
            Dim CustomerInformationAdapter As New GetUserInformationTableAdapters.CustomerGeneralTableAdapter
            Dim CustomerInformationTable As New GetUserInformation.CustomerGeneralDataTable
            CustomerInformationAdapter.FillCustomerInformation(CustomerInformationTable, SenderID.ToString)

            ''Sender Name
            senderName = CustomerInformationTable.Item(0).UserName.ToString()
            senderemail = CustomerInformationTable.Item(0).EmailAddress.ToString()
            SenderRole = 0

        End If

        If User.IsInRole("Professional") Then

            ''ProfessionalID 
            Dim GetProfessionalIDAdapter As New GetUserIDTableAdapters.LookUpProRolesTableAdapter
            Dim ProfessionalIDTable As New GetUserID.LookUpProRolesDataTable
            GetProfessionalIDAdapter.FillProfessionalID(ProfessionalIDTable, guidStringUser.ToString())

            ''Sender ID
            SenderID = ProfessionalIDTable.Rows(0).Item(2).ToString

            ''Professional General 
            Dim ProfessionalInformationAdapter As New GetUserInformationTableAdapters.ProfessionalGeneralTableAdapter

            Dim ProfessionalInformationTable As New GetUserInformation.ProfessionalGeneralDataTable
            ProfessionalInformationAdapter.FillProfessionalInformation(ProfessionalInformationTable, SenderID.ToString)

            ''Sender Name
            senderName = ProfessionalInformationTable.Item(0).UserName.ToString()
            senderemail = ProfessionalInformationTable.Item(0).EmailAddress.ToString()
            SenderRole = 1

        End If

        ''Receiver always a professional
        ReceiverID = Me.ProfessionalResultGridView.SelectedPersistedDataKey.Value.ToString()
        ProjectID = InvitationGridView.SelectedPersistedDataKey.Value.ToString()

        Title = senderName.ToString + " " + Resources.Resource.InvitationProject.ToString() + ProjectID.ToString
        Message = senderName.ToString + " " + Resources.Resource.InvitationProject.ToString() + _
            "<a href= http://Side/Authenticated/ViewProject.aspx?PRID=" + ProjectID.ToString + _
            ">" + ProjectID.ToString + "</a>"

        LCIDInvitation = _language.ToString
        DateEvent = Date.UtcNow.ToShortDateString.ToString + " " + Date.UtcNow.ToShortTimeString.ToString

        Dim Invitation As New InvitationToProjectTableAdapters.QueriesTableAdapter
        Invitation.InvitetoProject(SenderID.ToString, ReceiverID.ToString, ProjectID.ToString, SenderRole.ToString, Title.ToString, LCIDInvitation.ToString, DateEvent.ToString)

        ''Professional General 
        Dim ReceiverInformationAdapter As New GetUserInformationTableAdapters.ProfessionalGeneralTableAdapter
        Dim ReceiverInformationTable As New GetUserInformation.ProfessionalGeneralDataTable
        ReceiverInformationAdapter.FillProfessionalInformation(ReceiverInformationTable, ReceiverID.ToString)
        receiveremail = ReceiverInformationTable.Item(0).EmailAddress.ToString()
        receiverName = ReceiverInformationTable.Item(0).UserName.ToString()

        ''Email
        SendEmail(senderName.ToString(), senderemail.ToString(), Title.ToString(), Message.ToString(), receiverName.ToString(), receiveremail.ToString())
        LoadingModalPopupExtender.Hide()

    End Sub

    Protected Overrides Function SaveControlState() As Object
        Dim ControlState(2) As Object
        ControlState(1) = MyBase.SaveControlState()
        ControlState(2) = _language
        Return ControlState
    End Function

    Protected Overrides Sub LoadControlState(ByVal savedState As Object)
        Dim ControlState() As Object = CType(savedState, Object)
        MyBase.LoadControlState(ControlState(1))
        _language = CInt(ControlState(2))
    End Sub

    Protected Overrides Sub OnInit(ByVal e As System.EventArgs)
        MyBase.OnInit(e)
        Page.RequiresControlState(Me)
    End Sub

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''INVITATION''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''QUESTION''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub AskQuestionLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        LoadingModalPopupExtender.Show()
        Session("Question") = True
    End Sub
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''QUESTION''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''PROFILE''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''PROFILE''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''FAVORITE''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub SelectFavoriteLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("Favorite") = True
    End Sub

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''FAVORITE''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub CheckAndSet()
        If CrewNumberDropDownList.SelectedIndex = -1 Then
            ExperienceDropDownList.SelectedIndex = 0
        End If
        If ExperienceDropDownList.SelectedIndex = -1 Then
            ExperienceDropDownList.SelectedIndex = 0
        End If
        If LicensedDropDownList.SelectedIndex = -1 Then
            LicensedDropDownList.SelectedIndex = 0
        End If
        If InsuredDropDownList.SelectedIndex = -1 Then
            InsuredDropDownList.SelectedIndex = 0
        End If
        If RelocationDropDownList.SelectedIndex = -1 Then
            RelocationDropDownList.SelectedIndex = 0
        End If
        If AccomplishementMustHaveDropDownList.SelectedIndex = -1 Then
            AccomplishementMustHaveDropDownList.SelectedIndex = 0
        End If
        If StatusMustHaveDropDownList.SelectedIndex = -1 Then
            StatusMustHaveDropDownList.SelectedIndex = 0
        End If
        If LocationDropDownList.SelectedIndex = -1 Then
            LocationDropDownList.SelectedIndex = 0
        End If

    End Sub


    Protected Function RequirementQuery() As String
        Return " AND (Skills.Crew = " + CrewNumberDropDownList.SelectedIndex.ToString + ") AND (Skills.Experience = " + ExperienceDropDownList.SelectedIndex.ToString + _
             ") AND (Skills.Licensed = " + LicensedDropDownList.SelectedIndex.ToString() + ") AND (Skills.Insured = " + InsuredDropDownList.SelectedIndex.ToString + _
             ") AND (Skills.Relocation = " + RelocationDropDownList.SelectedIndex.ToString + ")"
    End Function

    Protected Function GetCustomZipCode() As String

        If Not (Request.QueryString("flag") Is Nothing) Then
            Flag = Request.QueryString("flag").ToString()
        End If

        Dim CustomZipCode As String = " AND (ProfessionalGeneral.Zipcode IN ( "
        If FromTextBox.Text.ToString <> "" Then
            If Flag = "us" Then
                Dim USFlagAdapter As New SearchProfessionalDataSetTableAdapters.FindUSZipCodesWithinRadiusTableAdapter
                Dim USFlagTable As New SearchProfessionalDataSet.FindUSZipCodesWithinRadiusDataTable
                USFlagAdapter.FillUSZipCodeRadius(USFlagTable, FromTextBox.Text.ToString, LocationSliderTargetedTextBox.Text.ToString)
                If USFlagTable.Rows.Count > 1 Then
                    For i As Integer = 0 To USFlagTable.Rows.Count - 2
                        CustomZipCode += "N'" + USFlagTable.Rows(i)(0).ToString + "',"
                    Next
                    CustomZipCode += "N'" + USFlagTable.Rows(USFlagTable.Rows.Count - 1)(0).ToString + "'))"
                Else
                    For Each r As DataRow In USFlagTable
                        CustomZipCode += "N'" + r(0).ToString() + "'"
                    Next
                    CustomZipCode += ")) "
                End If

            End If

            If Flag = "ca" Then
                Dim CanadaFlagAdapter As New SearchProfessionalDataSetTableAdapters.FindCanadaZipCodesWithinRadiusTableAdapter
                Dim CanadaFlagTable As New SearchProfessionalDataSet.FindCanadaZipCodesWithinRadiusDataTable
                CanadaFlagAdapter.FillCanadaZipCodeRadius(CanadaFlagTable, FromTextBox.Text.ToString, LocationSliderTargetedTextBox.Text.ToString)
                If CanadaFlagTable.Rows.Count > 1 Then
                    For i As Integer = 0 To CanadaFlagTable.Rows.Count - 2
                        CustomZipCode += "N'" + CanadaFlagTable.Rows(i)(0).ToString + "',"
                    Next
                    CustomZipCode += "N'" + CanadaFlagTable.Rows(CanadaFlagTable.Rows.Count - 1)(0).ToString + "'))"
                Else
                    For Each r As DataRow In CanadaFlagTable
                        CustomZipCode += "N'" + r(0).ToString() + "'"
                    Next
                    CustomZipCode += "))"
                End If
            End If
        Else
            CustomZipCode += "N'" + FromTextBox.Text.ToString + +"'))"
        End If

        Return CustomZipCode

    End Function

    Protected Function AccomplishementQuery() As String
        Return " AND (ProfessionalAdditionalInformation.ProjectCompleted " + AccomplishementMustHaveDropDownList.SelectedItem.Text.ToString + " " + ProjectsCompletedTargetTextBox.Text.ToString + _
            ") AND (ProfessionalAdditionalInformation.Reputation " + AccomplishementMustHaveDropDownList.SelectedItem.Text.ToString + " " + ReputationTargetTextBox.Text.ToString + ")"
    End Function

    Protected Function StatusQuery() As String
        Return " AND (ProfessionalAdditionalInformation.Rank " + StatusMustHaveDropDownList.SelectedItem.Text.ToString + " " + RankTargetTextBox.Text.ToString + _
            " ) AND (ProfessionalAdditionalInformation.Points " + StatusMustHaveDropDownList.SelectedItem.Text.ToString + "  " + PointsTargetedTextBox.Text.ToString + ")"
    End Function

    Protected Sub UpdateAllButton_Click(sender As Object, e As System.EventArgs) Handles UpdateAllButton.Click
        CustomUpdate()
    End Sub

    Protected Sub CustomUpdate()
        LoadingModalPopupExtender.Show()
        If FromTextBox.Text.ToString <> "" Then
            ProfessionalResultSqlDataSource.SelectCommand = DefaultSelection + RequirementQuery() + AccomplishementQuery() + StatusQuery() + GetCustomZipCode()
        Else
            ProfessionalResultSqlDataSource.SelectCommand = DefaultSelection + RequirementQuery() + AccomplishementQuery() + StatusQuery()
        End If
        Try
            ProfessionalResultSqlDataSource.DataBind()
            ProfessionalResultGridView.DataBind()
            ProfessionalResultUpdatePanel.Update()
            LoadingModalPopupExtender.Hide()
        Catch ex As Exception
            LoadingModalPopupExtender.Hide()
        End Try
    End Sub


End Class

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''Page Clean Up''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''