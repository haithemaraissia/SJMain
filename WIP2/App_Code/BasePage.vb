Imports System.Data
Imports System.Configuration
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Xml.Linq


''' <summary>
''' A custom base page class that sets the page Title, if needed.
''' </summary>
Public Class BasePage
    Inherits System.Web.UI.Page
    Protected Overrides Sub OnLoadComplete(e As EventArgs)
        ' Set the page's title, if necessary
        If String.IsNullOrEmpty(Page.Title) OrElse Page.Title = "Untitled Page" Then
            ' Is this page defined in the site map?
            Dim newTitle As String = Nothing

            Dim current As SiteMapNode = SiteMap.CurrentNode
            If current IsNot Nothing Then
                newTitle = current.Title
            Else
                ' Determine the filename for this page

                ' TODO for READER: Replace any "space" characters with spaces (such as "-")
                '                  Also, consider adding a space when there's any case change.
                '                  I.e., transform "AboutUs" to "About Us"
                newTitle = System.IO.Path.GetFileNameWithoutExtension(Request.PhysicalPath)
            End If

            Page.Title = newTitle
        End If

        MyBase.OnLoadComplete(e)
    End Sub
End Class

