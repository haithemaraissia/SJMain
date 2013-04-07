Imports System.Data.SqlClient
Imports System.Data
Imports System.Globalization
Imports System.Threading
Partial Class FindJob
    Inherits System.Web.UI.Page

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''GLOBAL VARIABLES'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Public _language As Integer
    Dim QueryString As String
    Dim GlobalQuery As String = "SELECT ProjectRequirements.ProjectID, ProjectRequirements.CategoryName,  ProjectRequirements.AmountOffered,  ProjectRequirements.Description," + _
        "ProjectRequirements.CountryName, (SELECT Path FROM CountriesUpdate WHERE (CountryId = ProjectRequirements.CountryID)) AS CountryFlag, ProjectRequirements.RegionName,ProjectPhoto.PhotoID, ProjectPhoto.PhotoPath, Projects.Status, Projects.StatusInt, Projects.HighestBid, Projects.HighestBidderID," + _
        "Projects.HighestBidUsername, Projects.NumberofBids,  ProjectRequirements.TimeLeft FROM ProjectRequirements INNER JOIN Projects ON ProjectRequirements.ProjectID = Projects.ProjectID" + _
        " INNER JOIN ProjectPhoto ON ProjectRequirements.ProjectID = ProjectPhoto.ProjectID "

    Public Property Language() As Integer
        Get
            Return _language
        End Get
        Set(ByVal value As Integer)
            value = _language
        End Set
    End Property
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''GLOBAL VARIABLES'''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''Page Clean Up''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            Me.CountryDropDownList.SelectedIndex = 0
            Me.RegionsDropDownList.SelectedIndex = 0
            Me.FindJobWizard.ActiveStepIndex = 0
            Response.Expires = 0
            Session("QueryString") = Nothing
        End If
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
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''Page Clean Up''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''' Basic ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub BasicSearchButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BasicSearchButton.Click

        Dim ProfileConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("SideJobConnectionString").ConnectionString)
        ProfileConnection.Open()
        Dim ProfileTransaction As SqlTransaction = ProfileConnection.BeginTransaction()
        Try
            Dim ProfileCommand As New SqlCommand("CustomKeywordsJobs", ProfileConnection, ProfileTransaction)
            ProfileCommand.CommandType = CommandType.StoredProcedure
            Dim CustomKey As New SqlParameter("@CustomKeyWord", SqlDbType.NVarChar, 100)
            CustomKey.Value = BasicSearchTextBox.Text.ToString
            ProfileCommand.Parameters.Add(CustomKey)

            Dim Result As New SqlParameter("@Result", SqlDbType.Int)
            Result.Direction = ParameterDirection.Output
            Result.Value = 0
            ProfileCommand.Parameters.Add(Result)

            Dim reader As SqlDataReader = ProfileCommand.ExecuteReader()
            Dim TestResult As String = Result.Value
            Dim CustomResult As Integer = Convert.ToInt32(Result.Value)

            If CustomResult = 0 Then
                Session("ProjectQuery") = "SELECT ProjectRequirements.ProjectID, ProjectRequirements.CategoryName,  ProjectRequirements.AmountOffered,  ProjectRequirements.Description,  ProjectRequirements.CountryName, (SELECT Path FROM CountriesUpdate WHERE (CountryId = ProjectRequirements.CountryID)) AS CountryFlag, ProjectRequirements.RegionName,ProjectPhoto.PhotoID, ProjectPhoto.PhotoPath, Projects.Status, Projects.StatusInt, Projects.HighestBid, Projects.HighestBidderID, Projects.HighestBidUsername, Projects.NumberofBids,  ProjectRequirements.TimeLeft FROM ProjectRequirements INNER JOIN Projects ON ProjectRequirements.ProjectID = Projects.ProjectID INNER JOIN ProjectPhoto ON ProjectRequirements.ProjectID = ProjectPhoto.ProjectID WHERE ProjectRequirements.ProjectID = -1 "
            Else
                Session("ProjectQuery") = "SELECT ProjectRequirements.ProjectID, ProjectRequirements.CategoryName,  ProjectRequirements.AmountOffered,  ProjectRequirements.Description,  ProjectRequirements.CountryName, (SELECT Path FROM CountriesUpdate WHERE (CountryId = ProjectRequirements.CountryID)) AS CountryFlag, ProjectRequirements.RegionName,ProjectPhoto.PhotoID, ProjectPhoto.PhotoPath, Projects.Status, Projects.StatusInt, Projects.HighestBid, Projects.HighestBidderID, Projects.HighestBidUsername, Projects.NumberofBids,  ProjectRequirements.TimeLeft FROM ProjectRequirements INNER JOIN Projects ON ProjectRequirements.ProjectID = Projects.ProjectID INNER JOIN ProjectPhoto ON ProjectRequirements.ProjectID = ProjectPhoto.ProjectID WHERE (ProjectRequirements.ProjectTitle LIKE  '%" + BasicSearchTextBox.Text.ToString + "%')"
            End If
            reader.Close()
            ProfileTransaction.Commit()

        Catch ex As Exception
            Throw
            Response.Redirect(Request.Url.ToString)
        Finally
            ProfileConnection.Close() 'Finally, close the connection
        End Try
        QueryString = "JobSearchResult.aspx?m=basictitle&un=" + BasicSearchTextBox.Text.ToString
        Response.Redirect(QueryString.ToString())
        Response.Expires = 0

    End Sub

    Protected Sub SearchByIndustryButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchByIndustryButton.Click

        Dim Industry As String = "WHERE ProjectRequirements.CategoryID = " + Me.IndustryDropDownList.SelectedValue.ToString
        Dim JobTitle As String = ""
        Dim specialization As New ArrayList
        Dim JobID As String = ""
        Dim i As Integer

        ActivateLanguage()
        Dim LCIDString As String = " AND ProjectRequirements.LCID = " + _language.ToString

        For i = 0 To Me.SpecialityListBox1.Items.Count - 1
            If Me.SpecialityListBox1.Items(i).Selected = True Then
                specialization.Add(SpecialityListBox1.Items(i).Value.ToString)
                JobID += SpecialityListBox1.Items(i).Value.ToString + ","
            End If
        Next
        For i = 0 To Me.SpecialityListBox2.Items.Count - 1
            If Me.SpecialityListBox2.Items(i).Selected = True Then
                specialization.Add(SpecialityListBox2.Items(i).Value.ToString)
                JobID += SpecialityListBox2.Items(i).Value.ToString + ","
            End If
        Next
        For i = 0 To Me.SpecialityListBox3.Items.Count - 1
            If Me.SpecialityListBox3.Items(i).Selected = True Then
                specialization.Add(SpecialityListBox3.Items(i).Value.ToString)
                JobID += SpecialityListBox3.Items(i).Value.ToString + ","
            End If
        Next

        If specialization.Count = 0 Then
            JobTitle = ""
        Else

            JobTitle = " AND ProjectRequirements.JobID =  "
            Dim RecursiveString = " OR ProjectRequirements.JobID = "
            For i = 0 To specialization.Count - 1
                JobTitle += specialization.Item(i).ToString
                If i <= specialization.Count - 2 Then
                    JobTitle += RecursiveString
                End If
            Next

        End If

        Session("ProjectQuery") = GlobalQuery + Industry.ToString + JobTitle.ToString + LCIDString.ToString
        QueryString = "JobSearchResult.aspx?m=basicskill"
        QueryString += "&ind=" + Me.IndustryDropDownList.SelectedValue.ToString + "&jid=" + JobID.ToString + "&lcid=" + _language.ToString
        Response.Redirect(QueryString)
        Response.Expires = 0

    End Sub

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''' Basic ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''' Advanced '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub AdvancedSearchButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AdvancedSearchButton.Click

        Dim Industry As String = "WHERE ProjectRequirements.CategoryID = " + Me.IndustryDropDownList2.SelectedValue.ToString
        Dim JobTitle As String = ""
        Dim specialization As New ArrayList
        Dim i As Integer
        Dim JobID As String = ""

        ActivateLanguage()
        Dim LCIDString As String = " AND ProjectRequirements.LCID = " + _language.ToString

        For i = 0 To Me.SpecialityListBox21.Items.Count - 1
            If Me.SpecialityListBox21.Items(i).Selected = True Then
                specialization.Add(SpecialityListBox21.Items(i).Value.ToString)
                JobID += SpecialityListBox21.Items(i).Value.ToString + ","
            End If
        Next
        For i = 0 To Me.SpecialityListBox23.Items.Count - 1
            If Me.SpecialityListBox23.Items(i).Selected = True Then
                specialization.Add(SpecialityListBox23.Items(i).Value.ToString)
                JobID += SpecialityListBox23.Items(i).Value.ToString + ","
            End If
        Next
        For i = 0 To Me.SpecialityListBox22.Items.Count - 1
            If Me.SpecialityListBox22.Items(i).Selected = True Then
                specialization.Add(SpecialityListBox22.Items(i).Value.ToString)
                JobID += SpecialityListBox22.Items(i).Value.ToString + ","
            End If
        Next

        If specialization.Count = 0 Then
            JobTitle = ""
        Else

            JobTitle = " AND ProjectRequirements.JobID =  "
            Dim RecursiveString = " OR ProjectRequirements.JobID = "
            For i = 0 To specialization.Count - 1
                JobTitle += specialization.Item(i).ToString
                If i <= specialization.Count - 2 Then
                    JobTitle += RecursiveString
                End If
            Next
        End If

        Dim ProjectRequirement As String = " AND ProjectRequirements.ExperienceID = " + Me.ExperienceDropDownList.SelectedItem.Value.ToString + " AND ProjectRequirements.CrewNumberID = " + Me.CrewNumberDropDownList.SelectedItem.Value.ToString + " AND ProjectRequirements.InsuredID = " + Me.InsuredDropDownList.SelectedItem.Value.ToString + " AND ProjectRequirements.RelocationID = " + _
        Me.RelocationDropDownList.SelectedItem.Value.ToString + " AND ProjectRequirements.LicensedID = " + Me.LicensedDropDownList.SelectedItem.Value.ToString
        Dim ProjectCurrency As String = " AND ProjectRequirements.AmountOffered >= " + Me.AmountOfferedTextBox.Text.ToString + " AND ProjectRequirements.CurrencyID = " + Me.CurrencyDropDownList.SelectedItem.Value.ToString
        Dim Location As String = " AND ProjectRequirements.CountryID = " + Me.CountryDropDownList.SelectedValue.ToString + " AND ProjectRequirements.RegionID = " + Me.RegionsDropDownList.SelectedValue.ToString
        If Me.CitiesDropDownList.SelectedIndex <> -1 Then
            Location += " AND ProjectRequirements.CityID =  " + Me.CitiesDropDownList.SelectedValue.ToString
        End If
        Dim TimeLeft As String = " AND ProjectRequirements.EndDate  " + Me.TimeLeftDropDownList.SelectedItem.Text.ToString + " '" + DateTime.Now.AddMonths(Me.MonthTextBox.Text.ToString).AddDays(Me.DaysTextBox.Text.ToString).AddHours(HoursTextBox.Text.ToString).AddMinutes(Me.MinutesTextBox.Text.ToString).ToString + "'"

        Session("Experience") = ExperienceDropDownList.SelectedIndex.ToString
        Session("Licensed") = LicensedDropDownList.SelectedIndex.ToString
        Session("Crew") = CrewNumberDropDownList.SelectedIndex.ToString
        Session("Insured") = InsuredDropDownList.SelectedIndex.ToString
        Session("Relocation") = RelocationDropDownList.SelectedIndex.ToString
        Session("MustHaveTimeFrame") = TimeLeftDropDownList.SelectedIndex.ToString
        Session("Months") = MonthTextBox.Text.ToString
        Session("Days") = DaysTextBox.Text.ToString
        Session("Hours") = HoursTextBox.Text.ToString
        Session("Minutes") = MinutesTextBox.Text.ToString
        Session("MustHaveCurrency") = CurrencyDropDownList.SelectedIndex.ToString
        Session("Amount") = AmountOfferedTextBox.Text.ToString
        Session("Currency") = CurrencyDropDownList.SelectedIndex.ToString

        '''''''''''''''''''''''''''''''''''''''''''''Country Code'''''''''''''''''''''''''''''''''''''''''''''''''
        'CANADA(43)
        'USA 254
        '''''''''''''''''''''''''''''''''''''''''''''Country Code'''''''''''''''''''''''''''''''''''''''''''''''''

        Dim NorthAmericaCustomSearch As Boolean = False
        Dim ZipCode As String = ""

        If Me.CountryDropDownList.SelectedValue = 43 Or Me.CountryDropDownList.SelectedValue = 254 Then
            If ZipcodeTextBox.Text.ToString <> "" Then
                ZipCode = " AND ProjectRequirements.Zipcode = '" + System.Web.HttpUtility.HtmlEncode(ZipcodeTextBox.Text.ToString) + "'"
                Session("Zipcode") = System.Web.HttpUtility.HtmlEncode(ZipcodeTextBox.Text.ToString)
                NorthAmericaCustomSearch = True
            End If
        End If

        If NorthAmericaCustomSearch = True Then
            Session("ProjectQuery") = GlobalQuery + Industry.ToString + Location.ToString + ProjectRequirement.ToString + TimeLeft.ToString + ProjectCurrency.ToString() + JobTitle.ToString + ZipCode.ToString + LCIDString.ToString
        Else
            Session("ProjectQuery") = GlobalQuery + Industry.ToString + Location.ToString + ProjectRequirement.ToString + TimeLeft.ToString + ProjectCurrency.ToString() + JobTitle.ToString + LCIDString.ToString
        End If


        Dim QueryString As String = GlobalQuery
        QueryString = "JobSearchResult.aspx?m=advanced&ex=" + ExperienceDropDownList.SelectedIndex.ToString + "&li=" + LicensedDropDownList.SelectedIndex.ToString + "&cr=" + CrewNumberDropDownList.SelectedIndex.ToString + "&in=" + InsuredDropDownList.SelectedIndex.ToString + "&re=" + RelocationDropDownList.SelectedIndex.ToString
        QueryString += "&tl=" + TimeLeftDropDownList.SelectedItem.Text.ToString + DateTime.Now.AddMonths(Me.MonthTextBox.Text.ToString).AddDays(Me.DaysTextBox.Text.ToString).AddHours(HoursTextBox.Text.ToString).AddMinutes(Me.MinutesTextBox.Text.ToString).ToString + "&amou=" + AmountOfferedTextBox.Text.ToString + "&curr=" + CurrencyDropDownList.SelectedItem.Value.ToString
        QueryString += "&ind=" + Me.IndustryDropDownList2.SelectedValue.ToString + "&jid=" + JobID.ToString
        QueryString += "&zip=" + System.Web.HttpUtility.HtmlEncode(ZipcodeTextBox.Text.ToString)

        If NorthAmericaCustomSearch = True Then
            If CountryDropDownList.SelectedValue = 43 Then
                QueryString += "&flag=ca"
            ElseIf CountryDropDownList.SelectedValue = 254 Then
                QueryString += "&flag=us"
            End If
        End If

        Response.Redirect(QueryString)
        Response.Expires = 0
    End Sub
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''' Advanced '''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''' Custom '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub CustomSearchButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CustomSearchButton.Click
        Me.ProjectRegularExpressionValidator.Validate()
        Me.ProjectRequiredFieldValidator.Validate()
        If Me.ProjectRegularExpressionValidator.IsValid And Me.ProjectRequiredFieldValidator.IsValid Then
            QueryString = "JobSearchResult.aspx?m=custom" + ProjectIDTextBox.Text.ToString
            Session("ProjectQuery") = GlobalQuery + " AND ProjectRequirements.ProjectID  =" + ProjectIDTextBox.Text.ToString
            Response.Redirect(QueryString)
        End If
        Response.Expires = 0
    End Sub

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''' Custom '''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''' Browse Continents '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub BindRegions(ByVal Continent As Integer)

        Select Case Continent

            Case 1
                ContinentObjectDataSource.SelectParameters("ContinentReference").DefaultValue = "North America"
                ContinentObjectDataSource.DataBind()
                Me.CountryDataList.RepeatColumns = 5
                Me.CountryDataList.DataBind()

            Case 2
                Me.ContinentObjectDataSource.SelectParameters("ContinentReference").DefaultValue = "South America"
                Me.ContinentObjectDataSource.DataBind()
                Me.CountryDataList.RepeatColumns = 5
                Me.CountryDataList.DataBind()

            Case 3
                Me.ContinentObjectDataSource.SelectParameters("ContinentReference").DefaultValue = "Europe"
                Me.ContinentObjectDataSource.DataBind()
                Me.CountryDataList.RepeatColumns = 5
                Me.CountryDataList.DataBind()

            Case 4
                Me.ContinentObjectDataSource.SelectParameters("ContinentReference").DefaultValue = "Africa"
                Me.ContinentObjectDataSource.DataBind()
                Me.CountryDataList.RepeatColumns = 5
                Me.CountryDataList.DataBind()

            Case 5
                Me.ContinentObjectDataSource.SelectParameters("ContinentReference").DefaultValue = "Asia"
                Me.ContinentObjectDataSource.DataBind()
                Me.CountryDataList.RepeatColumns = 5
                Me.CountryDataList.DataBind()

            Case 6
                Me.ContinentObjectDataSource.SelectParameters("ContinentReference").DefaultValue = "Southeast Asia"
                Me.ContinentObjectDataSource.DataBind()
                Me.CountryDataList.RepeatColumns = 5
                Me.CountryDataList.DataBind()

            Case 7
                Me.ContinentObjectDataSource.SelectParameters("ContinentReference").DefaultValue = "Middle East"
                Me.ContinentObjectDataSource.DataBind()
                Me.CountryDataList.RepeatColumns = 5
                Me.CountryDataList.DataBind()


            Case 8
                Me.ContinentObjectDataSource.SelectParameters("ContinentReference").DefaultValue = "Oceania OR Arctic OR Antarctic"
                Me.ContinentObjectDataSource.DataBind()
                Me.CountryDataList.RepeatColumns = 5
                Me.CountryDataList.DataBind()

        End Select
    End Sub

    Protected Sub NorthAmericaImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles NorthAmericaImageButton.Click
        BindRegions(1)
        Me.CountryPopupExtender.Show()
    End Sub

    Protected Sub SouthAmericaImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles SouthAmericaImageButton.Click
        BindRegions(2)
        Me.CountryPopupExtender.Show()
    End Sub

    Protected Sub EuropeImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        BindRegions(3)
        Me.CountryPopupExtender.Show()
    End Sub

    Protected Sub AfricaImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        BindRegions(4)
        Me.CountryPopupExtender.Show()
    End Sub

    Protected Sub AsiaImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        BindRegions(5)
        Me.CountryPopupExtender.Show()
    End Sub

    Protected Sub SoutheastAsiaImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        BindRegions(6)
        Me.CountryPopupExtender.Show()
    End Sub

    Protected Sub MiddleEastImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        BindRegions(7)
        Me.CountryPopupExtender.Show()
    End Sub

    Protected Sub OceaniaArcticAntarticImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        BindRegions(8)
        Me.CountryPopupExtender.Show()
    End Sub

    Protected Sub CountryDataList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        Me.RegionObjectDataSource1.SelectParameters("CountryID").DefaultValue = Me.CountryDataList.SelectedValue.ToString
        Me.RegionObjectDataSource1.SelectParameters("SelectedCountry").DefaultValue = CType(CountryDataList.SelectedItem.FindControl("CountryLinkButton"), LinkButton).Text.ToString
        Me.RegionObjectDataSource1.DataBind()
        Me.RegionDataList.DataBind()
        CustomDataListPaging(RegionDataList.Items.Count)

        If Me.RegionDataList.Items.Count = 0 Then
            Me.RegionDataList.Visible = False
            Me.EmptyRegionLabel.Visible = True
        Else
            Me.RegionDataList.Visible = True
            Me.EmptyRegionLabel.Visible = False
        End If
        Me.RegionModalPopupExtender.Show()

    End Sub

    Protected Sub Country_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.CountryPopupExtender.Hide()
    End Sub

    Protected Sub CustomDataListPaging(ByVal numberofrows As Integer)

        If numberofrows > 70 Then
            Dim custompaging As Integer = numberofrows / 10

            Select Case custompaging
                Case 7
                    Me.RegionDataList.Font.Size = 12
                    custompaging = 6

                Case 8
                    Me.RegionDataList.Font.Size = 12
                    custompaging = 7

                Case 9
                    Me.RegionDataList.Font.Size = 8
                    custompaging = 10

                Case 12
                    Me.RegionDataList.Font.Size = 10
                    custompaging = 9

                Case 14
                    Me.RegionDataList.Font.Size = 10
                    custompaging = 11

                Case 15
                    Me.RegionDataList.Font.Size = 9
                    custompaging = 11
            End Select

            Me.RegionDataList.RepeatColumns = custompaging

        Else
            Me.RegionDataList.Font.Size = 12
            Me.RegionDataList.RepeatColumns = 5

        End If

    End Sub

    Protected Sub RegionButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles RegionButton.Click
        Me.RegionModalPopupExtender.Hide()
    End Sub

    Protected Sub RegionDataList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        QueryString = "JobSearchResult.aspx?m=continents"
        Session("ProjectQuery") = GlobalQuery + " WHERE ProjectRequirements.CountryID = " + Me.CountryDataList.SelectedValue.ToString + " AND ProjectRequirements.RegionID = " + Me.RegionDataList.SelectedValue.ToString
        Response.Redirect(QueryString)
        Response.Expires = 0
    End Sub

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''' Browse Continents '''''''''''''''''''''''''''''''''''''''''''''''''''''''''

End Class
