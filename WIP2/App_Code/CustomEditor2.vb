Imports Microsoft.VisualBasic
Imports AjaxControlToolkit
Imports AjaxControlToolkit.HTMLEditor
Imports System.Collections
Imports System.Collections.ObjectModel


Namespace CommentAjaxControl2
    Public Class CustomEditor2
        Inherits Editor

        Protected Overloads Overrides Sub FillTopToolbar()


            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.Undo())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.Redo())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())

            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.Bold())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.Italic())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.Underline())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.StrikeThrough())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.SubScript())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.SuperScript())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())

            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.Ltr())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.Rtl())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())



            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.FixedForeColor())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.ForeColorSelector())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.ForeColorClear())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.BackColorSelector())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.BackColorClear())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())

            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.RemoveStyles())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())











            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.Cut())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.PasteText())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.PasteWord())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())


            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.DecreaseIndent())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.IncreaseIndent())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())

            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.Paragraph())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyLeft())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyCenter())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyRight())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.JustifyFull())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.RemoveAlignment())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())



            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.OrderedList())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.BulletedList())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.InsertHR())



            ''TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.FontName())
            ''TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())

            ''TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.FontSize())
            ''TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())




            ''Dim MyOptions As New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            ''MyOptions.Value = ""
            '' MyOptions.Text = ""

            ''  TopToolbar.Buttons.Add(Options)

            ''TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption())

            '' Dim MyFont As New AjaxControlToolkit.HTMLEditor.ToolbarButton.FontName
            '' MyOptions = MyFont.Options



            'Dim options As Collection(Of AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption)
            'Dim [option] As AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption



            'Dim fontName As New AjaxControlToolkit.HTMLEditor.ToolbarButton.FontName()
            'TopToolbar.Buttons.Add(fontName)

            'options = fontName.Options
            ''[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            ''[option].Value = ""
            ''[option].Text = ""
            ''options.Add([option])
            '[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            '[option].Value = "arial,helvetica,sans-serif"
            '[option].Text = "Arial"
            'options.Add([option])
            '[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            '[option].Value = "courier new,courier,monospace"
            '[option].Text = "Courier New"
            'options.Add([option])
            '[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            '[option].Value = "georgia,times new roman,times,serif"
            '[option].Text = "Georgia"
            'options.Add([option])
            '[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            '[option].Value = "tahoma,arial,helvetica,sans-serif"
            '[option].Text = "Tahoma"
            'options.Add([option])
            '[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            '[option].Value = "times new roman,times,serif"
            '[option].Text = "Times New Roman"
            'options.Add([option])
            '[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            '[option].Value = "verdana,arial,helvetica,sans-serif"
            '[option].Text = "Verdana"
            'options.Add([option])
            '[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            '[option].Value = "impact"
            '[option].Text = "Impact"
            'options.Add([option])
            '[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            '[option].Value = "wingdings"
            '[option].Text = "WingDings"
            'options.Add([option])

            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())
            'Dim fontSize As New AjaxControlToolkit.HTMLEditor.ToolbarButton.FontSize()
            'TopToolbar.Buttons.Add(fontSize)

            'options = fontSize.Options
            ''[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            ''[option].Value = ""
            ''[option].Text = ""
            ''options.Add([option])
            '[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            '[option].Value = "8pt"
            '[option].Text = "1 ( 8 pt)"
            'options.Add([option])
            '[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            '[option].Value = "10pt"
            '[option].Text = "2 (10 pt)"
            'options.Add([option])
            '[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            '[option].Value = "12pt"
            '[option].Text = "3 (12 pt)"
            'options.Add([option])
            '[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            '[option].Value = "14pt"
            '[option].Text = "4 (14 pt)"
            'options.Add([option])
            '[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            '[option].Value = "18pt"
            '[option].Text = "5 (18 pt)"
            'options.Add([option])
            '[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            '[option].Value = "24pt"
            '[option].Text = "6 (24 pt)"
            'options.Add([option])
            '[option] = New AjaxControlToolkit.HTMLEditor.ToolbarButton.SelectOption()
            '[option].Value = "36pt"
            '[option].Text = "7 (36 pt)"
            'options.Add([option])



        End Sub


        Protected Overloads Overrides Sub FillBottomToolbar()
            'BottomToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.DesignMode())
            ' BottomToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.PreviewMode())

            'BottomToolbar.Buttons.Add(New Button())
            'Dim Button1 As New AjaxControlToolkit.HTMLEditor.ToolbarButton.HtmlMode


            '   Dim CustomButton As New AjaxControlToolkit.HTMLEditor.ToolbarButton.CommonButton()



            'CustomButton.ControlStyle.ForeColor = Drawing.Color.Aqua
            'CustomButton.ID = "CustomButton"
            'BottomToolbar.Buttons.Add(Button1)







        End Sub



    End Class
End Namespace

