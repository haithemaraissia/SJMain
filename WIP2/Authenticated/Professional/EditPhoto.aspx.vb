
Partial Class EditPhoto
    Inherits System.Web.UI.Page

    Protected Sub SaveLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cb As TextBox = Me.PhotoDetailsView.Rows(0).FindControl("CaptionTextBox")
        Dim newCaption As String = cb.Text
        ProfessionalPhotoObjectDataSource.UpdateParameters(0).DefaultValue = Convert.ToInt32(Me.PhotoDetailsView.DataKey(0).ToString)
        ProfessionalPhotoObjectDataSource.UpdateParameters(1).DefaultValue = newCaption.ToString()
        ProfessionalPhotoObjectDataSource.Update()
        PhotoUpdatePanel.Update()
        Me.DelayModalPopUpExtender.Hide()
        UpdatePrimaryImage()
    End Sub

    Protected Sub CancelLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        PhotoUpdatePanel.Update()
        Response.Redirect("ProfessionalProfile.aspx")
    End Sub

    Protected Sub DeleteLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        DeletePhotoModalPopUpExtender.Show()
    End Sub

    Protected Sub ConfirmButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ConfirmButton.Click
        ProfessionalPhotoObjectDataSource.DeleteParameters(1).DefaultValue = Convert.ToInt32(Me.PhotoDetailsView.DataKey(0).ToString)
        ProfessionalPhotoObjectDataSource.Delete()
        PhotoUpdatePanel.Update()
        UpdatePrimaryImage()
    End Sub

    Protected Sub CancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelButton.Click
        DeletePhotoModalPopUpExtender.Hide()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            Dim user As MembershipUser = Membership.GetUser
            Dim role As String = Me.User.IsInRole("Professional").ToString

            If user Is Nothing Or Session("ProfessionalID") Is Nothing Then
                Response.Redirect("~/NotAuthenticated/SignIn.aspx")
            End If
        End If
    End Sub

    Protected Sub UpdatePrimaryImage()
        Dim PrimaryPhotoMaintenance As New ProfessionalPhotoDataSetTableAdapters.QueriesTableAdapter
        PrimaryPhotoMaintenance.ProfessionalPrimaryImageMaintenance(Session("ProfessionalID").ToString)
    End Sub

End Class
