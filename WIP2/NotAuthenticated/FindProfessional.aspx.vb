Imports System.Data.SqlClient
Imports System.Data
Partial Class FindJob
    Inherits System.Web.UI.Page

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''GLOBAL VARIABLES'''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    Dim GlobalQuery As String = "SELECT  ProfessionalSkill.ProID, ProfessionalGeneral.UserName, ProfessionalGeneral.CountryName, (SELECT Path FROM   CountriesUpdate WHERE  (CountryId = ProfessionalGeneral.CountryID)) AS CountryFlag, ProfessionalGeneral.RegionName, Skills.CategoryID, " + _
   " Skills.CategoryName, Skills.JobID, Skills.JobTitle, ProfessionalAdditionalInformation.Rank, ProfessionalAdditionalInformation.Points,  ProfessionalAdditionalInformation.Reputation, " + _
   " ProfessionalAdditionalInformation.ProjectCompleted, ProfessionalAdditionalInformation.MoneyEarned,ProfessionalAdditionalInformation.ProjectCompleted + ProfessionalAdditionalInformation.ProjectCanceled AS TotalProject, SUBSTRING(ProfessionalPortfolio.About, 0, 100) AS About " + _
   " , ProfessionalRating.IntRate, ProfessionalGeneral.PhotoPath FROM Skills INNER JOIN ProfessionalSkill ON Skills.SkillID = ProfessionalSkill.SkillID INNER JOIN ProfessionalGeneral ON ProfessionalSkill.ProID = ProfessionalGeneral.ProID INNER JOIN  ProfessionalAdditionalInformation ON ProfessionalGeneral.ProID = ProfessionalAdditionalInformation.ProID INNER JOIN  ProfessionalPortfolio ON ProfessionalGeneral.ProID = ProfessionalPortfolio.ProID INNER JOIN ProfessionalRating ON ProfessionalGeneral.ProID = ProfessionalRating.ProID WHERE (ProfessionalPortfolio.Modified = 0)"

    Dim QueryString As String

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''GLOBAL VARIABLES'''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''Page Clean Up''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            Me.CountryDropDownList.SelectedIndex = 0
            Me.RegionsDropDownList.SelectedIndex = 0
            Me.FindProfessionalWizard.ActiveStepIndex = 0
            Response.Expires = 0
            Session("ProfessionalQuery") = Nothing
        End If
    End Sub

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''Page Clean Up''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''' Basic ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    Protected Sub SearchByUserNameButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchByUserNameButton.Click
        QueryString = "ProfessionalResult.aspx?m=basicusername&un=" + UsernameTextBox.Text.ToString
        Session("ProfessionalQuery") = GlobalQuery + " And ProfessionalGeneral.Username = '" + System.Web.HttpUtility.HtmlEncode(UsernameTextBox.Text.ToString) + "'"
        Response.Redirect(QueryString)
        Response.Expires = 0
    End Sub

    Protected Sub SearchButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SearchButton.Click

        Dim Industry As String = "AND Skills.CategoryID = " + Me.IndustryDropDownList.SelectedValue.ToString
        Dim JobTitle As String = ""
        Dim specialization As New ArrayList
        Dim JobID As String = ""
        Dim i As Integer

        For i = 0 To Me.SpecialtyListBox1.Items.Count - 1
            If Me.SpecialtyListBox1.Items(i).Selected = True Then
                specialization.Add(SpecialtyListBox1.Items(i).Value.ToString)
                JobID += SpecialtyListBox1.Items(i).Value.ToString + ","
            End If
        Next
        For i = 0 To Me.SpecialtyListBox2.Items.Count - 1
            If Me.SpecialtyListBox2.Items(i).Selected = True Then
                specialization.Add(SpecialtyListBox2.Items(i).Value.ToString)
                JobID += SpecialtyListBox2.Items(i).Value.ToString + ","
            End If
        Next
        For i = 0 To Me.SpecialtyListBox3.Items.Count - 1
            If Me.SpecialtyListBox3.Items(i).Selected = True Then
                specialization.Add(SpecialtyListBox3.Items(i).Value.ToString)
                JobID += SpecialtyListBox3.Items(i).Value.ToString + ","
            End If
        Next

        If specialization.Count = 0 Then
            JobTitle = ""
        Else

            JobTitle = " AND Skills.JobID =  "
            Dim RecursiveString = " OR Skills.JobID = "
            For i = 0 To specialization.Count - 1
                JobTitle += specialization.Item(i).ToString
                If i <= specialization.Count - 2 Then
                    JobTitle += RecursiveString
                End If
            Next

        End If

        Session("ProfessionalQuery") = GlobalQuery + Industry.ToString + JobTitle.ToString
        QueryString = "ProfessionalResult.aspx?m=basicskill"
        QueryString += "&ind=" + Me.IndustryDropDownList.SelectedValue.ToString + "&jid=" + JobID.ToString
        Response.Redirect(QueryString)
        Response.Expires = 0

    End Sub

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''' Basic ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''' Advanced '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub AdvancedSearchButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AdvancedSearchButton.Click

        Dim Industry As String = "AND Skills.CategoryID = " + Me.IndustryDropDownList2.SelectedValue.ToString
        Dim JobTitle As String = ""
        Dim specialization As New ArrayList
        Dim i As Integer
        Dim JobID As String = ""

        For i = 0 To Me.SpecialtyListBox21.Items.Count - 1
            If Me.SpecialtyListBox21.Items(i).Selected = True Then
                specialization.Add(SpecialtyListBox21.Items(i).Value.ToString)
                JobID += SpecialtyListBox21.Items(i).Value.ToString + ","
            End If
        Next
        For i = 0 To Me.SpecialtyListBox23.Items.Count - 1
            If Me.SpecialtyListBox23.Items(i).Selected = True Then
                specialization.Add(SpecialtyListBox23.Items(i).Value.ToString)
                JobID += SpecialtyListBox23.Items(i).Value.ToString + ","
            End If
        Next
        For i = 0 To Me.SpecialtyListBox22.Items.Count - 1
            If Me.SpecialtyListBox22.Items(i).Selected = True Then
                specialization.Add(SpecialtyListBox22.Items(i).Value.ToString)
                JobID += SpecialtyListBox22.Items(i).Value.ToString + ","
            End If
        Next

        If specialization.Count = 0 Then
            JobTitle = ""
        Else
            JobTitle = " AND ( Skills.JobID =  "
            Dim RecursiveString = " OR Skills.JobID = "
            For i = 0 To specialization.Count - 1
                JobTitle += specialization.Item(i).ToString
                If i <= specialization.Count - 2 Then
                    JobTitle += RecursiveString
                End If
            Next
            JobTitle += " )"
        End If

        Dim ProfessionalRequirement As String = " AND Skills.Experience = " + Me.ExperienceDropDownList.SelectedItem.Value.ToString + " AND Skills.Crew = " + Me.CrewNumberDropDownList.SelectedItem.Value.ToString + " AND Skills.Insured = " + Me.InsuredDropDownList.SelectedItem.Value.ToString + " AND Skills.Relocation = " + _
        Me.RelocationDropDownList.SelectedItem.Value.ToString + " AND Skills.Licensed = " + Me.LicensedDropDownList.SelectedItem.Value.ToString + _
        " AND ProfessionalAdditionalInformation.ProjectCompleted " + Me.MustHaveDropDownList.SelectedItem.Text.ToString + " " + ProjectsCompleted.Text.ToString + _
        " AND ProfessionalAdditionalInformation.Reputation " + Me.MustHaveDropDownList.SelectedItem.Text.ToString + " " + Me.Reputation.Text.ToString

        Dim Location As String = " AND ProfessionalGeneral.CountryID = " + Me.CountryDropDownList.SelectedValue.ToString + " AND ProfessionalGeneral.RegionID = " + Me.RegionsDropDownList.SelectedValue.ToString

        If Me.CitiesDropDownList.SelectedIndex <> -1 Then
            Location += " AND ProfessionalGeneral.CityID =  " + Me.CitiesDropDownList.SelectedValue.ToString
        End If

        Session("Experience") = ExperienceDropDownList.SelectedIndex.ToString
        Session("Licensed") = LicensedDropDownList.SelectedIndex.ToString
        Session("Crew") = CrewNumberDropDownList.SelectedIndex.ToString
        Session("Insured") = InsuredDropDownList.SelectedIndex.ToString
        Session("Relocation") = RelocationDropDownList.SelectedIndex.ToString
        Session("MustHaveAccomplishement") = MustHaveDropDownList.SelectedIndex.ToString
        Session("Reputation") = Reputation.Text.ToString
        Session("ProjectCompleted") = ProjectsCompleted.Text.ToString


        '''''''''''''''''''''''''''''''''''''''''''''Country Code'''''''''''''''''''''''''''''''''''''''''''''''''
        'CANADA(43)
        'USA 254
        '''''''''''''''''''''''''''''''''''''''''''''Country Code'''''''''''''''''''''''''''''''''''''''''''''''''

        Dim NorthAmericaCustomSearch As Boolean = False

        Dim ZipCode As String = ""
        If Me.CountryDropDownList.SelectedValue = 43 Or Me.CountryDropDownList.SelectedValue = 254 Then
            If ZipcodeTextBox.Text.ToString <> "" Then
                ZipCode = " AND ProfessionalGeneral.Zipcode = '" + System.Web.HttpUtility.HtmlEncode(ZipcodeTextBox.Text.ToString) + "'"
                Session("Zipcode") = System.Web.HttpUtility.HtmlEncode(ZipcodeTextBox.Text.ToString)
                NorthAmericaCustomSearch = True
            End If
        End If

        If NorthAmericaCustomSearch = True Then
            Session("ProfessionalQuery") = GlobalQuery + Industry.ToString + Location.ToString + ProfessionalRequirement.ToString + JobTitle.ToString + ZipCode.ToString
        Else
            Session("ProfessionalQuery") = GlobalQuery + Industry.ToString + Location.ToString + ProfessionalRequirement.ToString + JobTitle.ToString
        End If

        QueryString = "ProfessionalResult.aspx?m=advanced&ex=" + ExperienceDropDownList.SelectedIndex.ToString + "&li=" + LicensedDropDownList.SelectedIndex.ToString + "&cr=" + CrewNumberDropDownList.SelectedIndex.ToString + "&in=" + InsuredDropDownList.SelectedIndex.ToString + "&re=" + RelocationDropDownList.SelectedIndex.ToString
        QueryString += "&mha=" + MustHaveDropDownList.SelectedIndex.ToString + "&cp=" + ProjectsCompleted.Text.ToString + "rep" + Reputation.Text.ToString
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
        Me.ProfessionalIDRegularExpressionValidator.Validate()
        Me.ProjectIDRequiredFieldValidator.Validate()
        If Me.ProjectIDRequiredFieldValidator.IsValid And Me.ProfessionalIDRegularExpressionValidator.IsValid Then
            QueryString = "ProfessionalResult.aspx?m=custom" + ProfessionalIDTextBox.Text.ToString
            Session("ProfessionalQuery") = GlobalQuery + " AND ProfessionalSkill.ProID =" + ProfessionalIDTextBox.Text.ToString
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

    Protected Sub OceaniaImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
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
        QueryString = "ProfessionalResult.aspx?m=continents"
        Session("ProfessionalQuery") = GlobalQuery + " AND ProfessionalGeneral.CountryID = " + Me.CountryDataList.SelectedValue.ToString + " AND ProfessionalGeneral.RegionID = " + Me.RegionDataList.SelectedValue.ToString
        Response.Redirect(QueryString)
        Response.Expires = 0
    End Sub

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''' Browse Continents '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
End Class
