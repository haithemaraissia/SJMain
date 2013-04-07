Imports System.IO
Imports System.Data.SqlClient
Imports System.Data
Imports System.Globalization
Imports System.Threading

Partial Class Authenticated_Professional_PostProject
    Inherits System.Web.UI.Page

    ''''''''''''''''''''''''''''''''''REQUIREMENT TAB''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''REQUIREMENT TAB''''''''''''''''''''''''''''''''''''''''''''


    ''''''''''''''''''''''''''''''''''DESCRIPTION TAB''''''''''''''''''''''''''''''''''''''''''''
    'NO CODE
    ''''''''''''''''''''''''''''''''''DESCRIPTION TAB''''''''''''''''''''''''''''''''''''''''''''


    ''''''''''''''''''''''''''''''''''LOCATION TAB'''''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''LOCATION TAB'''''''''''''''''''''''''''''''''''''''''''''''


    ''''''''''''''''''''''''''''''''''PROJECT SPECIFICATION TAB''''''''''''''''''''''''''''''''''
    ''NO CODE
    ''''''''''''''''''''''''''''''''''PROJECT SPECIFICATION TAB''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''PROJECT PICTURE TAB''''''''''''''''''''''''''''''''''''''''
    Protected Sub ProjectPictureListView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ProjectPictureListView.SelectedIndexChanged

        Dim MyButton As ImageButton = ProjectPictureListView.Items(ProjectPictureListView.SelectedIndex.ToString).FindControl("ProjectImageButton")
        Dim MyCaption As Label = ProjectPictureListView.Items(ProjectPictureListView.SelectedIndex.ToString).FindControl("CaptionLabel")

        ProjectPictureImage.ImageUrl = MyButton.ImageUrl
        ProjectPictureCaption.Text = MyCaption.Text

        ProjectPictureDetailModalPopupExtender.Show()
    End Sub

    Protected Sub ExitProjectPictureDetailLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ExitProjectPictureDetailLinkButton.Click
        ProjectPictureDetailModalPopupExtender.Hide()
    End Sub

    ''''''''''''''''''''''''''''''''''PROJECT PICTURE TAB'''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''''PAGE EVENTS '''''''''''''''''''''''''''''''''''''''''''''
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
        If Not Page.IsPostBack Then
            If Page.Request.QueryString("PRID") Is Nothing Then
                Response.Redirect("~/NotAuthenticated/SignIn.aspx")
            End If
            ActivateLanguage()
            InitializeProject()
            If User.Identity.IsAuthenticated Then
                ProjectMenu.Visible = True
            End If
            If User.Identity.IsAuthenticated = False Then
                BackToProfile.Visible = False
                BackToProfilePanel.CssClass = "BlueMenublockdefault"
            End If
        End If
    End Sub

    Protected Sub InitializeProject()

        Dim ProjectRequirementDataAdapter As New PostProjectTableAdapters.ProjectRequirementsTableAdapter
        Dim ProjectRequirementTable As New PostProject.ProjectRequirementsDataTable
        ProjectRequirementDataAdapter.FillInitializeProject(ProjectRequirementTable, Page.Request.QueryString("PRID").ToString)

        LocationFormView.DataBind()

        CustomDescriptionTextBox.Content = ProjectRequirementTable.Rows(0)("Description").ToString
        CustomDescriptionTextBox.ActiveMode = AjaxControlToolkit.HTMLEditor.ActiveModeType.Preview
        SpecialNotesTextBox.Text = ProjectRequirementTable.Rows(0)("SpecialNotes").ToString
        TitleTextBox.Text = ProjectRequirementTable.Rows(0)("ProjectTitle").ToString

        Dim StartDate As Date = Convert.ToDateTime(ProjectRequirementTable.Rows(0)("StartDate").ToString)
        StartDateCalendar.SelectedDate = StartDate.Date
        StartDateCalendar.VisibleDate = StartDate.Date

        Dim EndDate As Date = Convert.ToDateTime(ProjectRequirementTable.Rows(0)("EndDate").ToString)
        Me.EndDateCalendar.SelectedDate = EndDate.Date
        EndDateCalendar.VisibleDate = EndDate.Date

        Me.AmountOfferedTextBox.Text = ProjectRequirementTable.Rows(0)("AmountOffered").ToString

        SetExperience(ProjectRequirementTable.Rows(0)("ExperienceID").ToString, Session("Language").ToString)
        SetCrewNumber(ProjectRequirementTable.Rows(0)("CrewNumberID").ToString, Session("Language").ToString)
        SetLicensed(ProjectRequirementTable.Rows(0)("LicensedID").ToString, Session("Language").ToString)
        SetInsured(ProjectRequirementTable.Rows(0)("InsuredID").ToString, Session("Language").ToString)
        SetRelocation(ProjectRequirementTable.Rows(0)("RelocationID").ToString, Session("Language").ToString)
        SetCurrency(ProjectRequirementTable.Rows(0)("CurrencyID").ToString)
        GetCategoryANDJob(Page.Request.QueryString("PRID").ToString)
        GetProjectStatus(Page.Request.QueryString("PRID").ToString)

    End Sub

    Protected Sub GetProjectStatus(ByVal ProjectID As String)

        Dim ProjectStatusAdapter As New ViewProjectDataSetTableAdapters.ProjectsTableAdapter
        Dim ProjectStatusTable As New ViewProjectDataSet.ProjectsDataTable
        ProjectStatusAdapter.FillProjectViewStatus(ProjectStatusTable, ProjectID.ToString())

        Dim PosterRole As String = ProjectStatusTable.Rows(0)("PosterRole").ToString
        Dim PosterUrl As String

        If PosterRole = "PRO" Then
            PosterUrl = "ViewProfessionalProfile.aspx?PID=" + ProjectStatusTable.Rows(0)("PosterID").ToString
            PosterHyperlink.NavigateUrl = PosterUrl.ToString()
        ElseIf PosterRole = "CUS" Then
            PosterUrl = "ViewCustomerProfile.aspx?CID=" + ProjectStatusTable.Rows(0)("PosterID").ToString
            PosterHyperlink.NavigateUrl = PosterUrl.ToString()
        End If

        PosterHyperlink.Text = ProjectStatusTable.Rows(0)("PosterUserName").ToString
        HighestBidTextBox.Text = ProjectStatusTable.Rows(0)("HighestBid").ToString
        StatusTextBox.Text = ProjectStatusTable.Rows(0)("Status").ToString
        NumberOfBidsTextBox.Text = ProjectStatusTable.Rows(0)("NumberofBids").ToString

        Dim ExistingBidder As String
        ExistingBidder = ProjectStatusTable.Rows(0)("HighestBidderID").ToString()
        Dim BidderUserName As String = ProjectStatusTable.Rows(0)("HighestBidUsername").ToString

        If ExistingBidder = "" Then
        Else
            SetBidder(ProjectID.ToString, ExistingBidder.ToString, BidderUserName.ToString)
        End If

    End Sub

    Sub SetBidder(ByVal ProjectID As String, ByVal BidderID As String, ByVal UserName As String)

        Dim BidderAdapter As New ViewProjectDataSetTableAdapters.BidsTableAdapter
        Dim BidderTable As New ViewProjectDataSet.BidsDataTable
        BidderAdapter.FillBidderInformation(BidderTable, ProjectID.ToString(), BidderID.ToString)

        Dim BidderRole As String
        BidderRole = BidderTable.Rows(0)("BidderRole").ToString
        Dim BidderUrl As String

        If BidderRole = "CUS" Then
            BidderUrl = "ViewCustomerProfile.aspx?CID=" + BidderID.ToString
            HighestBidderHyperLink.NavigateUrl = BidderUrl.ToString
        ElseIf BidderRole = "PRO" Then
            BidderUrl = "ViewProfessionalProfile.aspx?PID=" + BidderID.ToString
            HighestBidderHyperLink.NavigateUrl = BidderUrl.ToString
        End If
        HighestBidderHyperLink.Text = UserName.ToString

    End Sub

    Protected Sub GetCategoryANDJob(ByVal ProjectID As String)

        Dim CategoryAdapter As New ViewProjectDataSetTableAdapters.CategoryByLCIDTableAdapter
        Dim CategoryTable As New ViewProjectDataSet.CategoryByLCIDDataTable
        CategoryAdapter.FillCategoryByLCID(CategoryTable, Session("Language").ToString, ProjectID.ToString)
        IndustryTextBox.Text = CategoryTable.Rows(0)("CategoryName").ToString
        SpecialisationTextBox.Text = CategoryTable.Rows(0)("JobTitle").ToString

    End Sub

    Protected Sub SetExperience(ByVal ExperienceID As String, ByVal Language As String)

        Dim ExperienceAdapter As New ViewProjectDataSetTableAdapters.ExperienceByLCIDTableAdapter
        Dim ExperienceTable As New ViewProjectDataSet.ExperienceByLCIDDataTable
        ExperienceAdapter.FillExperienceByLCID(ExperienceTable, Language)
        ExperienceTextBox.Text = ExperienceTable.Rows(ExperienceID).Item(0).ToString

    End Sub

    Protected Sub SetCrewNumber(ByVal CrewNumberID As String, ByVal Language As String)

        Dim CrewNumberAdapter As New ViewProjectDataSetTableAdapters.CrewNumberByLCIDTableAdapter
        Dim CrewNumberTable As New ViewProjectDataSet.CrewNumberByLCIDDataTable
        CrewNumberAdapter.FillCrewNumberByLCID(CrewNumberTable, Language)
        CrewNumberTextBox.Text = CrewNumberTable.Rows(CrewNumberID).Item(0).ToString

    End Sub

    Protected Sub SetLicensed(ByVal LicensedID As String, ByVal Language As String)

        Dim LicensedAdapter As New ViewProjectDataSetTableAdapters.LicensedByLCIDTableAdapter
        Dim LicensedTable As New ViewProjectDataSet.LicensedByLCIDDataTable
        LicensedAdapter.FillLicensedByLCID(LicensedTable, Language)
        LicensedTextBox.Text = LicensedTable.Rows(LicensedID).Item(0).ToString

    End Sub

    Protected Sub SetInsured(ByVal InsuredID As String, ByVal Language As String)

        Dim InsuredAdapter As New ViewProjectDataSetTableAdapters.InsuredByLCIDTableAdapter
        Dim InsuredTable As New ViewProjectDataSet.InsuredByLCIDDataTable
        InsuredAdapter.FillInsuredByLCID(InsuredTable, Language)
        InsuredTextBox.Text = InsuredTable.Rows(InsuredID).Item(0).ToString

    End Sub

    Protected Sub SetRelocation(ByVal RelocationID As String, ByVal Language As String)

        Dim RelocationAdapter As New ViewProjectDataSetTableAdapters.RelocationByLCIDTableAdapter
        Dim RelocationTable As New ViewProjectDataSet.RelocationByLCIDDataTable
        RelocationAdapter.FillRelocationByLCID(RelocationTable, Language)
        RelocationTextBox.Text = RelocationTable.Rows(RelocationID).Item(0).ToString

    End Sub

    Protected Sub SetCurrency(ByVal CurrencyID As String)

        Dim CurrencyAdapter As New ViewProjectDataSetTableAdapters.CurrencyTableAdapter
        Dim CurrencyTable As New ViewProjectDataSet.CurrencyDataTable
        CurrencyAdapter.FillCurrencyByID(CurrencyTable, CurrencyID)
        CurrencyTextBox.Text = CurrencyTable.Rows(0).Item(0).ToString

    End Sub

    Protected Sub StartDateCalendar_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles StartDateCalendar.SelectionChanged

        Dim ProjectRequirementDataAdapter As New PostProjectTableAdapters.ProjectRequirementsTableAdapter
        Dim ProjectRequirementTable As New PostProject.ProjectRequirementsDataTable
        ProjectRequirementDataAdapter.FillInitializeProject(ProjectRequirementTable, Page.Request.QueryString("PRID").ToString)

        Dim StartDate As Date = Convert.ToDateTime(ProjectRequirementTable.Rows(0)("StartDate").ToString)
        StartDateCalendar.SelectedDate = StartDate.Date

    End Sub

    Protected Sub EndDateCalendar_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles EndDateCalendar.SelectionChanged

        Dim ProjectRequirementDataAdapter As New PostProjectTableAdapters.ProjectRequirementsTableAdapter
        Dim ProjectRequirementTable As New PostProject.ProjectRequirementsDataTable
        ProjectRequirementDataAdapter.FillInitializeProject(ProjectRequirementTable, Page.Request.QueryString("PRID").ToString)

        Dim EndDate As Date = Convert.ToDateTime(ProjectRequirementTable.Rows(0)("EndDate").ToString)
        EndDateCalendar.SelectedDate = EndDate.Date

    End Sub

    Protected Sub BackToProfile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BackToProfile.Click

        If Me.User.IsInRole("Customer") Then
            Response.Redirect("Customer/CustomerProfile.aspx")
        End If

        If Me.User.IsInRole("Professional") Then
            Response.Redirect("Professional/ProfessionalProfile.aspx")
        End If

    End Sub

    Protected Sub AddtoWatchListButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddtoWatchListButton.Click

        Dim PosterID As String = ""
        Dim PosterRole As String = ""
        Dim guidStringUser As Guid

        If User.IsInRole("Professional") Then

            guidStringUser = New Guid(Membership.GetUser.ProviderUserKey().ToString())

            If Session("ProID") Is Nothing Then
                ''ProfessionalID 
                Dim GetProfessionalIDAdapter As New GetUserIDTableAdapters.LookUpProRolesTableAdapter
                Dim ProfessionalIDTable As New GetUserID.LookUpProRolesDataTable
                GetProfessionalIDAdapter.FillProfessionalID(ProfessionalIDTable, guidStringUser.ToString())
                PosterRole = "PRO"
                PosterID = ProfessionalIDTable.Rows(0).Item(2).ToString
            Else
                PosterRole = "PRO"
                PosterID = Session("ProID").ToString
            End If


        End If

        If User.IsInRole("Customer") Then

            guidStringUser = New Guid(Membership.GetUser.ProviderUserKey().ToString())

            ''CustomerID 
            If Session("CustomerID") Is Nothing Then
                Dim GetCustomerIDAdapter As New GetUserIDTableAdapters.LookUpRolesTableAdapter
                Dim CustomerIDTable As New GetUserID.LookUpRolesDataTable
                GetCustomerIDAdapter.FillCustomerID(CustomerIDTable, guidStringUser.ToString())
                PosterRole = "CUS"
                PosterID = CustomerIDTable.Rows(0).Item(0).ToString
            Else
                PosterRole = "CUS"
                PosterID = Session("CustomerID").ToString
            End If


        End If

        Dim AddToWatchListAdapter As New AddToFavoriteDataSetTableAdapters.AddWatchListTableAdapter
        Dim AddtoWatchListTable As New AddToFavoriteDataSet.AddWatchListDataTable
        AddToWatchListAdapter.FillAddToWatchList(AddtoWatchListTable, Page.Request.QueryString("PRID").ToString(), PosterID.ToString(), PosterRole.ToString())
        DelayModalPopUpExtender.Hide()
    End Sub

    ''''''''''''''''''''''''''''''''''''PAGE EVENTS '''''''''''''''''''''''''''''''''''''''''''''

End Class
