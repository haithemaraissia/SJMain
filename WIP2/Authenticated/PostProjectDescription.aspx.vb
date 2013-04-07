Imports System.IO
Imports System.Data.SqlClient
Imports System.Data
Imports System.Globalization
Imports System.Threading

Partial Class Authenticated_Professional_PostProject
    Inherits System.Web.UI.Page

    ''''''''''''''''''''''''''''''''''DESCRIPTION TAB'''''''''''''''''''''''''''''''''''''''''

    Protected Sub CancelDescription_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelDescription.Click
        Me.DelayModalPopUpExtender.Show()
        Response.Redirect("PostProject.aspx")
    End Sub

    Protected Sub UpdateDescription_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpdateDescription.Click
        Dim SaveProjectAdapter As New SaveProjectDataSetTableAdapters.QueriesTableAdapter
        SaveProjectAdapter.UpdateProjectDescription(Session("ProjectID").ToString, EditDescriptionEditor.Content.ToString)
        DelayModalPopUpExtender.Show()
        Response.Redirect("PostProject.aspx")
    End Sub

    ''''''''''''''''''''''''''''''''''DESCRIPTION TAB'''''''''''''''''''''''''''''''''''''''''

    ''''''''''''''''''''''''''''''''''''PAGE EVENTS '''''''''''''''''''''''''''''''''''''''''''

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            InitializeDescription()
        End If
    End Sub


    Protected Sub InitializeDescription()
        Try
            Dim ProjectDescriptionTableAdapter As New SaveProjectDataSetTableAdapters.QueriesTableAdapter
            EditDescriptionEditor.Content = ProjectDescriptionTableAdapter.GetProjectDescription(Session("ProjectID").ToString())

        Catch ex As Exception
            Response.Redirect("~/NotAuthenticated/SignIn.aspx")
        End Try
    End Sub

    ''''''''''''''''''''''''''''''''''''PAGE EVENTS ''''''''''''''''''''''''''''''''''''''''''''''
End Class
