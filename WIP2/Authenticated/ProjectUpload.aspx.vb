
Partial Class Authenticated_AsynchUpload
    Inherits System.Web.UI.Page

    Protected Sub AsyncFileUpload1_UploadedComplete(ByVal sender As Object, ByVal e As AjaxControlToolkit.AsyncFileUploadEventArgs) Handles AsyncFileUpload1.UploadedComplete

        Dim flag As Boolean = True

        ''Validation for file size
        If (Convert.ToInt32(e.filesize) >= 4096000) Then
            flag = False
        End If

        ''Validation for file type 
        Dim typeAllowed As String

        typeAllowed = System.IO.Path.GetExtension(e.filename).ToLower
        If (typeAllowed = ".jpg" Or typeAllowed = ".jpeg" Or typeAllowed = ".gif" Or typeAllowed = ".png" Or typeAllowed = ".bmp" Or typeAllowed = ".tiff") = False Then
            flag = False
        End If


        Dim Username As String = User.Identity.Name
        Dim rootPath As String
        Dim DirectoryString As String
        Dim VirtualPath As String

        ''Based on the role 
        Dim customerRole As String
        customerRole = Me.User.IsInRole("Customer")

        Dim ProfessionalRole As String
        ProfessionalRole = Me.User.IsInRole("Professional")

        If customerRole = True Then
            rootPath = Server.MapPath("~/Authenticated/Customer/Images/")
            DirectoryString = rootPath & Username.ToString & "/Projects/"
            VirtualPath = "http://side/Authenticated/Customer/Images/" & Username.ToString & "/Projects/" & Trim(AsyncFileUpload1.FileName.ToString())
        End If

        If ProfessionalRole = True Then
            rootPath = Server.MapPath("~/Authenticated/Professional/Images/")
            DirectoryString = rootPath & Username.ToString & "/Projects/"
            VirtualPath = "http://side/Authenticated/Professional/Images/" & Username.ToString & "/Projects/" & Trim(AsyncFileUpload1.FileName.ToString())
        End If

        If flag = True Then
            Dim ProjectNewPhoto As New ProjectPhotosDataSetTableAdapters.QueriesTableAdapter
            ProjectNewPhoto.AddNewProjectPhoto(Session("ProjectID").ToString, CaptionTextBox2.Text.ToString(), VirtualPath.ToString())
        End If

        ProjectPhotoDataSource.SelectParameters(0).DefaultValue = Session("ProjectID").ToString
        ProjectPhotoDataSource.DataBind()
        ProjectListView.DataBind()

        Dim PhotoPath As String = DirectoryString.ToString() + AsyncFileUpload1.FileName.ToString()
        Me.AsyncFileUpload1.SaveAs(PhotoPath.ToString())

        PictureUpdatePanel.Update()
        Response.Expires = 0

    End Sub

    Protected Sub AsyncFileUpload1_UploadedFileError(ByVal sender As Object, ByVal e As AjaxControlToolkit.AsyncFileUploadEventArgs) Handles AsyncFileUpload1.UploadedFileError
    End Sub

    Protected Sub ProjectListView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ProjectListView.SelectedIndexChanged

        Dim DeleteProjectPhoto As New ProjectPhotosDataSetTableAdapters.QueriesTableAdapter
        DeleteProjectPhoto.DeleteProjectPictureByID(Session("ProjectID").ToString, ProjectListView.SelectedValue.ToString())

    End Sub


End Class
