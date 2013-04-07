Imports System.Data.SqlClient
Imports System.Data
Imports System.Globalization
Imports System.Threading
Partial Class NotAuthenticated_JobSearchResult
    Inherits System.Web.UI.Page

    Public Experience As String
    Public Crew As String
    Public Licensed As String
    Public Insured As String
    Public Relocation As String

    Public MHT As String
    Public Months As String
    Public Days As String
    Public Hours As String
    Public Minutes As String

    Public MHC As String
    Public AmountOffered As String
    Public Currency As String

    Public Industry As String
    Public JobTitle() As String
    Public Zipcode As String
    Public Flag As String
    Public CustomZipCode As String
    Public _language As Integer

    Public DefaultSelection As String = "SELECT ProjectRequirements.ProjectID, ProjectRequirements.CategoryName,  ProjectRequirements.AmountOffered,  ProjectRequirements.Description, " + _
        "ProjectRequirements.CountryName, (SELECT Path FROM CountriesUpdate WHERE (CountryId = ProjectRequirements.CountryID)) AS CountryFlag, ProjectRequirements.RegionName,ProjectPhoto.PhotoID, " + _
        "ProjectPhoto.PhotoPath, Projects.Status, Projects.StatusInt, Projects.HighestBid, Projects.HighestBidderID, Projects.HighestBidUsername, Projects.NumberofBids,  ProjectRequirements.TimeLeft " + _
        " FROM ProjectRequirements INNER JOIN Projects ON ProjectRequirements.ProjectID = Projects.ProjectID INNER JOIN ProjectPhoto ON ProjectRequirements.ProjectID = ProjectPhoto.ProjectID"

    '''''''''''''''''''''''''''''''''''' PAGE EVENTS '''''''''''''''''''''''''''''''''''''''''''''  
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

        If Page.IsPostBack = False Then
            Try
                TimeUP()
            Catch ex As Exception
                JobResultSqlDataSource.SelectCommand = DefaultSelection.ToString
                JobResultGridView.DataBind()
            End Try
        End If

        If Not (Session("ProjectQuery") Is Nothing) Then

            JobResultSqlDataSource.SelectCommand = Session("ProjectQuery").ToString

            If Len(Request.QueryString("m")) <> 0 Then

                Select Case (Request.QueryString("m").ToString())

                    Case "basictitle"
                        JobResultSqlDataSource.SelectCommand = Session("ProjectQuery").ToString

                    Case "basicskill"
                        JobResultSqlDataSource.SelectCommand = Session("ProjectQuery").ToString

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

                        If Not (Session("MustHaveTimeFrame").ToString() Is Nothing) Then
                            TimeFrameMustHaveDropDownList.SelectedIndex = Session("MustHaveTimeFrame").ToString
                        Else
                            TimeFrameMustHaveDropDownList.SelectedIndex = 0
                        End If

                        If Not (Session("Months").ToString() Is Nothing) Then
                            MonthTextBox.Text = Session("Months").ToString
                        Else
                            MonthTextBox.Text = 0
                        End If
                        If Not (Session("Days").ToString() Is Nothing) Then
                            DaySilderTextBox.Text = Session("Days").ToString
                        Else
                            DaySilderTextBox.Text = 0
                        End If
                        If Not (Session("Hours").ToString() Is Nothing) Then
                            HoursTextBox.Text = Session("Hours").ToString
                        Else
                            HoursTextBox.Text = 0
                        End If
                        If Not (Session("Minutes").ToString() Is Nothing) Then
                            MinutesTextBox.Text = Session("Minutes").ToString
                        Else
                            MinutesTextBox.Text = 0
                        End If

                        If Not (Session("MustHaveCurrency").ToString() Is Nothing) Then
                            CurrencyMustHaveDropDownList.SelectedIndex = Session("MustHaveCurrency").ToString
                        Else
                            CurrencyMustHaveDropDownList.SelectedIndex = 0
                        End If
                        If Not (Session("Amount").ToString() Is Nothing) Then
                            AmountOfferedTextBox.Text = Session("Amount").ToString
                        Else
                            AmountOfferedTextBox.Text = 0
                        End If
                        If Not (Session("Currency").ToString() Is Nothing) Then
                            CurrencyMustHaveDropDownList.SelectedIndex = Session("Currency").ToString
                        Else
                            CurrencyMustHaveDropDownList.SelectedIndex = 0
                        End If

                        If Not (Request.QueryString("zip") Is Nothing) Then
                            FromTextBox.Text = Request.QueryString("zip").ToString()
                        End If

                    Case "custom"
                        JobResultSqlDataSource.SelectCommand = Session("ProjectQuery").ToString

                    Case "continents"
                        JobResultSqlDataSource.SelectCommand = Session("ProjectQuery").ToString

                End Select

                JobResultSqlDataSource.DataBind()
                JobResultGridView.DataBind()
            Else
                JobResultSqlDataSource.SelectCommand = Session("ProjectQuery").ToString
                JobResultSqlDataSource.DataBind()
                JobResultGridView.DataBind()
            End If

        End If

        GetAttribute()
        CustomSelection()
        ActivateLanguage()
        CustomZipCode = ""
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

        If Not (Request.QueryString("tl") Is Nothing) Then
            MHT = Request.QueryString("tl").ToString()
        End If

        If Not (Request.QueryString("amou") Is Nothing) Then
            AmountOffered = Request.QueryString("amou").ToString()
        End If

        If Not (Request.QueryString("curr") Is Nothing) Then
            Currency = Request.QueryString("curr").ToString()
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

    Public Sub CustomSelection()

        Dim IndustryJobsTableAdapter As New JobSearchResultTableAdapters.IndustryJobsTableAdapter
        Dim ProfessionalCountryTableAdapter As New JobSearchResultTableAdapters.JobCountryTableAdapter
        Dim ProfessionalRegionTableAdapter As New JobSearchResultTableAdapters.JobRegionTableAdapter

        Dim IndustryJobsDataTable As New JobSearchResult.IndustryJobsDataTable
        Dim StatesDataTable As New JobSearchResult.JobCountryDataTable
        Dim CitiesJobsDataTable As New JobSearchResult.JobRegionDataTable

        IndustryJobsTableAdapter.FillIndustryJob(IndustryJobsDataTable)
        IndustryListBox.DataSource = IndustryJobsDataTable
        IndustryListBox.DataBind()

        ProfessionalCountryTableAdapter.FillJobsCountry(StatesDataTable)
        StateListBox.DataSource = StatesDataTable
        StateListBox.DataBind()

        ProfessionalRegionTableAdapter.FillRegionsJobs(CitiesJobsDataTable)
        CityListBox.DataSource = CitiesJobsDataTable
        CityListBox.DataBind()

        IndustryListBox.SelectedIndex = -1
        StateListBox.SelectedIndex = -1
        CityListBox.SelectedIndex = -1

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

    Protected Sub TimeUP()

        Dim ProfileConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("SideJobConnectionString").ConnectionString)
        ProfileConnection.Open()
        Dim ProfileTransaction As SqlTransaction = ProfileConnection.BeginTransaction()

        Try

            Dim ProfileCommand As New SqlCommand("TimeUP", ProfileConnection, ProfileTransaction)
            ProfileCommand.CommandType = CommandType.StoredProcedure

            Dim reader As SqlDataReader = ProfileCommand.ExecuteReader()
            reader.Close()
            ProfileTransaction.Commit()

        Catch ex As Exception
            ProfileTransaction.Rollback()

            Throw
            Response.Redirect(Request.Url.ToString)

        Finally
            ProfileConnection.Close()

        End Try

    End Sub

    Protected Sub GoToProfileLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        LoadingPanelModalPopupExtender.Show()

        If User.IsInRole("Customer") Then
            Response.Redirect("../Authenticated/Customer/CustomerProfile.aspx")
        End If

        If User.IsInRole("Professional") Then
            Response.Redirect("../Authenticated/Professional/ProfessionalProfile.aspx")
        End If

    End Sub

    Protected Sub CancelLoginButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles JobResultGridView.SelectedIndexChanged
        ModalLoginUpdatePanel.Hide()
    End Sub

    Protected Sub LoginButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If User.Identity.IsAuthenticated = False Then
            ModalLoginUpdatePanel.Show()
        End If
    End Sub

    Protected Function RequirementQuery() As String
        Return " WHERE (ProjectRequirements.CrewNumberID = " + CrewNumberDropDownList.SelectedIndex.ToString + ") AND (ProjectRequirements.ExperienceID = " + ExperienceDropDownList.SelectedIndex.ToString + _
             ") AND (ProjectRequirements.LicensedID = " + LicensedDropDownList.SelectedIndex.ToString() + ") AND (ProjectRequirements.InsuredID = " + InsuredDropDownList.SelectedIndex.ToString + _
             ") AND (ProjectRequirements.RelocationID = " + RelocationDropDownList.SelectedIndex.ToString + ")"
    End Function

    Protected Function GetCustomZipCode() As String

        If Not (Request.QueryString("flag") Is Nothing) Then
            Flag = Request.QueryString("flag").ToString()
        End If

        Dim CustomZipCode As String = " AND (ProjectRequirements.Zipcode IN ( "
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

    Protected Function TimeFrameQuery() As String
        Return " AND DATEDIFF(Minute, '" + DateTime.Today.AddDays(DaySilderTextBox.Text.ToString).AddMonths(MonthTextBox.Text.ToString).ToString("yyyy-MM-dd") + "   " + HoursTextBox.Text.ToString + ":" + MinutesTextBox.Text.ToString + ":00" + " ', ProjectRequirements.EndDate) " + TimeFrameMustHaveDropDownList.SelectedItem.Text + " 0 "
    End Function

    Protected Function CurrencyQuery() As String
        Return " AND  (ProjectRequirements.AmountOffered " + CurrencyMustHaveDropDownList.SelectedItem.Text.ToString + " " + AmountOfferedTextBox.Text.ToString + _
          ") AND (ProjectRequirements.CurrencyID =  " + CurrencyDropDownList2.SelectedItem.Value.ToString + ")"
    End Function

    Protected Sub UpdateAllButton_Click(sender As Object, e As System.EventArgs) Handles UpdateAllButton.Click
        CustomUpdate()
    End Sub

    Protected Sub CustomUpdate()

        LoadingPanelModalPopupExtender.Show()
        If FromTextBox.Text.ToString <> "" Then
            JobResultSqlDataSource.SelectCommand = DefaultSelection + RequirementQuery() + TimeFrameQuery() + CurrencyQuery() + GetCustomZipCode()
        Else
            JobResultSqlDataSource.SelectCommand = DefaultSelection + RequirementQuery() + TimeFrameQuery() + CurrencyQuery()
        End If
        Try
            JobResultSqlDataSource.DataBind()
            JobResultGridView.DataBind()
            ProfessionalResultUpdatePanel.Update()
            LoadingPanelModalPopupExtender.Hide()
        Catch ex As Exception
            LoadingPanelModalPopupExtender.Hide()
        End Try

    End Sub

    Protected Sub JobResultGridView_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles JobResultGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            '' e.Row.Cells[1].ColumnSpan=2;
            e.Row.Cells(0).ColumnSpan = 5
            e.Row.Cells(0).Text = Resources.Resource.Page.ToString() & "  " & (JobResultGridView.PageIndex + 1) & "  " & Resources.Resource.of.ToString() & "  " & JobResultGridView.PageCount
            e.Row.Cells.RemoveAt(1)
            e.Row.Cells.RemoveAt(2)
            e.Row.Cells.RemoveAt(3)
            e.Row.Cells.RemoveAt(4)
        End If
    End Sub
    '''''''''''''''''''''''''''''''''''' PAGE EVENTS '''''''''''''''''''''''''''''''''''''''''''''  

    '''''''''''''''''''''''''''''''''''' PROJECT VIEW '''''''''''''''''''''''''''''''''''''''''''''  
    Protected Sub GlobalProjectPanelDescriptionLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("GlobalProjectPanel") = True
    End Sub

    Protected Sub JobResultGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim Role As String = ""
        Dim UserID As String = ""

        If User.Identity.IsAuthenticated = False Then
            ModalLoginUpdatePanel.Show()
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

            If Session("HistoryBid") = True Then
                MoreBidHistory()
            ElseIf Session("GlobalProjectPanel") = True Then
                ViewProject()
            ElseIf Session("WatchList") = True Then
                Session("WatchList") = False
                Dim AddtoWatchQuery As New JobSearchResultTableAdapters.QueriesTableAdapter
                AddtoWatchQuery.AddWatchList(JobResultGridView.SelectedPersistedDataKey.Item("ProjectID").ToString(), UserID.ToString, Role.ToString)
            Else
                If JobResultGridView.SelectedPersistedDataKey.Item("StatusInt").ToString = "0" Then
                    Dim timeleftlabel As Label = CType(JobResultGridView.SelectedRow.FindControl("BoundedTimeLeft"), Label)
                    Dim formatedstring As String
                    Dim TempArray() As String = Split(timeleftlabel.Text.ToString)
                    formatedstring = TempArray(0) + " " + Resources.Resource.Days + " " + _
                        TempArray(2) + " " + Resources.Resource.Hours + " " + _
                        TempArray(4) + " " + Resources.Resource.Minutes + " "

                    FormatedTimeLeftLabel.Text = formatedstring.ToString
                    FormatedTimeLeftLabel.DataBind()

                    Dim Days As Integer = Convert.ToInt32(TempArray(0).ToString)
                    Dim Hours As Integer = Convert.ToInt32(TempArray(2).ToString)
                    Dim Minutes As Integer = Convert.ToInt32(TempArray(4).ToString)

                    If Days = 0 And Hours = 0 Then
                        If Minutes = 0 Then
                            TimeUP()
                            JobResultSqlDataSource.DataBind()
                            JobResultGridView.DataBind()
                        End If
                        If Minutes < 5 And Minutes > 0 Then
                            FormatedTimeLeftLabel.ForeColor = Drawing.Color.Red
                            FormatedTimeLeftLabel.Font.Size = "LARGER"
                        End If
                    End If

                    Dim Image As Image = CType(JobResultGridView.SelectedRow.FindControl("ProjectPhoto"), Image)
                    ProjectImage.ImageUrl = Image.ImageUrl
                    ProjectImage.DataBind()
                    BidUpdatePanel.Update()
                    BidPanelModalPopupExtender.Show()
                Else
                    ClosedProjectModalPopupExtender.Show()
                End If
            End If
        End If

    End Sub

    Protected Sub JobResultGridView_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        Select Case e.CommandName.ToString
            Case "ProjectSpecification"
                MoreProjectModalPopupExtender.Show()
        End Select
    End Sub

    Protected Sub OkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("GlobalProjectPanel") = "false"
        MoreProjectModalPopupExtender.Hide()
    End Sub

    Protected Sub ProjectPhotoFormView_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewPageEventArgs)
        MoreProjectModalPopupExtender.Show()
    End Sub

    Protected Sub ViewProject()

        Dim ProjectviewAdpater As New ViewProjectDataSetTableAdapters.ProjectRequirementsTableAdapter
        Dim ProjectViewDataTable As New ViewProjectDataSet.ProjectRequirementsDataTable
        Dim ProjectPhotoAdpater As New ViewProjectDataSetTableAdapters.ProjectPhotoTableAdapter
        Dim ProjectPhotoDataTable As New ViewProjectDataSet.ProjectPhotoDataTable

        ProjectviewAdpater.FillViewProject(ProjectViewDataTable, JobResultGridView.SelectedPersistedDataKey.Item("ProjectID").ToString)
        ProjectPhotoAdpater.FillProjectPhoto(ProjectPhotoDataTable, JobResultGridView.SelectedPersistedDataKey.Item("ProjectID").ToString)
        ProjectPhotoObjectDataSource.SelectParameters(0).DefaultValue = JobResultGridView.SelectedPersistedDataKey.Item("ProjectID").ToString()
        ProjectPhotoFormView.DataBind()

        ProjectIDView.Text = ProjectViewDataTable.Rows(0).Item(0).ToString
        TitleView.Text = ProjectViewDataTable.Rows(0).Item(11).ToString
        IndustryView.Text = ProjectViewDataTable.Rows(0).Item(3).ToString
        SpecializationView.Text = ProjectViewDataTable.Rows(0).Item(5).ToString
        TimeLeftView.Text = ProjectViewDataTable.Rows(0).Item(27).ToString
        HighestBidView.Text = ProjectViewDataTable.Rows(0).Item(28).ToString

        CountryView.Text = ProjectViewDataTable.Rows(0).Item(20).ToString
        StateView.Text = ProjectViewDataTable.Rows(0).Item(22).ToString

        Dim DescriptionLength As Integer = 0
        Dim CustomDescription As String
        CustomDescription = ProjectViewDataTable.Rows(0).Item(16).ToString()
        If CustomDescription.Length < 500 Then
            DescriptionLength = CustomDescription.Length
        Else
            DescriptionLength = 500
        End If
        CustomDescriptionLabel.Text = ProjectViewDataTable.Rows(0).Item(16).ToString.Substring(0, DescriptionLength)
        NotesView.Text = ProjectViewDataTable.Rows(0).Item(17).ToString

        Dim ExperienceAdapter As New ViewProjectDataSetTableAdapters.ExperienceTableAdapter
        Dim ExperienceTable As New ViewProjectDataSet.ExperienceDataTable
        ExperienceAdapter.FillExperience(ExperienceTable, ProjectViewDataTable.Rows(0).Item(6).ToString)
        ExperienceView.Text = ExperienceTable.Rows(0).Item(0).ToString

        Dim InsuredAdpater As New ViewProjectDataSetTableAdapters.InsuredTableAdapter
        Dim InsuredTable As New ViewProjectDataSet.InsuredDataTable
        InsuredAdpater.FillInsured(InsuredTable, ProjectViewDataTable.Rows(0).Item(9).ToString)
        InsuredView.Text = InsuredTable.Rows(0).Item(0).ToString

        Dim LicensedAdapter As New ViewProjectDataSetTableAdapters.LicensedTableAdapter
        Dim LicensedTable As New ViewProjectDataSet.LicensedDataTable
        LicensedAdapter.FillLicensed(LicensedTable, ProjectViewDataTable.Rows(0).Item(8).ToString)
        LicensedView.Text = LicensedTable.Rows(0).Item(0).ToString

        Dim CrewAdapter As New ViewProjectDataSetTableAdapters.CrewNumberTableAdapter
        Dim CrewTable As New ViewProjectDataSet.CrewNumberDataTable
        CrewAdapter.FillCrewNumber(CrewTable, ProjectViewDataTable.Rows(0).Item(7).ToString)
        CrewNumberView.Text = CrewTable.Rows(0).Item(0).ToString

        Dim RelocationAdapter As New ViewProjectDataSetTableAdapters.RelocationTableAdapter
        Dim RelocationTable As New ViewProjectDataSet.RelocationDataTable
        RelocationAdapter.FillRelocation(RelocationTable, ProjectViewDataTable.Rows(0).Item(10).ToString)
        RelocationView.Text = RelocationTable.Rows(0).Item(0).ToString

        MoreProjectUpdatePanel.Update()
        MoreProjectModalPopupExtender.Show()

    End Sub
    '''''''''''''''''''''''''''''''''''' PROJECT VIEW '''''''''''''''''''''''''''''''''''''''''''''  

    ''''''''''''''''''''''''''''''''''''''''''Bids''''''''''''''''''''''''''''''''''''''''''''''''''  
    Protected Sub NewBid()

        Dim Role As String = ""
        Dim UserID As String = ""
        Dim UserName As String = ""

        If User.Identity.IsAuthenticated = False Then
            ModalLoginUpdatePanel.Show()
        Else
            Dim guidStringUser As Guid = New Guid(Membership.GetUser.ProviderUserKey().ToString())

            If User.IsInRole("Customer") Then
                Role = "CUS"
                Dim GetCustomerAdapter As New GetUserIDTableAdapters.LookUpRolesTableAdapter
                Dim CustomerTable As New GetUserID.LookUpRolesDataTable
                GetCustomerAdapter.FillCustomerID(CustomerTable, guidStringUser.ToString())
                UserID = CustomerTable.Item(0).CustomerId.ToString

                ''Customer General 
                Dim CustomerInformationAdapter As New GetUserInformationTableAdapters.CustomerGeneralTableAdapter
                Dim CustomerInformationTable As New GetUserInformation.CustomerGeneralDataTable
                CustomerInformationAdapter.FillCustomerInformation(CustomerInformationTable, UserID.ToString)
                UserName = CustomerInformationTable.Item(0).UserName.ToString()

            ElseIf User.IsInRole("Professional") Then
                Role = "PRO"
                Dim GetProfessionalAdapter As New GetUserIDTableAdapters.LookUpProRolesTableAdapter
                Dim ProfessionalTable As New GetUserID.LookUpProRolesDataTable
                GetProfessionalAdapter.FillProfessionalID(ProfessionalTable, guidStringUser.ToString())
                UserID = ProfessionalTable.Item(0).ProfessionalId.ToString

                ''Professional General 
                Dim ProfessionalInformationAdapter As New GetUserInformationTableAdapters.ProfessionalGeneralTableAdapter
                Dim ProfessionalInformationTable As New GetUserInformation.ProfessionalGeneralDataTable
                ProfessionalInformationAdapter.FillProfessionalInformation(ProfessionalInformationTable, UserID.ToString)
                UserName = ProfessionalInformationTable.Item(0).UserName.ToString()

            End If

            Dim BidInformationAdapter As New JobSearchResultTableAdapters.ProjectsTableAdapter
            Dim BidInformationTable As New JobSearchResult.ProjectsDataTable
            BidInformationAdapter.FillProject(BidInformationTable, Me.JobResultGridView.SelectedPersistedDataKey.Item("ProjectID").ToString())

            NewBidObjectDataSource.UpdateParameters("HighestBid").DefaultValue = NewAmountTextBox.Text.ToString
            NewBidObjectDataSource.UpdateParameters("HighestBidderID").DefaultValue = UserID.ToString
            NewBidObjectDataSource.UpdateParameters("HighestBidUsername").DefaultValue = UserName.ToString

            NewBidObjectDataSource.UpdateParameters("original_ProjectID").DefaultValue = BidInformationTable.Rows(0).Item("ProjectID").ToString
            NewBidObjectDataSource.UpdateParameters("original_HighestBid").DefaultValue = BidInformationTable.Rows(0).Item("HighestBid").ToString
            NewBidObjectDataSource.UpdateParameters("original_HighestBidderID").DefaultValue = BidInformationTable.Rows(0).Item("HighestBidderID").ToString
            NewBidObjectDataSource.UpdateParameters("original_HighestBidUsername").DefaultValue = BidInformationTable.Rows(0).Item("HighestBidUsername").ToString
            NewBidObjectDataSource.Update()

            Dim todaydate As String = DateTime.UtcNow.ToShortDateString.ToString
            Dim PlaceBidQuery As New JobSearchResultTableAdapters.QueriesTableAdapter
            PlaceBidQuery.PlaceBid(JobResultGridView.SelectedPersistedDataKey.Item("ProjectID").ToString, UserID, UserName, DateTime.UtcNow.ToShortDateString.ToString, NewAmountTextBox.Text.ToString, CurrencyDropDownList.SelectedItem.Value.ToString, Role)

            JobResultGridView.DataBind()
            ProfessionalResultUpdatePanel.Update()
            LoadingPanelModalPopupExtender.Show()
            BidPanelModalPopupExtender.Hide()
            LoadingPanelModalPopupExtender.Hide()

        End If

    End Sub

    Protected Sub NewBidCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)

        args.IsValid = False

        Try

            Dim newvalue As Decimal = Convert.ToDecimal(NewAmountTextBox.Text.ToString)
            Dim BidInformationAdapter As New JobSearchResultTableAdapters.ProjectsTableAdapter
            Dim BidInformationTable As New JobSearchResult.ProjectsDataTable
            BidInformationAdapter.FillProject(BidInformationTable, JobResultGridView.SelectedPersistedDataKey.Item("ProjectID").ToString())

            Dim oldvalues As Decimal
            If BidInformationTable.Rows(0).Item("HighestBid").ToString = "" Then
                oldvalues = 0
            Else
                oldvalues = Convert.ToDecimal(BidInformationTable.Rows(0).Item("HighestBid").ToString)
            End If

            NewBidCustomValidator.ErrorMessage = Resources.Resource.BidGreaterThan + BidInformationTable.Rows(0).Item("HighestBid").ToString
            args.IsValid = newvalue > oldvalues

        Catch ex As Exception
            args.IsValid = False
        End Try

    End Sub

    Protected Sub MoreBidHistory()
        HistoryBidGridView.DataBind()
        Session("HistoryBid") = False
        HistoryBidModalPopupExtender.Show()
    End Sub

    Protected Sub HistoryBidButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("HistoryBid") = False
        HistoryBidModalPopupExtender.Hide()
    End Sub

    Protected Sub HistoryBidGridView_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs)
        HistoryBidModalPopupExtender.Show()
    End Sub

    Protected Sub HistoryBidGridView_Sorting(sender As Object, e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles HistoryBidGridView.Sorting
        HistoryBidModalPopupExtender.Show()
    End Sub

    Protected Sub PlaceBidButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If Page.IsValid Then
            NewBid()
            BidPanelModalPopupExtender.Hide()
        Else
            NewBidGridView.DataBind()
            BidPanelModalPopupExtender.Show()
        End If
    End Sub

    Protected Sub BidLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        LoadingPanelModalPopupExtender.Hide()
    End Sub

    Protected Sub CancelNewBid_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelNewBidButton.Click
        MoreProjectModalPopupExtender.Hide()
    End Sub

    Protected Sub MoreBriefProjectBidLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("HistoryBid") = True
    End Sub

    Protected Sub CloseProjectClosedButton_Click(sender As Object, e As System.EventArgs) Handles CloseProjectClosedButton.Click
        ClosedProjectModalPopupExtender.Hide()
    End Sub
    ''''''''''''''''''''''''''''''''''''''''''Bids''''''''''''''''''''''''''''''''''''''''''''''''''  

    ''''''''''''''''''''''''''''''''''''''''''WATCHLIST''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub WatchListLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("WatchList") = True
    End Sub
    ''''''''''''''''''''''''''''''''''''''''''WATCHLIST''''''''''''''''''''''''''''''''''''''''''''''''''




End Class


'////////////////DONE//////////////////'
'GoToProfileLinkButton_Click
'GlobalProjectPanelDescriptionLinkButton_Click
'JobResultGridView_RowCommand
'OkButton_Click
'ProjectPhotoFormView_PageIndexChanging
'ViewProject
'MoreBidHistory
'HistoryBidButton_Click
'HistoryBidGridView_PageIndexChanging
'HistoryBidGridView_Sorting
'PlaceBidButton_Click
'BidLinkButton_Click
'CancelNewBid_Click
'MoreBriefProjectBidLinkButton_Click
'WatchListLinkButton_Click
'CloseProjectClosedButton_Click
'NewBidCustomValidator_ServerValidate
'NewBid
'JobResultGridView_SelectedIndexChanged
'PageLoad


'///////////////NOT DONE//////////////'
''LOGIICALLY NEED TO CHECK THE DATBASE
''TIMEUP


