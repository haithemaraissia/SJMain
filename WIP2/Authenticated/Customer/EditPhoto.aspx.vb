
Partial Class EditPhoto
    Inherits System.Web.UI.Page

    Protected Sub SaveLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cb As TextBox = Me.PhotoDetailsView.Rows(0).FindControl("CaptionTextBox")
        Dim newCaption As String = cb.Text
        CustomerPhotoObjectDataSource.UpdateParameters(0).DefaultValue = Convert.ToInt32(Me.PhotoDetailsView.DataKey(0).ToString)
        CustomerPhotoObjectDataSource.UpdateParameters(1).DefaultValue = newCaption.ToString()
        CustomerPhotoObjectDataSource.update()
        PhotoUpdatePanel.Update()
        Me.DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub CancelLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        PhotoUpdatePanel.Update()
        Response.Redirect("CustomerProfile.aspx")
    End Sub

    Protected Sub DeleteLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        DeletePhotoModalPopUpExtender.Show()
    End Sub

    Protected Sub ConfirmButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ConfirmButton.Click
        CustomerPhotoObjectDataSource.DeleteParameters(1).DefaultValue = Convert.ToInt32(Me.PhotoDetailsView.DataKey(0).ToString)
        CustomerPhotoObjectDataSource.delete()
        PhotoUpdatePanel.Update()
        UpdatePrimaryImage()
    End Sub

    Protected Sub CancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelButton.Click
        DeletePhotoModalPopUpExtender.Hide()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            Dim user As MembershipUser = Membership.GetUser
            Dim role As String = Me.User.IsInRole("Customer").ToString

            If user Is Nothing Or Session("CustomerID") Is Nothing Then
                Response.Redirect("~/NotAuthenticated/SignIn.aspx")
            End If
        End If
    End Sub

    Protected Sub UpdatePrimaryImage()
        Dim PrimaryPhotoMaintenance As New CustomerPhotoDataSetTableAdapters.QueriesTableAdapter
        PrimaryPhotoMaintenance.CustomerPrimaryImageMaintenance(Session("CustomerId").ToString)
    End Sub
End Class
