Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Partial Class UserProfile
    Inherits System.Web.UI.Page
    ''NOTE :
    ''CHANGE THE SIGN UP PROCEDURE SO THAT THE FIRST
    ''EVENT WILL HAVE A DESCRITPION OF WELCOME ABOARDS
    ''Work AROUND EVAL( ) See examples of Code to minimize time
    ''ClEAN UP the CODE Use Using sql connection

    ''Change Sign up and the procedure to includew all the information in the general information
    '' in other words eleminate Professional specific information table

    '' Modify Professional message and professional message  and message to all include descriptimn, from to and date .to minimze database connectivity
    '' in the database and in the sign up too

    Public _messagemode As Integer = 0
    Public _SelectedMessageID As Integer
    Public _newInbox As Integer



    Public Property NewInbox() As Integer
        Get
            Return _newInbox
        End Get
        Set(ByVal value As Integer)
            _newInbox = value

        End Set
    End Property


    Public Property MessageMode() As Integer
        Get
            Return _messagemode
        End Get
        Set(ByVal value As Integer)
            _messagemode = value
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

    Dim MenuButton As String = "Inbox"

    Protected Sub TabContainer1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ProfileTabContainer.Load
        'ProfileTabContainer.ControlStyle.BorderWidth = 5
        'ProfileTabContainer.BorderStyle = BorderStyle.Double
        ' ProfileTabContainer.ActiveTabIndex = 1


    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Membership.GetUser.ToString()


    End Sub



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Dim user As MembershipUser = Membership.GetUser


            ''***************
            ''based on the role direct the pages
            Dim role As String
            role = Me.User.IsInRole("Professional").ToString

            ''****************

            ''making sure that the session time is not over , user is still log in and handling the guid variable

            If user Is Nothing Then
                Response.Redirect("~/NotAuthenticated/SignIn.aspx")
            Else
                Dim guidStringUser As Guid = New Guid(Membership.GetUser.ProviderUserKey().ToString)

                Session("Userid") = guidStringUser.ToString

                Label1.Text = Session("Userid")
                'Session("NEWSKILLS") = False

                ' Session("messagemode") = 0

                ''Format the password error message
                'PasswordErrorMessage.Text = "<b><font color='red' >" & "An error has occured while processing your request" & _
                ' "</font></b></br>" & " <font color='black'>" & "Please ensure the following requirements: </br>" & "<ul><il> <text-align='left'>" & "* Password must be correct </text-align>" & _
                ' "</il><ul>" & "<il><ul> " & " New password length must at least 7 characters  including 1 non alphabetic character" & "</il></ul>"




                ''GetInformation will get 
                ''ProfessionalID
                ''NumberofEvents
                ''NumberofProjects
                ''NumberofBid
                ''Numberofmessages


                GetInformation()



                '  Response.Write(Session("Userid"))
            End If
        End If


        ''This behaviour is needed for changePassword 
        'ChangePassword1.Visible = False
        'ChangePasswordLinkButton.Text = "Change Password"


        'Dim rootPath As String = Server.MapPath("~")
        '    Response.Write(rootPath)

        ''retrieve the number of images , their location, thier rank

    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        Session.Remove("Userid")
    End Sub
    Sub GetInformation()

        ''Create a  connection
        Dim ProfileConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("SideJobConnectionString").ConnectionString)

        ''open the connection
        ProfileConnection.Open()

        ''Start the transaction    
        'Dim ProfileTransaction As SqlTransaction = ProfileConnection.BeginTransaction()

        Dim UserID As String
        UserID = Session("Userid")

        Try

            ''****************Get the ProfessionalID*************
            '' this line is correct , i use the second line to paypass security and matching of user id in look up roles

            'Dim strSQLProfessionalID As String = "SELECT ProfessionalId FROM LookUpRoles WHERE Userid = '" & UserID & "'"

            '' this line is not correct
            ''   Dim strSQLProfessionalID As String = " SELECT ProId FROM LookUpRoles WHERE Userid = '33AF623B-99EB-4342-9206-DD7B49C7ABE8' "


            Dim strSQLProfessionalID As String = " SELECT ProfessionalId FROM LookUpRoles WHERE Userid = '" + UserID + "'"


            Using ProfileCommand As New SqlCommand(strSQLProfessionalID, ProfileConnection)
                ProfileCommand.CommandType = CommandType.Text

                '    Call the store procedure
                Dim reader As SqlDataReader = ProfileCommand.ExecuteReader()

                reader.Read()

                Session("ProId") = reader("ProfessionalId")

                TargetedControlLabel.Text = Session("ProId")

                ''Close the reader
                reader.Close()
            End Using


            ''***Professionalidnumber convert Proid to an integer and use it for sql statement**

            Dim Professionalidnumber As Integer
            Professionalidnumber = Integer.Parse(Session("ProId"))


            ''*************************Get the number of Events************************

            Dim strSQLNumberofEvents As String = "SELECT NumberofEvents FROM ProfessionalEvent WHERE ProId = " & Professionalidnumber

            Using ProfileCommand2 As New SqlCommand(strSQLNumberofEvents, ProfileConnection)
                ProfileCommand2.CommandType = CommandType.Text


                Dim reader2 As SqlDataReader = ProfileCommand2.ExecuteReader()

                reader2.Read()

                ''Formating the Event Label

                EventLabel.Text &= "<b><font color='red'>"
                EventLabel.Text &= reader2("numberofEvents").ToString
                EventLabel.Text &= "</font></b> Events"

                'Label3.Text &= reader2("numberofEvents").ToString


                ''Close the reader
                reader2.Close()
            End Using


            ''************************Get the number of Projects***********************
            ''redo the sign up process to include that the number of projects i 0

            'Dim strSQLNumberofProjects As String = "SELECT NumberofProjects FROM ProfessionalProject WHERE ProId = " & Professionalidnumber

            'Dim ProfileCommand3 As New SqlCommand(strSQLNumberofEvents, ProfileConnection, ProfileTransaction)
            'ProfileCommand3.CommandType = CommandType.Text




            'Dim reader3 As SqlDataReader = ProfileCommand3.ExecuteReader()

            'reader3.Read()

            'Label4.Text &= reader3("NumberofProjects").ToString


            ''Close the reader
            'reader3.Close()



            ''************************Get the number of Bids***********************
            ''redo the sign up process to include that the number of Bids is 0

            'Dim strSQLNumberofBids As String = "SELECT NumberofBids FROM ProfessionalBid WHERE ProId = " & Professionalidnumber

            'Dim ProfileCommand4 As New SqlCommand(strSQLNumberofBids, ProfileConnection, ProfileTransaction)
            'ProfileCommand4.CommandType = CommandType.Text




            'Dim reader4 As SqlDataReader = ProfileCommand4.ExecuteReader()

            'reader4.Read()

            'Label5.Text &= reader4("NumberofBids").ToString


            ''Close the reader
            'reader4.Close()



            ''************************Get the number of Messages***********************
            ''redo the sign up process to include that the number of Messages is 0 ,but 
            ''the new message from the administrator will make it 1

            'Dim strSQLNumberofMessages As String = "SELECT Numberofmessages FROM ProfessionalMessage WHERE ProId = " & Professionalidnumber

            'Dim ProfileCommand5 As New SqlCommand(strSQLNumberofMessages , ProfileConnection, ProfileTransaction)
            'ProfileCommand5.CommandType = CommandType.Text




            'Dim reader5 As SqlDataReader = ProfileCommand5.ExecuteReader()

            'reader5.Read()

            'Label6.Text &= reader5("Numberofmessages").ToString


            ''Close the reader
            'reader5.Close()

            '**************************************************************************


            '    If we reach here, all command succeeded, so commit the transaction
            'ProfileTransaction.Commit()


        Catch ex As Exception
            '    Something went wrong, so rollback the transaction
            '    ProfileTransaction.Rollback()
            Response.Redirect("~/NotAuthenticated/ErrorPage.aspx")
            Throw        'Bubble up the exception
            Response.Redirect("~/NotAuthenticated/ErrorPage.aspx")
        Finally


            ''MAYBE THE PROBLEM IS HERER
            ProfileConnection.Close() 'Finally, close the connection
        End Try



    End Sub

    'Protected Sub EventDeleteButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EventDeleteButton.Click

    '    Dim atLeastOneRowDeleted As Boolean = False
    '    ' Iterate through the Products.Rows property

    '    For Each row As GridViewRow In EventGrid.Rows

    '        ' Access the CheckBox
    '        Dim cb As CheckBox = row.FindControl("EventSelectorCheckBox")

    '        If cb IsNot Nothing AndAlso cb.Checked Then

    '            ' Delete row! (Well, not really...)
    '            atLeastOneRowDeleted = True

    '            ' First, get the ProductID for the selected row
    '            Dim EventID As Integer = _
    '            Convert.ToInt32(EventGrid.DataKeys(row.RowIndex).Value)
    '            ' "Delete" the row

    '            GridTest.Text &= String.Format( _
    '            "This would have deleted EventID {0}<br />", EventID)

    '            '... To actually delete the product, use ...
    '            ' Dim productAPI As New ProductsBLL
    '            ' productAPI.DeleteProduct(productID)
    '            '............................................
    '        End If
    '    Next

    '    ''If not CheckBox is Selected
    '    If atLeastOneRowDeleted = False Then

    '        ' Define the name and type of the client scripts on the page.
    '        Dim csname1 As String = "EventDeleteScript"

    '        Dim cstype As Type = Me.GetType()

    '        ' Get a ClientScriptManager reference from the Page class.
    '        Dim cs As ClientScriptManager = Page.ClientScript

    '        ' Check to see if the startup script is already registered.
    '        If (Not cs.IsStartupScriptRegistered(cstype, csname1)) Then

    '            Dim EventError As String = "alert('You have to select at least one event to delete');"
    '            cs.RegisterStartupScript(cstype, csname1, EventError, True)

    '        End If
    '    End If


    'End Sub

    ' ''This procedure is used to Check All and Uncheck All Events Button

    'Private Sub EventToggleCheckState(ByVal checkState As Boolean)

    '    ' Iterate through the Products.Rows property
    '    For Each row As GridViewRow In EventGrid.Rows

    '        ' Access the CheckBox
    '        Dim cb As CheckBox = row.FindControl("EventSelectorCheckBox")
    '        If cb IsNot Nothing Then
    '            cb.Checked = checkState
    '        End If
    '    Next
    'End Sub



    'Protected Sub EventCheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EventCheckAll.Click
    '    EventToggleCheckState(True)
    'End Sub

    'Protected Sub EventUncheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EventUncheckAll.Click
    '    EventToggleCheckState(False)
    'End Sub

    ' ''This procedure is used to Check All and Uncheck All Message Button

    'Private Sub MessageToggleCheckState(ByVal checkState As Boolean)

    '    ' Iterate through the Products.Rows property
    '    For Each row As GridViewRow In MessageGrid.Rows

    '        ' Access the CheckBox
    '        Dim cb As CheckBox = row.FindControl("MessageSelectorCheckBox")
    '        If cb IsNot Nothing Then
    '            cb.Checked = checkState
    '        End If
    '    Next
    'End Sub
    'Protected Sub MessageCheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles MessageCheckAll.Click
    '    MessageToggleCheckState(True)
    'End Sub

    'Protected Sub MessageUncheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles MessageUncheckAll.Click
    '    MessageToggleCheckState(False)
    'End Sub

    Sub dgPopularFAQs_Delete(ByVal sender As Object, ByVal e As DataGridCommandEventArgs)

    End Sub
    Sub Change(ByVal sender As Object, ByVal e As DataGridCommandEventArgs)
        Response.Write("Change1")
    End Sub
    Sub Change2(ByVal sender As Object, ByVal e As DataGridCommandEventArgs)
        Response.Write("Change2")
    End Sub

    Protected Sub EventGrid_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles EventGrid.Load
        EventGrid.Columns(6).Visible = False
    End Sub

    Protected Sub EventGrid_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles EventGrid.RowCommand
        ''Event to handle the click on view message

        ''Detecting if the command is EventViewCommand
        If e.CommandName = "EventViewCommand" Then
            'Response.Write(EventGrid.DataKeys(0).Value)


            ' First, get the ProductID for the selected row
            'Dim EventID As Integer = _
            'Convert.ToInt32(EventGrid.DataKeys(0).Value)
            'Dim i As String = EventGrid.DataKeys("EventID").ToString
            'For Each row As GridViewRow In EventGrid.Rows

            'Next
            'Response.Write(i)

            ''get the index of the row

            ''*******************
            ''Modify the Professional Event Table so that Type should not be null , but essential

            'Dim i As Integer = Convert.ToInt32(e.CommandArgument)
            'EventGrid.Columns(6).Visible = True
            'Dim j As String = EventGrid.Rows(i).Cells(6).Text
            'Me.Label4.Text = j
            '  Dim typetextBox As TextBox = CType(EventGrid.Rows(i).Controls(0), TextBox)



            ''EventGrid.Columns(6).Visible = false
            'Response.Write(j)
            'Response.Write(typetextBox.Text)


            ''*******************
            Dim EventID As String = _
            Convert.ToString(EventGrid.DataKeys(0).Value)
            Response.Write(EventID)


            ProfileTabContainer.ActiveTabIndex = 2



        End If


    End Sub




    Protected Sub ClickTest(ByVal sender As Object, ByVal e As System.EventArgs)
        '      Dim i As String = Convert.ToInt32(EventGrid.Rows(0).DataItem("EventID").ToString)
    End Sub

    Protected Sub EventGrid_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles EventGrid.RowUpdated
        EventGrid.Columns(6).Visible = False
    End Sub



    'Protected Sub InboxProfessionalLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles InboxProfessionalLinkButton.Click
    '    MenuButton = "Inbox"

    '    MessageDataSource.SelectCommand = "SELECT ProID,MessageID, SenderType, SenderID, SenderName, ReceiverType, ReceiverID, ReceiverName, DateofMessage, Title, Description, Inbox, NumberofInbox, Outbox, NumberofOutbox, SavedMessageID, NumberofSaved, Numbersofmessages FROM ProfessionalMessage WHERE (ProID = CAST(@Proid AS int)) AND (inbox = 1)"

    '    MessageGrid.DataBind()

    '    'SaveMessageButton.Visible = True

    'End Sub

    'Protected Sub OutboxProfessionalLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles OutboxProfessionalLinkButton.Click

    '    MenuButton = "Outbox"

    '    MessageDataSource.SelectCommand = "SELECT ProID,MessageID, SenderType, SenderID, SenderName, ReceiverType, ReceiverID, ReceiverName, DateofMessage, Title, Description, Inbox, NumberofInbox, Outbox, NumberofOutbox, SavedMessageID, NumberofSaved, Numbersofmessages FROM ProfessionalMessage WHERE (ProID = CAST(@Proid AS int)) AND (Outbox = 1)"

    '    MessageGrid.DataBind()

    '    'SaveMessageButton.Visible = True


    'End Sub

    'Protected Sub SavedProfessionalLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SavedProfessionalLinkButton.Click

    '    'SaveMessageButton.Visible = False
    '    MenuButton = "Saved"

    '    MessageDataSource.SelectCommand = "SELECT ProID,MessageID, SenderType, SenderID, SenderName, ReceiverType, ReceiverID, ReceiverName, DateofMessage, Title, Description, Inbox, NumberofInbox, Outbox, NumberofOutbox, SavedMessageID, NumberofSaved, Numbersofmessages FROM ProfessionalMessage WHERE (ProID = CAST(@Proid AS int)) AND (SavedMessageID <> 0)"

    '    MessageGrid.DataBind()

    'End Sub


    'Protected Sub MessageDeleteButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles MessageDeleteButton.Click

    '    Dim atLeastOneRowDeleted As Boolean = False
    '    ' Iterate through the MessageGrid.Rows property

    '    For Each row As GridViewRow In MessageGrid.Rows

    '        ' Access the CheckBox
    '        Dim cb As CheckBox = row.FindControl("MessageSelectorCheckBox")

    '        If cb IsNot Nothing AndAlso cb.Checked Then

    '            ' Delete row! (Well, not really...)
    '            atLeastOneRowDeleted = True

    '            ' First, get the ProductID for the selected row
    '            Dim MessageID As Integer = _
    '            Convert.ToInt32(MessageGrid.DataKeys(row.RowIndex).Value)
    '            ' "Delete" the row
    '            MessageDataSource.DeleteCommand = "DELETE FROM ProfessionalMessage WHERE MESSAGEID = " & MessageID
    '            MessageDataSource.Delete()
    '            MessageGrid.DataBind()

    '            ''Update the Database






    '            ''   MessageGridTest.Text &= String.Format( _
    '            '' "This would have deleted MessageID {0}<br />", MessageID)

    '            '... To actually delete the product, use ...
    '            ' Dim productAPI As New ProductsBLL
    '            ' productAPI.DeleteProduct(productID)
    '            '............................................
    '        End If
    '    Next

    '    ''If not CheckBox is Selected
    '    If atLeastOneRowDeleted = False Then

    '        ' Define the name and type of the client scripts on the page.
    '        Dim MessageClientScript As String = "MessageDeleteScript"

    '        Dim MessageClientScriptType As Type = Me.GetType()

    '        ' Get a ClientScriptManager reference from the Page class.
    '        Dim cs As ClientScriptManager = Page.ClientScript

    '        ' Check to see if the startup script is already registered.
    '        If (Not cs.IsStartupScriptRegistered(MessageClientScriptType, MessageClientScript)) Then

    '            Dim MessageError As String = "alert('You have to select at least one message to delete');"
    '            cs.RegisterStartupScript(MessageClientScriptType, MessageClientScript, MessageError, True)

    '        End If
    '    End If
    'End Sub


    'Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ProfessionalProjectGridView.SelectedIndexChanged

    'End Sub



    'Protected Sub MessageGrid_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles MessageGrid.RowCommand


    'End Sub



    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub




    Protected Sub DescriptionTextBox_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    ''This method is used to adjust the problem with ' and ""  of the Description textbox 
    Protected Function AdjustDescripitonText(ByVal oldDescription As String) As String



        Return "test"

    End Function







    Protected Sub ModalPopupExtender1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ModalPopupExtender1.Load
        Dim label1 As New Label

        '   Dim current As HttpContext = HttpContext.Current
        'If Me.ProfileTabContainer.ActiveTabIndex = 4 Then
        '    Dim i As Integer

        'End If

        PhotoPaths()


        Dim slideshow1 As New AjaxControlToolkit.SlideShowExtender

        label1.Text = "Teststpjsewtsew"

        slideshow1.AutoPlay = True
        slideshow1.Loop = True
        '       ImageTitleLabelID = "Label3"
        '       ImageDescriptionLabelID = "Label2"
        slideshow1.NextButtonID = Me.NextButton.ID
        slideshow1.PreviousButtonID = Me.PreviousButton.ID
        slideshow1.PlayButtonID = Me.PlayButton.ID
        slideshow1.TargetControlID = Me.Image1.ID
        slideshow1.SlideShowServicePath = "ProfessionalSlideWebService.asmx"
        slideshow1.SlideShowServiceMethod = "GetSlides"
        slideshow1.PlayButtonText = "Play"
        slideshow1.StopButtonText = "Stop"
        slideshow1.PlayInterval = 3000


        Me.ModalPopupExtender1.Controls.Add(slideshow1)



        '        <cc1:SlideShowExtender ID="SlideShowExtender2" runat="server" 
        '       AutoPlay = "True"
        '       TargetControlID = "Image1"
        '       SlideShowServicePath = "SlideWebService.asmx"
        '       SlideShowServiceMethod = "GetSlides"
        '             Loop="True"
        '       ImageTitleLabelID = "Label3"
        '       NextButtonID = "Button1"
        '       PreviousButtonID = "Button2"
        '       PlayButtonID = "Button3"
        '       PlayButtonText = "Play"
        '       StopButtonText = "Stop"
        '       BehaviorID = "SlideShow"
        '       ImageDescriptionLabelID = "Label2"
        '>
        '           </cc1:SlideShowExtender>

    End Sub
    Sub PhotoPaths()


        'Label1.Text = Me.SqlDataSource1.DataSourceMode.ToString

        'Programmatically access the SqlDataSource - get back a DataView
        Dim dv As DataView = _
           CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)


        ''Dynamically Allocated a list box that will be used for the slide show
        Dim numberofrows As Integer = dv.Table.Rows.Count

        ' Response.Write(numberofrows)

        '''???
        'Dim ImagesListArray(numberofrows) As String



        If numberofrows = 1 Then
            ProfessionalData._PathImageList = New ArrayList(0)
            ProfessionalData._CaptionImageList = New ArrayList(0)


            'ImagesListArray(0) = dv.Table.Rows(0)(1).ToString
            ProfessionalData._PathImageList.Add(dv.Table.Rows(0)(1).ToString)
            ProfessionalData._CaptionImageList.Add(dv.Table.Rows(0)(2).ToString)
            'ProfessionalData.NumberofImages = 1
        Else
            Dim i As Integer
            ProfessionalData._PathImageList = New ArrayList(numberofrows - 1)
            ProfessionalData._CaptionImageList = New ArrayList(numberofrows - 1)

            For i = 0 To numberofrows - 1

                'See if we want to show this
                'ImagesListbox.DataSourceID = "SqlDataSource1"
                If i <> 0 Then
                    'ImagesListArray(i) = dv.Table.Rows(i)(1).ToString

                    ''dr(1).ToString()
                    ProfessionalData._PathImageList.Add(dv.Table.Rows(i)(1).ToString)
                    ProfessionalData._CaptionImageList.Add(dv.Table.Rows(i)(2).ToString)
                    'ProfessionalData._PathImageList.Add(dr(1).ToString)
                    'ProfessionalData._CaptionImageList.Add(dr(2).ToString)

                    'Response.Write(dr(1).ToString)

                End If
                ' i = i + 1


            Next

            ''ProfessionalData.NumberofImages = i - 1


        End If



        ' Me.Label1.Text = ImagesListArray.Length


        ''testing print all the elements of the arraylist

        'For Each s As String In ImagesListArray
        '    Response.Write(s)

        'Next

        'Dim test As String
        'test = """" & "Http://127.0.0.1/IMAGES/HAITHEM100/Haithem1.jpg" & """" & ")"

        'Me.SlideShowExtender1.SlideShowServiceMethod = "GetSlides(5,Http://127.0.0.1/IMAGES/HAITHEM100/Haithem1.jpg)"
        'Dim slide1 As New AjaxControlToolkit.Slide("Images/EmployeeImages/Professionals.jpg", "Name", "Caption")
        'ImageButton3.ImageUrl = slide1.ImagePath
        'Me.SlideShowExtender1.ContextKey = "Http://127.0.0.1/IMAGES/HAITHEM100/Haithem1.jpg"
    End Sub
    Sub PhotoPaths2()


        Dim dv As DataView = _
           CType(SqlDataSource3.Select(DataSourceSelectArguments.Empty), DataView)


        ''Dynamically Allocated a list box that will be used for the slide show
        Dim numberofrows As Integer = dv.Table.Rows.Count

        ' Response.Write(numberofrows)

        '''???
        'Dim ImagesListArray(numberofrows) As String



        If numberofrows = 1 Then
            ProfessionalWorkData._PathWorkImageList = New ArrayList(0)
            ProfessionalWorkData._CaptionWorkImageList = New ArrayList(0)


            'ImagesListArray(0) = dv.Table.Rows(0)(1).ToString
            ProfessionalWorkData._PathWorkImageList.Add(dv.Table.Rows(0)(1).ToString)
            ProfessionalWorkData._CaptionWorkImageList.Add(dv.Table.Rows(0)(2).ToString)
            'ProfessionalData.NumberofImages = 1
        Else
            Dim i As Integer
            ProfessionalWorkData._PathWorkImageList = New ArrayList(numberofrows - 1)
            ProfessionalWorkData._CaptionWorkImageList = New ArrayList(numberofrows - 1)

            For i = 0 To numberofrows - 1

                'See if we want to show this
                'ImagesListbox.DataSourceID = "SqlDataSource1"
                If i <> 0 Then
                    'ImagesListArray(i) = dv.Table.Rows(i)(1).ToString

                    ''dr(1).ToString()
                    ProfessionalWorkData._PathWorkImageList.Add(dv.Table.Rows(i)(1).ToString)
                    ProfessionalWorkData._CaptionWorkImageList.Add(dv.Table.Rows(i)(2).ToString)
                    'ProfessionalData._PathImageList.Add(dr(1).ToString)
                    'ProfessionalData._CaptionImageList.Add(dr(2).ToString)

                    'Response.Write(dr(1).ToString)

                End If
                ' i = i + 1


            Next

            ''ProfessionalData.NumberofImages = i - 1


        End If

    End Sub

    'Protected Sub CancelPushButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Me.ModalPopupExtender2.Hide()
    'End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Me.ModalPopupExtender1.Hide()
        'Me.ModalPopupExtender3.Show()
        ''Response.Redirect("")


    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Me.ModalPopupExtender3.Hide()
        'Me.UpdatePanel1.Update()


        'Me.ChangePassword1.Visible = True





    End Sub


    'Protected Sub CancelPassword_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    CurrentPassword.Text = ""
    '    NewPassword.Text = ""
    '    ConfirmPassword.Text = ""
    '    Me.ModalPopupExtender2.Hide()
    '    Me.UpdatePanel3.Update()


    'End Sub

    'Protected Sub ChangePassword_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Me.PasswordCompareValidator.Validate()
    '    ' Me.CustomValidator1.Validate()

    '    If Me.PasswordCompareValidator.IsValid Then

    '        'If Me.CustomValidator1.IsValid Then
    '        If Me.UpdatePassword = True Then


    '            'Me.PasswordCustomValidator.Validate()

    '            'If Me.PasswordCustomValidator.IsValid Then

    '            Me.ModalPopupExtender2.Hide()
    '            '  Me.ModalPopupExtender4.Show()
    '            Me.UpdatePanel3.Update()
    '        Else
    '            'CustomValidator1.ErrorMessage = "ERror:"
    '            '  CustomValidator1.SetFocusOnError = True

    '            '1:              solution()
    '            Me.ModalPopupExtender2.Hide()
    '            '   Me.ModalPopupExtender6.Show()
    '            Me.UpdatePanel3.Update()

    '            ''2 solution
    '            'Me.ModalPopupExtender2.Hide()
    '            'Me.UpdatePanel3.Update()
    '            'Me.ModalPopupExtender2.Show()


    '            'Me.ModalPopupExtender2.DropShadow = True
    '            'Dim LabelMessage As New Label
    '            'LabelMessage.Text = "test"
    '            'Me.ModalPopupExtender2.Controls.Add(LabelMessage)

    '            'Me.FailureText.Text = "Test"
    '            'Me.ModalPopupExtender2.Controls.Add(FailureText)
    '            ' Me.ModalPopupExtender2.Show()

    '            'Me.UpdatePanel3.Update()



    '        End If
    '        'Else


    '        '    Me.PasswordCustomValidator.SetFocusOnError = True

    '        '    Me.ModalPopupExtender2.Show()


    '    End If
    '    'Try

    '    '    Dim u As MembershipUser = Membership.GetUser(HttpContext.Current.User.Identity.Name)
    '    '    Dim result As Boolean


    '    '    result = u.ChangePassword(CurrentPassword.Text, NewPassword.Text)

    '    '    If (result = True) Then
    '    '        'FailureText.ForeColor = Drawing.Color.Blue
    '    '        '  FailureText.Text = "You have successfully changed your Password."
    '    '        CurrentPassword.Text = ""
    '    '        NewPassword.Text = ""
    '    '        ConfirmPassword.Text = ""
    '    '        Me.ModalPopupExtender2.Hide()
    '    '        Me.ModalPopupExtender4.Show()
    '    '        Me.UpdatePanel3.Update()


    '    '    Else


    '    '        FailureText.Text = "Your attempt to change your Password was unsuccessful.  Please try again."
    '    '        Me.UpdatePanel3.Update()

    '    '    End If
    '    'Catch ex As MembershipPasswordException

    '    '    FailureText.Text = ex.Message
    '    'Catch ex As Exception
    '    '    FailureText.ForeColor = Drawing.Color.Red
    '    '    FailureText.Text = "Your attempt to change your Password was unsuccessful.  Please try again."


    '    '    Me.UpdatePanel3.Update()
    '    'End Try
    '    'End If
    'End Sub

    'Protected Sub ContinuePassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ContinuePassword.Click
    '    Me.ModalPopupExtender4.Hide()
    '    Me.ModalPopupExtender2.Hide()
    '    Me.UpdatePanel3.Update()


    'End Sub

    'Protected Sub PasswordCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles PasswordCustomValidator.ServerValidate
    '    args.IsValid = True


    '    Try

    '        Dim u As MembershipUser = Membership.GetUser(HttpContext.Current.User.Identity.Name)
    '        Dim result As Boolean


    '        result = u.ChangePassword(CurrentPassword.Text, NewPassword.Text)


    '        If (result = True) Then
    '            'FailureText.ForeColor = Drawing.Color.Blue
    '            '  FailureText.Text = "You have successfully changed your Password."
    '            args.IsValid = True
    '        Else
    '            args.IsValid = False
    '        End If

    '    Catch ex As Exception
    '        args.IsValid = False

    '    End Try

    'End Sub

    Protected Sub ExitButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ExitButton.Click
        Me.ModalPopupExtender1.Hide()

    End Sub

    'Protected Function UpdatePassword() As Boolean




    '    Try

    '        Dim u As MembershipUser = Membership.GetUser(HttpContext.Current.User.Identity.Name)
    '        Dim result As Boolean



    '        result = u.ChangePassword(CurrentPassword.Text, NewPassword.Text)
    '        Dim test As String
    '        ' WEB CONFIG IS NOT CONFIGURED FOR PASSWORD RETRIVAL
    '        '' I DID THAT
    '        ' test = u.GetPassword.ToString
    '        'Response.Write(u.GetPassword.ToString)
    '        'Dim test2 As String
    '        ' test2 = NewPassword.Text



    '        Return result


    '    Catch ex As Exception
    '        Return False


    '    End Try



    'End Function
    'Protected Sub CustomValidator1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator1.ServerValidate
    '    args.IsValid = True


    '    Try

    '        Dim u As MembershipUser = Membership.GetUser(HttpContext.Current.User.Identity.Name)
    '        Dim result As Boolean


    '        '' i changed this reundo it
    '        result = u.ChangePassword(u.ResetPassword, NewPassword.Text)


    '        If (result = True) Then
    '            'FailureText.ForeColor = Drawing.Color.Blue
    '            '  FailureText.Text = "You have successfully changed your Password."
    '            args.IsValid = True
    '        Else
    '            args.IsValid = False
    '        End If

    '    Catch ex As Exception
    '        args.IsValid = False

    '    End Try



    'End Sub

    'Protected Sub CustomValidator2_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator2.ServerValidate
    '    args.IsValid = False

    'End Sub

    'Protected Sub OkeyButtonCustom_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles OkeyButtonCustom.Click
    '    Me.ModalPopupExtender2.Show()
    '    Me.UpdatePanel3.Update()

    '    '   Me.ModalPopupExtender6.Hide()
    '    'Me.CurrentPassword.Text = ""
    '    'Me.ConfirmPassword.Text = ""
    '    'Me.NewPassword.Text = ""
    '    'Me.UpdatePanel3.Update()



    'End Sub


    Protected Sub ChangePasswordPushButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.ModalPopupExtender5.Show()

    End Sub







    ''' <summary>
    ''' EVENT TAB PROCEDURES
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub EventCheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EventCheckAll.Click
        EventToggleCheckState(True)
    End Sub

    Protected Sub EventUncheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EventUncheckAll.Click
        EventToggleCheckState(False)
    End Sub

    ''This procedure is used to Check All and Uncheck All Events Button

    Private Sub EventToggleCheckState(ByVal checkState As Boolean)

        ' Iterate through the Products.Rows property
        For Each row As GridViewRow In EventGrid.Rows

            ' Access the CheckBox
            Dim cb As CheckBox = row.FindControl("EventSelectorCheckBox")
            If cb IsNot Nothing Then
                cb.Checked = checkState
            End If
        Next
        Me.ProfileTabContainer.ActiveTabIndex = 0

    End Sub



    Protected Sub EventDeleteButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EventDeleteButton.Click

        Dim atLeastOneRowDeleted As Boolean = False
        ' Iterate through the Products.Rows property

        For Each row As GridViewRow In EventGrid.Rows

            ' Access the CheckBox
            Dim cb As CheckBox = row.FindControl("EventSelectorCheckBox")

            If cb IsNot Nothing AndAlso cb.Checked Then

                ' Delete row! (Well, not really...)
                atLeastOneRowDeleted = True

                ' First, get the ProductID for the selected row
                Dim EventID As Integer = _
                Convert.ToInt32(EventGrid.DataKeys(row.RowIndex).Value)
                ' "Delete" the row


                '... To actually delete the product, use ...
                ' Dim productAPI As New ProductsBLL
                ' productAPI.DeleteProduct(productID)
                '............................................
            End If
        Next

        ''If not CheckBox is Selected
        If atLeastOneRowDeleted = False Then

            ' Define the name and type of the client scripts on the page.
            Dim csname1 As String = "EventDeleteScript"

            Dim cstype As Type = Me.GetType()

            ' Get a ClientScriptManager reference from the Page class.
            Dim cs As ClientScriptManager = Page.ClientScript

            ' Check to see if the startup script is already registered.
            If (Not cs.IsStartupScriptRegistered(cstype, csname1)) Then

                Dim EventError As String = "alert('You have to select at least one event to delete');"
                cs.RegisterStartupScript(cstype, csname1, EventError, True)

            End If
        End If

        Me.ProfileTabContainer.ActiveTabIndex = 0



    End Sub

    ''' EVENT TAB PROCEDURES
    ''''''''''

    Protected Sub ProfessionalImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub

    'Protected Sub UpdatePortfolioLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdatePortfolioLinkButton.Click
    '    ''in the debug tyr to sue another sqldatasource like datasource1 to save the overhead of differnts sqldatasource


    '    Me.SqlDataSource2.UpdateCommand = "UPDATE ProfessionalPortfolio SET About = ' " & Me.AboutTextBox.Text & "' , SpecialNotes = '" & Me.SpecialNotesTextBox.Text & "' WHERE ProID = " & Session("ProID").ToString()
    '    Me.SqlDataSource2.Update()
    '    ' Me.AboutTextBox.DataBind()



    'End Sub

    Protected Sub CancelPortfolioLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        '  Me.SpecialNotesTextBox.Text = ""
        '  Me.AboutTextBox.Text = ""

    End Sub

    'Protected Sub AboutTextBox_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
    '    ' Dim dv As DataView = _
    '    '    CType(Me.SqlDataSource2.Select(DataSourceSelectArguments.Empty), DataView)

    '    'Dim dr as DataRow In dv.Table.Rows
    '    'Label1.Text = dv.Table.Rows(0).Item(9).ToString
    '    'Me.AboutTextBox.Text = dv.Table.Rows(0).Item(2).ToString

    'End Sub

    Protected Sub UpdatePortfolioLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdatePortfolioLinkButton.Click
        ''in the debug tyr to sue another sqldatasource like datasource1 to save the overhead of differnts sqldatasource


        ''IN the FINAL PROCESS, THINK ABOUT ADDING THIS CALL TO A NEW TABLE WHERE USERS ARE PUTTED IN HOLD
        ''BEFORE APPROVAL
        '  Me.LoadingPanel.Visible = True
        '  Me.ModalPopupExtender10.Show()

        Dim AboutTextBox As TextBox = CType(DataList1.Items(0).FindControl("AboutTextBox"), TextBox)

        Dim SpecialNotes As TextBox = CType(DataList1.Items(0).FindControl("SpecialNotesTextBox"), TextBox)


        Me.SqlDataSource2.UpdateCommand = "UPDATE ProfessionalPortfolio SET About = '" & AboutTextBox.Text & "' , SpecialNotes = '" & SpecialNotes.Text & "', Modified = 1 " & " WHERE ProID = " & Session("ProID").ToString()
        Me.SqlDataSource2.Update()


        DataList1.DataBind()






        'Response.Redirect(Request.Url.ToString(), False)

        '  Me.ModalPopupExtender10.Hide()
        '    Me.UpdatePanel10.Update()





        Response.Redirect(Request.Url.ToString(), False)

        'Me.AboutTextBox.DataBind()
    End Sub

    Protected Sub ValidateString()
        'validate string
        ' then add store procedure for sql injecton
        'filter the text from ' ; / " and words like SET, DELETE, 


    End Sub

    Protected Sub CancelPortfolioLinkButton_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelPortfolioLinkButton.Click
        Response.Redirect(Request.Url.ToString(), False)


    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand

        Select Case e.CommandName
            Case Is = "Delete"

                Select Case Convert.ToInt32(Session("messagemode").ToString)
                    Case 0

                        Me.ProfessionalInboxSqlDataSource.DeleteCommand = " DELETE FROM [ProfessionalMessageInbox] WHERE [MessageID] = " & e.CommandArgument.ToString()
                        Me.ProfessionalInboxSqlDataSource.Delete()

                        Me.ProfessionalInboxSqlDataSource.SelectCommand = " SELECT [MessageID], [SenderName], [Date], [Title], [Checked] FROM [ProfessionalMessageInbox] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"


                    Case 1
                        Me.ProfessionalInboxSqlDataSource.DeleteCommand = " DELETE FROM [ProfessionalMessageOutbox] WHERE [MessageID] = " & e.CommandArgument.ToString()
                        Me.ProfessionalInboxSqlDataSource.Delete()

                        Me.ProfessionalInboxSqlDataSource.SelectCommand = " SELECT [MessageID], [SenderName], [Date], [Title], [Checked] FROM [ProfessionalMessageOutbox] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"

                    Case 2
                        Me.ProfessionalInboxSqlDataSource.DeleteCommand = " DELETE FROM [ProfessionalMessageSaved] WHERE [MessageID] = " & e.CommandArgument.ToString()
                        Me.ProfessionalInboxSqlDataSource.Delete()

                        Me.ProfessionalInboxSqlDataSource.SelectCommand = " SELECT [MessageID], [SenderName], [Date], [Title], [Checked] FROM [ProfessionalMessageSaved] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"


                End Select
                Me.GridView1.SelectedIndex = -1
                Me.UpdatePanel4.Update()
                'Me.DetailsView1.DataBind()




        End Select
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        'Me.DetailsView1.DataSource = Me.ProfessionalDetailInobxMessageSqlDataSource

        'Me.DetailsView1.DataBind()
        SelectedMessageID = GridView1.SelectedValue
        UpdateViewedMessage()


        If Session("messagemode") Is Nothing Then
            Session("messagemode") = 0
        End If


        Select Case Convert.ToInt32(Session("messagemode").ToString)
            Case 0
                SaveLinkButton.Visible = True
                ReplyLinkButton.Visible = True
                If (GridView1.SelectedRow.Font.Bold = True) Then

                    Dim k As Integer = NewInbox

                    Dim value As String = Me.InboxLinkButton.Text.Substring(Me.InboxLinkButton.Text.Length - 3, 1)
                    If Not (value Is Nothing Or value Is "") Then
                        Try
                            NewInbox = Convert.ToInt32(value)
                            DecreaseNewInbox()
                        Catch ex As Exception

                        End Try

                    End If

                End If
                Me.ProfessionalInboxSqlDataSource.SelectCommand = " SELECT [MessageID], [SenderName], [Date], [Title], [Checked] FROM [ProfessionalMessageInbox] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"


            Case 1

                SaveLinkButton.Visible = True
                ReplyLinkButton.Visible = True
                Me.ProfessionalDetailInobxMessageSqlDataSource.SelectCommand = "SELECT  [Description] FROM [ProfessionalMessageOutbox] WHERE (([ProID] = @ProID) AND ([MessageID] = @MessageID))"
                Me.DetailsView1.DataBind()
                Me.UpdatePanel4.Update()
            Case 2
                SaveLinkButton.Visible = False
                ReplyLinkButton.Visible = False

                Me.ProfessionalDetailInobxMessageSqlDataSource.SelectCommand = "SELECT  [Description] FROM [ProfessionalMessageSaved] WHERE (([ProID] = @ProID) AND ([MessageID] = @MessageID))"
                Me.DetailsView1.DataBind()
                Me.UpdatePanel4.Update()



        End Select





        ' Me.UpdatePanel4.Update()


    End Sub



    Protected Sub OutboxLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles OutboxLinkButton.Click
        'Me.GridView1.DataSource = Me.ProfessionalOutboxSqlDataSource
        'Me.GridView1.DataBind()
        Session("messagemode") = 1
        Me.ProfessionalInboxSqlDataSource.SelectCommand = " SELECT [MessageID], [SenderName], [Date], [Title], [Checked] FROM [ProfessionalMessageOutbox] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"
        GridView1.DataBind()
        GridView1.SelectedIndex = -1




        SaveLinkButton.Visible = False
        ReplyLinkButton.Visible = False
        ProfileTabContainer.ActiveTabIndex = 3


        Me.UpdatePanel4.Update()
    End Sub


    Protected Sub InboxLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles InboxLinkButton.Click
        Session("messagemode") = 0
        Me.ProfessionalInboxSqlDataSource.SelectCommand = "SELECT [MessageID], [SenderName], [Date], [Title],[Checked] FROM [ProfessionalMessageInbox] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"
        GridView1.DataBind()
        GridView1.SelectedIndex = -1

        Me.UpdatePanel4.Update()
        SaveLinkButton.Visible = False
        ReplyLinkButton.Visible = False
        ' Me.DetailsView1.DataBind()



        'Response.Redirect(Request.Url.ToString)

        ProfileTabContainer.ActiveTabIndex = 3


    End Sub

    Protected Sub UpdateViewedMessage()
        Select Case Convert.ToInt32(Session("messagemode").ToString)
            Case 0
                Me.ProfessionalInboxSqlDataSource.UpdateCommand = "UPDATE [ProfessionalMessageInbox] SET Checked = 0 WHERE [MessageID] = " & SelectedMessageID
                Me.ProfessionalInboxSqlDataSource.Update()
                Me.ProfessionalInboxSqlDataSource.SelectCommand = " SELECT [MessageID], [SenderName], [Date], [Title], [Checked] FROM [ProfessionalMessageInbox] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"


            Case 1
                Me.ProfessionalInboxSqlDataSource.UpdateCommand = "UPDATE [ProfessionalMessageOutbox] SET Checked = 0 WHERE [MessageID] = " & SelectedMessageID
                Me.ProfessionalInboxSqlDataSource.Update()

                Me.ProfessionalInboxSqlDataSource.SelectCommand = " SELECT [MessageID], [SenderName], [Date], [Title], [Checked] FROM [ProfessionalMessageOutbox] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"

            Case 2
                Me.ProfessionalInboxSqlDataSource.UpdateCommand = "UPDATE [ProfessionalMessageSaved] SET Checked = 0 WHERE [MessageID] = " & SelectedMessageID
                Me.ProfessionalInboxSqlDataSource.Update()

                Me.ProfessionalInboxSqlDataSource.SelectCommand = " SELECT [MessageID], [SenderName], [Date], [Title], [Checked] FROM [ProfessionalMessageSaved] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"


        End Select
        GridView1.DataBind()





    End Sub





    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then






            If e.Row.DataItem("Checked").ToString() Then
                e.Row.Font.Bold = True
                NewInbox += 1
                Dim j As String
                'If e.Row.RowState.
                ' j = GridView1.SelectedRow.RowIndex.ToString()

            End If




            'If value = 0 Then
            '    e.Row.Font.Bold = True


            'End If
        End If
    End Sub


    Protected Sub SaveLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        ''THINK ABOUT WHEN THE MESSAGE IS ALREADY SAVED, WE Will use the store prcoedure but only for inpox and outbox
        '' For saved the savelink should be not visible

        Dim UpdateStatement As String
        UpdateStatement = "EXECUTE [SIDEJOBS].[dbo].[SaveProfessionalMessage] " & GridView1.SelectedValue.ToString & "," & Session("messagemode").ToString

        ProfessionalInboxSqlDataSource.UpdateCommandType = SqlDataSourceCommandType.Text

        ProfessionalInboxSqlDataSource.UpdateCommand = UpdateStatement.ToString

        Me.ProfessionalInboxSqlDataSource.Update()

        ''ADD A CONFIRM TEXT BOX AFTER THE SUCESS , AFTER CLEANING UP THE PAGES


        'Response.Write("<script type='javascript'> alert('Message Saved'); </script>")



        ' INSERT INTO ProfessionalMessageInbox
        'SELECT     MessageID, ProID, SenderName, ReceiverName, Date, Title, Description, Checked
        'FROM         ProfessionalMessageSaved
        'WHERE     (MessageID = 35)

        ''You have to saved it 
        'INSERT INTO ProfessionalMessageSaved
        '              (MessageID, ProID, SenderName, ReceiverName, Date, Title, Description, Checked)
        'VALUES(, , , , , , ,1 )
        'Select Case MessageMode
        '    Case 0
        '        Me.ProfessionalInboxSqlDataSource.UpdateCommand = "UPDATE [ProfessionalMessageInbox] SET Checked = 0 WHERE [MessageID] = " & SelectedMessageID

        '    Case 1
        '        Me.ProfessionalInboxSqlDataSource.UpdateCommand = "UPDATE [ProfessionalMessageOutbox] SET Checked = 0 WHERE [MessageID] = " & SelectedMessageID

        '    Case 2
        '        Me.ProfessionalInboxSqlDataSource.UpdateCommand = "UPDATE [ProfessionalMessageSaved] SET Checked = 0 WHERE [MessageID] = " & SelectedMessageID

        'End Select
        'Me.ProfessionalInboxSqlDataSource.Update()
        Me.ModalPopupExtender10.Hide()

    End Sub

    Protected Sub SavedLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SavedLinkButton.Click

        Me.ProfessionalInboxSqlDataSource.SelectCommand = " SELECT [MessageID], [SenderName], [Date], [Title], [Checked] FROM [ProfessionalMessageSaved] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"

        GridView1.DataBind()
        GridView1.SelectedIndex = -1
        Me.DetailsView1.DataBind()
        Me.UpdatePanel4.Update()

        SaveLinkButton.Visible = False
        ReplyLinkButton.Visible = False
        'ProfileTabContainer.ActiveTabIndex = 3


        '  Response.Redirect(Request.Url.ToString(), False)

        Session("messagemode") = 2




    End Sub




    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        If Session("messagemode") Is Nothing Then
            Session("messagemode") = 0
        End If

        If Convert.ToInt32(Session("messagemode").ToString) = 0 Then


            If NewInbox > 0 Then
                InboxLinkButton.Text = "Inbox(" + NewInbox.ToString + ") "
            Else
                InboxLinkButton.Text = "Inbox"

            End If
        End If
    End Sub

    Protected Sub DecreaseNewInbox()
        If Convert.ToInt32(Session("messagemode").ToString) = 0 Then
            NewInbox = NewInbox - 1
            If NewInbox > 0 Then
                InboxLinkButton.Text = "Inbox(" + NewInbox.ToString + ") "
            Else
                InboxLinkButton.Text = "Inbox"
            End If


        End If

    End Sub






    Protected Sub SelectAllButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SelectAllButton.Click
        MessageToggleCheckState(True)

    End Sub


    Private Sub MessageToggleCheckState(ByVal checkState As Boolean)

        ' Iterate through the Products.Rows property
        For Each row As GridViewRow In GridView1.Rows

            ' Access the CheckBox
            Dim cb As CheckBox = row.FindControl("MessageSelectorCheckBox")
            If cb IsNot Nothing Then
                cb.Checked = checkState
            End If
        Next
        Me.ProfileTabContainer.ActiveTabIndex = 3

    End Sub


    Protected Sub DeselectAllButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeselectAllButton.Click
        MessageToggleCheckState(False)
    End Sub

    Protected Sub DeleteButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteButton.Click
        Dim atLeastOneRowDeleted As Boolean = False
        ' Iterate through the Products.Rows property

        Dim numberofmessages As Integer = 0

        ''You have to create an array of integer 
        For Each row As GridViewRow In GridView1.Rows

            ' Access the CheckBox
            Dim cb As CheckBox = row.FindControl("MessageSelectorCheckBox")

            If cb IsNot Nothing AndAlso cb.Checked Then

                ' Delete row! (Well, not really...)
                atLeastOneRowDeleted = True

                ' First, get the ProductID for the selected row
                Dim MessageID As Integer = _
                Convert.ToInt32(GridView1.DataKeys(row.RowIndex).Value)
                ' "Delete" the row

                Select Case Convert.ToInt32(Session("messagemode").ToString)
                    Case 0

                        Me.ProfessionalInboxSqlDataSource.DeleteCommand = " DELETE FROM [ProfessionalMessageInbox] WHERE [MessageID] = " & MessageID.ToString()
                        Me.ProfessionalInboxSqlDataSource.Delete()

                        Me.ProfessionalInboxSqlDataSource.SelectCommand = " SELECT [MessageID], [SenderName], [Date], [Title], [Checked] FROM [ProfessionalMessageInbox] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"


                    Case 1
                        Me.ProfessionalInboxSqlDataSource.DeleteCommand = " DELETE FROM [ProfessionalMessageOutbox] WHERE [MessageID] = " & MessageID.ToString()
                        Me.ProfessionalInboxSqlDataSource.Delete()

                        Me.ProfessionalInboxSqlDataSource.SelectCommand = " SELECT [MessageID], [SenderName], [Date], [Title], [Checked] FROM [ProfessionalMessageOutbox] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"

                    Case 2
                        Me.ProfessionalInboxSqlDataSource.DeleteCommand = " DELETE FROM [ProfessionalMessageSaved] WHERE [MessageID] = " & MessageID.ToString()
                        Me.ProfessionalInboxSqlDataSource.Delete()

                        Me.ProfessionalInboxSqlDataSource.SelectCommand = " SELECT [MessageID], [SenderName], [Date], [Title], [Checked] FROM [ProfessionalMessageSaved] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"


                End Select


                Select Case Convert.ToInt32(Session("messagemode").ToString)
                    Case 0
                        Me.ProfessionalInboxSqlDataSource.SelectCommand = " SELECT [MessageID], [SenderName], [Date], [Title], [Checked] FROM [ProfessionalMessageInbox] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"
                    Case 1
                        Me.ProfessionalInboxSqlDataSource.SelectCommand = " SELECT [MessageID], [SenderName], [Date], [Title], [Checked] FROM [ProfessionalMessageOutbox] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"
                    Case 2
                        Me.ProfessionalInboxSqlDataSource.SelectCommand = " SELECT [MessageID], [SenderName], [Date], [Title], [Checked] FROM [ProfessionalMessageSaved] WHERE ([ProID] = @ProID) ORDER BY [Checked], [Date]"

                End Select

                Me.GridView1.SelectedIndex = -1
                Me.UpdatePanel4.Update()


                'GridTest.Text &= String.Format( _
                '"This would have deleted EventID {0}<br />", EventID)

                '... To actually delete the product, use ...
                ' Dim productAPI As New ProductsBLL
                ' productAPI.DeleteProduct(productID)
                '............................................
            End If
        Next

        ''If not CheckBox is Selected
        If atLeastOneRowDeleted = False Then

            ' Define the name and type of the client scripts on the page.
            Dim csname1 As String = "MessageDeleteScript"

            Dim cstype As Type = Me.GetType()

            ' Get a ClientScriptManager reference from the Page class.
            Dim cs As ClientScriptManager = Page.ClientScript

            ' Check to see if the startup script is already registered.
            If (Not cs.IsStartupScriptRegistered(cstype, csname1)) Then

                Dim EventError As String = "alert('You have to check at least one message to delete');"
                cs.RegisterStartupScript(cstype, csname1, EventError, True)

            End If
        End If

        Me.ProfileTabContainer.ActiveTabIndex = 3


    End Sub

    Protected Sub LinkButton1_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click


        ''DELETE THE ACCOUNT AND RETURN TO THE INDEX PAGE


        ''Delete the virtual directory

        DeleteDirectory()

        ''Membership.DeleteUser(Membership.GetUser.ToString)
        Membership.DeleteUser(Membership.GetUser.ToString)


        ''THEN CALL YOU OWN PROCEDURE


        ''ALSO Delete the virtual directory

        ''If professional roles, think about that too
        ''DETERMINE THE NUMBER OF ROLES IN THE ROLES DROP DOWN
        ''IF MORE THAN 1 , CALL THE DELETE Professional 

        Dim DeleteStatement As String
        DeleteStatement = " EXECUTE [SIDEJOBS].[dbo].[DeleteProfessional] " & Session("ProID").ToString & " , " & RolesDropDownList.Items.Count - 1


        ProfessionalInboxSqlDataSource.UpdateCommandType = SqlDataSourceCommandType.Text

        ProfessionalInboxSqlDataSource.UpdateCommand = DeleteStatement.ToString

        Me.ProfessionalInboxSqlDataSource.Update()

        Response.Redirect("~/NotAuthenticated/index.aspx")






    End Sub

    Protected Sub EventGrid_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Sub DeleteDirectory()
        Dim Username As String = User.Identity.Name

        Dim rootPath As String = Server.MapPath("~/Authenticated/Professional/Images/")

        Dim NewProfessionalDirectory As String = rootPath & Username


        If Directory.Exists(NewProfessionalDirectory) = True Then
            Directory.Delete(NewProfessionalDirectory, True)

        End If


        ''Work
        Dim rootWorkPath As String = Server.MapPath("~/Authenticated/Professional/WorkImages/")

        Dim NewProfessionalWorkDirectory As String = rootWorkPath & Username


        If Directory.Exists(NewProfessionalWorkDirectory) = True Then
            Directory.Delete(NewProfessionalWorkDirectory, True)

        End If

    End Sub

    Protected Sub LinkButton5_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub ProfessionalWorkImageButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)

    End Sub


    Protected Sub ModalPopupExtender2_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ModalPopupExtender2.Load
        PhotoPaths2()
       
        Dim slideshow2 As New AjaxControlToolkit.SlideShowExtender

       
        slideshow2.AutoPlay = True
        slideshow2.Loop = True
        '       ImageTitleLabelID = "Label3"
        '       ImageDescriptionLabelID = "Label2"
        slideshow2.NextButtonID = Me.NextButton2.ID
        slideshow2.PreviousButtonID = Me.PreviousButton2.ID
        slideshow2.PlayButtonID = Me.PlayButton2.ID
        slideshow2.TargetControlID = Me.Image2.ID
        slideshow2.SlideShowServicePath = "ProfessionalSlideWebService.asmx"
        slideshow2.SlideShowServiceMethod = "GetWorkSlides"
        slideshow2.PlayButtonText = "Play"
        slideshow2.StopButtonText = "Stop"
        slideshow2.PlayInterval = 3000


        Me.ModalPopupExtender2.Controls.Add(slideshow2)


    End Sub

    Protected Sub DataList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataList2.SelectedIndexChanged
        ''GET THE SKILL ID
        ''BIND THE VALUE TO THE MODAL EXTENDER
        Dim SKILLID As String
        SKILLID = DataList2.SelectedValue.ToString

        ' Session("SKILLID") = DataList2.SelectedValue.ToString


        'Dim index As Integer = Convert.ToInt32(DataList2.SelectedIndex.ToString)

        ' Dim CategoryName As Label = CType(DataList2.Items(index).FindControl("CategoryNameLabel"), Label)



        Me.SqlDataSource4.SelectParameters(0).DefaultValue = SKILLID.ToString

        Me.SqlDataSource4.DataBind()

        Me.DataList3.DataBind()

        Me.UpdatePanel3.Update()



        Dim dv As DataView = _
                        CType(SqlDataSource4.Select(DataSourceSelectArguments.Empty), DataView)

        Dim SelectedTable As Integer
        ''CategoryID
        SelectedTable = Convert.ToInt32(dv.Table.Rows(0)(1).ToString)


        Me.IndustryDropDownList.SelectedIndex = SelectedTable - 1
        ' Me.IndustryDropDownList.Items(Me.IndustryDropDownList.SelectedIndex).Selected = True

        ''Me.IndustryDropDownList.DataBind()



        ' Me.IndustryDropDownList.SelectedIndex = Convert.ToInt32(dv.Table.Rows(0)(1).ToString)

        '  Me.IndustryDropDownList.Items(Convert.ToInt32(dv.Table.Rows(0)(1).ToString)).Selected = True

        ''Job ID
        SelectedTable = Convert.ToInt32(dv.Table.Rows(0)(2).ToString)

        ''Experience
        SelectedTable = Convert.ToInt32(dv.Table.Rows(0)(5).ToString)

        ''Crew Number
        ' Me.CrewNumberDropDownList.SelectedIndex = Convert.ToInt32(dv.Table.Rows(0)(6).ToString)
        'Me.CrewNumberDropDownList.Items(Convert.ToInt32(dv.Table.Rows(0)(6).ToString)).Selected = True

        ''Licensed
        '   Me.LicensedDropDownList.Items(Convert.ToInt32(dv.Table.Rows(0)(7).ToString)).Selected = True

        'Dim value As Integer = Me.LicensedDropDownList.SelectedIndex

        'If value <> -1 Then
        '    LicensedDropDownList.Items(value).Selected = False
        '    ' LicensedDropDownList.SelectedIndex = 2

        '    LicensedDropDownList.SelectedValue = 2
        '    LicensedDropDownList.DataBind()



        'End If

        ' SelectedTable = Convert.ToInt32(dv.Table.Rows(0)(7).ToString)

        ''Insured
        '    SelectedTable = Convert.ToInt32(dv.Table.Rows(0)(8).ToString)

        ''Relocation
        '  SelectedTable = Convert.ToInt32(dv.Table.Rows(0)(9).ToString)

        'Me.UpdatePanel3.Update()


        Me.ModalPopupExtender3.Show()




    End Sub

    Protected Sub CancelSkillButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelSkillButton.Click
        Me.ModalPopupExtender3.Hide()
        Session("NEWSKILLS") = False

    End Sub



    Protected Sub LinkButton4_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ''ADD THE NEW SKILLS

        'GET THE NUMBER OF SKILLS
        Dim numberofskills As Integer = 0
        numberofskills = DataList2.Items.Count

        If numberofskills >= 5 Then



            Me.ModalPopupExtender14.Show()
            Me.UpdatePanel9.Update()





            '' Define the name and type of the client scripts on the page.
            'Dim csname5 As String = "SkillScript"

            'Dim cstype2 As Type = Me.GetType()

            '' Get a ClientScriptManager reference from the Page class.
            'Dim cs As ClientScriptManager = Page.ClientScript

            '' Check to see if the startup script is already registered.
            'If (Not cs.IsStartupScriptRegistered(cstype2, csname5)) Then

            '    Dim SkillError As String = "alert('You are allowed 5 skills');"
            '    cs.RegisterStartupScript(cstype2, csname5, SkillError, True)

            'End If





            '  UpdatePanel7.Update()

            'Dim clientScriptManager As ClientScriptManager = Page.ClientScript
            'Dim sb As StringBuilder = New StringBuilder()

            'sb.Append("<script language='javascript'>")
            'sb.Append("alert('hello');")
            'sb.Append("<")
            'sb.Append("/script>")

            'If (Not clientScriptManager.IsClientScriptBlockRegistered("ColorScript")) Then
            '    clientScriptManager.RegisterClientScriptBlock(Me.GetType(), "ColorScript", sb.ToString())
            'End If





        Else
            Me.IndustryDropDownList.SelectedIndex = 0

            ''DEFAULT SKILLID = 1

            Me.SqlDataSource4.SelectParameters(0).DefaultValue = "1"

            Me.SqlDataSource4.DataBind()

            Me.ModalPopupExtender3.Show()
            Session("NEWSKILLS") = True



        End If

    End Sub

    Protected Sub SaveSkillButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SaveSkillButton.Click
        ''SAVE THE SKILLS 
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

        '' The first list box
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


        ''experience

        Dim list As DropDownList = CType(Me.DataList3.Items(0).FindControl("ExperienceDropDownList"), DropDownList)

        Dim SelectedExperience As String = list.SelectedIndex.ToString

        list = Nothing


        ''crew number
        list = CType(Me.DataList3.Items(0).FindControl("CrewNumberDropDownList"), DropDownList)

        Dim SelectedCrewNumber As String = list.SelectedIndex.ToString

        list = Nothing



        ''Licensed
        list = CType(Me.DataList3.Items(0).FindControl("LicensedDropDownList"), DropDownList)

        Dim SelectedLicensed As String = list.SelectedIndex.ToString

        list = Nothing


        ''Insured

        list = CType(Me.DataList3.Items(0).FindControl("InsuredDropDownList"), DropDownList)

        Dim SelectedInsured As String = list.SelectedIndex.ToString

        list = Nothing


        ''Relocation

        list = CType(Me.DataList3.Items(0).FindControl("RelocationDropDownList"), DropDownList)

        Dim SelectedRelocation As String = list.SelectedIndex.ToString

        list = Nothing




        If Session("NEWSKILLS") = False Then
            ''UPDATE


            ''DEPENDING ON THE LANGUAGES CHECK FROM THE TABLES

            ''Update all the pages where the use of LCID is used


            ''SkillID
            Dim SelectedSkillID As String = DataList2.SelectedValue.ToString

            Dim UpdateStatement As String

            UpdateStatement = " EXECUTE [SIDEJOBS].[dbo].[UpdateSkill] " + SelectedSkillID.ToString + ", "
            UpdateStatement += SelectedCategory.ToString + ", " + SelectedJobID.ToString + ", "
            UpdateStatement += SelectedExperience.ToString + ", " + SelectedCrewNumber.ToString + ", "
            UpdateStatement += SelectedLicensed.ToString + ", " + SelectedInsured.ToString + ", "
            UpdateStatement += SelectedRelocation.ToString + ", " + LanguageID.ToString


            SqlDataSource4.UpdateCommandType = SqlDataSourceCommandType.Text
            SqlDataSource4.UpdateCommand = UpdateStatement.ToString
            SqlDataSource4.Update()

            DataList2.DataBind()
            Me.UpdatePanel7.Update()


            Me.ModalPopupExtender3.Hide()











        Else

            ''ADD NEW SKILL



            Dim UpdateStatement As String
            UpdateStatement = " EXECUTE [SIDEJOBS].[dbo].[AddSKILL] " + Session("ProID").ToString + ", "
            UpdateStatement += SelectedCategory.ToString + ", " + SelectedJobID.ToString + ", "
            UpdateStatement += SelectedExperience.ToString + ", " + SelectedCrewNumber.ToString + ", "
            UpdateStatement += SelectedLicensed.ToString + ", " + SelectedInsured.ToString + ", "
            UpdateStatement += SelectedRelocation.ToString + ", " + LanguageID.ToString


            SqlDataSource4.UpdateCommandType = SqlDataSourceCommandType.Text
            SqlDataSource4.UpdateCommand = UpdateStatement.ToString
            SqlDataSource4.Update()

            DataList2.DataBind()

            Me.ModalPopupExtender3.Hide()



        End If





    End Sub




    Protected Sub DeleteSkillButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles DeleteSkillButton.Click
        Dim DeleteStatement As String
        DeleteStatement = "EXECUTE [SIDEJOBS].[dbo].[DeleteSKill] " + Session("ProID").ToString + ", " + DataList2.SelectedValue.ToString

        SqlDataSource4.DeleteCommandType = SqlDataSourceCommandType.Text
        SqlDataSource4.DeleteCommand = DeleteStatement.ToString
        SqlDataSource4.Delete()


        DataList2.DataBind()
        Me.ModalPopupExtender3.Hide()

    End Sub

    Protected Sub SkillHideButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SkillHideButton.Click
        Me.ModalPopupExtender14.Hide()
        Me.UpdatePanel9.Update()


    End Sub

    Protected Sub Exit2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Exit2.Click
        Me.ModalPopupExtender2.Hide()

    End Sub

    'Protected Sub PostProjectLink_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles PostProjectLink.Click

    '    AddNewProject()

    'End Sub




    Protected Sub AddNewProject()

        'Create a connection
        Dim ProfileConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("SideJobConnectionString").ConnectionString)
        ProfileConnection.Open()


        'Start the transaction    
        Dim ProfileTransaction As SqlTransaction = ProfileConnection.BeginTransaction()


        Try
            Dim ProfileCommand As New SqlCommand("AddProject", ProfileConnection, ProfileTransaction)
            ProfileCommand.CommandType = CommandType.StoredProcedure




            ''POSTER ID IS THE PRO ID
            ''PROJECT ID WHICH WILL BE USED IN THE SESSION WILL BE RETURNED BY THE STORE PROCEDURE

            '@PosterID int,'
            ''@PosterRole char(3) PRO ,
            '' @LCID int,


            ''@JobID int,
            ''@CategoryID int,
            ''@ExperienceID int,
            ''@CrewnumberID int,
            ''@LicensedID int,
            ''@InsuredID int,
            ''@RelocationID int,


            ''CHANGE THIS TO CUSTOMER ID IN THE CUSTOMERPOSTING THE PROJECT

            Dim PosterID As New SqlParameter("@PosterID", SqlDbType.Int)

            PosterID.Value = Session("ProID").ToString

            ProfileCommand.Parameters.Add(PosterID)


            Dim PosterRole As New SqlParameter("@PosterRole", SqlDbType.Char, 3)

            PosterRole.Value = "PRO"

            ProfileCommand.Parameters.Add(PosterRole)


            Dim LanguageID As Integer
            Dim Language As String

            Language = Session("Language")

            If Language Is Nothing Or Language = "" Then
                LanguageID = 1
            Else
                LanguageID = CInt(Language)

            End If


            Dim LCID As New SqlParameter("@LCID", SqlDbType.Int)

            LCID.Value = LanguageID.ToString

            ProfileCommand.Parameters.Add(LCID)


            Dim JobID As New SqlParameter("@JobID", SqlDbType.Int)

            JobID.Value = "1"

            ProfileCommand.Parameters.Add(JobID)



            Dim CategoryID As New SqlParameter("@CategoryID", SqlDbType.Int)

            CategoryID.Value = "1"

            ProfileCommand.Parameters.Add(CategoryID)



            Dim ExperienceID As New SqlParameter("@ExperienceID", SqlDbType.Int)



            ExperienceID.Value = "1"


            ProfileCommand.Parameters.Add(ExperienceID)




            Dim CrewnumberID As New SqlParameter("@CrewnumberID", SqlDbType.Int)



            CrewnumberID.Value = "1"


            ProfileCommand.Parameters.Add(CrewnumberID)




            Dim LicensedID As New SqlParameter("@LicensedID", SqlDbType.Int)



            LicensedID.Value = "1"


            ProfileCommand.Parameters.Add(LicensedID)




            Dim InsuredID As New SqlParameter("@InsuredID", SqlDbType.Int)

 
            InsuredID.Value = "1"


            ProfileCommand.Parameters.Add(InsuredID)




            Dim RelocationID As New SqlParameter("@RelocationID", SqlDbType.Int)


            RelocationID.Value = "1"



            ProfileCommand.Parameters.Add(RelocationID)




            ''  @ProjectTitle nvarchar(100),
            ''@StartDate	smalldatetime, 
            ''@EndDate	smalldatetime, 
            ''@AmountOffered	float,	
            ''@CurrencyID	int, 
            ''@Description	ntext, 
            ''@SpecialNotes	ntext,
            ''@DatePosted smalldatetime,




            Dim ProjectTitle As New SqlParameter("@ProjectTitle", SqlDbType.NVarChar, 100)

            ProjectTitle.Value = ""

            ProfileCommand.Parameters.Add(ProjectTitle)


            Dim StartDate As New SqlParameter("@StartDate", SqlDbType.SmallDateTime)

            StartDate.Value = System.DateTime.Today.ToShortDateString.ToString()

            ProfileCommand.Parameters.Add(StartDate)


            Dim EndDate As New SqlParameter("@EndDate", SqlDbType.SmallDateTime)

            EndDate.Value = System.DateTime.Today.AddDays(1).ToShortDateString.ToString()


            ProfileCommand.Parameters.Add(EndDate)


            Dim AmountOffered As New SqlParameter("@AmountOffered", SqlDbType.Float)

            AmountOffered.Value = "0.00"

            ProfileCommand.Parameters.Add(AmountOffered)


            Dim CurrencyID As New SqlParameter("@CurrencyID", SqlDbType.Int)

            CurrencyID.Value = "1"

            ProfileCommand.Parameters.Add(CurrencyID)


            Dim Description As New SqlParameter("@Description", SqlDbType.NText)

            Description.Value = ""

            ProfileCommand.Parameters.Add(Description)


            Dim SpecialNotes As New SqlParameter("@SpecialNotes", SqlDbType.NText)

            SpecialNotes.Value = ""

            ProfileCommand.Parameters.Add(SpecialNotes)


            Dim DatePosted As New SqlParameter("@DatePosted", SqlDbType.SmallDateTime)

            DatePosted.Value = System.DateTime.Today.ToShortDateString.ToString()

            ProfileCommand.Parameters.Add(DatePosted)


            Dim ProjectResult As New SqlParameter("@Project", SqlDbType.Int)


            'IMPORTANT - must set Direction as Output
            ProjectResult.Direction = ParameterDirection.Output
            ProjectResult.Value = 0

            'Finally, add the parameter to the Command's Parameters collection
            ProfileCommand.Parameters.Add(ProjectResult)




            '    Call the store procedure
            Dim reader As SqlDataReader = ProfileCommand.ExecuteReader()


            'Now you can grab the output parameter's value...
            Dim Result As Integer = Convert.ToInt32(ProjectResult.Value)

            Session("ProjectID") = Result.ToString



            reader.Close()

            'Now you can grab the output parameter's value...


            '    If we reach here, all command succeeded, so commit the transaction
            ProfileTransaction.Commit()



            'Me.CreateUserWizard1.ContinueDestinationPageUrl = "~/Authoniticated/Customer/CustomerProfile.aspx"
        Catch ex As Exception
            '    Something went wrong, so rollback the transaction
            '    ProfileTransaction.Rollback()

            Throw        'Bubble up the exception
            ''maybe over here 
            Response.Redirect(Request.Url.ToString)

        Finally

            ProfileConnection.Close() 'Finally, close the connection
            Response.Redirect("PostProject.aspx")

        End Try

    End Sub

    Protected Sub LinkButton15_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton15.Click
        AddNewProject()


    End Sub

    Protected Sub GridView2_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        Select Case e.CommandName.ToString
            Case "delete"
                Me.ProjectSqlDataSource.DeleteParameters("ProjectID").DefaultValue = GridView2.SelectedPersistedDataKey.Value.ToString
                Me.ProjectSqlDataSource.DeleteParameters("PosterID").DefaultValue = Session("ProID").ToString
                Me.ProjectSqlDataSource.DeleteParameters("PosterRole").DefaultValue = "PRO"
                Me.ProjectSqlDataSource.Delete()


        End Select
    End Sub

    Protected Sub LinkButton6_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("ProjectID") = GridView2.SelectedDataKey.Value.ToString
        Response.Redirect("PostProject.aspx")


    End Sub
End Class