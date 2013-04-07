
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text;


public partial class NotAuthenticated_ContactUS : System.Web.UI.Page
{
    private Random random = new Random();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.Session["CaptchaImageText"] = GenerateRandomCode();
        }
    }

    private string GenerateRandomCode()
    {
        string s = "";
        for (int i = 0; i < 6; i++)
            s = String.Concat(s, this.random.Next(10).ToString());
        return s;
    }

    protected void ValidateButton_Click(object sender, EventArgs e)
    {
        Validate();
    }

    protected void CustomCaptchaValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        CustomCaptchaValidator.IsValid = false;
        if (this.txtCapText.Text == this.Session["CaptchaImageText"].ToString())
        {
            CustomCaptchaValidator.IsValid = true;
        }
        else
        {
            CustomCaptchaValidator.IsValid = false;
        }
    }

    protected void ResetButton_Click(object sender, EventArgs e)
    {
        reset();
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (this.txtCapText.Text == this.Session["CaptchaImageText"].ToString())
            {
                SendEmail();
                reset();
            }
        }
        else
        {
            Validate();
        }
    }

    protected void reset()
    {
        Editor1.Content = "";
        CaptchLabel.Text = "";
        EmailTextBox.Text = "";
        NameTextBox.Text = "";
        txtCapText.Text = "";
        UpdatePanel1.Update();
        Response.Expires = -1000;
        Response.Cache.SetNoStore();
        Response.AppendHeader("Pragma", "no-cache");
    }

    protected void Validate()
    {
        if (this.txtCapText.Text == this.Session["CaptchaImageText"].ToString())
        {
            CaptchLabel.Visible = false;
            CaptchLabel.Text = "MATCHING";
        }
        else
        {
            CaptchLabel.Visible = true;
            CaptchLabel.Text = "NOT MATCHING";
            GenerateRandomCode();
        }
        UpdatePanel1.Update();
    }    
    
    protected void SendEmail()
    {
        Response.Write(@"<script language='javascript'>alert('Thank you for your email. I will contact you shortly.'); window.location = 'http://www.haithem-araissia.com/CSS/';</script>");
        string strTo = "postmaster@haithem-araissia.com";
        MailMessage MailMsg = new MailMessage(new MailAddress(EmailTextBox.Text.ToString()), new MailAddress(strTo));
        MailMsg.BodyEncoding = Encoding.Default;
        MailMsg.Subject = "From " + NameTextBox.Text.ToString();
        MailMsg.Body = Editor1.Content.ToString();
        MailMsg.Priority = MailPriority.High;
        MailMsg.IsBodyHtml = true;
        //Smtp Client to Send the Mail Message
        SmtpClient SmtpMail = new SmtpClient();
        System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("postmaster@haithem-araissia.com", "haithem759163");
        SmtpMail.Host = "mail.haithem-araissia.com";
        SmtpMail.UseDefaultCredentials = false;
        SmtpMail.Credentials = basicAuthenticationInfo;
        try
        {
            SmtpMail.Send(MailMsg);
        }
        catch (Exception)
        {
            Response.Redirect(Request.Url.ToString());
            throw;
        }
    }
}
