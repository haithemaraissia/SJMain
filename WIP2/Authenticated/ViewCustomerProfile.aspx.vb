Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class UserProfile
    Inherits System.Web.UI.Page

    ''''''''''''''''''''''''''''''''''PAGE EVENT '''''''''''''''''''''''''''''''''''''''''''''

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            If Page.Request.QueryString("CID") Is Nothing Then
                Response.Redirect("~/NotAuthenticated/SignIn.aspx")
            End If

            InitiateComment()
            UpdateProfileView()

            If User.Identity.IsAuthenticated Then
                If User.IsInRole("Professional") Then
                    ProjectMenu.Visible = True
                End If
            End If

            PortfolioDataList.DataBind()

        End If
        If PortfolioDataList.Items.Count = 0 Then
            PortfolioDataList.Visible = False
            UnderReviewLabel.Visible = True
        End If
    End Sub

    Protected Sub AddtoCustomerListButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddtoCustomerListButton.Click

        Dim PosterID As String = ""
        Dim guidStringUser As Guid
        guidStringUser = New Guid(Membership.GetUser.ProviderUserKey().ToString())

        ''ProfessionalID 
        Dim GetProfessionalIDAdapter As New GetUserIDTableAdapters.LookUpProRolesTableAdapter
        Dim ProfessionalIDTable As New GetUserID.LookUpProRolesDataTable
        GetProfessionalIDAdapter.FillProfessionalID(ProfessionalIDTable, guidStringUser.ToString())
        PosterID = ProfessionalIDTable.Rows(0).Item(2).ToString

        Dim AddToCustomerListAdapter As New AddToFavoriteDataSetTableAdapters.AddCustomerListTableAdapter
        Dim AddToCustomerListTable As New AddToFavoriteDataSet.AddCustomerListDataTable
        AddToCustomerListAdapter.FillAddToCustomerList(AddToCustomerListTable, PosterID.ToString, Page.Request.QueryString("CID"))
        DelayModalPopupExtender.Hide()

    End Sub

    ''''''''''''''''''''''''''''''''''PAGE EVENT''''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''EVENT TAB'''''''''''''''''''''''''''''''''''''''''''''''

    Protected Sub UpdateProfileView()

        Dim DifferentCustomer As Boolean = True

        If User.Identity.IsAuthenticated = False Then
            DifferentCustomer = False
        End If

        If User.IsInRole("Customer") Then
            Dim CustomerID As String
            Dim guidStringUser As Guid = New Guid(Membership.GetUser.ProviderUserKey().ToString())

            ''ProfessionalID 
            Dim GetCustomerIDAdapter As New GetUserIDTableAdapters.LookUpRolesTableAdapter

            Dim CustomerIDTable As New GetUserID.LookUpRolesDataTable

            GetCustomerIDAdapter.FillCustomerID(CustomerIDTable, guidStringUser.ToString())

            ''Sender ID
            CustomerID = CustomerIDTable.Rows(0).Item(0).ToString

            If String.Compare(CustomerID.ToString(), Page.Request.QueryString("CID").ToString()) = 0 Then
                DifferentCustomer = False
            End If

        End If

        If DifferentCustomer = True Then

            Dim CustomerViewAdapter As New UpdateProfileViewDataSetTableAdapters.UpdateCustomerProfileViewTableAdapter
            Dim CustomerViewTable As New UpdateProfileViewDataSet.UpdateCustomerProfileViewDataTable
            CustomerViewAdapter.FillProfileView(CustomerViewTable, Page.Request.QueryString("CID").ToString())
        End If

    End Sub

    ''''''''''''''''''''''''''''''''''EVENT TAB'''''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''PROFILE TAB''''''''''''''''''''''''''''''''''''''''''''

    Protected Sub ProfileModalPopupExtender_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ProfileModalPopupExtender.Load

        PhotoPaths()

        Dim ProfileSlideShow As New AjaxControlToolkit.SlideShowExtender
        ProfileSlideShow.AutoPlay = True
        ProfileSlideShow.Loop = True
        ProfileSlideShow.NextButtonID = NextButton.ID
        ProfileSlideShow.PreviousButtonID = PreviousButton.ID
        ProfileSlideShow.PlayButtonID = PlayButton.ID
        ProfileSlideShow.TargetControlID = ProfessionalImage.ID
        ProfileSlideShow.SlideShowServicePath = "CustomerSlideShow.asmx"
        ProfileSlideShow.SlideShowServiceMethod = "GetSlides"
        ProfileSlideShow.PlayButtonText = "Play"
        ProfileSlideShow.StopButtonText = "Stop"
        ProfileSlideShow.PlayInterval = 1000

        ProfileModalPopupExtender.Controls.Add(ProfileSlideShow)

    End Sub

    Sub PhotoPaths()
        Dim CustomerPhotoAdapter As New CustomModalPhotoSelectionDataSetTableAdapters.CustomerPhotoTableAdapter
        Dim CustomerPhotoTable As New CustomModalPhotoSelectionDataSet.CustomerPhotoDataTable
        CustomerPhotoAdapter.FillCustomCustomerPhoto(CustomerPhotoTable, Request.QueryString("CID").ToString())

        ''Dynamically Allocated a list box that will be used for the slide show
        Dim numberofrows As Integer = CustomerPhotoTable.Rows.Count

        If numberofrows = 1 Then
            CustomerData._PathImageList = New ArrayList(0)
            CustomerData._CaptionImageList = New ArrayList(0)

            CustomerData._PathImageList.Add(CustomerPhotoTable.Rows(0).Item(1).ToString)
            CustomerData._CaptionImageList.Add(CustomerPhotoTable.Rows(0).Item(2).ToString)
        Else
            Dim i As Integer
            CustomerData._PathImageList = New ArrayList(numberofrows - 1)
            CustomerData._CaptionImageList = New ArrayList(numberofrows - 1)

            For i = 0 To numberofrows - 1

                If i <> 0 Then
                    CustomerData._PathImageList.Add(CustomerPhotoTable.Rows(i).Item(1).ToString)
                    CustomerData._CaptionImageList.Add(CustomerPhotoTable.Rows(i).Item(2).ToString)
                End If

            Next

        End If

    End Sub

    Protected Sub ExitButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ExitButton.Click
        Me.ProfileModalPopupExtender.Hide()
    End Sub

    ''''''''''''''''''''''''''''''''''PROFILE TAB''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''PORTFOLIO TAB'''''''''''''''''''''''''''''''''''''''''''
    ''NO CODE
    ''''''''''''''''''''''''''''''''''PORTFOLIO TAB'''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''PROJECT TAB'''''''''''''''''''''''''''''''''''''''''''''
    ''NO CODE
    ''''''''''''''''''''''''''''''''''PROJECT TAB'''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''FAVORITE TAB''''''''''''''''''''''''''''''''''''''''''''
    ''NO CODE
    ''''''''''''''''''''''''''''''''''FAVORITE TAB''''''''''''''''''''''''''''''''''''''''''''


    ''''''''''''''''''''''''''''''''''COMMENT TAB ''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub InitiateComment()
        Dim CustomerInformationAdapter As New CustomerCommentsReceivedTableAdapters.CustomerCommentReceivedSummaryTableAdapter()
        Dim CustomerInformationTable As New CustomerCommentsReceived.CustomerCommentReceivedSummaryDataTable
        CustomerInformationAdapter.FillCustomerCommentReceivedSummary(CustomerInformationTable, Page.Request.QueryString("CID").ToString())

        Dim total As Integer
        Dim Positive As Integer = Convert.ToInt32(CustomerInformationTable.Item(0).NumberofPositive.ToString())
        Dim Negative As Integer = Convert.ToInt32(CustomerInformationTable.Item(0).NumberofNegative.ToString())
        Dim Neutral As Integer = Convert.ToInt32(CustomerInformationTable.Item(0).NumberofNeutral.ToString())

        total = Positive + Negative + Neutral
        If total = 0 Then
            Positive = 100
            Negative = 0
            Neutral = 0
        Else
            If Positive <> 0 Then
                Positive = ((Positive * 100) / total)
            End If

            If Negative <> 0 Then
                Negative = ((Negative * 100) / total)

            End If
            If Neutral <> 0 Then
            Else
                Neutral = ((Neutral * 100) / total)

            End If
        End If

        'Statistics - Performance Chart
        SummaryChart.Series(0).Points(0).SetValueXY(Positive, Positive)
        SummaryChart.Series(0).Points(1).SetValueXY(Negative, Negative)
        SummaryChart.Series(0).Points(2).SetValueXY(Neutral, Neutral)

        SummaryChart.Titles(0).Text = Positive.ToString + "%"

        'Comment Chart
        PerformanceChart.Series(0).Points(0).SetValueXY(Positive, Positive)
        PerformanceChart.Series(0).Points(1).SetValueXY(Negative, Negative)
        PerformanceChart.Series(0).Points(2).SetValueXY(Neutral, Neutral)

        PerformanceChart.Titles(0).Text = Positive.ToString + "%"
    End Sub

    Protected Sub ViewProject(ByVal commenttype As Integer)

        Dim ProjectviewAdpater As New ViewProjectDataSetTableAdapters.ProjectRequirementsTableAdapter
        Dim ProjectViewDataTable As New ViewProjectDataSet.ProjectRequirementsDataTable

        Dim ProjectPhotoAdpater As New ViewProjectDataSetTableAdapters.ProjectPhotoTableAdapter
        Dim ProjectPhotoDataTable As New ViewProjectDataSet.ProjectPhotoDataTable

        If commenttype = 1 Then

            ProjectviewAdpater.FillViewProject(ProjectViewDataTable, CommentReceivedGridView.SelectedPersistedDataKey.Value.ToString())
            ProjectPhotoAdpater.FillProjectPhoto(ProjectPhotoDataTable, CommentReceivedGridView.SelectedPersistedDataKey.Value.ToString())
            ProjectPhotoObjectDataSource.SelectParameters(0).DefaultValue = CommentReceivedGridView.SelectedPersistedDataKey.Value.ToString()

        Else

            ProjectviewAdpater.FillViewProject(ProjectViewDataTable, CommentSentGridView.SelectedPersistedDataKey.Value.ToString())
            ProjectPhotoAdpater.FillProjectPhoto(ProjectPhotoDataTable, CommentSentGridView.SelectedPersistedDataKey.Value.ToString())
            ProjectPhotoObjectDataSource.SelectParameters(0).DefaultValue = CommentSentGridView.SelectedPersistedDataKey.Value.ToString()

        End If

        Me.ProjectFormView.DataBind()

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
        notesview.Text = ProjectViewDataTable.Rows(0).Item(17).ToString

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
        Me.MoreProjectUpdatePanel.Update()

        MoreProjectHiddenFieldButton.Value = "./ViewProject.aspx?PRID=" + ProjectViewDataTable.Rows(0).Item(0).ToString

        Me.MoreProjectModalPopupExtender.Show()
        Me.DelayModalPopupExtender.Hide()
    End Sub

    Protected Sub CommentSentGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CommentSentGridView.SelectedIndexChanged
        ViewProject(2)
    End Sub

    Protected Sub CommentReceivedGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CommentReceivedGridView.SelectedIndexChanged
        ViewProject(1)
    End Sub

    Protected Sub OkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles OkButton.Click
        DelayModalPopupExtender.Hide()
    End Sub

    ''''''''''''''''''''''''''''''''''COMMENT TAB '''''''''''''''''''''''''''''''''''''''''''

End Class
