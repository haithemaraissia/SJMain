Imports System.IO
Imports System.Data.SqlClient
Imports System.Data
Imports System.Globalization
Imports System.Threading

Partial Class Authenticated_Professional_PostProject
    Inherits System.Web.UI.Page

    ''''''''''''''''''''''''''''''''''REQUIREMENT TAB''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub EndDateCalendar_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles EndDateCalendar.SelectionChanged
        CalenderCheck()
        LocationDelayModalPopupExtender.Hide()
    End Sub

    Protected Sub CalenderCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CalenderCustomValidator.ServerValidate
        args.IsValid = False
        Dim result As Integer = 0
        result = Date.Compare(Me.EndDateCalendar.SelectedDate.Date, Me.StartDateCalendar.SelectedDate.Date)
        If result < 1 Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If
    End Sub

    Protected Sub StartDateCalendar_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles StartDateCalendar.SelectionChanged
        CalenderCheck()
        LocationDelayModalPopupExtender.Hide()
    End Sub

    Public Sub CalenderCheck()
        Dim result As Integer = 0
        result = Date.Compare(Me.EndDateCalendar.SelectedDate.Date, Me.StartDateCalendar.SelectedDate.Date)
        If result < 1 Then
            Me.DateErrorTextBox.Text = ""
            Me.CalenderCustomValidator.Validate()
        Else
            Me.DateErrorTextBox.Text = ""
        End If
    End Sub
    ''''''''''''''''''''''''''''''''''REQUIREMENT TAB'''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''DESCRIPTION TAB'''''''''''''''''''''''''''''''''''''''''
    Protected Sub EditProjectDescriptionLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EditProjectDescriptionLinkButton.Click
        Response.Redirect("PostProjectDescription.aspx")
    End Sub

    Protected Sub CountryDropDownList_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.RegionsDropDownList.SelectedIndex = 0
        RegionsDropDownList.DataBind()
        LocationDelayModalPopupExtender.Hide()
    End Sub

    ''''''''''''''''''''''''''''''''''LOCATION TAB''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''PROJECT SPECIFICATION TAB'''''''''''''''''''''''''''''''
    Protected Sub HideListButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles HideListButton.Click
        Me.GlobalJobSelectionModalPopupExtender.Hide()
        Me.DelayModalPopUpExtender.Hide()
    End Sub
    Protected Sub IndustryDropDownList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles IndustryDropDownList.SelectedIndexChanged
        DelayModalPopUpExtender.Hide()
    End Sub
    Protected Sub JobListView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles JobListView.SelectedIndexChanged
        Dim JobIndex As Integer = Convert.ToInt32(JobListView.SelectedIndex.ToString)
        Dim JobID As Integer = Convert.ToInt32(JobListView.SelectedPersistedDataKey.Value.ToString)

        Dim CategoryLabel As New Label
        CategoryLabel = CType(JobListView.Items(JobIndex).FindControl("JobCategoryLabel"), Label)

        Dim CategoryID As Integer = Convert.ToInt32(CategoryLabel.Text.ToString) - 1

        IndustryDropDownList.SelectedIndex = CategoryID
        IndustryUpdatePanel.Update()

        SpecialityUpdatePanel.Update()
        SelectJob(JobID)

    End Sub

    Protected Sub JobIDLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.GlobalJobSelectionModalPopupExtender.Hide()
        Me.DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub SelectJob(ByVal ID As Integer)

        For i As Integer = 0 To SpecialtyListBox1.Items.Count - 1
            If SpecialtyListBox1.Items(i).Value = ID Then
                SpecialtyListBox1.SelectedIndex = i
                Exit Sub
            End If
        Next

        For i As Integer = 0 To SpecialtyListBox2.Items.Count - 1
            If SpecialtyListBox2.Items(i).Value = ID Then
                SpecialtyListBox2.SelectedIndex = i
                Exit Sub
            End If
        Next

        For i As Integer = 0 To SpecialtyListBox3.Items.Count - 1
            If SpecialtyListBox3.Items(i).Value = ID Then
                SpecialtyListBox3.SelectedIndex = i
                Exit Sub
            End If
        Next

    End Sub

    Protected Sub AlphabeticJobsLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AlphabeticJobsLinkButton.Click
        InitializeJobSelection()
        Me.GlobalJobSelectionModalPopupExtender.Show()
        Me.DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub AlphabeticDataList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles AlphabeticDataList.SelectedIndexChanged
        InitializeJobSelection()
    End Sub

    Protected Sub RegionsDropDownList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RegionsDropDownList.SelectedIndexChanged
        LocationDelayModalPopupExtender.Hide()
    End Sub
    ''''''''''''''''''''''''''''''''''PROJECT SPECIFICATION TAB'''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''PICTURE TAB'''''''''''''''''''''''''''''''''''''''''''''
    'NO CODE
    ''''''''''''''''''''''''''''''''''PICTURE TAB'''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''PROJECT MENU PANEL'''''''''''''''''''''''''''''''''''''''
    Protected Sub SaveAll(ByVal postedAction As Integer)

        Dim AddressTextBox As TextBox = CType(Me.LocationFormView.FindControl("AddressTextBox"), TextBox)
        Dim ZipcodeTextBox As TextBox = CType(Me.LocationFormView.FindControl("ZipcodeTextBox"), TextBox)
        Dim CountryDropDownList As DropDownList = CType(LocationFormView.FindControl("CountryDropDownList"), DropDownList)
        Dim RegionsDropDownList As DropDownList = CType(LocationFormView.FindControl("RegionsDropDownList"), DropDownList)
        Dim CitiesDropDownList As DropDownList = CType(LocationFormView.FindControl("CitiesDropDownList"), DropDownList)

        Dim PosterID As String = ""

        If Me.User.IsInRole("Customer") Then
            PosterID = Session("CustomerId").ToString
        End If

        If Me.User.IsInRole("Professional") Then
            PosterID = Session("ProfessionalID").ToString
        End If

        Dim JobID1 As String = ""
        Dim Found As Boolean = False

        Dim i As Integer
        For i = 0 To Me.SpecialtyListBox1.Items.Count - 1
            If Me.SpecialtyListBox1.Items(i).Selected = True Then
                JobID1 = SpecialtyListBox1.Items(i).Value.ToString
                Found = True
                Exit For
            End If
        Next

        If Found = False Then
            For i = 0 To Me.SpecialtyListBox2.Items.Count - 1
                If Me.SpecialtyListBox2.Items(i).Selected = True Then
                    JobID1 = SpecialtyListBox2.Items(i).Value.ToString
                    Found = True
                    Exit For
                End If
            Next
        End If

        If Found = False Then
            For i = 0 To Me.SpecialtyListBox3.Items.Count - 1
                If Me.SpecialtyListBox3.Items(i).Selected = True Then
                    JobID1 = SpecialtyListBox3.Items(i).Value.ToString
                    Found = True
                    Exit For
                End If
            Next
        End If

        If JobID1.ToString = "" Then
            JobID1 = SpecialtyListBox1.Items(0).Value.ToString
        End If

        Dim CityID As String = ""

        If CitiesDropDownList Is Nothing Then
            CityID = -1
        Else
            CityID = CitiesDropDownList.SelectedValue.ToString()
        End If

        If CityID = "" Then
            CityID = -1
        End If

        Dim AmountOffered As String = AmountOfferedTextBox.Text.ToString
        If Not (AmountofferedCompareValidator.IsValid Or AmountOfferedRequiredFieldValidator.IsValid) Then
            AmountOffered = "0"
        Else
            AmountOffered = AmountOfferedTextBox.Text.ToString()
        End If

        Dim StartDate As String = StartDateCalendar.SelectedDate.ToShortDateString.ToString() + " "
        StartDate += DateTime.Now.ToShortTimeString()

        Dim EndDate As String = EndDateCalendar.SelectedDate.ToShortDateString.ToString() + " "
        EndDate += DateTime.Now.ToShortTimeString()

        Dim Zipcode As String
        If ZipcodeTextBox.Text.ToString = "" Then
            Zipcode = "0"
        Else
            Zipcode = ZipcodeTextBox.Text.ToString()
        End If

        Dim Title As String
        If TitleTextBox.Text.ToString = "" Then
            Title = ProjectTitleLabel.Text.ToString()
        Else
            Title = TitleTextBox.Text.ToString()
        End If

        Dim Description As String
        If DescriptionContentLabel.Text.ToString = "" Then
            Description = DescriptionLabel.Text.ToString()
        Else
            Description = DescriptionContentLabel.Text.ToString
        End If

        Dim SpecialNotes As String
        If SpecialNotesTextBox.Text.ToString = "" Then
            SpecialNotes = SpecialNotesLabel.Text.ToString()
        Else
            SpecialNotes = SpecialNotesTextBox.Text.ToString()
        End If

        SaveProjectObjectDataSource.UpdateParameters(0).DefaultValue = Session("ProjectID").ToString()
        SaveProjectObjectDataSource.UpdateParameters(1).DefaultValue = PosterID.ToString()
        SaveProjectObjectDataSource.UpdateParameters(2).DefaultValue = Session("Language").ToString()
        SaveProjectObjectDataSource.UpdateParameters(3).DefaultValue = JobID1.ToString()
        SaveProjectObjectDataSource.UpdateParameters(4).DefaultValue = IndustryDropDownList.SelectedItem.Value.ToString()
        SaveProjectObjectDataSource.UpdateParameters(5).DefaultValue = ExperienceDropDownList.SelectedIndex.ToString()
        SaveProjectObjectDataSource.UpdateParameters(6).DefaultValue = CrewNumberDropDownList.SelectedIndex.ToString()
        SaveProjectObjectDataSource.UpdateParameters(7).DefaultValue = LicensedDropDownList.SelectedIndex.ToString()
        SaveProjectObjectDataSource.UpdateParameters(8).DefaultValue = InsuredDropDownList.SelectedIndex.ToString()
        SaveProjectObjectDataSource.UpdateParameters(9).DefaultValue = RelocationDropDownList.SelectedIndex.ToString()
        SaveProjectObjectDataSource.UpdateParameters(10).DefaultValue = Title.ToString()
        SaveProjectObjectDataSource.UpdateParameters(11).DefaultValue = StartDate.ToString()
        SaveProjectObjectDataSource.UpdateParameters(12).DefaultValue = EndDate.ToString()
        SaveProjectObjectDataSource.UpdateParameters(13).DefaultValue = AmountOffered.ToString()
        SaveProjectObjectDataSource.UpdateParameters(14).DefaultValue = CurrencyDropDownList.SelectedValue.ToString()
        SaveProjectObjectDataSource.UpdateParameters(15).DefaultValue = Description.ToString()
        SaveProjectObjectDataSource.UpdateParameters(16).DefaultValue = SpecialNotes.ToString()
        SaveProjectObjectDataSource.UpdateParameters(17).DefaultValue = System.DateTime.Today.ToShortDateString.ToString()
        SaveProjectObjectDataSource.UpdateParameters(18).DefaultValue = AddressTextBox.Text.ToString()
        SaveProjectObjectDataSource.UpdateParameters(19).DefaultValue = CountryDropDownList.SelectedValue.ToString()
        SaveProjectObjectDataSource.UpdateParameters(20).DefaultValue = CountryDropDownList.SelectedItem.Text.ToString()
        SaveProjectObjectDataSource.UpdateParameters(21).DefaultValue = RegionsDropDownList.SelectedValue.ToString()
        SaveProjectObjectDataSource.UpdateParameters(22).DefaultValue = RegionsDropDownList.SelectedItem.Text.ToString()
        SaveProjectObjectDataSource.UpdateParameters(23).DefaultValue = CityID.ToString()
        SaveProjectObjectDataSource.UpdateParameters(24).DefaultValue = Zipcode.ToString()
        SaveProjectObjectDataSource.UpdateParameters(25).DefaultValue = postedAction.ToString()

        SaveProjectObjectDataSource.Update()
    End Sub

    Protected Sub SaveButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SaveButton.Click

        SaveAll(1)

        PostProjectModalPopupExtender.Hide()

        Dim CustomMessageAdapter As New PostProjectTableAdapters.CustomMessageTableAdapter

        Dim CustomMessageTable As New PostProject.CustomMessageDataTable

        CustomMessageAdapter.FillCustomMessage(CustomMessageTable, "SaveMessage", Session("Language").ToString())

        For i As Integer = 0 To CustomMessageTable.Rows.Count - 1

            CustomMessageLabel.Text += CustomMessageTable.Rows(i).Item("Message").ToString()

            If i < CustomMessageTable.Rows.Count - 1 Then
                CustomMessageLabel.Text += "<br/>"
            End If
        Next

        Me.CustomMessageModalPopupExtender.Show()

    End Sub

    Protected Sub DeleteButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteButton.Click

        Dim DeleteProjectAdapter As New PostProjectTableAdapters.QueriesTableAdapter
        Dim PosterID As String = ""
        Dim PosterRole As String = ""

        If Me.User.IsInRole("Customer") Then
            PosterID = Session("CustomerId").ToString
            PosterRole = "CUS"
        End If

        If Me.User.IsInRole("Professional") Then
            PosterID = Session("ProID").ToString
            PosterRole = "PRO"
        End If

        DeleteProjectAdapter.DeleteProject(Session("ProjectID").ToString, PosterID.ToString, PosterRole.ToString)

        PostProjectModalPopupExtender.Hide()

        Dim CustomMessageAdapter As New PostProjectTableAdapters.CustomMessageTableAdapter
        Dim CustomMessageTable As New PostProject.CustomMessageDataTable

        CustomMessageAdapter.FillCustomMessage(CustomMessageTable, "ProjectDeleteMessage", Session("Language").ToString())

        For i As Integer = 0 To CustomMessageTable.Rows.Count - 1

            CustomMessageLabel.Text += CustomMessageTable.Rows(i).Item("Message").ToString()

            If i < CustomMessageTable.Rows.Count - 1 Then
                CustomMessageLabel.Text += "<br/>"
            End If
        Next

        Me.CustomMessageModalPopupExtender.Show()
    End Sub

    Protected Sub OK_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If Me.User.IsInRole("Customer") Then
            Response.Redirect("Customer/CustomerProfile.aspx")
        End If

        If Me.User.IsInRole("Professional") Then
            Response.Redirect("Professional/ProfessionalProfile.aspx")
        End If
    End Sub
    ''''''''''''''''''''''''''''''''''PROJECT MENU PANEL'''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''''PAGE EVENTS '''''''''''''''''''''''''''''''''''''''''''
    Protected Overrides Sub InitializeCulture()
        Dim Lang As String
        If Session("Language") Is Nothing Then
            Session("Language") = 1
            Lang = "en-US"
            Thread.CurrentThread.CurrentUICulture = New CultureInfo(Lang.ToString())
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Lang.ToString())
        End If
    End Sub

    Protected Sub ActivateLanguage()
        Select Case Thread.CurrentThread.CurrentUICulture.TwoLetterISOLanguageName.ToString
            Case "en"
                ''English
                Session("Language") = 1

            Case "fr"
                '"French
                Session("Language") = 2
        End Select
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Page.IsPostBack = False Then
            ActivateLanguage()
            Me.StartDateCalendar.SelectedDates.Add(DateTime.Now)
            Me.EndDateCalendar.SelectedDates.Add(DateTime.Now.AddDays(1))
            InitializeProject()
            InitializeJobSelection()
        End If

        InitializeJobs()

    End Sub

    Sub InitializeJobSelection()
        Select Case Session("Language").ToString
            Case "1"
                ''ENGLISH
                JobSelectionDataSource.SelectMethod = "GetJobSelectionEn"
            Case "2"
                ''FRENCH
                JobSelectionDataSource.SelectMethod = "GetJobSelectionFr"
        End Select
    End Sub

    Sub InitializeJobs()
        Select Case Session("Language").ToString
            Case "1"
                ''ENGLISH
                CategoryDataSource.SelectMethod = "GetCategoryEnglish"
                CategoryDataSource.DataBind()
                SpecialityJobs1DataSource.SelectMethod = "GetSpecialityJob1English"
                SpecialityJobs1DataSource.DataBind()
                SpecialityJobs2DataSource.SelectMethod = "GetSpecialityJob2English"
                SpecialityJobs2DataSource.DataBind()
                SpecialityJobs3DataSource.SelectMethod = "GetSpecialityJob3English"
                SpecialityJobs3DataSource.DataBind()

            Case "2"
                CategoryDataSource.SelectMethod = "GetCategoryFrench"
                CategoryDataSource.DataBind()
                SpecialityJobs1DataSource.SelectMethod = "GetSpecialityJob1French"
                SpecialityJobs1DataSource.DataBind()
                SpecialityJobs2DataSource.SelectMethod = "GetSpecialityJob2French"
                SpecialityJobs2DataSource.DataBind()
                SpecialityJobs3DataSource.SelectMethod = "GetSpecialityJob3French"
                SpecialityJobs3DataSource.DataBind()
        End Select
    End Sub

    Protected Sub PreviousInitialize()

        IndustrySummaryTextBox.Text = IndustryDropDownList.Items(IndustryDropDownList.SelectedIndex).ToString

        Dim specialization As New ArrayList
        Dim numberofselectedspecialty As Integer = 0
        Dim i As Integer

        For i = 0 To SpecialtyListBox1.Items.Count - 1
            If SpecialtyListBox1.Items(i).Selected = True Then
                numberofselectedspecialty += 1
                specialization.Add(SpecialtyListBox1.Items(i).ToString)

            End If
        Next
        For i = 0 To SpecialtyListBox2.Items.Count - 1
            If SpecialtyListBox2.Items(i).Selected = True Then
                numberofselectedspecialty += 1
                specialization.Add(SpecialtyListBox2.Items(i).ToString)

            End If
        Next
        For i = 0 To SpecialtyListBox3.Items.Count - 1
            If SpecialtyListBox3.Items(i).Selected = True Then
                numberofselectedspecialty += 1
                specialization.Add(SpecialtyListBox3.Items(i).ToString)
            End If
        Next

        If numberofselectedspecialty <> 0 Then
            For i = 0 To specialization.Count - 1
                Me.SummarySpecializationListBox.Items.Add(specialization.Item(i).ToString)
            Next
        Else
            SpecialtyListBox1.DataBind()

            SummarySpecializationListBox.Items.Add(SpecialtyListBox1.Items(0).ToString)
        End If

        LicensedSummary.Text = LicensedDropDownList.Items(LicensedDropDownList.SelectedIndex).ToString
        InsuredSummaryLabel.Text = InsuredDropDownList.Items(InsuredDropDownList.SelectedIndex).ToString
        ExperienceSummaryLabel.Text = ExperienceDropDownList.Items(ExperienceDropDownList.SelectedIndex).ToString
        CrewNumberSummaryLabel.Text = CrewNumberDropDownList.SelectedItem.ToString
        RelocationSummaryLabel.Text = RelocationDropDownList.SelectedItem.ToString

        ProjectTitleSummaryLabel.Text = TitleTextBox.Text

        Dim result As Integer = 0
        result = Date.Compare(EndDateCalendar.SelectedDate.Date, StartDateCalendar.SelectedDate.Date)
        If result = 1 Then
            StartDateSummaryLabel.Text = StartDateCalendar.SelectedDate.ToShortDateString.ToString
            StartDateCalendar.VisibleDate = StartDateCalendar.SelectedDate
            EndDateSummaryLabel.Text = EndDateCalendar.SelectedDate.ToShortDateString.ToString
            EndDateCalendar.VisibleDate = EndDateCalendar.SelectedDate
        End If

        AmountOfferedSummaryLabel.Text = AmountOfferedTextBox.Text
        CurrencySummaryLabel.Text = CurrencyDropDownList.Items(CurrencyDropDownList.SelectedIndex).ToString

        CustomDescriptionSummary.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Design
        CustomDescriptionSummary.Content = DescriptionContentLabel.Text.ToString
        CustomDescriptionSummary.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        CustomDescriptionSummary.DataBind()
        NotesSummaryTextBox.Text = SpecialNotesTextBox.Text

        Dim AddressTextBox As TextBox = CType(LocationFormView.FindControl("AddressTextBox"), TextBox)
        SummaryAddressTextBox.Text = AddressTextBox.Text

        Dim ZipcodeTextBox As TextBox = CType(LocationFormView.FindControl("ZipcodeTextBox"), TextBox)
        SummaryZipcode.Text = ZipcodeTextBox.Text

        Dim CountryDropDownList As DropDownList = CType(LocationFormView.FindControl("CountryDropDownList"), DropDownList)
        SummaryCountry.Text = CountryDropDownList.SelectedItem.ToString

        Dim RegionsDropDownList As DropDownList = CType(LocationFormView.FindControl("RegionsDropDownList"), DropDownList)
        SummaryState.Text = RegionsDropDownList.SelectedItem.ToString

        Dim CitiesDropDownList As DropDownList = CType(LocationFormView.FindControl("CitiesDropDownList"), DropDownList)
        If CitiesDropDownList.SelectedItem Is Nothing Then
            SummaryCity.Text = ""
        Else
            Me.SummaryCity.Text = CitiesDropDownList.SelectedItem.ToString
        End If

    End Sub

    Protected Sub InitializeProject()

        Try

            Dim ProjectRequirementDataAdapter As New PostProjectTableAdapters.ProjectRequirementsTableAdapter
            Dim ProjectRequirementTable As New PostProject.ProjectRequirementsDataTable
            ProjectRequirementDataAdapter.FillInitializeProject(ProjectRequirementTable, Session("ProjectID").ToString)

            LocationFormView.DataBind()
            Me.RegionsDropDownList.SelectedValue = ProjectRequirementTable.Rows(0)("RegionName").ToString

            Me.CitiesDropDownList.SelectedValue = ProjectRequirementTable.Rows(0)("CityID").ToString
            Me.DescriptionContentLabel.Text = ProjectRequirementTable.Rows(0)("Description").ToString
            Me.SpecialNotesTextBox.Text = ProjectRequirementTable.Rows(0)("SpecialNotes").ToString
            Me.TitleTextBox.Text = ProjectRequirementTable.Rows(0)("ProjectTitle").ToString

            Dim StartDate As Date = Convert.ToDateTime(ProjectRequirementTable.Rows(0)("StartDate").ToString)
            Me.StartDateCalendar.SelectedDate = StartDate.Date
            StartDateCalendar.VisibleDate = StartDate.Date

            Dim EndDate As Date = Convert.ToDateTime(ProjectRequirementTable.Rows(0)("EndDate").ToString)
            Me.EndDateCalendar.SelectedDate = EndDate.Date
            EndDateCalendar.VisibleDate = EndDate.Date

            Me.AmountOfferedTextBox.Text = ProjectRequirementTable.Rows(0)("AmountOffered").ToString
            Me.CurrencyDropDownList.SelectedValue = ProjectRequirementTable.Rows(0)("CurrencyID").ToString

            Me.ExperienceDropDownList.SelectedIndex = ProjectRequirementTable.Rows(0)("ExperienceID").ToString
            Me.CrewNumberDropDownList.SelectedIndex = ProjectRequirementTable.Rows(0)("CrewNumberID").ToString
            Me.LicensedDropDownList.SelectedIndex = ProjectRequirementTable.Rows(0)("LicensedID").ToString
            Me.InsuredDropDownList.SelectedIndex = ProjectRequirementTable.Rows(0)("InsuredID").ToString
            Me.RelocationDropDownList.SelectedIndex = ProjectRequirementTable.Rows(0)("RelocationID").ToString

            Me.IndustryDropDownList.DataBind()
            Me.IndustryDropDownList.SelectedValue = Convert.ToInt32(ProjectRequirementTable.Rows(0)("CategoryID").ToString)

            Me.SpecialtyListBox1.DataBind()
            Dim i As Integer
            For i = 0 To Me.SpecialtyListBox1.Items.Count - 1
                If SpecialtyListBox1.Items(i).Value.ToString = ProjectRequirementTable.Rows(0)("JobID").ToString Then
                    SpecialtyListBox1.Items(i).Selected = True
                    SpecialtyListBox1.SelectedIndex = i
                    Exit Sub
                End If
            Next

            Me.SpecialtyListBox2.DataBind()
            For i = 0 To Me.SpecialtyListBox2.Items.Count - 1
                If SpecialtyListBox2.Items(i).Value.ToString = ProjectRequirementTable.Rows(0)("JobID").ToString Then
                    SpecialtyListBox2.Items(i).Selected = True
                    SpecialtyListBox2.SelectedIndex = i
                    Exit Sub
                End If
            Next

            Me.SpecialtyListBox3.DataBind()
            For i = 0 To Me.SpecialtyListBox3.Items.Count - 1
                If SpecialtyListBox3.Items(i).Value.ToString = ProjectRequirementTable.Rows(0)("JobID").ToString Then
                    SpecialtyListBox3.Items(i).Selected = True
                    SpecialtyListBox3.SelectedIndex = i
                    Exit Sub
                End If
            Next
        Catch ex As Exception
            Response.Redirect("~/NotAuthenticated/SignIn.aspx")
        End Try
    End Sub

    Protected Sub BackToProfile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BackToProfile.Click

        If Me.User.IsInRole("Customer") Then
            Response.Redirect("Customer/CustomerProfile.aspx")
        End If

        If Me.User.IsInRole("Professional") Then
            Response.Redirect("Professional/ProfessionalProfile.aspx")
        End If

    End Sub
    ''''''''''''''''''''''''''''''''''''PAGE EVENTS ''''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''''FINALLY POST PROJECT '''''''''''''''''''''''''''''''''''''
    Protected Sub Cancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.PostProjectModalPopupExtender.Hide()
        Me.DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub PreviewButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles PreviewButton.Click

        Response.Expires = 0
        Page.Validate()
        GlobalValidation.Text = ""

        Dim GlobalValidationValues As Boolean = True
        Dim i As Integer
        For i = 0 To 3
            If Page.Validators(i).IsValid = False Then
                GlobalValidationValues = False
                GlobalValidation.Text += "*" + Page.Validators(i).ErrorMessage.ToString + "<br/>"
            End If
        Next

        ''Address validation"
        If Page.Validators(4).IsValid = False Then
            GlobalValidationValues = False
            GlobalValidation.Text += "*" + Page.Validators(4).ErrorMessage.ToString + "<br/>"
        End If

        If GlobalValidationValues = True Then
            SummarySpecializationListBox.Items.Clear()
            PostProjectModalPopupExtender.Show()
            DelayModalPopUpExtender.Hide()

            PreviousInitialize()
            Response.Expires = 0
        Else
            ValidationModalPopupExtender.Show()
            Response.Expires = 0
        End If

    End Sub

    Protected Sub ValidationOkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.ValidationModalPopupExtender.Hide()
        Me.DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub PhotoFormView_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewPageEventArgs)
        Me.PostProjectModalPopupExtender.Show()
    End Sub

    Protected Sub PostButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        SaveAll(2)

        Me.PostProjectModalPopupExtender.Hide()
        Dim CustomMessageAdapter As New PostProjectTableAdapters.CustomMessageTableAdapter
        Dim CustomMessageTable As New PostProject.CustomMessageDataTable

        CustomMessageAdapter.FillCustomMessage(CustomMessageTable, "ProjectPostingMessage", Session("Language").ToString())
        For i As Integer = 0 To CustomMessageTable.Rows.Count - 1
            CustomMessageLabel.Text += CustomMessageTable.Rows(i).Item("Message").ToString()
            If i < CustomMessageTable.Rows.Count - 1 Then
                CustomMessageLabel.Text += "<br/>"
            End If
        Next

        Me.CustomMessageModalPopupExtender.Show()
        DelayModalPopUpExtender.Hide()

    End Sub
    ''''''''''''''''''''''''''''''''''''FINALLY POST PROJECT''''''''''''''''''''''''''''''''''''''
End Class
