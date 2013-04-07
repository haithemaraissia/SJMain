Imports System.Data.SqlClient
Imports System.Data
Partial Class Authenticated_Admin_AdminTest
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        TimeUP()

        Maintenance()

    End Sub


    Protected Sub TimeUP()
        'Create a connection

        Dim ProfileConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("SideJobConnectionString").ConnectionString)
        ProfileConnection.Open()


        'Start the transaction    
        Dim ProfileTransaction As SqlTransaction = ProfileConnection.BeginTransaction()

        Try

            Dim ProfileCommand As New SqlCommand("TimeUP", ProfileConnection, ProfileTransaction)
            ProfileCommand.CommandType = CommandType.StoredProcedure

            Dim reader As SqlDataReader = ProfileCommand.ExecuteReader()
            reader.Close()
            ProfileTransaction.Commit()


        Catch ex As Exception
            '    Something went wrong, so rollback the transaction
            '    ProfileTransaction.Rollback()

            Throw        'Bubble up the exception
            ''maybe over here 
            Response.Redirect(Request.Url.ToString)


        Finally

            ProfileConnection.Close() 'Finally, close the connection
        End Try

    End Sub

    Protected Sub Maintenance()

        Dim ProjectsAdapter As New CompleteProjectTableAdapters.ProjectCompleteTableAdapter
        ''BidderEmail
        Dim BidderEmail As CompleteProject.ProjectCompleteDataTable
        BidderEmail = ProjectsAdapter.BidderEmail

        For Each BidderRow As CompleteProject.ProjectCompleteRow In BidderEmail
            'Label1.Text += "ProjectID: " & BidderRow.ProjectID & "<br />"
            'Label1.Text += "ProjectID: " & BidderRow.ProjectID & "<br />"
            'Label1.Text += "BidderID: " & BidderRow.BidderID & "<br />"
            'Label1.Text += "BidderRole: " & BidderRow.BidderRole & "<br />"

            ProjectsAdapter.UpdateProjectConfirmation(BidderRow.ProjectID, 0)


            'UPDATE THE ProjectComplete

            ''UpdateProjectConfirmation(@ProjectID,0)
        Next


        ''PosterEmail

        Dim PosterEmail As CompleteProject.ProjectCompleteDataTable
        PosterEmail = ProjectsAdapter.PosterEmail

        For Each PosterRow As CompleteProject.ProjectCompleteRow In PosterEmail
            'Label2.Text += "ProjectID: " & PosterRow.ProjectID & "<br />"
            'Label2.Text += "PosterID: " & PosterRow.PosterID & "<br />"
            'Label2.Text += "PosterRole: " & PosterRow.PosterRole & "<br />"

            ProjectsAdapter.UpdateProjectConfirmation(PosterRow.ProjectID, 2)


        Next


        ''Contract


        Dim ContractEmail As CompleteProject.ProjectCompleteDataTable
        ContractEmail = ProjectsAdapter.GenerateContract

        For Each ContractRow As CompleteProject.ProjectCompleteRow In ContractEmail
            'Label3.Text += "ProjectID: " & ContractRow.ProjectID & "<br />"
            'Label3.Text += "BidderID: " & ContractRow.BidderID & "<br />"
            'Label3.Text += "BidderRole: " & ContractRow.BidderRole & "<br />"
            'Label3.Text += "PosterID: " & ContractRow.PosterID & "<br />"
            'Label3.Text += "PosterRole: " & ContractRow.PosterRole & "<br />"

            ProjectsAdapter.UpdateProjectConfirmation(ContractRow.ProjectID, 4)


        Next

        EmailAutomation()



    End Sub

    Protected Sub EmailAutomation()
        ''SEND THE EMAIL

        Dim EmailAdapter As New AutomateEmailTableAdapters.AutomatedMessageTableAdapter

        Dim EmailTable As AutomateEmail.AutomatedMessageDataTable

        EmailTable = EmailAdapter.GetEmail
        'Dim i As Integer = 0
        For Each EmailRow As AutomateEmail.AutomatedMessageRow In EmailTable

            'Dim EmailAddress As String = EmailRow.EmailAddress.ToString
            'Dim Title As String = EmailRow.Title.ToString
            'Dim Message As String = EmailRow.Message.ToString
            


            Dim mailMessage As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage()
            mailMessage.From = New System.Net.Mail.MailAddress("SideJobs@yahoo.com")
            mailMessage.To.Add(New System.Net.Mail.MailAddress(EmailRow.EmailAddress.ToString))
            mailMessage.Subject = EmailRow.Title.ToString
            mailMessage.Body = EmailRow.Message.ToString
            mailMessage.Priority = Net.Mail.MailPriority.High

            Try
                Dim smtpClient As System.Net.Mail.SmtpClient = New System.Net.Mail.SmtpClient()
                smtpClient.Send(mailMessage)

                'Catch smtpEx As System.Net.Mail.SmtpFailedRecipientsException
                '    ''REDO THIS TO CATCH THE ERRORS
                '    ''INSERT INTO DATABASE
                '    Response.Write(smtpEx.Message.ToString)


            Catch ex As Exception
                ''INSERT INTO DATABASE

                Dim EmailErorAdapter As New AutomateEmailProblemTableAdapters.AutomationEmailProblemTableAdapter
                'If DBNull(EmailRow.EmailAddress) Then
                '    EmailRow.EmailAddress = ""
                'End If
                'If IsDBNull(EmailRow.Title) Then
                '    EmailRow.Title = ""
                'End If

                'If IsDBNull(EmailRow.Message) Then
                '    EmailRow.Message = ""
                'End If


                'Dim EmailAddress As String = Convert.ToString(EmailRow.EmailAddress)
                'Dim title As String = Convert.ToString(EmailRow.Title)
                'Dim Message As String = Convert.ToString(EmailRow.Message)

                EmailErorAdapter.InsertEmail(EmailRow.MessageID, EmailRow.EmailAddress, EmailRow.Title, EmailRow.Message)


                ' Response.Write(ex.Message.ToString)


            End Try
        Next

        ' Response.Write(i.ToString)


        ''delete the email table 
        EmailAdapter.DeleteMessage()


    End Sub
End Class
