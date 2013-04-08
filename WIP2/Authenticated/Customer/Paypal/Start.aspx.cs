using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using Resources;

public partial class Paypal_Start : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {

            if (Request.QueryString["ID"] == null || Request.QueryString["ID"] == "")
            {
                Response.Redirect("../CustomerProfile.aspx");
            }
            else
            {
                CurrencyDropDownList.SelectedIndex = 5;
                CustomerPDTDataSet.CustomerPaymentDueDataTable CustomerPaymentDueTable;
                GetValue(out CustomerPaymentDueTable);
                InitAmount();
            }
        }

    }


    public enum CurrencyCode
    {
        AUD,
        CAD,
        CZK,
        DKK,
        EUR,
        HKD,
        HUF,
        ILS,
        JPY,
        MXN,
        NZD,
        NOK,
        PHP,
        PLN,
        SGD,
        SEK,
        CHF,
        TWD,
        THB,
        GBP
    }

    public static double CurrencyCharge(string Chosen)
    {
        double charge = 0;
        CurrencyCode SelectedCurrency = (CurrencyCode)Enum.Parse(typeof(CurrencyCode), Chosen);
        switch (SelectedCurrency)
        {
            case CurrencyCode.AUD:
                charge = 0.30;
                break;
            case CurrencyCode.CAD:
                charge = 0.30;
                break;
            case CurrencyCode.CZK:
                charge = 10.00;
                break;
            case CurrencyCode.DKK:
                charge = 2.60;
                break;
            case CurrencyCode.EUR:
                charge = 0.35;
                break;
            case CurrencyCode.GBP:
                charge = 0.20;
                break;
            case CurrencyCode.HKD:
                charge = 2.35;
                break;
            case CurrencyCode.HUF:
                charge = 90;
                break;
            case CurrencyCode.ILS:
                charge = 1.20;
                break;
            case CurrencyCode.JPY:
                charge = 40;
                break;
            case CurrencyCode.MXN:
                charge = 4.00;
                break;
            case CurrencyCode.NOK:
                charge = 2.80;
                break;
            case CurrencyCode.NZD:
                charge = 0.45;
                break;
            case CurrencyCode.PHP:
                charge = 15.00;
                break;
            case CurrencyCode.PLN:
                charge = 1.35;
                break;
            case CurrencyCode.SEK:
                charge = 3.25;
                break;
            case CurrencyCode.SGD:
                charge = 0.50;
                break;
            case CurrencyCode.THB:
                charge = 11;
                break;
            case CurrencyCode.TWD:
                charge = 10;
                break;
        }
        return charge;
    }

    protected void PayPalImageButton_Click(object sender, ImageClickEventArgs e)
    {
        const string Server_URL = "https://www.sandbox.paypal.com/cgi-bin/webscr";
        const string return_URL = "http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Authenticated/Customer/Paypal/PDTSuccess.aspx";
        const string cancelreturn_URL = "http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Authenticated/Customer/Paypal/CancelPayment.aspx";
        const string notify_url = "http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Authenticated/Customer/Paypal/Handler.aspx";
        const string cmd = "_xclick";

        CustomerPDTDataSet.CustomerPaymentDueDataTable CustomerPaymentDueTable;
        GetValue(out CustomerPaymentDueTable);
        const string business = "site_1359998662_biz@haithem-araissia.com";
        string item_name = CustomerPaymentDueTable.Rows[0]["ProjectTitle"].ToString();
        string project_id = Request.QueryString["ID"].ToString();
        string customer_id = GetCustomerID();
        
        if (PaymentMade(customer_id, project_id) == false)
        {
            string redirect = "";
            redirect += Server_URL;
            redirect += "?cmd=" + cmd;
            redirect += "&business=" + business;
            redirect += "&item_name=" + item_name;
            redirect += "&amount=" + Amount.Text.ToString();
            redirect += "&currency_code=" + CurrencyDropDownList.SelectedValue.ToString();
            redirect += "&payer_id=" + customer_id.ToString();
            redirect += "&receiver_email=" + "site_1359998662_biz@haithem-araissia.com";
            redirect += "&custom=" + project_id;
            redirect += "&notify_url" + notify_url;
            redirect += "&return=" + return_URL;
            redirect += "&cancel_return" + cancelreturn_URL;

            CustomerPDTDataSetTableAdapters.QueriesTableAdapter CustomerPDT = new CustomerPDTDataSetTableAdapters.QueriesTableAdapter();
            CustomerPDT.CustomerStartPayment(Convert.ToInt32(project_id), Convert.ToDouble(Amount.Text.ToString()), CurrencyDropDownList.SelectedValue.ToString(), Convert.ToInt32(customer_id));

            //Redirect to the payment page
            Response.Redirect(redirect);
        }
    }

    public string GetCustomerID()
    {
        string customer_id ="";
        if (!String.IsNullOrEmpty(Session["CustomerId"].ToString()))
        {
            customer_id = Session["CustomerId"].ToString();
        }
        else
        {
            Response.Redirect("CustomerProfile.aspx");
        }
        return customer_id;
    }

    protected void InitAmount()
    {
        double Percentage = 0;

        //USAmount from database on US Dollar
        CustomerPDTDataSet.CustomerPaymentDueDataTable CustomerPaymentDueTable;
        GetValue(out CustomerPaymentDueTable);
        double USAmount = (double)CustomerPaymentDueTable.Rows[0]["ProjectAmount"];
        CurrencyWebService CurrencyService = new CurrencyWebService();
        decimal ToUSRate = CurrencyService.Convert(1.000m, CurrencyDropDownList.SelectedValue.ToString(), "USD");

        //Amount from the Database in US
        //IF Not paid in US  
        Percentage = GetSideJobPercentage(USAmount);
            USAmount = USAmount + (USAmount * Percentage);
        Amount.Text = (Math.Round(USAmount, 2)).ToString();

    }

    protected void Currency_SelectedIndexChanged(object sender, EventArgs e)
    {
        double InternationalFixedFee = 0;
        double Percentage = 0;

        //USAmount from database on US Dollar
        CustomerPDTDataSet.CustomerPaymentDueDataTable CustomerPaymentDueTable;
        GetValue(out CustomerPaymentDueTable);
        double USAmount = (double)CustomerPaymentDueTable.Rows[0]["ProjectAmount"];
        CurrencyWebService CurrencyService = new CurrencyWebService();
        decimal ToUSRate = CurrencyService.Convert(1.000m, CurrencyDropDownList.SelectedValue.ToString(), "USD");

        //Amount from the Database in US
        //IF Not paid in US  
        Percentage = GetSideJobPercentage(USAmount);
        if (CurrencyDropDownList.SelectedValue.ToString() != "USD")
        {
            InternationalFixedFee = (double)((decimal)USAmount * ToUSRate);
            USAmount = USAmount + (USAmount * Percentage) + InternationalFixedFee;
        }
        else
        {
            USAmount = USAmount + (USAmount * Percentage);
        }
        Amount.Text = (Math.Round(USAmount, 2)).ToString();
    }

    public double GetSideJobPercentage(double USAmount)
    {
        double SideJobPercentage = 0;
        //SideJob Percentage: Domestic
        if ((USAmount > 0) && (USAmount <= 100.00))
        {
            SideJobPercentage = 0.20;
        }
        if ((USAmount > 100.01) && (USAmount <= 1000.00))
        {
            SideJobPercentage = 0.17;
        }
        if ((USAmount > 1000.01) && (USAmount <= 10000.00))
        {
            SideJobPercentage = 0.12;
        }
        if ((USAmount > 10000.01) && (USAmount <= 100000.00))
        {
            SideJobPercentage = 0.8;
        }
        if (USAmount > 100000.01)
        {
            SideJobPercentage = 0.3;
        }
        //SideJob Percentage: International
        if (CurrencyDropDownList.SelectedValue.ToString() != "USD")
        {
            SideJobPercentage += 0.02;
        }
        return SideJobPercentage;
    }

    protected bool PaymentMade(string CustomerID, string ProjectID)
    {
        bool result = false;
        //// Checking if Payment for this project were already submitted by Customer ////
        CustomerPDTDataSetTableAdapters.CustomerSuccessfulPDTTableAdapter CustomerCheckAdapter = new CustomerPDTDataSetTableAdapters.CustomerSuccessfulPDTTableAdapter();
        CustomerPDTDataSet.CustomerSuccessfulPDTDataTable CustomerCheckTable = new CustomerPDTDataSet.CustomerSuccessfulPDTDataTable();
        CustomerCheckAdapter.FillCheck(CustomerCheckTable, Convert.ToInt32(CustomerID.ToString()), Convert.ToInt32(ProjectID.ToString()));

        //There can be only 1 row or 0 row
        if (CustomerCheckTable.Rows.Count == 1)
        {
            if ((string.Equals(CustomerCheckTable.Rows[0]["CurrencyCode"].ToString(), CurrencyDropDownList.SelectedValue.ToString())) && (string.Equals(CustomerCheckTable.Rows[0]["GrossTotal"].ToString(), Amount.Text.ToString())))
            {
                string sucessmessage = CustomerCheckTable.Rows[0]["FirstName"].ToString() +
                                       CustomerCheckTable.Rows[0]["LastName"].ToString() + ",<br/>";
                sucessmessage += Resource.ThankPayment + "<br/>";
                sucessmessage += Resource.PaymentOf + CustomerCheckTable.Rows[0]["CurrencyCode"].ToString() +
                                 CustomerCheckTable.Rows[0]["GrossTotal"].ToString() + Resource.PaymentProcessed + "<br/><br/>";
                sucessmessage += Resource.Sincerely + "<br/>";
                sucessmessage += Resource.YourSideJobTeam + "<br/>";
                HiddenLabel.Text = sucessmessage;
                result = true;
            }
            else
            {
                string failuremessage = CustomerCheckTable.Rows[0]["FirstName"].ToString() +
                                       CustomerCheckTable.Rows[0]["LastName"].ToString() + ",<br/>";
                failuremessage += Resource.FailedTransaction + "<br/>";
                failuremessage += Resource.FailurePDT;
                HiddenLabel.Text = failuremessage;
                result = false;
            }
        }
        else if (CustomerCheckTable.Rows.Count > 1)
        {
            EmailAdmin(String.Format("Multiple Payment from Customer {0} for Projet {1}", CustomerID.ToString(),
                         ProjectID.ToString()), "Check CustomerSuccessfulPDT Table", "yoursidjob@yahoo.com");
            result = true;
        }
        return result;
    }

    private void EmailAdmin(string subject, string message, string EmailAddress)
    {
        MailMessage mailObj = new MailMessage();
        mailObj.From = new MailAddress("yoursidjob@yahoo.com");
        mailObj.Subject = subject;
        mailObj.Body = message;
        mailObj.To.Add(new MailAddress(EmailAddress));
        mailObj.IsBodyHtml = true;
        SmtpClient SmtpMail = new SmtpClient();
        System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("postmaster@programmingfundamental.com", "haithem759163");
        SmtpMail.Host = "mail.programmingfundamental.com";
        SmtpMail.UseDefaultCredentials = false;
        SmtpMail.Credentials = basicAuthenticationInfo;
        try
        {
            SmtpMail.Send(mailObj);
        }
        catch (Exception)
        {
            Response.Redirect(Request.Url.ToString());
            throw;
        }
    }

    public void GetValue(out CustomerPDTDataSet.CustomerPaymentDueDataTable CustomerPaymentDueTable)
    {
        CustomerPDTDataSetTableAdapters.CustomerPaymentDueTableAdapter CustomerPaymentDue =
            new CustomerPDTDataSetTableAdapters.CustomerPaymentDueTableAdapter();
        CustomerPaymentDueTable = new CustomerPDTDataSet.CustomerPaymentDueDataTable();
        CustomerPaymentDue.FillCustomerPaymentDue(CustomerPaymentDueTable, Convert.ToInt32(Session["CustomerId"].ToString()),
                                                  Convert.ToInt32(Request.QueryString["ID"].ToString()));
    }
}