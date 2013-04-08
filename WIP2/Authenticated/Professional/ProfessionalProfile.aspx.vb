
Imports System.IO
Imports System.Net.Mail
Imports System.Globalization
Imports System.Threading
Imports Resources

Partial Class UserProfile
    Inherits System.Web.UI.Page
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''LEFT''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    '-1-SEO Sitemap:
    'do it do it with the correct variables by adding to translation file .fr and .en

    '-2-Testing SendEmail
    'FUNCTION THAT INCLUDE THE SENDER, RECEIVER, Subject and BODY AS Parameters
    'Add its call everytime is need in the code.

    '-3-Test the Transaction, Bids and Contract generation and result

    '-4-Complete and test the Report

    '-5-Add and test the functionality of deleting the profile
    'Make sure you delete all the records, files and code for each deleted user

    '-6-Add and test sending email if the account tab

    '-7-Optimization:
    ''REPLCAE SESSION ("CUSTOMERID") BY CONTROL STATE --MAYBE BECASUE YOU HAVE TO SHARE ACROOS OTHER PAGES
    ''CURRENTLY WORKING ON MESSAGE TAB AND REPLACING ALL SESSION WITH CONTROL STATE CHECK THE BOTTOM

    Protected Sub SEOSiteMap()
        Page.Title = Resources.Resource.SignUpTitle.ToString

        Dim nl1 As New Web.UI.WebControls.Literal
        nl1.Text = Environment.NewLine
        Dim Title As New HtmlMeta()
        Title.Name = "title"
        Title.Content = Resources.Resource.SignUpTitle.ToString
        Page.Header.Controls.AddAt(1, Title)

        Dim Description As New HtmlMeta()
        Description.Name = "description"
        Description.Content = Resources.Resource.SignUpDescription.ToString
        Page.Header.Controls.AddAt(2, Description)

        Dim keywords As New HtmlMeta()
        keywords.Name = "keywords"
        keywords.Content = Resources.Resource.SignUpKeywords.ToString
        Page.Header.Controls.AddAt(3, keywords)
    End Sub


    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''GLOBAL VARIABLES'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Public _language As Integer
    Public _newInbox As Integer
    Public _SelectedMessageID As Integer
    Public _messagemode As String = "0"
    Public _deleteWatchList As Boolean
    Public _viewWatchListProject As Boolean
    Public _deleteProject As Boolean
    Public _editProject As Boolean
    Public _InvitetoProject As Boolean
    Public _Question As Boolean

    Public Property Language() As Integer
        Get
            Return _language
        End Get
        Set(ByVal value As Integer)
            value = _language
        End Set
    End Property
    Public Property NewInbox() As Integer
        Get
            Return _newInbox
        End Get
        Set(ByVal value As Integer)
            _newInbox = value

        End Set
    End Property
    Public Property SelectedMessageID() As Integer
        Get
            Return _SelectedMessageID
        End Get
        Set(ByVal value As Integer)
            _SelectedMessageID = value
        End Set
    End Property
    Public Property DeleteWatchList() As Boolean
        Get
            Return _deleteWatchList
        End Get
        Set(ByVal value As Boolean)
            value = _deleteWatchList
        End Set
    End Property
    Public Property ViewWatchListProject() As Boolean
        Get
            Return _viewWatchListProject
        End Get
        Set(ByVal value As Boolean)
            value = _viewWatchListProject
        End Set
    End Property
    Public Property DeleteProject() As Boolean
        Get
            Return _deleteProject
        End Get
        Set(ByVal value As Boolean)
            value = _deleteProject
        End Set
    End Property
    Public Property editProject() As Boolean
        Get
            Return _editProject
        End Get
        Set(ByVal value As Boolean)
            value = _editProject
        End Set
    End Property
    Public Property InvitetoProject() As Boolean
        Get
            Return _InvitetoProject
        End Get
        Set(ByVal value As Boolean)
            value = _InvitetoProject
        End Set
    End Property
    Public Property Question() As Boolean
        Get
            Return _Question
        End Get
        Set(ByVal value As Boolean)
            value = _Question
        End Set
    End Property

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''GLOBAL VARIABLES'''''''''''''''''''''''''''''''''''''''''''''''''''''''''   
















    '*****************************************************************************************'

    ''''''''''''''''''''''''''''''''''''BIDS TABS''''''''''''''''''''''''''''''''''''''''''' 
    Protected Sub ActiveBidsViewProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("ActiveProject") = True
    End Sub
    Protected Sub WonBidsViewProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("WonProject") = True
    End Sub
    Protected Sub LostBidsViewProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("LostProject") = True
    End Sub
    Protected Sub NewBidLinkButtonClick(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("NewBid") = True
    End Sub
    Protected Sub WonBidsRemoveProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("RemoveBidWon") = True
    End Sub
    Protected Sub LostBids_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs)
        DeleteLostBid(e.Keys.Item(0).ToString())
    End Sub
    Protected Sub LostBidsSelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles LostBidsGridView.SelectedIndexChanged

        If Session("LostProject") = True Then
            MoreProjectView()
        End If
        If Session("NewBid") = True Then
            PlaceNewBid()
        End If

    End Sub
    Protected Sub PlaceBidButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If Page.IsValid Then
            NewBid()
        Else
            ActiveBidsGridView.DataBind()
            BidModalPopupExtender.Show()
        End If

    End Sub
    Protected Sub ClosedProject(ByVal sender As Object, ByVal e As System.EventArgs) Handles OkButton.Click
        ClosedProjectModalPopupExtender.Hide()
    End Sub
    Protected Sub MoreProjectView()
        ViewProject(3)
    End Sub
    Protected Sub ActiveBidsGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ActiveBidsGridView.SelectedIndexChanged
        If Session("ActiveProject") = True Then
            MoreProjectView()
        End If
    End Sub
    Protected Sub NewBid()

        CurrentBidObjectDataSource.UpdateParameters("HighestBid").DefaultValue = NewAmountTextBox.Text.ToString
        CurrentBidObjectDataSource.UpdateParameters("HighestBidderID").DefaultValue = Session("ProfessionalID").ToString
        CurrentBidObjectDataSource.UpdateParameters("HighestBidUsername").DefaultValue = User.Identity.Name.ToString

        CurrentBidObjectDataSource.UpdateParameters("original_ProjectID").DefaultValue = Session("originalProjectID").ToString
        CurrentBidObjectDataSource.UpdateParameters("original_HighestBid").DefaultValue = Session("OriginalHighestBid").ToString
        CurrentBidObjectDataSource.UpdateParameters("original_HighestBidderID").DefaultValue = Session("OriginalHighestBidderID").ToString
        CurrentBidObjectDataSource.UpdateParameters("original_HighestBidUsername").DefaultValue = Session("OriginalHighestBidderUserName").ToString

        CurrentBidObjectDataSource.Update()
        Dim todaydate As String = DateTime.UtcNow.ToShortDateString.ToString
        Dim ProjectLabel As Label
        ProjectLabel = CType(LostBidsGridView.SelectedRow.FindControl("ProjectLostIDLabel"), Label)
        Dim PlaceBidQuery As New ProfessionalBidsDataSetTableAdapters.BidsQueriesTableAdapter
        PlaceBidQuery.PlaceBid(ProjectLabel.Text.ToString, Session("ProfessionalID").ToString, User.Identity.Name.ToString, DateTime.UtcNow.ToShortDateString.ToString, NewAmountTextBox.Text.ToString, CurrencyDropDownList.SelectedItem.Value.ToString, "PRO")

        ActiveBidsGridView.DataBind()
        WonBidsGridView.DataBind()
        LostBidsGridView.DataBind()
        BidModalPopupExtender.Hide()
        DeleteLostBid(LostBidsGridView.SelectedPersistedDataKey.Value.ToString)
        Session("NewBid") = False

    End Sub
    Protected Sub DeleteLostBid(ByVal BidId As String)
        LostBidsObjectDataSource.DeleteParameters(0).DefaultValue = BidId.ToString
        LostBidsObjectDataSource.DeleteParameters(1).DefaultValue = Session("ProfessionalID").ToString
        LostBidsObjectDataSource.DeleteParameters(2).DefaultValue = "PRO"
        LostBidsObjectDataSource.Delete()
        LostBidsGridView.DataBind()
    End Sub
    Protected Sub WonBidsGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles WonBidsGridView.SelectedIndexChanged
        If Session("WonProject") = True Then
            MoreProjectView()
        End If
        If Session("RemoveBidWon") = True Then
            WonBidsObjectDataSource.DeleteParameters(0).DefaultValue = WonBidsGridView.SelectedPersistedDataKey.Value.ToString
            WonBidsObjectDataSource.Delete()
            Session("RemoveBidWon") = False
        End If
    End Sub
    Protected Sub PlaceNewBid()

        Dim ProjectLabel As Label
        ProjectLabel = CType(LostBidsGridView.SelectedRow.FindControl("ProjectLostIDLabel"), Label)
        Session("NewBid") = False
        Dim CurrentBidsAdapter As New ProfessionalBidsDataSetTableAdapters.ProjectsTableAdapter
        Dim CurrentBidsDataTable As New ProfessionalBidsDataSet.ProjectsDataTable
        CurrentBidsAdapter.FillProjects(CurrentBidsDataTable, ProjectLabel.Text.ToString)
        Dim StatusLabel As String = CurrentBidsDataTable.Rows(0).Item(6).ToString
        If StatusLabel.ToString = "0" Then
            ProjectCurrentStatusGridView.DataBind()
            Dim timeleftlabel As String = CurrentBidsDataTable.Rows(0).Item(5).ToString
            Dim formatedstring As String
            Dim TempArray() As String = Split(timeleftlabel.ToString)
            formatedstring = TempArray(0) + "   " + Resources.Resource.Days.ToString + "  " + TempArray(2) + _
                " " + Resources.Resource.Hours.ToString + "  " + TempArray(4) + " " + Resources.Resource.Mins.ToString + ""
            CurrentTimeLeftValue.Text = formatedstring.ToString
            CurrentTimeLeftValue.DataBind()
            Dim Days As Integer = Convert.ToInt32(TempArray(0).ToString)
            Dim Hours As Integer = Convert.ToInt32(TempArray(2).ToString)
            Dim Minutes As Integer = Convert.ToInt32(TempArray(4).ToString)
            If Days = 0 And Hours = 0 Then
                If Minutes = 0 Then
                    TimeUP()
                    Response.Write(Resources.Resource.TimeUp.ToString)
                End If
                If Minutes < 5 And Minutes > 0 Then
                    CurrentTimeLeftValue.ForeColor = Drawing.Color.Red
                    CurrentTimeLeftValue.Font.Size = "LARGER"
                End If
            End If
            Dim ProjectPhotoAdapter As New ProfessionalBidsDataSetTableAdapters.SelectProjectPhotoTableAdapter
            Dim ProjectPhotoDataTable As New ProfessionalBidsDataSet.SelectProjectPhotoDataTable
            ProjectPhotoAdapter.FillProjectDetail(ProjectPhotoDataTable, ProjectLabel.Text.ToString)
            ProjectImage.ImageUrl = ProjectPhotoDataTable.Rows(0).Item(1).ToString
            ProjectImage.DataBind()
            BidUpdatePanel.Update()
            BidModalPopupExtender.Show()
        Else
            ClosedProjectModalPopupExtender.Show()
        End If

    End Sub
    Protected Sub BidCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
        args.IsValid = False
        Try
            Dim newvalue As Decimal = Convert.ToDecimal(NewAmountTextBox.Text.ToString)
            Dim ProjectLabel As Label
            ProjectLabel = CType(LostBidsGridView.SelectedRow.FindControl("ProjectLostIDLabel"), Label)
            Session("NewBid") = False
            Dim CurrentBidsAdapter As New ProfessionalBidsDataSetTableAdapters.ProjectsTableAdapter
            Dim CurrentBidsDataTable As New ProfessionalBidsDataSet.ProjectsDataTable
            CurrentBidsAdapter.FillProjects(CurrentBidsDataTable, ProjectLabel.Text.ToString)
            Session("originalProjectID") = CurrentBidsDataTable.Rows(0).Item(0).ToString
            Session("OriginalHighestBid") = CurrentBidsDataTable.Rows(0).Item(1).ToString
            Session("OriginalHighestBidderID") = CurrentBidsDataTable.Rows(0).Item(2).ToString
            Session("OriginalHighestBidderUserName") = CurrentBidsDataTable.Rows(0).Item(3).ToString
            Dim oldvalues As Decimal = Convert.ToDecimal(CurrentBidsDataTable.Rows(0).Item(1).ToString)
            BidCustomValidator.ErrorMessage = Resources.Resource.BidGreaterThan + " " + CurrentBidsDataTable.Rows(0).Item(1).ToString
            args.IsValid = newvalue > oldvalues
        Catch ex As Exception
            args.IsValid = False
        End Try
    End Sub

    ''''''''''''''''''''''''''''''''''''BIDS TABS''''''''''''''''''''''''''''''''''''''''''' 
    '*****************************************************************************************'
















    ''''''''''''''''''''''''''''''''''''PROFILE TABS''''''''''''''''''''''''''''''''''''''''''' 

    Protected Sub ProfileSlideShowModalPopupExtender_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ProfileSlideShowModalPopupExtender.Load

        PhotoPaths()

        Dim ProfileSlideShowExtender As New AjaxControlToolkit.SlideShowExtender
        ProfileSlideShowExtender.AutoPlay = True
        ProfileSlideShowExtender.Loop = True
        ProfileSlideShowExtender.NextButtonID = ProfileImageNextButton.ID
        ProfileSlideShowExtender.PreviousButtonID = ProfileImagePreviousButton.ID
        ProfileSlideShowExtender.PlayButtonID = ProfileImagePlayButton.ID
        ProfileSlideShowExtender.TargetControlID = ProfileImage.ID
        ProfileSlideShowExtender.SlideShowServicePath = "ProfessionalSlideWebService.asmx"
        ProfileSlideShowExtender.SlideShowServiceMethod = "GetSlides"
        ProfileSlideShowExtender.PlayButtonText = PlayHiddenField.Value.ToString
        ProfileSlideShowExtender.StopButtonText = StopHiddenField.Value.ToString
        ProfileSlideShowExtender.PlayInterval = 1000
        ProfileSlideShowModalPopupExtender.Controls.Add(ProfileSlideShowExtender)

    End Sub

    Sub PhotoPaths()

        Dim ProfessionalPhotoAdapter As New CustomModalPhotoSelectionDataSetTableAdapters.ProfessionalPhotoTableAdapter
        Dim ProfessionalPhotoTable As New CustomModalPhotoSelectionDataSet.ProfessionalPhotoDataTable
        ProfessionalPhotoAdapter.FillCustomProfessionalPhoto(ProfessionalPhotoTable, Session("ProfessionalID").ToString)

        ''Dynamically Allocated a list box that will be used for the slide show
        Dim numberofrows As Integer = ProfessionalPhotoTable.Rows.Count

        If numberofrows = 1 Then
            ProfessionalData._PathImageList = New ArrayList(0)
            ProfessionalData._CaptionImageList = New ArrayList(0)

            ProfessionalData._PathImageList.Add(ProfessionalPhotoTable.Rows(0).Item(1).ToString)
            ProfessionalData._CaptionImageList.Add(ProfessionalPhotoTable.Rows(0).Item(2).ToString)

        Else
            Dim i As Integer
            ProfessionalData._PathImageList = New ArrayList(numberofrows - 1)
            ProfessionalData._CaptionImageList = New ArrayList(numberofrows - 1)

            For i = 0 To numberofrows - 1

                If i <> 0 Then
                    ProfessionalData._PathImageList.Add(ProfessionalPhotoTable.Rows(i).Item(1).ToString)
                    ProfessionalData._CaptionImageList.Add(ProfessionalPhotoTable.Rows(i).Item(2).ToString)
                End If

            Next

        End If

    End Sub

    Protected Sub ProfileImageExitButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ProfileImageExitButton.Click
        ProfileSlideShowModalPopupExtender.Hide()
    End Sub

    Protected Sub ChangePasswordPushButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ChangePasswordModalPopupExtender.Show()
    End Sub

    ''''''''''''''''''''''''''''''''''''PROFILE TABS''''''''''''''''''''''''''''''''''''''''''' 

    ''''''''''''''''''''''''''''''''''''PORTFOLIO TABS'''''''''''''''''''''''''''''''''''''''''    

    Protected Sub UpdatePortfolioLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdatePortfolioLinkButton.Click

        ''Changes are subject to Approval by Administration
        Dim AboutTextBox As TextBox = CType(PortfolioDataList.Items(0).FindControl("AboutTextBox"), TextBox)
        Dim SpecialNotes As TextBox = CType(PortfolioDataList.Items(0).FindControl("SpecialNotesTextBox"), TextBox)
        Dim ProfessionalPortfolioUpdate As New ProfessionalPortfolioDataSetTableAdapters.UpdateProfessionalPortfolioQuery

        ProfessionalPortfolioUpdate.UpdateProfessionalPortfolio(AboutTextBox.Text.ToString, SpecialNotes.Text.ToString, Session("ProfessionalID").ToString)
        PortfolioDataList.DataBind()
        Me.DelayModalPopUpExtender.Hide()

    End Sub

    Protected Sub CancelPortfolioLinkButton_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelPortfolioLinkButton.Click
        PortfolioDataList.DataBind()
        Me.DelayModalPopUpExtender.Hide()
    End Sub

    ''''''''''''''''''''''''''''''''''''PORTFOLIO TABS'''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''''MESSAGE TABS''''''''''''''''''''''''''''''''''''''''''' 

    Protected Sub ReplyEmailLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ReplyEmailLinkButton.Click

        Dim ReplyAdapter As New ProfessionalReplyMessageTableAdapters.ReplyProfessionalTableAdapter
        ReplyAdapter.ReplyProfessionalMessage(Convert.ToInt32(MessageGridView.SelectedPersistedDataKey.Value.ToString), Convert.ToInt32(Session("ProfessionalID").ToString), Convert.ToInt32(Session("messagemode").ToString), ReplyMessageTextBox.Text.ToString)

        MessageGridView.DataBind()
        MessageGridView.SelectedIndex = -1
        MessageGridView.PageIndex = 0

        LowerMessageUpdatePanel.Update()
        SaveLinkButton.Visible = False
        ReplyLinkButton.Visible = False

        DelayModalPopUpExtender.Hide()

    End Sub

    Protected Sub CancelReplyEmailLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelReplyEmailLinkButton.Click
        DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub ReplyLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ReplyLinkButton.Click
        ReplyMessageModalPopupExtender.Show()
    End Sub

    Protected Sub SaveLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SaveLinkButton.Click

        ProfessionalMessageObjectDataSource.InsertMethod = "SaveProfessionalMessage"
        ProfessionalMessageObjectDataSource.InsertParameters(0).DefaultValue = MessageGridView.SelectedPersistedDataKey.Value.ToString
        ProfessionalMessageObjectDataSource.InsertParameters(1).DefaultValue = Convert.ToInt32(Session("messagemode").ToString)
        ProfessionalMessageObjectDataSource.Insert()

        MessageGridView.DataBind()
        MessageGridView.SelectedIndex = -1
        MessageGridView.PageIndex = 0

        LowerMessageUpdatePanel.Update()
        SaveLinkButton.Visible = False
        ReplyLinkButton.Visible = False

        DelayModalPopUpExtender.Hide()

    End Sub

    Protected Sub DeleteButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteButton.Click

        Dim atLeastOneRowDeleted As Boolean = False
        Dim numberofmessages As Integer = 0

        For Each row As GridViewRow In MessageGridView.Rows

            Dim cb As CheckBox = row.FindControl("MessageSelectorCheckBox")

            If cb IsNot Nothing AndAlso cb.Checked Then
                atLeastOneRowDeleted = True

                Dim MessageID As Integer = _
                Convert.ToInt32(MessageGridView.DataKeys(row.RowIndex).Value)

                Select Case Convert.ToInt32(Session("messagemode").ToString)
                    Case 0
                        ProfessionalMessageObjectDataSource.DeleteMethod = "DeleteProfessionalMessageInbox"
                        ProfessionalMessageObjectDataSource.DeleteParameters(0).DefaultValue = MessageID.ToString()
                        ProfessionalMessageObjectDataSource.Delete()
                        ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageInbox"
                    Case 1
                        ProfessionalMessageObjectDataSource.DeleteMethod = "DeleteProfessionalMessageOutbox"
                        ProfessionalMessageObjectDataSource.DeleteParameters(0).DefaultValue = MessageID.ToString()
                        ProfessionalMessageObjectDataSource.Delete()
                        ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageOutbox"
                    Case 2
                        ProfessionalMessageObjectDataSource.DeleteMethod = "DeleteProfessionalMessageSaved"
                        ProfessionalMessageObjectDataSource.DeleteParameters(0).DefaultValue = MessageID.ToString()
                        ProfessionalMessageObjectDataSource.Delete()
                        ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageSaved"
                End Select

            End If

        Next

        MessageGridView.DataBind()
        MessageGridView.SelectedIndex = -1
        UpperMessageUpdatePanel.Update()

        If atLeastOneRowDeleted = False Then
            Me.MessageDeletionModalPopupExtender.Show()
        End If

    End Sub

    Protected Sub DecreaseNewInbox()

        If Convert.ToInt32(Session("messagemode").ToString) = 0 Then
            NewInbox = NewInbox - 1
            If NewInbox > 0 Then
                InboxLinkButton.Text = NumberofInboxLinkButton.Text.ToString() + "(" + NewInbox.ToString + ") "
            Else
                InboxLinkButton.Text = NumberofInboxLinkButton.Text.ToString()
            End If
        End If
        LowerMessageUpdatePanel.Update()

    End Sub

    Private Sub MessageToggleCheckState(ByVal checkState As Boolean)

        For Each row As GridViewRow In MessageGridView.Rows
            Dim cb As CheckBox = CType(row.FindControl("MessageSelectorCheckBox"), CheckBox)
            If cb IsNot Nothing Then
                cb.Checked = checkState
            End If
        Next

    End Sub

    Protected Sub MessageDeletionCloseButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles MessageDeletionCloseButton.Click

        Me.MessageDeletionModalPopupExtender.Hide()
        Me.UpperMessageUpdatePanel.Update()

    End Sub

    Protected Sub SelectAllButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SelectAllButton.Click

        MessageToggleCheckState(True)
        UpperMessageUpdatePanel.Update()

    End Sub

    Protected Sub DeselectAllButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeselectAllButton.Click

        MessageToggleCheckState(False)
        UpperMessageUpdatePanel.Update()

    End Sub

    Protected Sub MessageGridView_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles MessageGridView.PreRender

        If Session("messagemode") Is Nothing Then
            Session("messagemode") = 0
        End If

        If Convert.ToInt32(Session("messagemode").ToString) = 0 Then
            Dim professionalInboxAdapter As New NewProfessionalInboxDataSetTableAdapters.QueriesTableAdapter
            Dim NewInboxValue As String = professionalInboxAdapter.GetProfessionalNewInbox(Session("ProfessionalID").ToString).ToString

            If NewInboxValue = "0" Then
                InboxLinkButton.Text = NumberofInboxLinkButton.Text.ToString()
            Else
                InboxLinkButton.Text = NumberofInboxLinkButton.Text.ToString() + "(" + NewInboxValue.ToString() + ") "
            End If
        End If
        LowerMessageUpdatePanel.Update()

    End Sub

    Protected Sub MessageGridView_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles MessageGridView.RowCommand

        Select Case e.CommandName
            Case Is = "Delete"

                Select Case Convert.ToInt32(Session("messagemode").ToString)
                    Case 0
                        ProfessionalMessageObjectDataSource.DeleteMethod = "DeleteProfessionalMessageInbox"
                        ProfessionalMessageObjectDataSource.DeleteParameters(0).DefaultValue = e.CommandArgument.ToString()
                        ProfessionalMessageObjectDataSource.Delete()
                        ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageInbox"
                    Case 1
                        ProfessionalMessageObjectDataSource.DeleteMethod = "DeleteProfessionalMessageOutbox"
                        ProfessionalMessageObjectDataSource.DeleteParameters(0).DefaultValue = e.CommandArgument.ToString()
                        ProfessionalMessageObjectDataSource.Delete()
                        ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageOutbox"
                    Case 2
                        ProfessionalMessageObjectDataSource.DeleteMethod = "DeleteProfessionalMessageSaved"
                        ProfessionalMessageObjectDataSource.DeleteParameters(0).DefaultValue = e.CommandArgument.ToString()
                        ProfessionalMessageObjectDataSource.Delete()
                        ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageSaved"
                End Select

                Me.MessageGridView.SelectedIndex = -1
                Me.LowerMessageUpdatePanel.Update()

        End Select

    End Sub

    Protected Sub MessageGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles MessageGridView.SelectedIndexChanged

        SelectedMessageID = MessageGridView.SelectedValue
        UpdateViewedMessage()

        If Session("messagemode") Is Nothing Then
            Session("messagemode") = 0
        End If

        Select Case Convert.ToInt32(Session("messagemode").ToString)
            Case 0
                SaveLinkButton.Visible = True
                ReplyLinkButton.Visible = True
                ProfessionalMessageDetailObjectDataSource.SelectMethod = "GetProfessionalMessageInbox"
                ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageInbox"
                DetailsMessageView.DataBind()
                LowerMessageUpdatePanel.Update()
            Case 1
                SaveLinkButton.Visible = True
                ReplyLinkButton.Visible = True
                ProfessionalMessageDetailObjectDataSource.SelectMethod = "GetProfessionalMessageOutbox"
                ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageOutbox"
                DetailsMessageView.DataBind()
                LowerMessageUpdatePanel.Update()

            Case 2
                SaveLinkButton.Visible = False
                ReplyLinkButton.Visible = False
                ProfessionalMessageDetailObjectDataSource.SelectMethod = "GetProfessionalMessageSaved"
                ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageSaved"
                DetailsMessageView.DataBind()
                LowerMessageUpdatePanel.Update()
        End Select

    End Sub

    Protected Sub MessageGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles MessageGridView.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.DataItem("Checked").ToString() Then
                e.Row.Font.Bold = True
                NewInbox += 1
            End If
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#6B696B'; this.style.color='white'")
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#EFE7A7'; this.style.color='black'")
        End If

    End Sub

    Protected Sub MessageGridView_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles MessageGridView.PageIndexChanging

        Select Case Convert.ToInt32(Session("messagemode").ToString)
            Case 0
                ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageInbox"
            Case 1
                ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageOutbox"
            Case 2
                ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageSaved"
        End Select

    End Sub

    Protected Sub MessageGridView_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles MessageGridView.Sorting

        Select Case Convert.ToInt32(Session("messagemode").ToString)
            Case 0
                ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageInbox"
            Case 1
                ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageOutbox"
            Case 2
                ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageSaved"
        End Select

    End Sub

    Protected Sub InboxLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles InboxLinkButton.Click

        Session("messagemode") = 0
        ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageInbox"

        MessageGridView.DataBind()
        MessageGridView.SelectedIndex = -1
        MessageGridView.PageIndex = 0

        LowerMessageUpdatePanel.Update()
        SaveLinkButton.Visible = False
        ReplyLinkButton.Visible = False

        InboxLinkButton.BackColor = Drawing.Color.White
        OutboxLinkButton.BackColor = Drawing.Color.Transparent
        SavedLinkButton.BackColor = Drawing.Color.Transparent
        ProfileTabContainer.ActiveTabIndex = 3

    End Sub

    Protected Sub OutboxLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles OutboxLinkButton.Click

        Session("messagemode") = 1
        ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageOutbox"

        MessageGridView.DataBind()
        MessageGridView.SelectedIndex = -1
        MessageGridView.PageIndex = 0

        LowerMessageUpdatePanel.Update()
        SaveLinkButton.Visible = False
        ReplyLinkButton.Visible = False

        InboxLinkButton.BackColor = Drawing.Color.Transparent
        OutboxLinkButton.BackColor = Drawing.Color.White
        SavedLinkButton.BackColor = Drawing.Color.Transparent
        ProfileTabContainer.ActiveTabIndex = 3

    End Sub

    Protected Sub SavedLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SavedLinkButton.Click

        ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageSaved"

        MessageGridView.DataBind()
        MessageGridView.SelectedIndex = -1
        DetailsMessageView.DataBind()
        LowerMessageUpdatePanel.Update()

        SaveLinkButton.Visible = False
        ReplyLinkButton.Visible = False
        MessageGridView.PageIndex = 0

        Session("messagemode") = 2
        InboxLinkButton.BackColor = Drawing.Color.Transparent
        OutboxLinkButton.BackColor = Drawing.Color.Transparent
        SavedLinkButton.BackColor = Drawing.Color.White

    End Sub

    Protected Sub UpdateViewedMessage()

        Select Case Convert.ToInt32(Session("messagemode").ToString)
            Case 0
                ProfessionalMessageObjectDataSource.UpdateMethod = "UpdateProfessionalMessageInbox"
                ProfessionalMessageObjectDataSource.UpdateParameters(0).DefaultValue = SelectedMessageID
                ProfessionalMessageObjectDataSource.Update()
            Case 1
                ProfessionalMessageObjectDataSource.UpdateMethod = "UpdateProfessionalMessageOutbox"
                ProfessionalMessageObjectDataSource.UpdateParameters(0).DefaultValue = SelectedMessageID
                ProfessionalMessageObjectDataSource.Update()
            Case 2
                ProfessionalMessageObjectDataSource.UpdateMethod = "UpdateProfessionalMessageSaved"
                ProfessionalMessageObjectDataSource.UpdateParameters(0).DefaultValue = SelectedMessageID
                ProfessionalMessageObjectDataSource.Update()
        End Select

    End Sub

    ''''''''''''''''''''''''''''''''''''MESSAGE TABS''''''''''''''''''''''''''''''''''''''''''' 

    ''''''''''''''''''''''''''''''''''''PROJECT TABS'''''''''''''''''''''''''''''''''''''''''    

    Protected Sub AddNewProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddNewProjectLinkButton.Click
        AddNewProject()
    End Sub

    Protected Sub AddNewProject()

        Dim StartDate As String
        StartDate = Date.UtcNow.ToShortDateString.ToString + " " + Date.UtcNow.ToShortTimeString.ToString

        Dim EndDate As String
        EndDate = Date.UtcNow.AddDays(1).ToShortDateString.ToString + " " + Date.UtcNow.ToShortTimeString.ToString

        Dim DatePosted As String
        DatePosted = System.DateTime.Today.ToShortDateString.ToString()

        Dim Result As String = "0"

        Dim NewProjectAdapter As New AddNewProjectDataSetTableAdapters.QueriesTableAdapter
        ActivateLanguage()
        NewProjectAdapter.AddProject(Session("ProfessionalId").ToString(), "PRO", _language.ToString(), 1, 1, 1, 1, 1, 1, 1, "" + _
                                                                   "", StartDate.ToString(), EndDate.ToString(), 0.0, 1, "", "", DatePosted.ToString(), Result)

        Session("ProjectID") = Result

        DelayModalPopUpExtender.Hide()

        Response.Redirect("../PostProject.aspx")

    End Sub

    Protected Sub EditProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Session("ProjectID") = ProjectGridView.SelectedDataKey.Value.ToString

        Dim ProjectStatus As New ProjectExtraDataSetTableAdapters.QueriesTableAdapter
        Dim Status As String = ProjectStatus.GetStatus(Session("ProjectID").ToString)

        If Status = "CLOSED" Then
            Me.Calendar1.SelectedDate = DateTime.UtcNow
            DelayModalPopUpExtender.Hide()
            Me.ExtendProjectModalPopupExtender.Show()
        Else
            Response.Redirect("../PostProject.aspx")
            DelayModalPopUpExtender.Hide()
        End If

    End Sub

    Protected Sub Extend(ByVal sender As Object, ByVal e As System.EventArgs) Handles ExtendButton.Click

        Dim ExtendProjectQuery As New ExtendProjectDataSetTableAdapters.QueriesTableAdapter
        ExtendProjectQuery.ExtendProject(Session("ProjectID").ToString, Calendar1.SelectedDate.Date.ToUniversalTime.ToString)

        DelayModalPopUpExtender.Hide()
        Response.Redirect("../PostProject.aspx")

    End Sub

    Protected Sub Calendar1_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles Calendar1.DayRender
        e.Day.IsSelectable = e.Day.Date >= DateTime.UtcNow
    End Sub

    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
        Me.ExtendProjectModalPopupExtender.Show()
    End Sub

    Protected Sub Calendar1_VisibleMonthChanged(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MonthChangedEventArgs) Handles Calendar1.VisibleMonthChanged
        Me.ExtendProjectModalPopupExtender.Show()
    End Sub

    Protected Sub CancelExtension(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelExtensionButton.Click
        DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub DeleteProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        _deleteProject = True
    End Sub

    Protected Sub ProjectGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles ProjectGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='Maroon'; this.style.color='white'")
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#F7F6F3'; ; this.style.color='black'")
        End If
    End Sub

    Protected Sub ProjectGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ProjectGridView.SelectedIndexChanged

        If _deleteProject = True Then
            _deleteProject = False
            Me.ProfessionalProjectDataSource.DeleteParameters("ProjectID").DefaultValue = ProjectGridView.SelectedPersistedDataKey.Value.ToString
            Me.ProfessionalProjectDataSource.DeleteParameters("PosterID").DefaultValue = Session("ProfessionalId").ToString
            Me.ProfessionalProjectDataSource.DeleteParameters("PosterRole").DefaultValue = "PRO"
            Me.ProfessionalProjectDataSource.Delete()
            Me.ProjectGridView.DataBind()
            Me.ProjectGridView.SelectedIndex = -1
            Me.DetailProjectSpecificationUpdatePanel.Update()
            Me.DetailProjectPhotoUpdatePanel.Update()
            Me.DetailProjectStatusUpdatePanel.Update()
            Me.WatchListGridView.DataBind()
            Me.EditProjectLinkButton.Visible = False
        End If

        If _editProject = True Then
            _editProject = False
            Dim ProjectStatus As New ProjectExtraDataSetTableAdapters.QueriesTableAdapter
            Dim Status As String = ProjectStatus.GetStatus(ProjectGridView.SelectedPersistedDataKey.Value.ToString)
            Select Case Status.ToString
                Case "Saved", "Enregistré"
                    EditProjectLinkButton.Visible = True
                Case "CLOSED", "FERMÉ"
                    EditProjectLinkButton.Visible = True
                Case "Pending", "En Attente"
                    EditProjectLinkButton.Visible = False
                Case "OPEN", "OUVERT"
                    EditProjectLinkButton.Visible = False
            End Select

        End If

        DelayModalPopUpExtender.Hide()

    End Sub

    Protected Sub ViewProjectLinkButtonClick(ByVal sender As Object, ByVal e As System.EventArgs)
        _editProject = True
    End Sub

    ''''''''''''''''''''''''''''''''''''PROJECT TABS'''''''''''''''''''''''''''''''''''''''''''    














    ''''''''''''''''''''''''''''''''''''FAVORITE TABS'''''''''''''''''''''''''''''''''''''''''''   

    Protected Sub ModalInvitationGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Invitation()
        Me.ModalInvitationGridView.SelectedIndex = -1
        Me.DelayModalPopUpExtender.Hide()

    End Sub

    Protected Sub ModalInvitationGridView_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles ModalInvitationGridView.PageIndexChanging
        Me.ModalInvitationPopupExtender.Show()
    End Sub

    Protected Sub ModalInvitationGridView_Sorting1(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles ModalInvitationGridView.Sorting
        Me.ModalInvitationPopupExtender.Show()
    End Sub

    Sub Invitation()
        Dim SenderID As String
        Dim ReceiverID As String
        Dim ProjectID As String
        Dim SenderRole As Integer
        Dim Title As String
        Dim LCID As String
        Dim DateEvent As String
        Dim senderName As String

        ''Sender ID
        SenderID = Session("ProfessionalId").ToString

        ''Professional General 
        Dim ProfessionalInformationAdapter As New GetUserInformationTableAdapters.ProfessionalGeneralTableAdapter

        Dim ProfessionalInformationTable As New GetUserInformation.ProfessionalGeneralDataTable

        ProfessionalInformationAdapter.FillProfessionalInformation(ProfessionalInformationTable, SenderID.ToString)

        ''Sender Name

        senderName = ProfessionalInformationTable.Item(0).UserName.ToString()

        SenderRole = 1

        ''Receiver always a professional
        Dim professionalLabel As Label = CType(Me.FavoriteGridView.SelectedRow.FindControl("ProID1"), Label)

        ReceiverID = professionalLabel.Text.ToString

        ProjectID = ModalInvitationGridView.SelectedPersistedDataKey.Value.ToString()

        ''FINAL STEP : MAKE SUE TO FORMAT THE MESSAGE TO INCLUDE THE PROJECT AS A HYPERLINK AND THE FORMATION OF THE EMAIL
        ActivateLanguage()
        Dim MessageCompositionAdapter As New MessageCompositionTableAdapters.EmailCompositionTableAdapter

        Dim MessageCompositionTable As New MessageComposition.EmailCompositionDataTable

        MessageCompositionAdapter.FillCustomMessage(MessageCompositionTable, _language.ToString())

        Title = senderName.ToString + " " + MessageCompositionTable.Rows(0).Item("InvitationMessage").ToString() + " " + ProjectID.ToString

        LCID = _language.ToString

        DateEvent = Date.UtcNow.ToShortDateString.ToString + " " + Date.UtcNow.ToShortTimeString.ToString

        '' Database 

        Dim Invitation As New InvitationToProjectTableAdapters.QueriesTableAdapter

        Invitation.InvitetoProject(SenderID.ToString, ReceiverID.ToString, ProjectID.ToString, SenderRole.ToString, Title.ToString, LCID.ToString, DateEvent.ToString)
        InvitationGridView.DataBind()

        ''SEND AN EMAIL ONLY  TO THE RECEIVER AND AN EVENT TO THE RECEIVER

        Me.DelayModalPopUpExtender.Hide()

    End Sub

    Protected Sub InviteToProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        _InvitetoProject = True
    End Sub

    Protected Sub AskQuestionLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.DelayModalPopUpExtender.Show()
        _Question = True
    End Sub

    Protected Sub SubmitQuestion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitQuestion.Click

        MessageModalPopupExtender.Hide()
        DelayModalPopUpExtender.Show()

        Dim senderid As String
        Dim receiverid As String
        Dim message As String
        Dim sendername As String
        Dim receivername As String
        Dim senderemail As String
        Dim receiveremail As String
        Dim senderRole As String

        ''Professional General 
        Dim ProfessionalInformationAdapter As New GetUserInformationTableAdapters.ProfessionalGeneralTableAdapter

        Dim ProfessionalInformationTable As New GetUserInformation.ProfessionalGeneralDataTable

        ProfessionalInformationAdapter.FillProfessionalInformation(ProfessionalInformationTable, Session("ProfessionalId").ToString)

        ''Sender Information
        senderid = Session("ProfessionalId").ToString()

        senderemail = ProfessionalInformationTable.Item(0).EmailAddress.ToString()

        sendername = ProfessionalInformationTable.Item(0).UserName.ToString()

        'MailMessage.isbodyhtml = True ( convert the content into html) see the send email function

        message = MessageTextBox.Text.ToString()

        senderRole = 0

        ''Receiver always a professional

        Dim professionalLabel As Label = CType(Me.FavoriteGridView.SelectedRow.FindControl("ProID1"), Label)

        receiverid = professionalLabel.Text.ToString

        ''Professional General 
        Dim ReceiverInformationAdapter As New GetUserInformationTableAdapters.ProfessionalGeneralTableAdapter

        Dim ReceiverInformationTable As New GetUserInformation.ProfessionalGeneralDataTable

        ReceiverInformationAdapter.FillProfessionalInformation(ReceiverInformationTable, receiverid.ToString)

        receiveremail = ReceiverInformationTable.Item(0).EmailAddress.ToString()

        receivername = ReceiverInformationTable.Item(0).UserName.ToString()

        Dim MessageCompositionAdapter As New MessageCompositionTableAdapters.EmailCompositionTableAdapter

        Dim MessageCompositionTable As New MessageComposition.EmailCompositionDataTable

        ActivateLanguage()

        MessageCompositionAdapter.FillCustomMessage(MessageCompositionTable, _language.ToString())

        Title = sendername.ToString + " " + MessageCompositionTable.Rows(0).Item("QuestionMessage").ToString() + " "

        Dim LCID As String = _language.ToString

        '' Database
        Dim AskQuestionAdpater As New GetUserInformationTableAdapters.AskQuestionTableAdapter

        Dim QuestionDate As String = Date.UtcNow.ToShortDateString.ToString + " " + Date.UtcNow.ToShortTimeString.ToString

        AskQuestionAdpater.AskQuestion(senderid.ToString(), sendername.ToString(), senderemail.ToString(), receiverid.ToString(), receivername.ToString(), receiveremail.ToString(), message.ToString(), Title.ToString(), LCID.ToString(), QuestionDate.ToString(), senderRole.ToString())

        Me.MessageTextBox.Text = ""

        MessagePanelUpdatePanel.Update()

        DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub CancelQuestion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelQuestion.Click
        DelayModalPopUpExtender.Show()
        Me.MessageModalPopupExtender.Hide()
        DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub FavoriteGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles FavoriteGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='Silver'; this.style.color='#15317E'")
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#F7F6F3'; this.style.color='black'")
        End If
    End Sub

    Protected Sub FavoriteGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FavoriteGridView.SelectedIndexChanged

        If _InvitetoProject = True Then
            _InvitetoProject = False

            ProfessionalOpenProjectDataSource.SelectParameters(0).DefaultValue = Session("ProfessionalId").ToString
            ProfessionalOpenProjectDataSource.SelectParameters(1).DefaultValue = _language.ToString
            ModalInvitationGridView.DataBind()
            Me.ModalInvitationUpdatePanel.Update()

            Me.DelayModalPopUpExtender.Hide()
            Me.ModalInvitationPopupExtender.Show()

        End If

        If _Question = True Then
            _Question = False

            Me.DelayModalPopUpExtender.Hide()
            Me.MessageModalPopupExtender.Show()

        End If

    End Sub

    '''''''''''''''''''''''''''''''''''FAVORITE TABS''''''''''''''''''''''''''''''''''''''''''''

    '''''''''''''''''''''''''''''''''''INVITATION TABS'''''''''''''''''''''''''''''''''''''''''    

    Protected Sub InvitationGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles InvitationGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#006699'; this.style.color='white'")
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#F7F6F3'; this.style.color='black'")
        End If
    End Sub

    Protected Sub InvitationGridView_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles InvitationGridView.SelectedIndexChanged
        Dim ProfessionalInvitationAdpater As New ProfessionalInvitationSentTableAdapters.ProfessionalInvitationSentTableAdapter
        ProfessionalInvitationAdpater.DeleteProfessionalInvitation(Session("ProfessionalID").ToString(), InvitationGridView.SelectedPersistedDataKey.Value.ToString())
        InvitationGridView.DataBind()
    End Sub

    '''''''''''''''''''''''''''''''''''INVITATION TABS'''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''''WATCHLIST TABS'''''''''''''''''''''''''''''''''''''''''  

    Protected Sub DeleteWatchListProject_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        _deleteWatchList = True
    End Sub

    Protected Sub ViewWatchListProject_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        _viewWatchListProject = True
    End Sub

    Protected Sub WatchListGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles WatchListGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#4F5A64'; this.style.color='white'")
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#F7F6F3'; this.style.color='black'")
        End If
    End Sub

    Protected Sub WatchListGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles WatchListGridView.SelectedIndexChanged

        Dim watchIDlist As Label = CType(WatchListGridView.SelectedRow.FindControl("WatchLabelID"), Label)

        If _deleteWatchList = True Then
            Dim DeleteWatchListAdapter As New ProfessionalWatchListDataSetTableAdapters.GetProfessionalWatchListTableAdapter
            DeleteWatchListAdapter.DeleteWatchList(watchIDlist.Text.ToString(), "CUS")
            _deleteWatchList = False
            WatchListGridView.DataBind()
            DelayModalPopUpExtender.Hide()
        End If

        If _viewWatchListProject = True Then
            ViewQuickListProject(WatchListGridView.SelectedPersistedDataKey.Value.ToString())
            _viewWatchListProject = False
        End If
    End Sub

    Protected Sub ViewQuickListProject(ByVal ProjectID As String)

        Dim ProjectviewAdpater As New ViewProjectDataSetTableAdapters.ProjectRequirementsTableAdapter

        Dim ProjectViewDataTable As New ViewProjectDataSet.ProjectRequirementsDataTable

        Dim ProjectPhotoAdpater As New ViewProjectDataSetTableAdapters.ProjectPhotoTableAdapter

        Dim ProjectPhotoDataTable As New ViewProjectDataSet.ProjectPhotoDataTable

        ProjectviewAdpater.FillViewProject(ProjectViewDataTable, ProjectID.ToString())

        ProjectPhotoAdpater.FillProjectPhoto(ProjectPhotoDataTable, ProjectID.ToString())

        ProjectPhotoObjectDataSource.SelectParameters(0).DefaultValue = ProjectID.ToString()

        Me.ProjectPhotoFormView.DataBind()

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

        Me.MoreProjectUpdatePanel.Update()
        MoreProjectHiddenFieldButton.Value = "../ViewProject.aspx?PRID=" + ProjectViewDataTable.Rows(0).Item(0).ToString
        Me.MoreProjectModalPopupExtender.Show()
    End Sub

    ''''''''''''''''''''''''''''''''''''WATCHLIST TABS'''''''''''''''''''''''''''''''''''''''''    

    ''''''''''''''''''''''''''''''''''''TRANSACTION TABS'''''''''''''''''''''''''''''''''''''''

    Protected Sub ActiveTransactionDetailLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("TransactionDetail") = True
    End Sub

    Protected Sub ActiveTransactionPayNowLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("PaymentMethod") = True
    End Sub

    Protected Sub ActiveTransactionGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ActiveTransactionGridView.SelectedIndexChanged
        If Session("PaymentMethod") = True Then
            'MethodofPaymentModalPopupExtender.Show() 
            Session("PaymentMethod") = False
            Response.Redirect("Paypal/Start.aspx?ID=" + ActiveTransactionGridView.SelectedRow.Cells(1).Text.ToString())
        End If
        If Session("TransactionDetail") = True Then
            PhaseInformationObjectDataSource.SelectParameters(0).DefaultValue = ActiveTransactionGridView.SelectedPersistedDataKey.Value.ToString
            PhaseInformationObjectDataSource.DataBind()
            DetailTransactionDetailView.DataBind()
            DetailTransactionUpdatePanel.Update()
            DetailTransactionModalPopupExtender.Show()
            Session("TransactionDetail") = False
        End If
    End Sub

    Protected Sub CancelPayment_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        MethodofPaymentModalPopupExtender.Hide()
    End Sub

    ''''''''''''''''''''''''''''''''''''TRANSACTION TABS''''''''''''''''''''''''''''''''''''''''

    '''''''''''''''''''''''''''''''''''''CONTRACT TABS'''''''''''''''''''''''''''''''''''''''''''

    Protected Sub PDFButtonClick(sender As Object, e As System.Web.UI.ImageClickEventArgs)
        Response.Redirect("../Contracts/ReportDownload.aspx?ID=" + GlobalContractGridView.SelectedValue.ToString())
    End Sub

    'Protected Sub DownloadLinkButton_Click(sender As Object, e As System.EventArgs)

    '    Dim ProfessionalContractAdapter As New ContractDataSetTableAdapters.ContractTableAdapter
    '    Dim ProfessionalContractTable As New ContractDataSet.ContractDataTable
    '    ProfessionalContractAdapter.FillContract(ProfessionalContractTable, Convert.ToInt32((GlobalContractGridView.SelectedDataKey.Value.ToString())))

    '    Dim ProfessionalReportDataSource As New ReportDataSource()
    '    ProfessionalReportDataSource.Name = "ContractDataSet"
    '    ProfessionalReportDataSource.Value = ProfessionalContractTable

    '    Dim ProfessionalContractDescriptionAdapter As New ContractDataSetTableAdapters.ContractDescriptionTableAdapter
    '    Dim ProfessionalContractDescriptionTable As New ContractDataSet.ContractDescriptionDataTable
    '    ProfessionalContractDescriptionAdapter.FillContractDescription(ProfessionalContractDescriptionTable, _language.ToString())

    '    Dim ProfessionalDescriptionReportDataSource As New ReportDataSource()
    '    ProfessionalDescriptionReportDataSource.Name = "ContractDescriptionDataSet"
    '    ProfessionalDescriptionReportDataSource.Value = ProfessionalContractDescriptionTable

    '    ProfessionalReportViewer.Visible = True
    '    ProfessionalReportViewer.LocalReport.DataSources.Clear()
    '    ProfessionalReportViewer.LocalReport.DataSources.Add(ProfessionalReportDataSource)
    '    ProfessionalReportViewer.LocalReport.DataSources.Add(ProfessionalDescriptionReportDataSource)
    '    ProfessionalReportViewer.LocalReport.Refresh()

    '    ' ''Export to PDF
    '    Dim mimeType As String
    '    Dim encoding As String
    '    Dim fileNameExtension As String
    '    Dim streams As String()
    '    Dim warnings As Warning()

    '    Dim pdfContent As Byte() = ProfessionalReportViewer.LocalReport.Render("PDF", Nothing, mimeType, encoding, fileNameExtension, streams, _
    '     warnings)

    '    'Return PDF
    '    Response.Clear()
    '    Response.ContentType = "application/pdf"
    '    Response.AddHeader("Content-disposition", "attachment; filename=Contract.pdf")
    '    Response.BinaryWrite(pdfContent)
    '    Response.[End]()

    'End Sub

    '''''''''''''''''''''''''''''''''''''CONTRACT TABS''''''''''''''''''''''''''''''''''''''''''' 

    '''''''''''''''''''''''''''''''''''''COMMENT TABS''''''''''''''''''''''''''''''''''''''''''''    

    Protected Sub CommentReceivedGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles CommentReceivedGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#1C5E55'; this.style.color='white'")
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#E3EAEB'; this.style.color='black'")
        End If
    End Sub

    Protected Sub CommentReceivedGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CommentReceivedGridView.SelectedIndexChanged
        ViewProject(1)
        DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub CommentSentGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles CommentSentGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#5D7B9D'; this.style.color='white'")
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#F7F6F3'; this.style.color='black'")
        End If
    End Sub

    Protected Sub CommentSentGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CommentSentGridView.SelectedIndexChanged
        ViewProject(2)
        DelayModalPopUpExtender.Hide()
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

        ElseIf commenttype = 2 Then

            ProjectviewAdpater.FillViewProject(ProjectViewDataTable, CommentSentGridView.SelectedPersistedDataKey.Value.ToString())

            ProjectPhotoAdpater.FillProjectPhoto(ProjectPhotoDataTable, CommentSentGridView.SelectedPersistedDataKey.Value.ToString())

            ProjectPhotoObjectDataSource.SelectParameters(0).DefaultValue = CommentSentGridView.SelectedPersistedDataKey.Value.ToString()

        ElseIf commenttype = 3 Then
            Dim ProjectLabel As New Label

            If Session("ActiveProject") = True Then
                ProjectLabel = CType(ActiveBidsGridView.SelectedRow.FindControl("ProjectIDLabel"), Label)
                Session("ActiveProject") = False

            ElseIf Session("WonProject") = True Then
                ProjectLabel = CType(WonBidsGridView.SelectedRow.FindControl("ProjectWonIDLabel"), Label)
                Session("WonProject") = False

            ElseIf Session("LostProject") = True Then
                ProjectLabel = CType(LostBidsGridView.SelectedRow.FindControl("ProjectLostIDLabel"), Label)
                Session("LostProject") = False

            End If
        End If

        Me.ProjectPhotoFormView.DataBind()

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

        Me.MoreProjectUpdatePanel.Update()
        MoreProjectHiddenFieldButton.Value = "../ViewProject.aspx?PRID=" + ProjectViewDataTable.Rows(0).Item(0).ToString
        Me.MoreProjectModalPopupExtender.Show()
    End Sub

    Protected Sub InitiateComment()

        Dim ProfessionalInformationAdapter As New ProfessionalCommentsReceivedTableAdapters.ProfessionalCommentReceivedSummaryTableAdapter

        Dim ProfessionalInformationTable As New ProfessionalCommentsReceived.ProfessionalCommentReceivedSummaryDataTable

        ProfessionalInformationAdapter.FillProfessionalCommentReceivedSummary(ProfessionalInformationTable, Session("ProfessionalId").ToString())

        Dim total As Integer
        Dim Positive As Integer = Convert.ToInt32(ProfessionalInformationTable.Item(0).NumberofPositive.ToString())
        Dim Negative As Integer = Convert.ToInt32(ProfessionalInformationTable.Item(0).NumberofNegative.ToString())
        Dim Neutral As Integer = Convert.ToInt32(ProfessionalInformationTable.Item(0).NumberofNeutral.ToString())

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

        'FeedBack Chart
        PerformanceChart.Series(0).Points(0).SetValueXY(Positive, Positive)
        PerformanceChart.Series(0).Points(1).SetValueXY(Negative, Negative)
        PerformanceChart.Series(0).Points(2).SetValueXY(Neutral, Neutral)

        PerformanceChart.Titles(0).Text = Positive.ToString + "%"

        'Comment Chart
        CommentChart.Series(0).Points(0).SetValueXY(Positive, Positive)
        CommentChart.Series(0).Points(1).SetValueXY(Negative, Negative)
        CommentChart.Series(0).Points(2).SetValueXY(Neutral, Neutral)

        CommentChart.Titles(0).Text = Positive.ToString + "%"

    End Sub

    Protected Sub OkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.MoreProjectModalPopupExtender.Hide()
        Me.DelayModalPopUpExtender.Hide()
    End Sub

    '''''''''''''''''''''''''''''''''''COMMENT TABS'''''''''''''''''''''''''''''''''''''''''''''

    '''''''''''''''''''''''''''''''''''ACCOUNT TABS''''''''''''''''''''''''''''''''''''''''''' 

    Protected Sub DeleteAccountClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteAccountLinkButton.Click
        Utility.DeleteProfessional()
        DeleteDirectory()
        Membership.DeleteUser(Membership.GetUser.ToString, True)
        FormsAuthentication.SignOut()
        FormsAuthentication.RedirectToLoginPage()
    End Sub

    Sub DeleteDirectory()
        Dim Username As String = User.Identity.Name
        Dim rootPath As String = Server.MapPath("~/Authenticated/Professional/Images/")
        Dim newProfessionalDirectory As String = rootPath & Username

        If Directory.Exists(newProfessionalDirectory) = True Then
            Directory.Delete(newProfessionalDirectory, True)
        End If

        Dim professionalProjectDirectory As String = newProfessionalDirectory & "/Projects/"

        If Directory.Exists(professionalProjectDirectory) = True Then
            Directory.Delete(professionalProjectDirectory, True)
        End If

        Dim rootWorkPath As String = Server.MapPath("~/Authenticated/Professional/WorkImages/")
        Dim newProfessionalWorkDirectory As String = rootWorkPath & Username

        If Directory.Exists(newProfessionalWorkDirectory) = True Then
            Directory.Delete(newProfessionalWorkDirectory, True)

        End If
    End Sub

    Protected Sub AccountSendMessageLinkButtonClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles AccountSendMessageLinkButton.Click
        Utility.SendEmail(Utility.GetProfessionalGeneralProperties().UserName, Utility.GetProfessionalGeneralProperties().EmailAddress, Utility.GetProfessionalProperties.LCID,
                        "Contact Us", "Administrator", "postmaster@my-side-job.com",
                        Server.HtmlEncode(AccountProfessionalServiceMessageTextBox.Text.ToString()),
                        "http://my-side-job.com/Schedule/MySideJob/EmailTemplates/Professional/ProfessionalContactUs.aspx?id=" + Utility.GetProfessionalProperties.ProID.ToString(),
                        , , Utility.GetProfessionalProperties.ProID)
        Dim customMessage = Resource.ThankyouForyourEmail
        Response.Write("<script language='javascript'>alert('" + customMessage + "'); window.location = 'http://www.my-side-job.com';</script>")
    End Sub

    Protected Sub BindQuestions()
        ProfessionalServiceObjectDataSource.SelectParameters(0).DefaultValue = _language
        ProfessionalServiceObjectDataSource.DataBind()
    End Sub

    '''''''''''''''''''''''''''''''''''ACCOUNT TABS''''''''''''''''''''''''''''''''''''''''''' 

    ''''''''''''''''''''''''''''''''''''''SKILLS''''''''''''''''''''''''''''''''''''''''''''''

    Protected Sub CancelSkillButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelSkillButton.Click
        Me.ProfessionalPanelModalPopup.Hide()
        Session("NEWSKILLS") = False
        Me.DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub AddSkillLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Me.DelayModalPopUpExtender.Show()
        Dim numberofskills As Integer = 0
        numberofskills = SkillDataList.Items.Count

        If numberofskills >= 4 Then

            Me.PanelMaximumSkillsModalPopup.Show()
            Me.PanelMaximumSkillsUpdatePanel.Update()

        Else
            Me.IndustryDropDownList.SelectedIndex = 0

            SkillDetailObjectDataSource.SelectMethod = "GetDefault"
            SkillDetailObjectDataSource.SelectParameters.Clear()
            SkillDetailObjectDataSource.DataBind()
            ProfessionalPanelModalPopup.Show()

            Session("NEWSKILLS") = True

        End If
        Me.DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub SaveSkillButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SaveSkillButton.Click
        DelayModalPopUpExtender.Show()
        Dim LanguageID As Integer
        Dim Language As String

        Language = Session("Language")

        If Language Is Nothing Or Language = "" Then
            LanguageID = 1
        Else
            LanguageID = CInt(Language)
        End If

        ''Industry
        Dim SelectedCategory As String = (Me.IndustryDropDownList.SelectedIndex + 1).ToString

        ''Speciality
        Dim SelectedJobID As String = "-1"

        If Me.SpecialtyListBox1.SelectedIndex <> -1 Then
            SelectedJobID = SpecialtyListBox1.SelectedValue.ToString
        Else
            If Me.SpecialtyListBox2.SelectedIndex <> -1 Then
                SelectedJobID = SpecialtyListBox2.SelectedValue.ToString
            Else
                If Me.SpecialtyListBox3.SelectedIndex <> -1 Then
                    SelectedJobID = SpecialtyListBox3.SelectedValue.ToString
                End If
            End If
        End If

        If SelectedJobID = "-1" Then
            SelectedJobID = SpecialtyListBox1.Items(0).Value.ToString
        End If

        ''Experience
        Dim list As DropDownList = CType(Me.ProfessionalRequirementDataList.Items(0).FindControl("ExperienceDropDownList"), DropDownList)
        Dim SelectedExperience As String = list.SelectedIndex.ToString

        list = Nothing

        ''Crew number
        list = CType(Me.ProfessionalRequirementDataList.Items(0).FindControl("CrewNumberDropDownList"), DropDownList)

        Dim SelectedCrewNumber As String = list.SelectedIndex.ToString

        list = Nothing

        ''Licensed
        list = CType(Me.ProfessionalRequirementDataList.Items(0).FindControl("LicensedDropDownList"), DropDownList)

        Dim SelectedLicensed As String = list.SelectedIndex.ToString

        list = Nothing

        ''Insured

        list = CType(Me.ProfessionalRequirementDataList.Items(0).FindControl("InsuredDropDownList"), DropDownList)

        Dim SelectedInsured As String = list.SelectedIndex.ToString

        list = Nothing

        ''Relocation

        list = CType(Me.ProfessionalRequirementDataList.Items(0).FindControl("RelocationDropDownList"), DropDownList)

        Dim SelectedRelocation As String = list.SelectedIndex.ToString

        list = Nothing

        If Session("NEWSKILLS") = False Then
            Dim SelectedSkillID As String = SkillDataList.SelectedValue.ToString
            Dim UpdateSkillTableAdapter As New SkillsDataSetTableAdapters.SkillsTableAdapter
            UpdateSkillTableAdapter.UpdateSkill(SelectedSkillID.ToString(), SelectedCategory.ToString(), SelectedJobID.ToString(), SelectedExperience.ToString(), + _
                                                SelectedCrewNumber.ToString(), SelectedLicensed.ToString(), SelectedInsured.ToString(), SelectedRelocation.ToString(), LanguageID.ToString())


            SkillDataList.DataBind()
            SkillUpdatePanel.Update()
            ProfessionalPanelModalPopup.Hide()
            DelayModalPopUpExtender.Hide()
        Else
            Dim AddSkillTableAdapter As New SkillsDataSetTableAdapters.SkillsTableAdapter
            AddSkillTableAdapter.AddSKILL(Session("ProfessionalID").ToString, SelectedCategory.ToString(), SelectedJobID.ToString(), SelectedExperience.ToString(), + _
                                                SelectedCrewNumber.ToString(), SelectedLicensed.ToString(), SelectedInsured.ToString(), SelectedRelocation.ToString(), LanguageID.ToString())


            SkillDataList.DataBind()
            ProfessionalPanelModalPopup.Hide()
            DelayModalPopUpExtender.Hide()
        End If
    End Sub

    Protected Sub DeleteSkillButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteSkillButton.Click
        Me.DelayModalPopUpExtender.Show()
        Dim DeletedSkillTableAdapter As New SkillsDataSetTableAdapters.SkillsTableAdapter
        DeletedSkillTableAdapter.DeleteSKILL(Session("ProfessionalID").ToString(), SkillDataList.SelectedValue.ToString())
        SkillDataList.DataBind()
        ProfessionalPanelModalPopup.Hide()
        DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub SkillHideButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SkillHideButton.Click
        Session("NEWSKILLS") = False
        PanelMaximumSkillsModalPopup.Hide()
    End Sub

    Protected Sub SkillDataList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles SkillDataList.SelectedIndexChanged

        Dim SKILLID As String
        SKILLID = SkillDataList.SelectedValue.ToString

        SkillDetailObjectDataSource.SelectMethod = "GetSkillDetail"
        SkillDetailObjectDataSource.SelectParameters(0).DefaultValue = SKILLID.ToString()
        SkillDetailObjectDataSource.DataBind()

        Me.UpdateProfessionalPanel.Update()

        Dim SelectedTable As Integer
        Dim SelectedCategory As Integer
        Dim SelectedJob As Integer
        Dim SelectedSkillTableAdapter As New SkillsDataSetTableAdapters.SkillDetailTableAdapter
        Dim SelectedSkillTable As New SkillsDataSet.SkillDetailDataTable

        SelectedSkillTableAdapter.FillSkillDetail(SelectedSkillTable, SKILLID.ToString())
        SelectedTable = SelectedSkillTable.Rows(0)(2).ToString()
        SelectedCategory = SelectedSkillTable.Rows(0)("CategoryID").ToString()
        SelectedCategory = SelectedSkillTable.Rows(0)("CategoryID").ToString()
        SelectedJob = SelectedSkillTable.Rows(0)("JobID").ToString()

        IndustryDropDownList.SelectedIndex = SelectedCategory - 1
        IndustryDropDownList.DataBind()
        SelectJob(SelectedJob)
        ProfessionalPanelModalPopup.Show()
    End Sub

    Protected Sub SelectJob(ByVal ID As Integer)

        For i As Integer = 0 To SpecialtyListBox1.Items.Count - 1
            If SpecialtyListBox1.Items(i).Value = ID Then
                SpecialtyListBox1.SelectedIndex = i
                SpecialtyListBox1.Focus()
                SpecialtyListBox1.Items(i).Selected = True
                Exit Sub
            End If
        Next

        For i As Integer = 0 To SpecialtyListBox2.Items.Count - 1
            If SpecialtyListBox2.Items(i).Value = ID Then
                SpecialtyListBox2.SelectedIndex = i
                SpecialtyListBox2.Focus()
                SpecialtyListBox2.Items(i).Selected = True
                Exit Sub
            End If
        Next

        For i As Integer = 0 To SpecialtyListBox3.Items.Count - 1
            If SpecialtyListBox3.Items(i).Value = ID Then
                SpecialtyListBox3.SelectedIndex = i
                SpecialtyListBox3.Focus()
                SpecialtyListBox3.Items(i).Selected = True
                Exit Sub
            End If
        Next

    End Sub

    Protected Sub IndustryDropDownList_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles IndustryDropDownList.SelectedIndexChanged
        DelayModalPopUpExtender.Show()
        DelayModalPopUpExtender.Hide()
    End Sub

    ''''''''''''''''''''''''''''''''''''''SKILLS''''''''''''''''''''''''''''''''''''''''''''''

    '''''''''''''''''''''''''''''''''''WORKSHOP TAB'''''''''''''''''''''''''''''''''''''''''''

    Sub PhotoPaths2()
        Dim ProfessionalWorkPhotoAdapter As New CustomModalPhotoSelectionDataSetTableAdapters.ProfessionalWorkPhotoTableAdapter
        Dim ProfessionalWorkPhotoTable As New CustomModalPhotoSelectionDataSet.ProfessionalWorkPhotoDataTable
        ProfessionalWorkPhotoAdapter.FillCustomProfessionalWorkPhoto(ProfessionalWorkPhotoTable, CType(Session("ProfessionalID").ToString, Integer))

        ''Dynamically Allocated a list box that will be used for the slide show
        Dim numberofrows As Integer = ProfessionalWorkPhotoTable.Rows.Count

        If numberofrows = 1 Then
            ProfessionalWorkData._PathWorkImageList = New ArrayList(0)
            ProfessionalWorkData._CaptionWorkImageList = New ArrayList(0)

            ProfessionalWorkData._PathWorkImageList.Add(ProfessionalWorkPhotoTable.Rows(0).Item(1).ToString)
            ProfessionalWorkData._CaptionWorkImageList.Add(ProfessionalWorkPhotoTable.Rows(0).Item(2).ToString)

        Else
            Dim i As Integer
            ProfessionalWorkData._PathWorkImageList = New ArrayList(numberofrows - 1)
            ProfessionalWorkData._CaptionWorkImageList = New ArrayList(numberofrows - 1)

            For i = 0 To numberofrows - 1

                If i <> 0 Then
                    ProfessionalWorkData._PathWorkImageList.Add(ProfessionalWorkPhotoTable.Rows(i).Item(1).ToString)
                    ProfessionalWorkData._CaptionWorkImageList.Add(ProfessionalWorkPhotoTable.Rows(i).Item(2).ToString)
                End If

            Next
        End If
    End Sub

    Protected Sub WorkShopSlideShowModalPopupExtender_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles WorkShopSlideShowModalPopupExtender.Load

        PhotoPaths2()
        Dim slideshow2 As New AjaxControlToolkit.SlideShowExtender
        slideshow2.AutoPlay = True
        slideshow2.Loop = True
        slideshow2.NextButtonID = Me.WorkShopImageNextButton.ID
        slideshow2.PreviousButtonID = Me.WorkShopImagePreviousButton.ID
        slideshow2.PlayButtonID = Me.WorkShopImagePlayButton.ID
        slideshow2.TargetControlID = Me.WorkShopImageButton.ID
        slideshow2.SlideShowServicePath = "ProfessionalSlideWebService.asmx"
        slideshow2.SlideShowServiceMethod = "GetWorkSlides"
        slideshow2.PlayInterval = 1000
        slideshow2.PlayButtonText = PlayHiddenField.Value.ToString
        slideshow2.StopButtonText = StopHiddenField.Value.ToString
        Me.WorkShopSlideShowModalPopupExtender.Controls.Add(slideshow2)

    End Sub

    Protected Sub WorkShopImageExitButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles WorkShopImageExitButton.Click
        Me.WorkShopSlideShowModalPopupExtender.Hide()
    End Sub

    '''''''''''''''''''''''''''''''''''WORKSHOP TABS''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''''PAGE EVENTS '''''''''''''''''''''''''''''''''''''''''''''

    Protected Overrides Sub InitializeCulture()
        Utility.InitializeAllCulture(Session("LCID"), Request.QueryString("l"))
        ActivateLanguage()
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Dim user As MembershipUser = Membership.GetUser
            Dim role As String = Me.User.IsInRole("Professional").ToString

            If user Is Nothing Then
                Response.Redirect("~/NotAuthenticated/SignIn.aspx")
            ElseIf role = True Then
                GetInformation()
                TimeUP()
                Calendar1.SelectedDates.Add(DateTime.UtcNow)
                InitiateComment()
                ActivateLanguage()
                BindQuestions()
                InitializeJobs()
            End If
            Dim lang As String = Request.QueryString("l")
            If lang IsNot Nothing Or lang <> "" Then
                Thread.CurrentThread.CurrentUICulture = New CultureInfo(lang)
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang)
            End If
            ActivateLanguage()
        End If

        If (Session("ProfessionalID") IsNot Nothing OrElse [String].Empty.Equals(Session("ProfessionalID"))) Then
            GetInformation()
        End If
    End Sub

    Sub InitializeJobs()
        Select Case _language
            Case 1
                ''ENGLISH
                CategoryDataSource.SelectMethod = "GetCategoryEnglish"
                CategoryDataSource.DataBind()
                SpecialityJobs1DataSource.SelectMethod = "GetSpecialityJob1English"
                SpecialityJobs1DataSource.DataBind()
                SpecialityJobs2DataSource.SelectMethod = "GetSpecialityJob2English"
                SpecialityJobs2DataSource.DataBind()
                SpecialityJobs3DataSource.SelectMethod = "GetSpecialityJob3English"
                SpecialityJobs3DataSource.DataBind()

            Case 2
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

    Sub GetInformation()
        Session("ProfessionalId") = Utility.GetUserInformation("Professional")
    End Sub

    Protected Sub TimeUP()
        Dim ScheduleAdapter As New ScheduleTaskDataSetTableAdapters.TimeUPProcedure
        ScheduleAdapter.TimeUP()
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

    ''''''''''''''''''''''''''''''''''''PAGE EVENTS '''''''''''''''''''''''''''''''''''''''''''''

End Class