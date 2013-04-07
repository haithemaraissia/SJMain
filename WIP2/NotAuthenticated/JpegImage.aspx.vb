Imports System.Drawing.Imaging

Namespace CaptchaImage
    Partial Public Class JpegImage
        Inherits System.Web.UI.Page
        Private Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
            ' Create a CAPTCHA image using the text stored in the Session object.
            Dim ci As New CaptchaImage(Me.Session("CaptchaImageText").ToString(), 200, 50, "Century Schoolbook")

            ' Change the response headers to output a JPEG image.
            Me.Response.Clear()
            Me.Response.ContentType = "image/jpeg"

            ' Write the image to the response stream in JPEG format.
            ci.Image.Save(Me.Response.OutputStream, ImageFormat.Jpeg)

            ' Dispose of the CAPTCHA image object.
            ci.Dispose()
        End Sub

#Region "Web Form Designer generated code"
        Protected Overrides Sub OnInit(ByVal e As EventArgs)
            '
            ' CODEGEN: This call is required by the ASP.NET Web Form Designer.
            '
            InitializeComponent()
            MyBase.OnInit(e)
        End Sub

        ''' <summary>
        ''' Required method for Designer support - do not modify
        ''' the contents of this method with the code editor.
        ''' </summary>
        Private Sub InitializeComponent()
            AddHandler Me.Load, New System.EventHandler(AddressOf Me.Page_Load)
        End Sub
#End Region
    End Class
End Namespace
