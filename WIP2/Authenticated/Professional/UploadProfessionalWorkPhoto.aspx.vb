
Partial Class Authenticated_AsynchUpload
    Inherits System.Web.UI.Page

    Dim rootPath As String
    Dim DirectoryString As String
    Dim VirtualPath As String

    Protected Sub AsyncFileUpload1_UploadedComplete(ByVal sender As Object, ByVal e As AjaxControlToolkit.AsyncFileUploadEventArgs) Handles AsyncFileUpload1.UploadedComplete

        Dim flag As Boolean = True
        Dim ProfessionalRole As String
        Dim Username As String = User.Identity.Name

        If (Convert.ToInt32(e.filesize) >= 4096000) Then
            flag = False
        End If

        Dim typeAllowed As String
        typeAllowed = System.IO.Path.GetExtension(e.filename).ToLower
        If (typeAllowed = ".jpg" Or typeAllowed = ".jpeg" Or typeAllowed = ".gif" Or typeAllowed = ".png" Or typeAllowed = ".bmp" Or typeAllowed = ".tiff") = False Then
            flag = False
        End If

        ProfessionalRole = Me.User.IsInRole("Professional")
        If ProfessionalRole = True Then

            rootPath = Server.MapPath("~/Authenticated/Professional/WorkImages/")
            DirectoryString = rootPath & Username.ToString & "/"
            VirtualPath = "http://side/Authenticated/Professional/WorkImages/" & Username.ToString & "/" & Trim(AsyncFileUpload1.FileName.ToString())

        End If

        If flag = True Then

            Dim ProfessionalNewWorkPhoto As New ProfessionalWorkShopPhotoDataSetTableAdapters.QueriesTableAdapter
            ProfessionalNewWorkPhoto.AddNewProfessionalWorkPhoto(Session("ProfessionalID").ToString, CaptionTextBox2.Text.ToString(), VirtualPath.ToString())

        End If

        ProfessionalWorkShopPhotoDataSource.SelectParameters(0).DefaultValue = Session("ProfessionalID").ToString
        ProfessionalWorkShopPhotoDataSource.DataBind()
        ProfessionalListView.DataBind()

        Dim PhotoPath As String = DirectoryString.ToString() + AsyncFileUpload1.FileName.ToString()
        Me.AsyncFileUpload1.SaveAs(PhotoPath.ToString())

        PictureUpdatePanel.Update()
        Response.Expires = 0

    End Sub

    Protected Sub ProfessionalListView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ProfessionalListView.SelectedIndexChanged

        Dim DeleteProfessionalPhoto As New ProfessionalWorkShopPhotoDataSetTableAdapters.QueriesTableAdapter
        DeleteProfessionalPhoto.DeleteProfessionalWorkByID(Session("ProfessionalID").ToString, ProfessionalListView.SelectedValue.ToString())

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

End Class
