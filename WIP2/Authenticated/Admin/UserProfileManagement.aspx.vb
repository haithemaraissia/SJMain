
Partial Class Authenticated_Admin_UserProfileManagement
    Inherits Page

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs) _
        Handles GridView1.RowCommand
        Select Case e.CommandName
            Case "AcceptChange"
                Dim k As String = GridView1.DataKeys(e.CommandArgument.ToString).Value.ToString
                UpdateCustomerPortfolio(k)
        End Select
    End Sub

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As GridViewRowEventArgs) _
        Handles GridView1.RowCreated
        ''The GridViewCommandEventArgs class does not contain a 
        '' property that indicates which row's command button was
        ''clicked. To identify which row's button was clicked, use 
        '' the button's CommandArgument property by setting it to the 
        '' row's index.

        If e.Row.RowType = DataControlRowType.DataRow Then
            CType((e.Row.Cells(0).FindControl("Button1")), Button).CommandArgument = e.Row.RowIndex.ToString()
        End If
    End Sub


    Protected Sub UpdateCustomerPortfolio(ByVal CustomerID As String)
        Dim UpdatePortfolio As String
        UpdatePortfolio = " UPDATE CustomerPortfolio SET Modified = 0 WHERE CustomerID = " & CustomerID.ToString
        SqlDataSource1.UpdateCommand = UpdatePortfolio
        SqlDataSource1.Update()
    End Sub


    Protected Sub GridView2_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView2.RowCommand
        Select Case e.CommandName
            Case "AcceptChange"
                Dim k As String = GridView2.DataKeys(e.CommandArgument.ToString).Value.ToString
                UpdateProfessionalPortfolio(k)
        End Select
    End Sub

    Protected Sub GridView2_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles GridView2.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            CType((e.Row.Cells(0).FindControl("Button2")), Button).CommandArgument = e.Row.RowIndex.ToString()
        End If
    End Sub

    Protected Sub UpdateProfessionalPortfolio(ByVal ProID As String)
        Dim UpdatePortfolio As String
        UpdatePortfolio = " UPDATE ProfessionalPortfolio SET Modified = 0 WHERE ProID = " & ProID.ToString
        SqlDataSource2.UpdateCommand = UpdatePortfolio
        SqlDataSource2.Update()
    End Sub
End Class
