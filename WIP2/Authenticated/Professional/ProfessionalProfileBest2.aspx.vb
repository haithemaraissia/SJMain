Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Net.Mail
Imports System.Globalization
Imports System.Threading

Partial Class UserProfile
    Inherits System.Web.UI.Page

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
            Return _ViewWatchListProject
        End Get
        Set(ByVal value As Boolean)
            value = _ViewWatchListProject
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
















    ''WHAT REMINS
    ''SENDING EMAIL
    ''CREDIT CARD
    ''TRANSACTION , BIDS , CONTRACT
    ''COMPLETE THE DELETION OF EVERYTHING IN DELETING THE USER and SEnding the MEssage in the Account TAb

    'UPDATE
    'THEN CLEAN UP A LITTLE BIT OF CODES FOR BIDS, TRANSACTION, CONTRACT + TRANSALTION 
    'REPLCAE SESSION ("ProfessionalID") BY CONTROL STATE --MAYBE BECASUE YOU HAVE TO SHARE ACROOS OTHER PAGES

    '' 'CURRENTLY WORKING ON MESSAGE TAB AND REPLACING ALL SESSION WITH CONTROL STATE CHECK THE BOTTOM

    '******************************************************************************************************
    ''''''''''''''''''''''''''''''''''' PAGE CLEAN UP '''''''''''''''''''''''''''''''''''''''''''''  

    ''ADD FUNCTION THAT INCLUDE THE SENDER, RECEIVER, Subject and BODY AS Parameters
    Protected Sub SendEmail()

        ''TEST THIS WITH WWW.programmingfundamenatl.com/Haithem-Admin/
        Dim mailMessage As New System.Net.Mail.MailMessage

        ''set the Address
        mailMessage.From = New MailAddress("automated_noreply@programmingfundamental.com")
        mailMessage.To.Add(New MailAddress("haithemaraissia@yahoo.com"))

        'mailMessage.Subject = Subject.Trim()
        'mailMessage.Body = Body.Trim()

        'set the content
        mailMessage.Subject = "New invitation to Project"
        mailMessage.Body = "Gongratulation Mr Adam. Mr Jack send you an invitation to Project. Please Log in to your account to view the Project Details."

        mailMessage.IsBodyHtml = True

        Dim smtpClient As New SmtpClient()
        Dim userState As Object = mailMessage


        'Attach event handler for async callback
        AddHandler smtpClient.SendCompleted, AddressOf SmtpClient_OnCompleted

        Try
            '' THIS IS WHAT I HAVE DONE IN www.programmingfundamental.com
            '********************
            'Dim Smtp As New SmtpClient("localhost")
            'smtpClient.Send(mailMessage)
            '********************

            'Send the email asynchronously
            smtpClient.SendAsync(mailMessage, userState)
        Catch smtpEx As SmtpException
            'Error handling here
        Catch ex As Exception
            'Error handling here
        End Try

    End Sub

    Public Sub SmtpClient_OnCompleted(ByVal sender As Object, ByVal e As System.ComponentModel.AsyncCompletedEventArgs)

        'Get UserState as MailMessage instance from SendMail()
        Dim mailMessage As MailMessage = CType(e.UserState, MailMessage)

        'READJUST THIS AFTER YOU ARE SETTING THE EMAIL PROCESS
        If (e.Cancelled) Then
            'ErrorEmailMessage.Text = "Sending of email message was cancelled. Address=" + mailMessage.To(0).Address
        End If

        If Not (e.Error Is Nothing) Then
            ' ErrorEmailMessage.Text = "Error occured, info=" + e.Error.Message
        Else
            ' ErrorEmailMessage.Text = "Mail sent successfully"
        End If

    End Sub

    '  '''''''''''''''''''''''''''''''''''' PAGE CLEAN UP '''''''''''''''''''''''''''''''''''''''''''''     
    '  ''''''''''''''''''''''''''''''''''''BIDS TABS''''''''''''''''''''''''''''''''''''''''''' 
    Protected Sub ActiveBidsViewProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("ActiveProject") = True

    End Sub
    Protected Sub WonBidsViewProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("WonProject") = True
    End Sub
    Protected Sub LostBidsViewProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("LostProject") = True
    End Sub

    Protected Sub NewBidLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("NewBid") = True
    End Sub
    Protected Sub NewBid()

        Me.SqlDataSource55.UpdateParameters("HighestBid").DefaultValue = NewAmountTextBox.Text.ToString
        Me.SqlDataSource55.UpdateParameters("HighestBidderID").DefaultValue = Session("ProfessionalID").ToString
        Me.SqlDataSource55.UpdateParameters("HighestBidUsername").DefaultValue = User.Identity.Name.ToString

        Me.SqlDataSource55.UpdateParameters("original_ProjectID").DefaultValue = Session("originalProjectID").ToString
        Me.SqlDataSource55.UpdateParameters("original_HighestBid").DefaultValue = Session("OriginalHighestBid").ToString
        Me.SqlDataSource55.UpdateParameters("original_HighestBidderID").DefaultValue = Session("OriginalHighestBidderID").ToString
        Me.SqlDataSource55.UpdateParameters("original_HighestBidUsername").DefaultValue = Session("OriginalHighestBidderUserName").ToString

        Dim test As String = Me.SqlDataSource55.UpdateCommand.ToString()

        Me.SqlDataSource55.Update()

        Dim todaydate As String = DateTime.UtcNow.ToShortDateString.ToString

        Dim ProjectLabel As Label

        ProjectLabel = CType(LostBidsGridView.SelectedRow.FindControl("ProjectLostIDLabel"), Label)

        Me.SqlDataSource156.InsertParameters("ProjectID").DefaultValue = ProjectLabel.Text.ToString
        Me.SqlDataSource156.InsertParameters("BidderID").DefaultValue = Session("ProfessionalID").ToString
        Me.SqlDataSource156.InsertParameters("BidderUserName").DefaultValue = User.Identity.Name.ToString
        Me.SqlDataSource156.InsertParameters("BidDate").DefaultValue = DateTime.UtcNow.ToShortDateString.ToString
        Me.SqlDataSource156.InsertParameters("AmountOffered").DefaultValue = Me.NewAmountTextBox.Text.ToString
        Me.SqlDataSource156.InsertParameters("CurrencyID").DefaultValue = Me.CurrencyDropDownList.SelectedItem.Value.ToString
        Me.SqlDataSource156.InsertParameters("BidderRole").DefaultValue = "CUS"
        ''replace this by the following line if the user is authenticated 
        'If User.IsInRole("Professional") Then
        '    Me.SqlDataSource156.InsertParameters("BidderRole").DefaultValue = "CUS"
        'ElseIf User.IsInRole("Professional") Then
        '    Me.SqlDataSource156.InsertParameters("BidderRole").DefaultValue = "PRO"
        'End If

        '  Dim debugtest As String = ProjectLabel.text.ToString + " ," + Session("ProfessionalID").ToString + "," + User.Identity.Name.ToString + "," + DateTime.UtcNow.ToShortDateString.ToString + "," + Me.NewAmountTextBox.Text.ToString + "," + Me.CurrencyDropDownList.SelectedItem.Value.ToString + "," + "CUS"

        Me.SqlDataSource156.Insert()

        Me.ActiveBidsGridView.DataBind()
        Me.WonBidsGridView.DataBind()
        Me.LostBidsGridView.DataBind()
        ''Professional or Professional Bid
        ''replace the session with the appropriate one

        '        ALTER PROCEDURE PlaceBid 
        '@ProjectID int,
        '@BidderID int,
        '@BidderUserName nvarchar(256),
        '@Date datetime,
        '@AmountOffered float,
        '@CurrencyID int

        ''Create a connection
        'Dim ProfileConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("SideJobConnectionString").ConnectionString)
        'ProfileConnection.Open()

        ''Start the transaction    
        'Dim ProfileTransaction As SqlTransaction = ProfileConnection.BeginTransaction()

        'Try
        '    Dim ProfileCommand As New SqlCommand("DeleteProject", ProfileConnection, ProfileTransaction)
        '    ProfileCommand.CommandType = CommandType.StoredProcedure


        '    Dim ProjectID As New SqlParameter("@ProjectID", SqlDbType.Int)

        '    ProjectID.Value = Session("ProjectID").ToString

        '    ProfileCommand.Parameters.Add(ProjectID)

        '    ''CHANGE THIS TO Professional ID IN THE ProfessionalPOSTING THE PROJECT

        '    Dim PosterID As New SqlParameter("@PosterID", SqlDbType.Int)

        '    PosterID.Value = Session("ProID").ToString

        '    ProfileCommand.Parameters.Add(PosterID)

        '    Dim PosterRole As New SqlParameter("@PosterRole", SqlDbType.Char, 3)

        '    PosterRole.Value = "PRO"

        '    ProfileCommand.Parameters.Add(PosterRole)

        '    '    Call the store procedure
        '    Dim reader As SqlDataReader = ProfileCommand.ExecuteReader()

        '    reader.Close()

        '    'Now you can grab the output parameter's value...

        '    '    If we reach here, all command succeeded, so commit the transaction
        '    ProfileTransaction.Commit()

        '    'Me.CreateUserWizard1.ContinueDestinationPageUrl = "~/Authoniticated/Professional/ProfessionalProfile.aspx"
        'Catch ex As Exception
        '    '    Something went wrong, so rollback the transaction
        '    '    ProfileTransaction.Rollback()

        '    Throw        'Bubble up the exception
        '    ''maybe over here 
        '    Response.Redirect(Request.Url.ToString)

        'Finally

        '    ProfileConnection.Close() 'Finally, close the connection
        'End Try
        Me.BidModalPopupExtender.Hide()

        ''Insert the bid to the Professional or professional

        ''Update the numberofbids for the project

        '        HighestBid] = @HighestBid,
        ' [HighestBidderID] = @HighestBidderID, 
        '[HighestBidUsername] = @HighestBidUsername 
        DeleteLostBid(LostBidsGridView.SelectedPersistedDataKey.Value.ToString)

        Session("NewBid") = False
    End Sub

    Protected Sub WonBidsRemoveProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("RemoveBidWon") = True
    End Sub
    Protected Sub LostBids_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs)
        Dim test As String = e.Keys.Item(0).ToString
        DeleteLostBid(e.Keys.Item(0).ToString())
    End Sub
    Protected Sub DeleteLostBid(ByVal BidId As String)
        Me.SqlDataSource399.DeleteParameters(0).DefaultValue = BidId.ToString
        Me.SqlDataSource399.DeleteParameters(1).DefaultValue = Session("ProfessionalID").ToString
        Me.SqlDataSource399.DeleteParameters(2).DefaultValue = "CUS"
        Me.SqlDataSource399.Delete()
        Me.LostBidsGridView.DataBind()
    End Sub
    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ActiveBidsGridView.SelectedIndexChanged
        If Session("ActiveProject") = True Then
            Me.MoreProjectView()
        End If
    End Sub
    Protected Sub WonBidsGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles WonBidsGridView.SelectedIndexChanged
        If Session("WonProject") = True Then
            Me.MoreProjectView()
        End If

        If Session("RemoveBidWon") = True Then

            Me.SqlDataSource299.DeleteParameters(0).DefaultValue = Me.WonBidsGridView.SelectedPersistedDataKey.Value.ToString
            Me.SqlDataSource299.Delete()
            Session("RemoveBidWon") = False

        End If
    End Sub
    Protected Sub LostBids_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles LostBidsGridView.SelectedIndexChanged
        If Session("LostProject") = True Then
            Me.MoreProjectView()
        End If
        If Session("NewBid") = True Then
            Me.PlaceNewBid()

        End If

    End Sub
    Protected Sub PlaceNewBid()

        ''GET THE ProjectID

        Dim ProjectLabel As Label

        ProjectLabel = CType(LostBidsGridView.SelectedRow.FindControl("ProjectLostIDLabel"), Label)
        'ProjectLostIDLabel
        Session("NewBid") = False

        Me.SqlDataSource55.SelectParameters.Item(0).DefaultValue = ProjectLabel.Text.ToString
        Me.SqlDataSource55.DataBind()

        Dim dv As DataView = _
  CType(SqlDataSource55.Select(DataSourceSelectArguments.Empty), DataView)

        Dim StatusLabel As String = dv.Table.Rows(0).Item(4).ToString

        ' Dim StatusLabel As Label = CType(LostBids.SelectedRow.FindControl("Label4"), Label)

        If StatusLabel.ToString = "OPEN" Then

            Me.ProjectCurrentStatusGridView.DataBind()

            ''Bind the Primary Photo

            ''ProjectImage
            ' Dim test As String = MessageGridView.SelectedRow.FindControl("ProjectImage").ToString

            ''Label3
            Dim timeleftlabel As String = dv.Table.Rows(0).Item(5).ToString

            Dim formatedstring As String
            'formatedstring = timeleftlabel.Text.ToString

            Dim TestArray() As String = Split(timeleftlabel.ToString)

            formatedstring = TestArray(0) + "   Days  " + TestArray(2) + " Hours  " + TestArray(4) + " Mins"

            ' Me.Label20.Text = timeleftlabel.Text
            Me.CurrentTimeLeftValue.Text = formatedstring.ToString
            Me.CurrentTimeLeftValue.DataBind()

            ''TRY TO PREVENT THE LAST MINUTE CHANGE
            Dim Days As Integer = Convert.ToInt32(TestArray(0).ToString)
            Dim Hours As Integer = Convert.ToInt32(TestArray(2).ToString)
            Dim Minutes As Integer = Convert.ToInt32(TestArray(4).ToString)

            If Days = 0 And Hours = 0 Then
                If Minutes = 0 Then
                    ''DON'T BID
                    ''DISPLAY MESSAGE TIME UP
                    TimeUP()


                    'SqlDataSource1.DataBind()
                    'GridView1.DataBind()

                    Response.Write("Time is UP")
                End If
                If Minutes < 5 And Minutes > 0 Then
                    ''MAKE THE LABEL RED AND BIG
                    CurrentTimeLeftValue.ForeColor = Drawing.Color.Red
                    ''CHECK THIS LINE
                    CurrentTimeLeftValue.Font.Size = "LARGER"
                End If
            End If


            ''11529 Days<br/> 1 Hours<br/> 15 Mins

            ' Returns an array containing 
            ''reimplemt this to emphasis the important time left
            '   Dim TestArray() As String = Split(timeleftlabel.Text.ToString)


            Me.SqlDataSource8.SelectParameters(0).DefaultValue = ProjectLabel.Text.ToString
            Me.SqlDataSource8.DataBind()

            Dim dv1 As DataView = _
      CType(SqlDataSource8.Select(DataSourceSelectArguments.Empty), DataView)

            'Dim Image As Image = CType(GridView1.SelectedRow.FindControl("ProjectImage"), Image)
            ProjectImage.ImageUrl = dv1.Table.Rows(0).Item(1).ToString
            ProjectImage.DataBind()

            Me.BidUpdatePanel.Update()
            Me.BidModalPopupExtender.Show()
        Else

            Me.ClosedProjectModalPopupExtender.Show()

        End If

    End Sub

    Protected Sub BidCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
        args.IsValid = False
        Try

            Dim newvalue As Decimal = Convert.ToDecimal(Me.NewAmountTextBox.Text.ToString)
            'Programmatically access the SqlDataSource - get back a DataView
            Dim dv As DataView = _
               CType(SqlDataSource55.Select(DataSourceSelectArguments.Empty), DataView)

            Session("originalProjectID") = dv.Table.Rows(0).Item(0).ToString
            Session("OriginalHighestBid") = dv.Table.Rows(0).Item(1).ToString
            Session("OriginalHighestBidderID") = dv.Table.Rows(0).Item(2).ToString
            Session("OriginalHighestBidderUserName") = dv.Table.Rows(0).Item(3).ToString

            Dim oldvalues As Decimal = Convert.ToDecimal(dv.Table.Rows(0).Item(1).ToString)

            ''implemtn the eroor message

            Me.BidCustomValidator.ErrorMessage = "Your bid have to be greater than " + dv.Table.Rows(0).Item(1).ToString

            args.IsValid = newvalue > oldvalues

        Catch ex As Exception
            args.IsValid = False
        End Try

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

    '  ''''''''''''''''''''''''''''''''''''BIDS TABS''''''''''''''''''''''''''''''''''''''''''' 

    '  '''''''''''''''''''''''''''''''''''''TRANSACTION TABS'''''''''''''''''''''''''''''''''''''''

    '  Protected Sub ActiveTransactionDetailLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '      Session("TransactionDetail") = True
    '  End Sub
    '  Protected Sub ActiveTransactionPayNowLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '      Session("PaymentMethod") = True
    '  End Sub
    '  Protected Sub ActiveTransactionGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ActiveTransactionGridView.SelectedIndexChanged
    '      If Session("PaymentMethod") = True Then
    '          Me.MethodofPaymentModalPopupExtender.Show()
    '          Session("PaymentMethod") = False
    '      End If
    '      If Session("TransactionDetail") = True Then
    '          Me.SqlDataSource46846.SelectParameters(0).DefaultValue = Me.ActiveTransactionGridView.SelectedPersistedDataKey.Value.ToString
    '          Me.SqlDataSource46846.DataBind()
    '          Me.DetailTransactionDetailView.DataBind()

    '          DetailTransactionUpdatePanel.Update()
    '          Me.DetailTransactionModalPopupExtender.Show()
    '          Session("TransactionDetail") = False
    '      End If
    '  End Sub
    '  Protected Sub TransactionHistoryGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TransactionHistoryGridView.SelectedIndexChanged
    '  End Sub

    Protected Sub CancelPayment_Click()

    End Sub

    '  Protected Sub CancelPayment_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '      MethodofPaymentModalPopupExtender.Hide()
    '  End Sub
    '  Protected Sub ViewandPrintLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    '      'Page.ClientScript.RegisterClientScriptBlock(Me.GetType, "alert", "<script>alert('" & GlobalContractGridView.SelectedIndex & "');</script>")

    '      '        Dim csname111 As String = "ViewContractScript"

    '      '        Dim cstype111 As Type = Me.GetType()

    '      '        ' Get a ClientScriptManager reference from the Page class.
    '      '        Dim cs As ClientScriptManager = Page.ClientScript

    '      '        ' Check to see if the startup script is already registered.
    '      '        If (Not cs.IsStartupScriptRegistered(cstype111, csname111)) Then

    '      '            Session("ContractID") = Me.GlobalContractGridView.SelectedDataKey.Value.ToString

    '      '            Dim ContractScript As String = _
    '      '"var width  = 500; var height = 300; var left   = (screen.width  - width)/2; var top    = (screen.height - height)/2; var params = 'width='+width+', height='+height; params += ', top='+top+', left='+left;" + _
    '      '"params += ', directories=no';params += ', location=no';params += ', menubar=no';params += ', copyhistory=no';params += ', resizable=no';params += ', scrollbars=no';params += ', status=no';params += ', toolbar=no';" + _
    '      '"newwin=window.open('http://localhost:2058/SIDEJOB/Authenticated/ViewContract.aspx','windowname5', params);if (window.focus) {newwin.focus()}return false;"
    '      '        End If

    '  End Sub
    '  ''''''''''''''''''''''''''''''''''''TRANSACTION TABS'''''''''''''''''''''''''''''''''''''''

    '  ''''''''''''''''''''''''''''''''''''CONTRACT TABS'''''''''''''''''''''''''''''''''''''''''''
    '  Protected Sub GlobalContractGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GlobalContractGridView.SelectedIndexChanged

    '      ' Page.ClientScript.RegisterClientScriptBlock(Me.GetType, "alert", "<script>alert('" & GlobalContractGridView.SelectedIndex & "');</script>")
    '      '  Response.Clear()
    '      '  Me.OkButton_Click1(sender, e)
    '      ' Response.Write("<script>window.open" & _
    '      '"('http://www.yahoo.com','_new', 'width=400,height=200');</script>")

    '      'Dim csname111 As String = "ViewContractScript"

    '      'Dim cstype111 As Type = Me.GetType()

    '      '' Get a ClientScriptManager reference from the Page class.
    '      'Dim cs As ClientScriptManager = Page.ClientScript

    '      '' Check to see if the startup script is already registered.
    '      'If (Not cs.IsStartupScriptRegistered(cstype111, csname111)) Then

    '      Session("ContractID") = Me.GlobalContractGridView.SelectedDataKey.Value.ToString

    '      '    '            Dim ContractScript As String = _
    '      '    '"var width  = 500; var height = 300; var left   = (screen.width  - width)/2; var top    = (screen.height - height)/2; var params = 'width='+width+', height='+height; params += ', top='+top+', left='+left;" + _
    '      '    '"params += ', directories=no';params += ', location=no';params += ', menubar=no';params += ', copyhistory=no';params += ', resizable=no';params += ', scrollbars=no';params += ', status=no';params += ', toolbar=no';" + _
    '      '    '"newwin=window.open('http://localhost:2058/SIDEJOB/Authenticated/ViewContract.aspx','windowname5', params);if (window.focus) {newwin.focus()}return false;"

    '      '    Dim ContractScript As String = "alert('Hello');"

    '      '    'http://localhost:2058/SIDEJOB/Authenticated/ViewContract.aspx
    '      '    '../ViewContract.aspx

    '      '    cs.RegisterStartupScript(cstype111, csname111, ContractScript, True)
    '      '    'Response.Write("hello")
    '      'End If

    '  End Sub
    '  Protected Sub OkButton_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
    '      Page.ClientScript.RegisterClientScriptBlock(Me.GetType, "alert", "<script>alert('" & GlobalContractGridView.SelectedIndex & "');</script>")
    '  End Sub
    '  Protected Sub DetailsLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '  End Sub

    '  '''''''''''''''''''''''''''''''''''''CONTRACT TABS''''''''''''''''''''''''''''''''''''''''''' 
    '  '''''''''''''''''''''''''''''''''''' PAGE CLEAN UP '''''''''''''''''''''''''''''''''''''''''''''
    '  '******************************************************************************************************
    '  '''''''''''''''''''''''''''''SKILLS AND WORKSHOPPHOTOSHOP''''''''''''''''''''''''''''''''''''''

    '  'Protected Sub ProfessionalWorkImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    '  'End Sub
    '  'Protected Sub LinkButton5_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    '  'End Sub
    '  Protected Sub CancelSkillButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelSkillButton.Click
    '      Me.ModalPopupExtender3.Hide()
    '      Session("NEWSKILLS") = False

    '  End Sub



    '  Protected Sub LinkButton4_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '      ''ADD THE NEW SKILLS

    '      'GET THE NUMBER OF SKILLS
    '      Dim numberofskills As Integer = 0
    '      numberofskills = DataList2.Items.Count

    '      If numberofskills >= 5 Then



    '          Me.ModalPopupExtender14.Show()
    '          Me.UpdatePanel9.Update()





    '          '' Define the name and type of the client scripts on the page.
    '          'Dim csname5 As String = "SkillScript"

    '          'Dim cstype2 As Type = Me.GetType()

    '          '' Get a ClientScriptManager reference from the Page class.
    '          'Dim cs As ClientScriptManager = Page.ClientScript

    '          '' Check to see if the startup script is already registered.
    '          'If (Not cs.IsStartupScriptRegistered(cstype2, csname5)) Then

    '          '    Dim SkillError As String = "alert('You are allowed 5 skills');"
    '          '    cs.RegisterStartupScript(cstype2, csname5, SkillError, True)

    '          'End If





    '          '  UpdatePanel7.Update()

    '          'Dim clientScriptManager As ClientScriptManager = Page.ClientScript
    '          'Dim sb As StringBuilder = New StringBuilder()

    '          'sb.Append("<script language='javascript'>")
    '          'sb.Append("alert('hello');")
    '          'sb.Append("<")
    '          'sb.Append("/script>")

    '          'If (Not clientScriptManager.IsClientScriptBlockRegistered("ColorScript")) Then
    '          '    clientScriptManager.RegisterClientScriptBlock(Me.GetType(), "ColorScript", sb.ToString())
    '          'End If





    '      Else
    '          Me.IndustryDropDownList.SelectedIndex = 0

    '          ''DEFAULT SKILLID = 1

    '          Me.SqlDataSource4.SelectParameters(0).DefaultValue = "1"

    '          Me.SqlDataSource4.DataBind()

    '          Me.ModalPopupExtender3.Show()
    '          Session("NEWSKILLS") = True



    '      End If

    '  End Sub

    '  Protected Sub SaveSkillButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SaveSkillButton.Click
    '      ''SAVE THE SKILLS 
    '      Dim LanguageID As Integer
    '      Dim Language As String

    '      Language = Session("Language")

    '      If Language Is Nothing Or Language = "" Then
    '          LanguageID = 1
    '      Else
    '          LanguageID = CInt(Language)

    '      End If





    '      ''Industry
    '      Dim SelectedCategory As String = (Me.IndustryDropDownList.SelectedIndex + 1).ToString


    '      ''Speciality
    '      Dim SelectedJobID As String = "-1"

    '      '' The first list box
    '      If Me.SpecialtyListBox1.SelectedIndex <> -1 Then
    '          SelectedJobID = SpecialtyListBox1.SelectedValue.ToString

    '      Else
    '          If Me.SpecialtyListBox2.SelectedIndex <> -1 Then
    '              SelectedJobID = SpecialtyListBox2.SelectedValue.ToString

    '          Else
    '              If Me.SpecialtyListBox3.SelectedIndex <> -1 Then
    '                  SelectedJobID = SpecialtyListBox3.SelectedValue.ToString

    '              End If
    '          End If


    '      End If

    '      If SelectedJobID = "-1" Then
    '          SelectedJobID = SpecialtyListBox1.Items(0).Value.ToString

    '      End If


    '      ''experience

    '      Dim list As DropDownList = CType(Me.DataList3.Items(0).FindControl("ExperienceDropDownList"), DropDownList)

    '      Dim SelectedExperience As String = list.SelectedIndex.ToString

    '      list = Nothing


    '      ''crew number
    '      list = CType(Me.DataList3.Items(0).FindControl("CrewNumberDropDownList"), DropDownList)

    '      Dim SelectedCrewNumber As String = list.SelectedIndex.ToString

    '      list = Nothing



    '      ''Licensed
    '      list = CType(Me.DataList3.Items(0).FindControl("LicensedDropDownList"), DropDownList)

    '      Dim SelectedLicensed As String = list.SelectedIndex.ToString

    '      list = Nothing


    '      ''Insured

    '      list = CType(Me.DataList3.Items(0).FindControl("InsuredDropDownList"), DropDownList)

    '      Dim SelectedInsured As String = list.SelectedIndex.ToString

    '      list = Nothing


    '      ''Relocation

    '      list = CType(Me.DataList3.Items(0).FindControl("RelocationDropDownList"), DropDownList)

    '      Dim SelectedRelocation As String = list.SelectedIndex.ToString

    '      list = Nothing




    '      If Session("NEWSKILLS") = False Then
    '          ''UPDATE


    '          ''DEPENDING ON THE LANGUAGES CHECK FROM THE TABLES

    '          ''Update all the pages where the use of LCID is used


    '          ''SkillID
    '          Dim SelectedSkillID As String = DataList2.SelectedValue.ToString

    '          Dim UpdateStatement As String

    '          UpdateStatement = " EXECUTE [SIDEJOBS].[dbo].[UpdateSkill] " + SelectedSkillID.ToString + ", "
    '          UpdateStatement += SelectedCategory.ToString + ", " + SelectedJobID.ToString + ", "
    '          UpdateStatement += SelectedExperience.ToString + ", " + SelectedCrewNumber.ToString + ", "
    '          UpdateStatement += SelectedLicensed.ToString + ", " + SelectedInsured.ToString + ", "
    '          UpdateStatement += SelectedRelocation.ToString + ", " + LanguageID.ToString


    '          SqlDataSource4.UpdateCommandType = SqlDataSourceCommandType.Text
    '          SqlDataSource4.UpdateCommand = UpdateStatement.ToString
    '          SqlDataSource4.Update()

    '          DataList2.DataBind()
    '          Me.UpdatePanel7.Update()


    '          Me.ModalPopupExtender3.Hide()











    '      Else

    '          ''ADD NEW SKILL



    '          Dim UpdateStatement As String
    '          UpdateStatement = " EXECUTE [SIDEJOBS].[dbo].[AddSKILL] " + Session("ProID").ToString + ", "
    '          UpdateStatement += SelectedCategory.ToString + ", " + SelectedJobID.ToString + ", "
    '          UpdateStatement += SelectedExperience.ToString + ", " + SelectedCrewNumber.ToString + ", "
    '          UpdateStatement += SelectedLicensed.ToString + ", " + SelectedInsured.ToString + ", "
    '          UpdateStatement += SelectedRelocation.ToString + ", " + LanguageID.ToString


    '          SqlDataSource4.UpdateCommandType = SqlDataSourceCommandType.Text
    '          SqlDataSource4.UpdateCommand = UpdateStatement.ToString
    '          SqlDataSource4.Update()

    '          DataList2.DataBind()

    '          Me.ModalPopupExtender3.Hide()



    '      End If





    '  End Sub




    '  Protected Sub DeleteSkillButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteSkillButton.Click
    '      Dim DeleteStatement As String
    '      DeleteStatement = "EXECUTE [SIDEJOBS].[dbo].[DeleteSKill] " + Session("ProID").ToString + ", " + DataList2.SelectedValue.ToString

    '      SqlDataSource4.DeleteCommandType = SqlDataSourceCommandType.Text
    '      SqlDataSource4.DeleteCommand = DeleteStatement.ToString
    '      SqlDataSource4.Delete()


    '      DataList2.DataBind()
    '      Me.ModalPopupExtender3.Hide()

    '  End Sub

    '  Protected Sub SkillHideButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SkillHideButton.Click
    '      Me.ModalPopupExtender14.Hide()
    '      Me.UpdatePanel9.Update()


    '  End Sub

    ''''''''''''''''''''''''''''SKILLS AND WORKSHOPPHOTOSHOP''''''''''''''''''''''''''''''''''''''



































































































    ''''''''''''''''''''''''''''''''''''PAGE EVENTS '''''''''''''''''''''''''''''''''''''''''''''

    'Protected Sub ActivateLanguage()
    '    Select Case Thread.CurrentThread.CurrentUICulture.TwoLetterISOLanguageName.ToString
    '        Case "en"
    '            ''English
    '            _language = 1

    '        Case "fr"
    '            '"French
    '            _language = 2
    '    End Select
    'End Sub

    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    '    If Not Page.IsPostBack Then
    '        Dim user As MembershipUser = Membership.GetUser
    '        Dim role As String = Me.User.IsInRole("Professional").ToString

    '        If user Is Nothing Then
    '            Response.Redirect("~/NotAuthenticated/SignIn.aspx")
    '        ElseIf role = True Then
    '            GetInformation()
    '            TimeUP()
    '            Calendar1.SelectedDates.Add(DateTime.UtcNow)
    '            InitiateComment()
    '            ActivateLanguage()
    '            BindQuestions()
    '        End If

    '    End If

    'End Sub

    'Sub GetInformation()

    '    Dim guidStringUser As Guid = New Guid(Membership.GetUser.ProviderUserKey().ToString())
    '    Dim GetProfessionalIDAdapter As New GetUserIDTableAdapters.LookUpProRolesTableAdapter
    '    Dim ProfessionalIDTable As New GetUserID.LookUpProRolesDataTable
    '    GetProfessionalIDAdapter.FillProfessionalID(ProfessionalIDTable, guidStringUser.ToString())
    '    Session("ProfessionalID") = ProfessionalIDTable.Item(0).ProfessionalId.ToString

    'End Sub

    Protected Sub TimeUP()
        Dim ScheduleAdapter As New ScheduleTaskDataSetTableAdapters.TimeUPProcedure
        ScheduleAdapter.TimeUP()
    End Sub

    'Protected Overrides Function SaveControlState() As Object
    '    Dim ControlState(2) As Object
    '    ControlState(1) = MyBase.SaveControlState()
    '    ControlState(2) = _language
    '    Return ControlState
    'End Function

    'Protected Overrides Sub LoadControlState(ByVal savedState As Object)
    '    Dim ControlState() As Object = CType(savedState, Object)
    '    MyBase.LoadControlState(ControlState(1))
    '    _language = CInt(ControlState(2))
    'End Sub

    'Protected Overrides Sub OnInit(ByVal e As System.EventArgs)
    '    MyBase.OnInit(e)
    '    Page.RequiresControlState(Me)
    'End Sub

    '''''''''''''''''''''''''''''''''''''PAGE EVENTS '''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''TRANSFORMATION DONE''''''''''''''''''''''''''''''''
    ' ''EVENT TAB DONE: CHECK WITH THE DESIGN WHEN FINISHING
    ' ''PROFILE TAB DONE: CHECK WITH THE DESIGN WHEN FINISHING
    ' ''PORTFOLIO TAB DONE: CHECK WITH THE DESIGN WHEN FINISHING
    ' ''MESSAGE TAB DONE: CHECK WITH THE DESIGN WHEN FINISHING
    ' ''PROJECT TAB DONE: CHECK WITH THE DESIGN WHEN FINISHING
    ' ''FAVORITE TAB DONE: CHECK WITH THE DESIGN WHEN FINISHING
    ' ''Invitation TAB DONE: CHECK WITH THE DESIGN WHEN FINISHING
    ' ''WatchList TAB DONE: CHECK WITH THE DESIGN WHEN FINISHING
    ' ''Comment TAB DONE: CHECK WITH THE DESIGN WHEN FINISHING
    ' ''Account TAB DONE: CHECK WITH THE DESIGN WHEN FINISHING
    '''''''''''''''''''''''''''''''''''''PROFILE TABS''''''''''''''''''''''''''''''''''''''''''' 

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

    '''''''''''''''''''''''''''''''''''''PROFILE TABS''''''''''''''''''''''''''''''''''''''''''' 

    '''''''''''''''''''''''''''''''''''''PORTFOLIO TABS'''''''''''''''''''''''''''''''''''''''''    

    'Protected Sub UpdatePortfolioLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdatePortfolioLinkButton.Click

    '    ''Changes are subject to Approval by Administration
    '    Dim AboutTextBox As TextBox = CType(PortfolioDataList.Items(0).FindControl("AboutTextBox"), TextBox)
    '    Dim SpecialNotes As TextBox = CType(PortfolioDataList.Items(0).FindControl("SpecialNotesTextBox"), TextBox)
    '    Dim ProfessionalPortfolioUpdate As New ProfessionalPortfolioDataSetTableAdapters.UpdateProfessionalPortfolioQuery

    '    ProfessionalPortfolioUpdate.UpdateProfessionalPortfolio(AboutTextBox.Text.ToString, SpecialNotes.Text.ToString, Session("ProfessionalID").ToString)
    '    PortfolioDataList.DataBind()
    '    Me.DelayModalPopUpExtender.Hide()

    'End Sub

    'Protected Sub CancelPortfolioLinkButton_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelPortfolioLinkButton.Click
    '    PortfolioDataList.DataBind()
    '    Me.DelayModalPopUpExtender.Hide()
    'End Sub

    '''''''''''''''''''''''''''''''''''''PORTFOLIO TABS'''''''''''''''''''''''''''''''''''''''''

    '''''''''''''''''''''''''''''''''''''MESSAGE TABS''''''''''''''''''''''''''''''''''''''''''' 

    'Protected Sub ReplyEmailLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ReplyEmailLinkButton.Click

    '    Dim ReplyAdapter As New ProfessionalReplyMessageTableAdapters.ReplyProfessionalTableAdapter
    '    ReplyAdapter.ReplyProfessionalMessage(Convert.ToInt32(MessageGridView.SelectedPersistedDataKey.Value.ToString), Convert.ToInt32(Session("ProfessionalID").ToString), Convert.ToInt32(Session("messagemode").ToString), ReplyMessageTextBox.Text.ToString)

    '    MessageGridView.DataBind()
    '    MessageGridView.SelectedIndex = -1
    '    MessageGridView.PageIndex = 0

    '    LowerMessageUpdatePanel.Update()
    '    SaveLinkButton.Visible = False
    '    ReplyLinkButton.Visible = False

    '    DelayModalPopUpExtender.Hide()

    'End Sub

    'Protected Sub CancelReplyEmailLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelReplyEmailLinkButton.Click
    '    DelayModalPopUpExtender.Hide()
    'End Sub

    'Protected Sub ReplyLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ReplyLinkButton.Click
    '    ReplyMessageModalPopupExtender.Show()
    'End Sub

    'Protected Sub SaveLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SaveLinkButton.Click

    '    ProfessionalMessageObjectDataSource.InsertMethod = "SaveProfessionalMessage"
    '    ProfessionalMessageObjectDataSource.InsertParameters(0).DefaultValue = MessageGridView.SelectedPersistedDataKey.Value.ToString
    '    ProfessionalMessageObjectDataSource.InsertParameters(1).DefaultValue = Convert.ToInt32(Session("messagemode").ToString)
    '    ProfessionalMessageObjectDataSource.Insert()

    '    MessageGridView.DataBind()
    '    MessageGridView.SelectedIndex = -1
    '    MessageGridView.PageIndex = 0

    '    LowerMessageUpdatePanel.Update()
    '    SaveLinkButton.Visible = False
    '    ReplyLinkButton.Visible = False

    '    DelayModalPopUpExtender.Hide()

    'End Sub

    'Protected Sub DeleteButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteButton.Click

    '    Dim atLeastOneRowDeleted As Boolean = False
    '    Dim numberofmessages As Integer = 0

    '    For Each row As GridViewRow In MessageGridView.Rows

    '        Dim cb As CheckBox = row.FindControl("MessageSelectorCheckBox")

    '        If cb IsNot Nothing AndAlso cb.Checked Then
    '            atLeastOneRowDeleted = True

    '            Dim MessageID As Integer = _
    '            Convert.ToInt32(MessageGridView.DataKeys(row.RowIndex).Value)

    '            Select Case Convert.ToInt32(Session("messagemode").ToString)
    '                Case 0
    '                    ProfessionalMessageObjectDataSource.DeleteMethod = "DeleteProfessionalMessageInbox"
    '                    ProfessionalMessageObjectDataSource.DeleteParameters(0).DefaultValue = MessageID.ToString()
    '                    ProfessionalMessageObjectDataSource.Delete()
    '                    ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageInbox"
    '                Case 1
    '                    ProfessionalMessageObjectDataSource.DeleteMethod = "DeleteProfessionalMessageOutbox"
    '                    ProfessionalMessageObjectDataSource.DeleteParameters(0).DefaultValue = MessageID.ToString()
    '                    ProfessionalMessageObjectDataSource.Delete()
    '                    ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageOutbox"
    '                Case 2
    '                    ProfessionalMessageObjectDataSource.DeleteMethod = "DeleteProfessionalMessageSaved"
    '                    ProfessionalMessageObjectDataSource.DeleteParameters(0).DefaultValue = MessageID.ToString()
    '                    ProfessionalMessageObjectDataSource.Delete()
    '                    ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageSaved"
    '            End Select

    '        End If

    '    Next

    '    MessageGridView.DataBind()
    '    MessageGridView.SelectedIndex = -1
    '    UpperMessageUpdatePanel.Update()

    '    If atLeastOneRowDeleted = False Then
    '        Me.MessageDeletionModalPopupExtender.Show()
    '    End If

    'End Sub

    'Protected Sub DecreaseNewInbox()

    '    If Convert.ToInt32(Session("messagemode").ToString) = 0 Then
    '        NewInbox = NewInbox - 1
    '        If NewInbox > 0 Then
    '            InboxLinkButton.Text = NumberofInboxLinkButton.Text.ToString() + "(" + NewInbox.ToString + ") "
    '        Else
    '            InboxLinkButton.Text = NumberofInboxLinkButton.Text.ToString()
    '        End If
    '    End If
    '    LowerMessageUpdatePanel.Update()

    'End Sub

    'Private Sub MessageToggleCheckState(ByVal checkState As Boolean)

    '    For Each row As GridViewRow In MessageGridView.Rows
    '        Dim cb As CheckBox = row.FindControl("MessageSelectorCheckBox")
    '        If cb IsNot Nothing Then
    '            cb.Checked = checkState
    '        End If
    '    Next

    'End Sub

    'Protected Sub MessageDeletionCloseButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles MessageDeletionCloseButton.Click

    '    Me.MessageDeletionModalPopupExtender.Hide()
    '    Me.UpperMessageUpdatePanel.Update()

    'End Sub

    'Protected Sub SelectAllButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SelectAllButton.Click

    '    MessageToggleCheckState(True)
    '    UpperMessageUpdatePanel.Update()

    'End Sub

    'Protected Sub DeselectAllButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeselectAllButton.Click

    '    MessageToggleCheckState(False)
    '    UpperMessageUpdatePanel.Update()

    'End Sub

    'Protected Sub MessageGridView_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles MessageGridView.PreRender

    '    If Session("messagemode") Is Nothing Then
    '        Session("messagemode") = 0
    '    End If

    '    If Convert.ToInt32(Session("messagemode").ToString) = 0 Then
    '        Dim ProfessionalInboxAdapter As New NewProfessionalInboxDataSetTableAdapters.QueriesTableAdapter
    '        Dim NewInboxValue As String = ProfessionalInboxAdapter.GetProfessionalNewInbox(Session("ProfessionalID").ToString).ToString

    '        If NewInboxValue = "0" Then
    '            InboxLinkButton.Text = NumberofInboxLinkButton.Text.ToString()
    '        Else
    '            InboxLinkButton.Text = NumberofInboxLinkButton.Text.ToString() + "(" + NewInboxValue.ToString() + ") "
    '        End If
    '    End If
    '    LowerMessageUpdatePanel.Update()

    'End Sub

    'Protected Sub MessageGridView_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles MessageGridView.RowCommand

    '    Select Case e.CommandName
    '        Case Is = "Delete"

    '            Select Case Convert.ToInt32(Session("messagemode").ToString)
    '                Case 0
    '                    ProfessionalMessageObjectDataSource.DeleteMethod = "DeleteProfessionalMessageInbox"
    '                    ProfessionalMessageObjectDataSource.DeleteParameters(0).DefaultValue = e.CommandArgument.ToString()
    '                    ProfessionalMessageObjectDataSource.Delete()
    '                    ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageInbox"
    '                Case 1
    '                    ProfessionalMessageObjectDataSource.DeleteMethod = "DeleteProfessionalMessageOutbox"
    '                    ProfessionalMessageObjectDataSource.DeleteParameters(0).DefaultValue = e.CommandArgument.ToString()
    '                    ProfessionalMessageObjectDataSource.Delete()
    '                    ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageOutbox"
    '                Case 2
    '                    ProfessionalMessageObjectDataSource.DeleteMethod = "DeleteProfessionalMessageSaved"
    '                    ProfessionalMessageObjectDataSource.DeleteParameters(0).DefaultValue = e.CommandArgument.ToString()
    '                    ProfessionalMessageObjectDataSource.Delete()
    '                    ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageSaved"
    '            End Select

    '            Me.MessageGridView.SelectedIndex = -1
    '            Me.LowerMessageUpdatePanel.Update()

    '    End Select

    'End Sub

    'Protected Sub MessageGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles MessageGridView.SelectedIndexChanged

    '    SelectedMessageID = MessageGridView.SelectedValue
    '    UpdateViewedMessage()

    '    If Session("messagemode") Is Nothing Then
    '        Session("messagemode") = 0
    '    End If

    '    Select Case Convert.ToInt32(Session("messagemode").ToString)
    '        Case 0
    '            SaveLinkButton.Visible = True
    '            ReplyLinkButton.Visible = True
    '            ProfessionalMessageDetailObjectDataSource.SelectMethod = "GetProfessionalMessageInbox"
    '            ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageInbox"
    '            DetailsMessageView.DataBind()
    '            LowerMessageUpdatePanel.Update()
    '        Case 1
    '            SaveLinkButton.Visible = True
    '            ReplyLinkButton.Visible = True
    '            ProfessionalMessageDetailObjectDataSource.SelectMethod = "GetProfessionalMessageOutbox"
    '            ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageOutbox"
    '            DetailsMessageView.DataBind()
    '            LowerMessageUpdatePanel.Update()

    '        Case 2
    '            SaveLinkButton.Visible = False
    '            ReplyLinkButton.Visible = False
    '            ProfessionalMessageDetailObjectDataSource.SelectMethod = "GetProfessionalMessageSaved"
    '            ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageSaved"
    '            DetailsMessageView.DataBind()
    '            LowerMessageUpdatePanel.Update()
    '    End Select

    'End Sub

    'Protected Sub MessageGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles MessageGridView.RowDataBound

    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        If e.Row.DataItem("Checked").ToString() Then
    '            e.Row.Font.Bold = True
    '            NewInbox += 1
    '        End If
    '        e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#6B696B'; this.style.color='white'")
    '        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#EFE7A7'; this.style.color='black'")
    '    End If

    'End Sub

    'Protected Sub MessageGridView_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles MessageGridView.PageIndexChanging

    '    Select Case Convert.ToInt32(Session("messagemode").ToString)
    '        Case 0
    '            ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageInbox"
    '        Case 1
    '            ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageOutbox"
    '        Case 2
    '            ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageSaved"
    '    End Select

    'End Sub

    'Protected Sub MessageGridView_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles MessageGridView.Sorting

    '    Select Case Convert.ToInt32(Session("messagemode").ToString)
    '        Case 0
    '            ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageInbox"
    '        Case 1
    '            ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageOutbox"
    '        Case 2
    '            ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageSaved"
    '    End Select

    'End Sub

    'Protected Sub InboxLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles InboxLinkButton.Click

    '    Session("messagemode") = 0
    '    ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageInbox"

    '    MessageGridView.DataBind()
    '    MessageGridView.SelectedIndex = -1
    '    MessageGridView.PageIndex = 0

    '    LowerMessageUpdatePanel.Update()
    '    SaveLinkButton.Visible = False
    '    ReplyLinkButton.Visible = False

    '    InboxLinkButton.BackColor = Drawing.Color.White
    '    OutboxLinkButton.BackColor = Drawing.Color.Transparent
    '    SavedLinkButton.BackColor = Drawing.Color.Transparent
    '    ProfileTabContainer.ActiveTabIndex = 3

    'End Sub

    'Protected Sub OutboxLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles OutboxLinkButton.Click

    '    Session("messagemode") = 1
    '    ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageOutbox"

    '    MessageGridView.DataBind()
    '    MessageGridView.SelectedIndex = -1
    '    MessageGridView.PageIndex = 0

    '    LowerMessageUpdatePanel.Update()
    '    SaveLinkButton.Visible = False
    '    ReplyLinkButton.Visible = False

    '    InboxLinkButton.BackColor = Drawing.Color.Transparent
    '    OutboxLinkButton.BackColor = Drawing.Color.White
    '    SavedLinkButton.BackColor = Drawing.Color.Transparent
    '    ProfileTabContainer.ActiveTabIndex = 3

    'End Sub

    'Protected Sub SavedLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SavedLinkButton.Click

    '    ProfessionalMessageObjectDataSource.SelectMethod = "GetProfessionalMessageSaved"

    '    MessageGridView.DataBind()
    '    MessageGridView.SelectedIndex = -1
    '    DetailsMessageView.DataBind()
    '    LowerMessageUpdatePanel.Update()

    '    SaveLinkButton.Visible = False
    '    ReplyLinkButton.Visible = False
    '    MessageGridView.PageIndex = 0

    '    Session("messagemode") = 2
    '    InboxLinkButton.BackColor = Drawing.Color.Transparent
    '    OutboxLinkButton.BackColor = Drawing.Color.Transparent
    '    SavedLinkButton.BackColor = Drawing.Color.White

    'End Sub

    'Protected Sub UpdateViewedMessage()

    '    Select Case Convert.ToInt32(Session("messagemode").ToString)
    '        Case 0
    '            ProfessionalMessageObjectDataSource.UpdateMethod = "UpdateProfessionalMessageInbox"
    '            ProfessionalMessageObjectDataSource.UpdateParameters(0).DefaultValue = SelectedMessageID
    '            ProfessionalMessageObjectDataSource.Update()
    '        Case 1
    '            ProfessionalMessageObjectDataSource.UpdateMethod = "UpdateProfessionalMessageOutbox"
    '            ProfessionalMessageObjectDataSource.UpdateParameters(0).DefaultValue = SelectedMessageID
    '            ProfessionalMessageObjectDataSource.Update()
    '        Case 2
    '            ProfessionalMessageObjectDataSource.UpdateMethod = "UpdateProfessionalMessageSaved"
    '            ProfessionalMessageObjectDataSource.UpdateParameters(0).DefaultValue = SelectedMessageID
    '            ProfessionalMessageObjectDataSource.Update()
    '    End Select

    'End Sub

    '''''''''''''''''''''''''''''''''''''MESSAGE TABS''''''''''''''''''''''''''''''''''''''''''' 

    '''''''''''''''''''''''''''''''''''''PROJECT TABS'''''''''''''''''''''''''''''''''''''''''    

    'Protected Sub AddNewProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddNewProjectLinkButton.Click
    '    AddNewProject()
    'End Sub

    'Protected Sub AddNewProject()

    '    Dim StartDate As String
    '    StartDate = Date.UtcNow.ToShortDateString.ToString + " " + Date.UtcNow.ToShortTimeString.ToString

    '    Dim EndDate As String
    '    EndDate = Date.UtcNow.AddDays(1).ToShortDateString.ToString + " " + Date.UtcNow.ToShortTimeString.ToString

    '    Dim DatePosted As String
    '    DatePosted = System.DateTime.Today.ToShortDateString.ToString()

    '    Dim Result As String = "0"

    '    Dim NewProjectAdapter As New AddNewProjectDataSetTableAdapters.QueriesTableAdapter
    '    ActivateLanguage()
    '    NewProjectAdapter.AddProject(Session("ProfessionalId").ToString(), "PRO", _language.ToString(), 1, 1, 1, 1, 1, 1, 1, "" + _
    '                                                               "", StartDate.ToString(), EndDate.ToString(), 0.0, 1, "", "", DatePosted.ToString(), Result)

    '    Session("ProjectID") = Result

    '    DelayModalPopUpExtender.Hide()

    '    Response.Redirect("../PostProject.aspx")

    'End Sub

    'Protected Sub EditProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    '    Session("ProjectID") = ProjectGridView.SelectedDataKey.Value.ToString

    '    Dim ProjectStatus As New ProjectExtraDataSetTableAdapters.QueriesTableAdapter
    '    Dim Status As String = ProjectStatus.GetStatus(Session("ProjectID").ToString)

    '    If Status = "CLOSED" Then
    '        Me.Calendar1.SelectedDate = DateTime.UtcNow
    '        DelayModalPopUpExtender.Hide()
    '        Me.ExtendProjectModalPopupExtender.Show()
    '    Else
    '        Response.Redirect("../PostProject.aspx")
    '        DelayModalPopUpExtender.Hide()
    '    End If

    'End Sub

    Protected Sub Extend(ByVal sender As Object, ByVal e As System.EventArgs) Handles ExtendButton.Click

    End Sub

    'Protected Sub Extend(ByVal sender As Object, ByVal e As System.EventArgs) Handles ExtendButton.Click

    '    Dim ExtendProjectQuery As New ExtendProjectDataSetTableAdapters.QueriesTableAdapter
    '    ExtendProjectQuery.ExtendProject(Session("ProjectID").ToString, Calendar1.SelectedDate.Date.ToUniversalTime.ToString)

    '    DelayModalPopUpExtender.Hide()
    '    Response.Redirect("../PostProject.aspx")

    'End Sub

    'Protected Sub Calendar1_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles Calendar1.DayRender
    '    e.Day.IsSelectable = e.Day.Date >= DateTime.UtcNow
    'End Sub

    'Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
    '    Me.ExtendProjectModalPopupExtender.Show()
    'End Sub

    'Protected Sub Calendar1_VisibleMonthChanged(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MonthChangedEventArgs) Handles Calendar1.VisibleMonthChanged
    '    Me.ExtendProjectModalPopupExtender.Show()
    'End Sub


    Protected Sub CancelExtension(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelExtensionButton.Click

    End Sub
    'Protected Sub CancelExtension(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelExtensionButton.Click
    '    DelayModalPopUpExtender.Hide()
    'End Sub

    'Protected Sub DeleteProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    _deleteProject = True
    'End Sub

    'Protected Sub ProjectGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles ProjectGridView.RowDataBound
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='Maroon'; this.style.color='white'")
    '        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#F7F6F3'; ; this.style.color='black'")
    '    End If
    'End Sub

    'Protected Sub ProjectGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ProjectGridView.SelectedIndexChanged

    '    If _deleteProject = True Then
    '        _deleteProject = False
    '        Me.ProfessionalProjectDataSource.DeleteParameters("ProjectID").DefaultValue = ProjectGridView.SelectedPersistedDataKey.Value.ToString
    '        Me.ProfessionalProjectDataSource.DeleteParameters("PosterID").DefaultValue = Session("ProfessionalId").ToString
    '        Me.ProfessionalProjectDataSource.DeleteParameters("PosterRole").DefaultValue = "PRO"
    '        Me.ProfessionalProjectDataSource.Delete()
    '        Me.ProjectGridView.DataBind()
    '        Me.ProjectGridView.SelectedIndex = -1
    '        Me.DetailProjectSpecificationUpdatePanel.Update()
    '        Me.DetailProjectPhotoUpdatePanel.Update()
    '        Me.DetailProjectStatusUpdatePanel.Update()
    '        Me.WatchListGridView.DataBind()
    '        Me.EditProjectLinkButton.Visible = False
    '    End If

    '    If _editProject = True Then
    '        _editProject = False
    '        Dim ProjectStatus As New ProjectExtraDataSetTableAdapters.QueriesTableAdapter
    '        Dim Status As String = ProjectStatus.GetStatus(ProjectGridView.SelectedPersistedDataKey.Value.ToString)
    '        Select Case Status.ToString
    '            Case "Saved", "Enregistré"
    '                EditProjectLinkButton.Visible = True
    '            Case "CLOSED", "FERMÉ"
    '                EditProjectLinkButton.Visible = True
    '            Case "Pending", "En Attente"
    '                EditProjectLinkButton.Visible = False
    '            Case "OPEN", "OUVERT"
    '                EditProjectLinkButton.Visible = False
    '        End Select

    '    End If

    '    DelayModalPopUpExtender.Hide()

    'End Sub

    'Protected Sub ViewProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    _editProject = True
    'End Sub

    '''''''''''''''''''''''''''''''''''''PROJECT TABS'''''''''''''''''''''''''''''''''''''''''    

    '''''''''''''''''''''''''''''''''''''FAVORITE TABS'''''''''''''''''''''''''''''''''''''''''''   

    'Protected Sub ModalInvitationGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Invitation()
    '    Me.ModalInvitationGridView.SelectedIndex = -1
    '    Me.DelayModalPopUpExtender.Hide()

    'End Sub

    'Protected Sub ModalInvitationGridView_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles ModalInvitationGridView.PageIndexChanging
    '    Me.ModalInvitationPopupExtender.Show()
    'End Sub

    'Protected Sub ModalInvitationGridView_Sorting1(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles ModalInvitationGridView.Sorting
    '    Me.ModalInvitationPopupExtender.Show()
    'End Sub

    'Sub Invitation()
    '    Dim SenderID As String
    '    Dim ReceiverID As String
    '    Dim ProjectID As String
    '    Dim SenderRole As Integer
    '    Dim Title As String
    '    Dim LCID As String
    '    Dim DateEvent As String
    '    Dim senderName As String

    '    ''Sender ID
    '    SenderID = Session("ProfessionalId").ToString

    '    ''Professional General 
    '    Dim ProfessionalInformationAdapter As New GetUserInformationTableAdapters.ProfessionalGeneralTableAdapter

    '    Dim ProfessionalInformationTable As New GetUserInformation.ProfessionalGeneralDataTable

    '    ProfessionalInformationAdapter.FillProfessionalInformation(ProfessionalInformationTable, SenderID.ToString)

    '    ''Sender Name

    '    senderName = ProfessionalInformationTable.Item(0).UserName.ToString()

    '    SenderRole = 0

    '    ''Receiver always a professional
    '    Dim professionalLabel As Label = CType(Me.FavoriteGridView.SelectedRow.FindControl("ProID1"), Label)

    '    ReceiverID = professionalLabel.Text.ToString

    '    ProjectID = ModalInvitationGridView.SelectedPersistedDataKey.Value.ToString()

    '    ''FINAL STEP : MAKE SUE TO FORMAT THE MESSAGE TO INCLUDE THE PROJECT AS A HYPERLINK AND THE FORMATION OF THE EMAIL
    '    ActivateLanguage()
    '    Dim MessageCompositionAdapter As New MessageCompositionTableAdapters.EmailCompositionTableAdapter

    '    Dim MessageCompositionTable As New MessageComposition.EmailCompositionDataTable

    '    MessageCompositionAdapter.FillCustomMessage(MessageCompositionTable, _language.ToString())

    '    Title = senderName.ToString + " " + MessageCompositionTable.Rows(0).Item("InvitationMessage").ToString() + " " + ProjectID.ToString

    '    LCID = _language.ToString

    '    DateEvent = Date.UtcNow.ToShortDateString.ToString + " " + Date.UtcNow.ToShortTimeString.ToString

    '    '' Database 

    '    Dim Invitation As New InvitationToProjectTableAdapters.QueriesTableAdapter

    '    Invitation.InvitetoProject(SenderID.ToString, ReceiverID.ToString, ProjectID.ToString, SenderRole.ToString, Title.ToString, LCID.ToString, DateEvent.ToString)

    '    ''SEND AN EMAIL ONLY  TO THE RECEIVER AND AN EVENT TO THE RECEIVER

    '    Me.DelayModalPopUpExtender.Hide()

    'End Sub

    'Protected Sub InviteToProjectLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    _InvitetoProject = True
    'End Sub

    'Protected Sub AskQuestionLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Me.DelayModalPopUpExtender.Show()
    '    _Question = True
    'End Sub

    'Protected Sub SubmitQuestion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitQuestion.Click

    '    MessageModalPopupExtender.Hide()
    '    DelayModalPopUpExtender.Show()

    '    Dim senderid As String
    '    Dim receiverid As String
    '    Dim message As String
    '    Dim sendername As String
    '    Dim receivername As String
    '    Dim senderemail As String
    '    Dim receiveremail As String
    '    Dim senderRole As String

    '    ''Professional General 
    '    Dim ProfessionalInformationAdapter As New GetUserInformationTableAdapters.ProfessionalGeneralTableAdapter

    '    Dim ProfessionalInformationTable As New GetUserInformation.ProfessionalGeneralDataTable

    '    ProfessionalInformationAdapter.FillProfessionalInformation(ProfessionalInformationTable, Session("ProfessionalId").ToString)

    '    ''Sender Information
    '    senderid = Session("ProfessionalId").ToString()

    '    senderemail = ProfessionalInformationTable.Item(0).EmailAddress.ToString()

    '    sendername = ProfessionalInformationTable.Item(0).UserName.ToString()

    '    'MailMessage.isbodyhtml = True ( convert the content into html) see the send email function

    '    message = MessageTextBox.Text.ToString()

    '    senderRole = 0

    '    ''Receiver always a professional

    '    Dim professionalLabel As Label = CType(Me.FavoriteGridView.SelectedRow.FindControl("ProID1"), Label)

    '    receiverid = professionalLabel.Text.ToString

    '    ''Professional General 
    '    Dim ReceiverInformationAdapter As New GetUserInformationTableAdapters.ProfessionalGeneralTableAdapter

    '    Dim ReceiverInformationTable As New GetUserInformation.ProfessionalGeneralDataTable

    '    ReceiverInformationAdapter.FillProfessionalInformation(ReceiverInformationTable, receiverid.ToString)

    '    receiveremail = ReceiverInformationTable.Item(0).EmailAddress.ToString()

    '    receivername = ReceiverInformationTable.Item(0).UserName.ToString()

    '    Dim MessageCompositionAdapter As New MessageCompositionTableAdapters.EmailCompositionTableAdapter

    '    Dim MessageCompositionTable As New MessageComposition.EmailCompositionDataTable

    '    ActivateLanguage()

    '    MessageCompositionAdapter.FillCustomMessage(MessageCompositionTable, _language.ToString())

    '    Title = sendername.ToString + " " + MessageCompositionTable.Rows(0).Item("QuestionMessage").ToString() + " "

    '    Dim LCID As String = _language.ToString

    '    '' Database
    '    Dim AskQuestionAdpater As New GetUserInformationTableAdapters.AskQuestionTableAdapter

    '    Dim QuestionDate As String = Date.UtcNow.ToShortDateString.ToString + " " + Date.UtcNow.ToShortTimeString.ToString

    '    AskQuestionAdpater.AskQuestion(senderid.ToString(), sendername.ToString(), senderemail.ToString(), receiverid.ToString(), receivername.ToString(), receiveremail.ToString(), message.ToString(), Title.ToString(), LCID.ToString(), QuestionDate.ToString(), senderRole.ToString())

    '    Me.MessageTextBox.Text = ""

    '    MessagePanelUpdatePanel.Update()

    '    DelayModalPopUpExtender.Hide()
    'End Sub

    'Protected Sub CancelQuestion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelQuestion.Click
    '    DelayModalPopUpExtender.Show()
    '    Me.MessageModalPopupExtender.Hide()
    '    DelayModalPopUpExtender.Hide()
    'End Sub

    'Protected Sub FavoriteGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles FavoriteGridView.RowDataBound
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='Silver'; this.style.color='#15317E'")
    '        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#F7F6F3'; this.style.color='black'")
    '    End If
    'End Sub

    'Protected Sub FavoriteGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FavoriteGridView.SelectedIndexChanged

    '    If _InvitetoProject = True Then
    '        _InvitetoProject = False

    '        ProfessionalOpenProjectDataSource.SelectParameters(0).DefaultValue = Session("ProfessionalId").ToString
    '        ProfessionalOpenProjectDataSource.SelectParameters(1).DefaultValue = _language.ToString
    '        ModalInvitationGridView.DataBind()
    '        Me.ModalInvitationUpdatePanel.Update()

    '        Me.DelayModalPopUpExtender.Hide()
    '        Me.ModalInvitationPopupExtender.Show()

    '    End If

    '    If _Question = True Then
    '        _Question = False

    '        Me.DelayModalPopUpExtender.Hide()
    '        Me.MessageModalPopupExtender.Show()

    '    End If

    'End Sub

    ''''''''''''''''''''''''''''''''''''FAVORITE TABS''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''''INVITATION TABS'''''''''''''''''''''''''''''''''''''''''    

    'Protected Sub InvitationGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles InvitationGridView.RowDataBound
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#006699'; this.style.color='white'")
    '        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#F7F6F3'; this.style.color='black'")
    '    End If
    'End Sub

    ''''''''''''''''''''''''''''''''''''INVITATION TABS'''''''''''''''''''''''''''''''''''''''''

    '''''''''''''''''''''''''''''''''''''WATCHLIST TABS'''''''''''''''''''''''''''''''''''''''''  

    'Protected Sub DeleteWatchListProject_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    _deleteWatchList = True
    'End Sub

    'Protected Sub ViewWatchListProject_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    _viewWatchListProject = True
    'End Sub

    'Protected Sub WatchListGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles WatchListGridView.RowDataBound
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#4F5A64'; this.style.color='white'")
    '        e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#F7F6F3'; this.style.color='black'")
    '    End If
    'End Sub

    'Protected Sub WatchListGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles WatchListGridView.SelectedIndexChanged

    '    Dim watchIDlist As Label = CType(WatchListGridView.SelectedRow.FindControl("WatchLabelID"), Label)

    '    If _deleteWatchList = True Then
    '        Dim DeleteWatchListAdapter As New ProfessionalWatchListDataSetTableAdapters.GetProfessionalWatchListTableAdapter
    '        DeleteWatchListAdapter.DeleteWatchList(watchIDlist.Text.ToString(), "CUS")
    '        _deleteWatchList = False
    '        WatchListGridView.DataBind()
    '        DelayModalPopUpExtender.Hide()
    '    End If

    '    If _viewWatchListProject = True Then
    '        ViewQuickListProject(WatchListGridView.SelectedPersistedDataKey.Value.ToString())
    '        _viewWatchListProject = False
    '    End If
    'End Sub

    'Protected Sub ViewQuickListProject(ByVal ProjectID As String)

    '    Dim ProjectviewAdpater As New ViewProjectDataSetTableAdapters.ProjectRequirementsTableAdapter

    '    Dim ProjectViewDataTable As New ViewProjectDataSet.ProjectRequirementsDataTable

    '    Dim ProjectPhotoAdpater As New ViewProjectDataSetTableAdapters.ProjectPhotoTableAdapter

    '    Dim ProjectPhotoDataTable As New ViewProjectDataSet.ProjectPhotoDataTable

    '    ProjectviewAdpater.FillViewProject(ProjectViewDataTable, ProjectID.ToString())

    '    ProjectPhotoAdpater.FillProjectPhoto(ProjectPhotoDataTable, ProjectID.ToString())

    '    ProjectPhotoObjectDataSource.SelectParameters(0).DefaultValue = ProjectID.ToString()

    '    Me.ProjectPhotoFormView.DataBind()

    '    ProjectIDView.Text = ProjectViewDataTable.Rows(0).Item(0).ToString
    '    TitleView.Text = ProjectViewDataTable.Rows(0).Item(11).ToString
    '    IndustryView.Text = ProjectViewDataTable.Rows(0).Item(3).ToString
    '    SpecializationView.Text = ProjectViewDataTable.Rows(0).Item(5).ToString
    '    TimeLeftView.Text = ProjectViewDataTable.Rows(0).Item(27).ToString
    '    HighestBidView.Text = ProjectViewDataTable.Rows(0).Item(28).ToString

    '    CountryView.Text = ProjectViewDataTable.Rows(0).Item(20).ToString
    '    StateView.Text = ProjectViewDataTable.Rows(0).Item(22).ToString

    '    Dim DescriptionLength As Integer = 0
    '    Dim CustomDescription As String
    '    CustomDescription = ProjectViewDataTable.Rows(0).Item(16).ToString()
    '    If CustomDescription.Length < 500 Then
    '        DescriptionLength = CustomDescription.Length
    '    Else
    '        DescriptionLength = 500
    '    End If
    '    CustomDescriptionLabel.Text = ProjectViewDataTable.Rows(0).Item(16).ToString.Substring(0, DescriptionLength)
    '    NotesView.Text = ProjectViewDataTable.Rows(0).Item(17).ToString


    '    Dim ExperienceAdapter As New ViewProjectDataSetTableAdapters.ExperienceTableAdapter
    '    Dim ExperienceTable As New ViewProjectDataSet.ExperienceDataTable
    '    ExperienceAdapter.FillExperience(ExperienceTable, ProjectViewDataTable.Rows(0).Item(6).ToString)
    '    ExperienceView.Text = ExperienceTable.Rows(0).Item(0).ToString

    '    Dim InsuredAdpater As New ViewProjectDataSetTableAdapters.InsuredTableAdapter
    '    Dim InsuredTable As New ViewProjectDataSet.InsuredDataTable
    '    InsuredAdpater.FillInsured(InsuredTable, ProjectViewDataTable.Rows(0).Item(9).ToString)
    '    InsuredView.Text = InsuredTable.Rows(0).Item(0).ToString

    '    Dim LicensedAdapter As New ViewProjectDataSetTableAdapters.LicensedTableAdapter
    '    Dim LicensedTable As New ViewProjectDataSet.LicensedDataTable
    '    LicensedAdapter.FillLicensed(LicensedTable, ProjectViewDataTable.Rows(0).Item(8).ToString)
    '    LicensedView.Text = LicensedTable.Rows(0).Item(0).ToString

    '    Dim CrewAdapter As New ViewProjectDataSetTableAdapters.CrewNumberTableAdapter
    '    Dim CrewTable As New ViewProjectDataSet.CrewNumberDataTable
    '    CrewAdapter.FillCrewNumber(CrewTable, ProjectViewDataTable.Rows(0).Item(7).ToString)
    '    CrewNumberView.Text = CrewTable.Rows(0).Item(0).ToString

    '    Dim RelocationAdapter As New ViewProjectDataSetTableAdapters.RelocationTableAdapter
    '    Dim RelocationTable As New ViewProjectDataSet.RelocationDataTable
    '    RelocationAdapter.FillRelocation(RelocationTable, ProjectViewDataTable.Rows(0).Item(10).ToString)
    '    RelocationView.Text = RelocationTable.Rows(0).Item(0).ToString

    '    Me.MoreProjectUpdatePanel.Update()
    '    MoreProjectHiddenFieldButton.Value = "../ViewProject.aspx?PRID=" + ProjectViewDataTable.Rows(0).Item(0).ToString
    '    Me.MoreProjectModalPopupExtender.Show()
    'End Sub

    '''''''''''''''''''''''''''''''''''''WATCHLIST TABS'''''''''''''''''''''''''''''''''''''''''    

    ''''''''''''''''''''''''''''''''''''COMMENT TABS''''''''''''''''''''''''''''''''''''''''''''    

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

    ''''''''''''''''''''''''''''''''''''COMMENT TABS'''''''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''''ACCOUNT TABS''''''''''''''''''''''''''''''''''''''''''' 

    Protected Sub DeleteAccount_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteAccountLinkButton.Click
        DeleteDirectory()
        Membership.DeleteUser(Membership.GetUser.ToString)

        Dim UserDeletionQuery As New DeleteUserDataSetTableAdapters.QueriesTableAdapter
        UserDeletionQuery.DeleteUser(Session("ProfessionalID").ToString, 0)

        Response.Redirect("~/NotAuthenticated/index.aspx")
    End Sub

    Sub DeleteDirectory()
        Dim Username As String = User.Identity.Name
        Dim rootPath As String = Server.MapPath("~/Authenticated/Professional/Images/")
        Dim NewProfessionalDirectory As String = rootPath & Username

        If Directory.Exists(NewProfessionalDirectory) = True Then
            Directory.Delete(NewProfessionalDirectory, True)
        End If
    End Sub

    Protected Sub AccountSendMessageLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AccountSendMessageLinkButton.Click

    End Sub

    Protected Sub BindQuestions()
        ProfessionalServiceObjectDataSource.SelectParameters(0).DefaultValue = _language
        ProfessionalServiceObjectDataSource.DataBind()
    End Sub

    '''''''''''''''''''''''''''''''''''ACCOUNT TABS''''''''''''''''''''''''''''''''''''''''''' 


End Class