
Partial Class WIP2_RightCleanSideJOB2008FromInetpub_CleanSIDEJOB2008_common_MainUpperButtons2
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim lang As String = Request.QueryString("l")
        selected.Src = "../Images/flags/earth.png"

        If lang IsNot Nothing Or lang <> "" Then

            Select Case lang

                Case "en-US"
                    selected.Src = "../Images/flags/US.png"

                Case "fr"
                    selected.Src = "../Images/flags/FR.png"

                Case "es"
                    selected.Src = "../Images/flags/ES.png"

                Case "zh-CN"
                    selected.Src = "../Images/flags/CN.png"

                Case "ru"
                    selected.Src = "../Images/flags/RU.png"

                Case "ar"
                    selected.Src = "../Images/flags/AE.png"

                Case "ja"
                    selected.Src = "../Images/flags/JP.png"

                Case "de"
                    selected.Src = "../Images/flags/DE.png"
                Case Else

            End Select

        End If

    End Sub
End Class
