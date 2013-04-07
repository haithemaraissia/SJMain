Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System
Imports System.Web.Security
Imports System.Configuration


Public Class CustomerClass
    Inherits System.Web.UI.Page
    Private UserIDGuid As String
    Private CustomerID As String
    Private NumberofEvents As String




    Public Sub test()
        ' Response.Write("Test Class")

    End Sub

    'Public Function Test2(ByVal i As Integer)
    '    '  Response.Write("Test2" & i)
    '    Dim j As Integer = 3
    '    Return i

    'End Function

    Public Function GetUserID() As String
        Dim guidStringUser As Guid = New Guid(Membership.GetUser.ProviderUserKey().ToString)
        Dim UserID As String = guidStringUser.ToString

        ' Response.Write("Test3" & UserID)
        UserIDGuid = guidStringUser.ToString
        Return UserID
    End Function



    Public Function GetCustomerID() As Integer


        'Create a  connection
        Dim ProfileConnection2 As New SqlConnection(ConfigurationManager.ConnectionStrings("SideJobConnectionString").ConnectionString)

        ''open the connection
        ProfileConnection2.Open()

        'Start the transaction    
        Dim ProfileTransaction2 As SqlTransaction = ProfileConnection2.BeginTransaction()

        Dim UserID As String
        UserID = GetUserID()

        Try
            Trace.Warn("this statement is excuted")
            ''SQl String
            'Const strSQL As String = "SELECT TOP(1) CustomerID FROM Customer"
            Dim strSQL As String = "SELECT CustomerId FROM LookUpRoles WHERE Userid = '" & UserID & "'"
            ' Dim myCommand As New SqlCommand(strSQL, ProfileConnection)

            Dim ProfileCommand As New SqlCommand(strSQL, ProfileConnection2, ProfileTransaction2)
            ProfileCommand.CommandType = CommandType.Text

            '    Call the store procedure
            ''reader does not give you back result
            Dim reader As SqlDataReader = ProfileCommand.ExecuteReader()

            reader.Read()

            CustomerID = reader("CustomerID")

            ''3. Create parameters
            'Dim paramUsername As SqlParameter
            'paramUsername = New SqlParameter("@Username", SqlDbType.VarChar, 25)
            'paramUsername.Value = txtUsername.Text
            'objCmd.Parameters.Add(paramUsername)


            ''    Now you can grab the output parameter's value...
            reader.Close()


            '    If we reach here, all command succeeded, so commit the transaction
            ProfileTransaction2.Commit()


        Catch ex As Exception
            '    Something went wrong, so rollback the transaction
            '    ProfileTransaction.Rollback()

            Throw        'Bubble up the exception
            Response.Redirect("index.aspx")
        Finally

            ProfileConnection2.Close() 'Finally, close the connection
        End Try

        'Response.Write(" Customer ID is" & CustomerID)
        Return Integer.Parse(CustomerID)


    End Function


    Public Sub BlockIntruder()
        Dim user As MembershipUser = Membership.GetUser

        If user Is Nothing Then
            'Throw New ApplicationException("Can't find the user.")
            Response.Redirect("index.aspx")
        End If

    End Sub


    Public Function CustomerNumberofEvents() As Integer

        'Create a  connection
        Dim ProfileConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("SideJobConnectionString").ConnectionString)

        ''open the connection
        ProfileConnection.Open()

        'Start the transaction    
        Dim ProfileTransaction As SqlTransaction = ProfileConnection.BeginTransaction()



        Dim customerIDinteger As Integer
        customerIDinteger = GetCustomerID()

        Try
            ''SQl String
            Dim strSQL As String = "SELECT [NumberofEvents] FROM [CustomerEvent] WHERE [CustomerID] = " & customerIDinteger
            ' Dim myCommand As New SqlCommand(strSQL, ProfileConnection)

            Dim ProfileCommand As New SqlCommand(strSQL, ProfileConnection, ProfileTransaction)
            ProfileCommand.CommandType = CommandType.Text

            '    Call the store procedure
            ''reader does not give you back result
            Dim reader As SqlDataReader = ProfileCommand.ExecuteReader()

            reader.Read()

            NumberofEvents = reader("NumberofEvents")

            ''3. Create parameters
            'Dim paramUsername As SqlParameter
            'paramUsername = New SqlParameter("@Username", SqlDbType.VarChar, 25)
            'paramUsername.Value = txtUsername.Text
            'objCmd.Parameters.Add(paramUsername)


            ''    Now you can grab the output parameter's value...
            reader.Close()


            '    If we reach here, all command succeeded, so commit the transaction
            ProfileTransaction.Commit()


        Catch ex As Exception
            '    Something went wrong, so rollback the transaction
            '    ProfileTransaction.Rollback()

            Throw        'Bubble up the exception
            Response.Redirect("index.aspx")
        Finally

            ProfileConnection.Close() 'Finally, close the connection
        End Try

        'Response.Write(" Customer ID is" & CustomerID)
        Return Integer.Parse(NumberofEvents)

    End Function

End Class
