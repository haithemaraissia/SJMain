
Partial Class _EditAlbum
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            Dim user As MembershipUser = Membership.GetUser
            Dim role As String = Me.User.IsInRole("Professional").ToString

            If user Is Nothing Or Session("ProfessionalID") Is Nothing Then
                Response.Redirect("~/NotAuthenticated/SignIn.aspx")
            End If
        End If
    End Sub

    '''''''''''''''''''''''''''''''''''''''''Photo'''''''''''''''''''''''''''''''''''''''''''

    Protected Sub PhotoDataList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        PhotoObjectDataSource.SelectParameters.Item(0).DefaultValue = PhotoDataList.SelectedValue.ToString
        PhotoObjectDataSource.Select()
        EditPhotoDetailView.DataBind()
        EditPhotoModalPopUpExtender.Show()

    End Sub

    Protected Sub SaveLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim cb As TextBox = Me.EditPhotoDetailView.Rows(0).FindControl("CaptionTextBox")
        Dim newCaption As String = cb.Text
        Dim SelectedPhotoID As Integer = Convert.ToInt32(Me.EditPhotoDetailView.DataKey(0).ToString)

        PhotoObjectDataSource.UpdateParameters(0).DefaultValue = PhotoDataList.SelectedValue.ToString
        PhotoObjectDataSource.UpdateParameters(1).DefaultValue = newCaption.ToString
        PhotoObjectDataSource.Update()

        PhotoDataList.DataBind()
        PhotoUpdatePanel.Update()
        EditPhotoModalPopUpExtender.Hide()
        UpdatePrimaryImage()

    End Sub

    Protected Sub CancelLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        EditPhotoModalPopUpExtender.Hide()
    End Sub

    Protected Sub DeleteLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        EditPhotoModalPopUpExtender.Hide()
        PhotoObjectDataSource.DeleteParameters(0).DefaultValue = Session("ProfessionalID").ToString
        PhotoObjectDataSource.DeleteParameters(1).DefaultValue = PhotoDataList.SelectedValue.ToString
        PhotoObjectDataSource.Delete()
        PhotoDataList.DataBind()
        PhotoUpdatePanel.Update()
        EditAlbumUpdatePanel.Update()
        UpdatePrimaryImage()

    End Sub

    '''''''''''''''''''''''''''''''''''''''''Photo'''''''''''''''''''''''''''''''''''''''''''

    '''''''''''''''''''''''''''''''''''''''''Album'''''''''''''''''''''''''''''''''''''''''''

    Protected Sub EditAlbumName_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EditAlbumName.Click

        AddAlbumTextbox.Text = AlbumDropDownList.SelectedItem.ToString
        ModifyAlbumUpdatePanel.Update()
        ModifyAlbumModalPopupExtender.Show()

    End Sub

    Protected Sub AddNewAlbumCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)

        args.IsValid = True

        Dim i As Integer
        For i = 0 To AlbumDropDownList.Items.Count - 1
            If AlbumDropDownList.Items(i).Selected = False Then
                If String.Compare(Me.AddAlbumTextbox.Text, AlbumDropDownList.Items(i).ToString) = 0 Then
                    args.IsValid = False
                End If
            End If
        Next

    End Sub

    Protected Sub CancelAlbum_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        AddAlbumTextbox.Text = AlbumDropDownList.SelectedItem.ToString
        ModifyAlbumUpdatePanel.Update()
        ModifyAlbumModalPopupExtender.Hide()

    End Sub

    Protected Sub AlbumDropDownList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles AlbumDropDownList.SelectedIndexChanged
        AddAlbumTextbox.Text = AlbumDropDownList.SelectedItem.ToString
        AddNewAlbumCustomValidator.Validate()
        ModifyAlbumUpdatePanel.Update()
    End Sub

    Protected Sub SaveAlbum_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        AddNewAlbumCustomValidator.Validate()
        NewAlbumRequiredFieldValidator.Validate()

        If AddNewAlbumCustomValidator.IsValid = True Then
            If NewAlbumRequiredFieldValidator.IsValid = True Then
                ProfessionalAlbumObjectDataSource.UpdateParameters(0).DefaultValue = AlbumDropDownList.SelectedValue.ToString
                ProfessionalAlbumObjectDataSource.UpdateParameters(1).DefaultValue = Session("ProfessionalID").ToString
                ProfessionalAlbumObjectDataSource.UpdateParameters(2).DefaultValue = AddAlbumTextbox.Text
                ProfessionalAlbumObjectDataSource.Update()
                AlbumDropDownList.DataBind()
                PhotoDataList.DataBind()
                PhotoUpdatePanel.Update()
            Else
                ModifyAlbumModalPopupExtender.Show()
            End If
        Else
            ModifyAlbumModalPopupExtender.Show()
        End If
        UpdatePrimaryImage()
    End Sub

    Protected Sub DeleteAlbum_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        ProfessionalAlbumObjectDataSource.DeleteParameters("ProfessionalID").DefaultValue = Session("ProfessionalID").ToString
        ProfessionalAlbumObjectDataSource.DeleteParameters("AlbumID").DefaultValue = AlbumDropDownList.SelectedValue.ToString
        ProfessionalAlbumObjectDataSource.Delete()

        AlbumDropDownList.DataBind()
        PhotoDataList.DataBind()
        PhotoUpdatePanel.Update()
        UpdatePrimaryImage()

    End Sub

    '''''''''''''''''''''''''''''''''''''''''Album'''''''''''''''''''''''''''''''''''''''''''
    Protected Sub UpdatePrimaryImage()
        Dim PrimaryPhotoMaintenance As New ProfessionalPhotoDataSetTableAdapters.QueriesTableAdapter
        PrimaryPhotoMaintenance.ProfessionalPrimaryImageMaintenance(Session("ProfessionalID").ToString)
    End Sub

End Class
