
Namespace common
    Partial Class Wip2RightCleanSideJob2008FromInetpubCleanSidejob2008CommonMainUpperButtons2
        Inherits UserControl

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
            Localization()
        End Sub

        Public Sub Localization()

            Dim lang As String = Request.QueryString("l")
            selected.Src = "http://www.my-side-job.com/Images/flags/earth.png"
            Dim currentUrl = Request.Url.AbsoluteUri
            If (Request.QueryString.Count > 0) Then
                If (Request.QueryString("l") IsNot Nothing) Then
                    If Request.QueryString("l").Length >= 1 Then
                        currentUrl = Utility.RemoveQuerystringVar(currentUrl, "l")
                        If (Request.QueryString.Count = 1) Then
                            currentUrl += "?l="
                        Else
                            currentUrl += "&l="
                        End If
                    Else
                        currentUrl += "&l="
                    End If
                End If
            Else
                currentUrl += "?l="
            End If
                EnglishLanguageLink.HRef = currentUrl + "en-US"
                FrenchLanguageLink.HRef = currentUrl + "fr"
                SpanishLanguageLink.HRef = currentUrl + "es"
                ChineseLanguageLink.HRef = currentUrl + "zh-CN"
                RussianLanguageLink.HRef = currentUrl + "ru"
                ArabicLanguageLink.HRef = currentUrl + "ar"
                JapaneseLanguageLink.HRef = currentUrl + "ja"
                GermanLanguageLink.HRef = currentUrl + "de"
                If lang IsNot Nothing Or lang <> "" Then
                    Select Case lang

                        Case "en-US"
                            EnglishLanguageLink.HRef = "Hello"
                            selected.Src = "http://www.my-side-job.com/Images/flags/US.png"

                        Case "fr"
                            selected.Src = "http://www.my-side-job.com/Images/flags/FR.png"

                        Case "es"
                            selected.Src = "http://www.my-side-job.com/Images/flags/ES.png"

                        Case "zh-CN"
                            selected.Src = "http://www.my-side-job.com/Images/flags/CN.png"

                        Case "ru"
                            selected.Src = "http://www.my-side-job.com/Images/flags/RU.png"

                        Case "ar"
                            selected.Src = "http://www.my-side-job.com/Images/flags/AE.png"

                        Case "ja"
                            selected.Src = "http://www.my-side-job.com/Images/flags/JP.png"

                        Case "de"
                            selected.Src = "http://www.my-side-job.com/Images/flags/DE.png"
                    End Select
                End If
        End Sub
    End Class
End Namespace