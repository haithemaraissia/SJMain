
Partial Class Authenticated_Admin_UserProfileManagement
    Inherits System.Web.UI.Page

   
    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        Select Case e.CommandName
            Case "AcceptChange"

                'Dim j As String = e.CommandArgument.ToString

                '  Dim k As String = GridView1.DataKeys(e.CommandArgument.ToString).Value.ToString
                '   Dim t As String = GridView1.DataKeys(GridView1.Row.RowIndex.ToString())
                ' AcceptProject(k)

                'SqlDataSource1.DeleteParameters(0).DefaultValue = GridView1.SelectedPersistedDataKey.Value.ToString
                'SqlDataSource1.Delete()
                'GridView1.DataBind()

                'UpdatePanel1.Update()



        End Select

    End Sub

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        ''The GridViewCommandEventArgs class does not contain a 
        '' property that indicates which row's command button was
        ''clicked. To identify which row's button was clicked, use 
        '' the button's CommandArgument property by setting it to the 
        '' row's index.

        'If e.Row.RowType = DataControlRowType.DataRow Then
        '    CType((e.Row.Cells(0).FindControl("Button1")), Button).CommandArgument = e.Row.RowIndex.ToString()
        'End If




    End Sub


    'Protected Sub AcceptProject(ByVal ProjectID As String)
    '    Dim UpdatePortfolio As String
    '    UpdatePortfolio = " UPDATE CustomerPortfolio SET Modified = 0 WHERE CustomerID = " & CustomerID.ToString
    '    SqlDataSource1.UpdateCommand = UpdatePortfolio
    '    SqlDataSource1.Update()


    'End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        SqlDataSource1.DeleteParameters(0).DefaultValue = GridView1.SelectedPersistedDataKey.Value.ToString
        SqlDataSource1.Delete()
        GridView1.DataBind()




    End Sub
End Class
