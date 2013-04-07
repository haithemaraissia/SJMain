
Partial Class Authenticated_AsynchUpload
    Inherits System.Web.UI.Page

    Dim rootPath As String
    Dim DirectoryString As String
    Dim VirtualPath As String

    Protected Sub AsyncFileUpload1_UploadedComplete(ByVal sender As Object, ByVal e As AjaxControlToolkit.AsyncFileUploadEventArgs) Handles AsyncFileUpload1.UploadedComplete

        Dim flag As Boolean = True
        Dim customerRole As String
        Dim Username As String = User.Identity.Name

        If (Convert.ToInt32(e.filesize) >= 4096000) Then
            flag = False
        End If

        Dim typeAllowed As String
        typeAllowed = System.IO.Path.GetExtension(e.filename).ToLower
        If (typeAllowed = ".jpg" Or typeAllowed = ".jpeg" Or typeAllowed = ".gif" Or typeAllowed = ".png" Or typeAllowed = ".bmp" Or typeAllowed = ".tiff") = False Then
            flag = False
        End If

        customerRole = Me.User.IsInRole("Customer")
        If customerRole = True Then

            rootPath = Server.MapPath("~/Authenticated/Customer/Images/")
            DirectoryString = rootPath & Username.ToString & "/"
            VirtualPath = "http://side/Authenticated/Customer/Images/" & Username.ToString & "/" & Trim(AsyncFileUpload1.FileName.ToString())

        End If

        If flag = True Then

            Dim CustomerNewPhoto As New CustomerPhotoDataSetTableAdapters.QueriesTableAdapter
            CustomerNewPhoto.AddNewCustomerPhoto(Session("CustomerId").ToString, CaptionTextBox2.Text.ToString(), VirtualPath.ToString())

        End If

        CustomerPhotoDataSource.SelectParameters(0).DefaultValue = Session("CustomerId").ToString
        CustomerPhotoDataSource.DataBind()
        CustomerListView.DataBind()

        Dim PhotoPath As String = DirectoryString.ToString() + AsyncFileUpload1.FileName.ToString()
        Me.AsyncFileUpload1.SaveAs(PhotoPath.ToString())

        PictureUpdatePanel.Update()
        Response.Expires = 0

        UpdatePrimaryImage()
    End Sub

    Protected Sub CustomerListView_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CustomerListView.SelectedIndexChanged

        Dim DeleteCustomerPhoto As New CustomerPhotoDataSetTableAdapters.QueriesTableAdapter
        DeleteCustomerPhoto.DeleteCustomerPhotoByID(Session("CustomerId").ToString, CustomerListView.SelectedValue.ToString())
        UpdatePrimaryImage()

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
