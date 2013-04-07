
Partial Class RearrangePhotos
    Inherits System.Web.UI.Page

    Protected Sub RearrangeDataList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim SelectedPhoto As Integer = Convert.ToInt32(Me.RearrangeDataList.SelectedValue.ToString)
        RearrangeDataList.DataBind()

        Dim i As Integer
        Dim j As Integer = Convert.ToInt32(RearrangeDataList.SelectedIndex.ToString)
        Dim Rank As TextBox
        For i = 0 To RearrangeDataList.Items.Count - 1
            If i <> j Then
                Rank = Me.RearrangeDataList.Items(i).FindControl("RankTextBox")
                Rank.ReadOnly = True
            Else
                Rank = Me.RearrangeDataList.Items(j).FindControl("RankTextBox")
                Rank.ReadOnly = False
                Dim oldValue As Integer
                oldValue = Convert.ToInt32(Rank.Text)
                RankData.oldValue = oldValue.ToString
                Rank.BackColor = Drawing.Color.Maroon
                Rank.ForeColor = Drawing.Color.White
            End If
        Next

    End Sub

    Protected Sub RankTextBox_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim NewRank As TextBox = Me.RearrangeDataList.Items(RearrangeDataList.SelectedIndex).FindControl("RankTextBox")
        Dim newValue As Integer
        newValue = Convert.ToInt32(NewRank.Text)
        RankData.newValue = newValue
        Switch()
        NewRank.ReadOnly = True
        NewRank.BackColor = Drawing.Color.LightSlateGray

    End Sub

    Protected Sub Switch()

        Dim numberofimages = RearrangeDataList.Items.Count
        Dim indexofoldvalue As Integer = -1
        Dim indexofnewvalue As Integer = -1
        Dim i As Integer
        Dim RankValue As Integer

        For i = 0 To numberofimages - 1
            Dim Rank As TextBox = Me.RearrangeDataList.Items(i).FindControl("RankTextBox")
            RankValue = Convert.ToInt32(Rank.Text)
            If RankValue = RankData.newValue Then
                If RearrangeDataList.SelectedIndex <> i Then
                    indexofnewvalue = i
                End If
            End If
        Next

        If indexofnewvalue <> -1 Then
            Dim newRank As TextBox = Me.RearrangeDataList.Items(indexofnewvalue).FindControl("RankTextBox")
            newRank.Text = RankData.oldValue.ToString
        End If
        RearrangeUpdatePanel.Update()

    End Sub

    Protected Sub SaveButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SaveButton.Click

        Dim RankTextBox As TextBox
        Dim currentPhotoID As String
        Dim currentRank As String
        Dim i As Integer
        For i = 0 To Me.RearrangeDataList.Items.Count - 1
            currentPhotoID = RearrangeDataList.DataKeys(i).ToString
            RankTextBox = RearrangeDataList.Items(i).FindControl("RankTextBox")
            currentRank = RankTextBox.Text
            RearrangeObjectDataSource.UpdateParameters(0).DefaultValue = currentRank.ToString
            RearrangeObjectDataSource.UpdateParameters(1).DefaultValue = currentPhotoID.ToString
            RearrangeObjectDataSource.Update()
        Next
        RearrangeDataList.DataBind()
        RearrangeUpdatePanel.Update()

    End Sub

    Protected Sub CancelButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelButton.Click
        Response.Redirect(Request.Url.ToString(), False)
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

Public Class RankData

    Private Shared _oldValue As Integer
    Private Shared _newValue As Integer

    Public Shared Property oldValue() As String
        Get
            Return _oldValue
        End Get
        Set(ByVal value As String)
            _oldValue = value
        End Set
    End Property

    Public Shared Property newValue() As String
        Get
            Return _newValue
        End Get
        Set(ByVal value As String)
            _newValue = value
        End Set
    End Property

End Class