Imports Microsoft.VisualBasic
Imports System

Namespace CustomTextBox
    Public Class CustomTextBoxClass
        Inherits TextBox


        Protected Overrides Sub OnTextChanged(ByVal e As EventArgs)
            ' Call the base OnTextChanged method.
            MyBase.OnTextChanged(e)

            Dim NumberofCharacters As Integer = Text.Length

            If NumberofCharacters > 5 Then
                Me.Enabled = False
            End If

        End Sub


    End Class
End Namespace

