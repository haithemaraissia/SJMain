
Imports System.Net
Imports System.Net.Mail

Namespace NotAuthenticated

    Partial Class PasswordRecovery
        Inherits Page

        Protected Sub Page_Load(sender As Object, e As EventArgs)
            If Session("LCID") Is Nothing Then
                Session("LCID") = 1
            End If
        End Sub

        Protected Sub PasswordRecovery1SendingMail(sender As Object, e As MailMessageEventArgs)
            Dim currentuser = Membership.GetUser(PasswordRecovery1.UserName)
            If currentuser IsNot Nothing Then
                Dim pwd = currentuser.GetPassword(PasswordRecovery1.Answer)
                ''Dim UserProfile As ProfileCommon = Profile.GetProfile(PasswordRecovery1.UserName)
                SendEmail(currentuser.Email, pwd, currentuser.UserName)
            End If
            ' cancel the component's email here
            e.Cancel = True

        End Sub

        Protected Sub SendEmail(memberEmail As String, psw As String, username As String)
            'var response = @"<script language='javascript'>alert('" 
            '                        + Resources.Resource.PasswordSent  
            '                        + @"'); window.location = 'http://my-side-job.com/Manage/Advertise/Default.aspx';</script>";
            'Response.Write(response);

            Dim lang = If(Request.QueryString("l"), "en-US")
            Dim url = "http://www.my-side-job.com/Manage/Advertise/EmailTemplates/PasswordRecovery.aspx?psw=" + psw + "&usn=" + username + "&l=" + lang
            Const strFrom As String = "postmaster@my-side-job.com"
            Dim mailMsg = New MailMessage(New MailAddress(strFrom), New MailAddress(memberEmail)) With { _
                    .BodyEncoding = Encoding.[Default], _
                    .Subject = Resources.Resource.ForgotPassword, _
                    .Body = Utility.GetHtmlFrom(url), _
                    .Priority = MailPriority.High, _
                    .IsBodyHtml = True _
                    }
            Dim smtpMail = New SmtpClient()
            Dim basicAuthenticationInfo = New NetworkCredential("postmaster@my-side-job.com", "haithem759163")
            smtpMail.Host = "mail.my-side-job.com"
            smtpMail.UseDefaultCredentials = False
            smtpMail.Credentials = basicAuthenticationInfo
            Try
                smtpMail.Send(mailMsg)
            Catch generatedExceptionName As Exception
                Response.Redirect(Request.Url.ToString())
                Throw
            End Try
        End Sub

    End Class
End Namespace