using System;
using System.Web;
using System.IO;
using System.Net;
using System.Configuration;
using System.Text;
using System.Net.Mail;
using System.Data;
using CustomerPDTDataSetTableAdapters;

public partial class Authenticated_Customer_Paypal_Handler : System.Web.UI.Page
{
    ////////////////////////////////////Resrouces////////////////////////////////////
    /// 
    //https://developer.paypal.com/us/cgi-bin/devscr
    ///
    // See following url for more IPN code samples
    // https://cms.paypal.com/us/cgi-bin/?&cmd=_render-content&content_ID=developer/library_code_ipn_code_samples
    ///
    //Process Logic//
    //IF Process is verified and complete
    //ProcessIPN
    //IF Transaction is Successful
    //Email Payer
    //Email Admin
    //Start Time Up Procedure
    //IF Transaction is FAILED OR DENIED
    //Email Admin
    //IF Process FAIl or DENIED
    //Email Payer

    ////////////////////////////////////Resrouces////////////////////////////////////
    protected void Page_Load(object sender, EventArgs e)
    {
        string postUrl = ConfigurationManager.AppSettings["PayPalSubmitUrl"];
        HttpWebRequest req = (HttpWebRequest)WebRequest.Create(postUrl);

        //Set values for the request back
        req.Method = "POST";
        req.ContentType = "application/x-www-form-urlencoded";
        byte[] param = Request.BinaryRead(HttpContext.Current.Request.ContentLength);
        string strRequest = Encoding.ASCII.GetString(param);
        string ipnPost = strRequest;
        strRequest += "&cmd=_notify-validate";
        req.ContentLength = strRequest.Length;

        //for proxy
        //WebProxy proxy = new WebProxy(new Uri("http://url:port#"));
        //req.Proxy = proxy;

        //Send the request to PayPal and get the response
        StreamWriter streamOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
        streamOut.Write(strRequest);
        streamOut.Close();

        StreamReader streamIn = new StreamReader(req.GetResponse().GetResponseStream());
        string strResponse = streamIn.ReadToEnd();
        streamIn.Close();

        // logging ipn messages... be sure that you give write permission to process executing this code
        // string logPathDir = ResolveUrl("Messages");
        // string logPath = string.Format("{0}\\{1}.txt", Server.MapPath(logPathDir), DateTime.Now.Ticks);
        // File.WriteAllText(logPath, strResponse);

        IPNHolder pdt = IPNHolder.Parse(ipnPost);

        ////check the payment_status is Completed////
        ////check that txn_id has not been previously processed////
        ////check that receiver_email is your Primary PayPal email////
        ////check that payment_amount/payment_currency are correct////
        ////process payment////
        ////ASP.NET will send back a 200 automatically if your page executes successfully.////


        string CustomerID = GetCustomerID(pdt);
        switch (strResponse)
        {
            case "VERIFIED":
                switch (pdt._paymentStatus)
                {
                    case "Completed":
                        if (pdt._receiverEmail == "admin_1329938514_biz@yahoo.com")
                        {
                            ////Sucess////
                            SavedToDatabase(pdt, CustomerID);
                        }
                        else
                        {
                            EmailAdmin("PayPal: Unknown order...please check your paypal account", pdt);
                        }
                        break;
                    case "Failed":
                        EmailBuyer(Resources.Resource.PaypalFailedHeader, "Failed", pdt._payerEmail.ToString(), pdt);
                        EmailAdmin("PayPal: Failed Payment", pdt);
                        break;
                    case "Denied":
                        EmailBuyer(Resources.Resource.PaypalFailedHeader, "Denied", pdt._payerEmail.ToString(), pdt);
                        EmailAdmin("PayPal: Denied Payment", pdt);
                        break;
                }
                break;
            case "INVALID":
                EmailAdmin("PayPal: Invalid order, please review and investigate", pdt);
                break;
            default:
                EmailAdmin("PayPal: ERROR, response is " + this.Response, pdt);
                break;
        }
    }
    private void EmailBuyer(string subject, string reason, string PayerEmail, IPNHolder pdt)
    {
        MailMessage mailObj = new MailMessage();
        mailObj.From = new MailAddress("yoursidjob@yahoo.com");
        mailObj.Subject = subject;
        switch (reason)
        {
            case "Failed":
                mailObj.Body = Resources.Resource.PaypalFailedMessage;
                break;
            case "Denied":
                mailObj.Body = Resources.Resource.PaypalDeniedMessage;
                break;
            case "Success":
                mailObj.Body =  pdt._firstName + " " +
                                pdt._lastName + "<br/>"
                                + Resources.Resource.PaymentOf + " "
                                + pdt._currency + " " + pdt._paymentGross
                                + Resources.Resource.SucessfullyCompleted + "<br/>"
                                + Resources.Resource.ConfirmationNumber + " "+ pdt._txnID + "<br/>"
                                + Resources.Resource.Sincerely + "<br/>"
                                + Resources.Resource.YourSideJobTeam + "<br/>";
                break;
        }
        mailObj.To.Add(new MailAddress(PayerEmail));
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
    private void EmailAdmin(string subject, IPNHolder pdt)
    {
        string strTo = "postmaster@haithem-araissia.com";
        MailMessage MailMsg = new MailMessage(new MailAddress("haithemaraissia@yahoo.com"), new MailAddress(strTo));
        MailMsg.BodyEncoding = Encoding.Default;
        MailMsg.Subject = subject.ToString();
        MailMsg.Body = "<br />"
     + "_paymentGross " + pdt._paymentGross + "<br />"
     + "Invoice: " + pdt._invoice + "<br />"
     + "Payment Status: " + pdt._paymentStatus + "<br />"
     + "First Name: " + pdt._firstName + "<br />"
     + "Last Name: " + pdt._lastName + "<br />"
     + "Payment Fee: " + pdt._paymentFee + "<br />"
     + "Business " + pdt._business + "<br />"
     + "Receiver Email: " + pdt._receiverEmail + "<br />"
     + "Item Name: " + pdt._itemName + "<br />"
     + "Currency: " + pdt._currency + "<br />"
     + "TransactionID: " + pdt._txnID + "<br />"
     + "Custom: " + pdt._custom + "<br />"
     + "No Subscriber" + "No Subscriber" + "<br />"
     + "Custom: " + pdt._custom + "<br />"
     + "Transaction Type:" + pdt._txnType + "<br />"
     + "Pending Reason: " + pdt._pendingReason + "<br />"
     + "Date" + System.DateTime.UtcNow + "<br/>"
     + "City: " + pdt._city + "<br />"
     + "State: " + pdt._state + "<br />"
     + "City: " + pdt._city + "<br />"
     + "Zip: " + pdt._zip + "<br />"
     + "Country: " + pdt._country + "<br />"
     + "_addressStatus: " + pdt._addressStatus + "<br />"
     + "_payerStatus: " + pdt._payerStatus + "<br />"
     + "_payerID " + pdt._payerID + "<br />"
     + "_paymentType: " + pdt._paymentType + "<br />"
     + "_notifyVersion: " + pdt._notifyVersion + "<br />"
     + "_payerPhone: " + pdt._payerPhone + "<br />"
     + "_tax: " + pdt._tax + "<br />"
     + "_payerBusinessName: " + pdt._payerBusinessName + "<br />"
     + "--Role--: Customer <br />"
     + "CustomerID" + GetCustomerID(pdt) +"<br />";
        MailMsg.Priority = MailPriority.High;
        MailMsg.IsBodyHtml = true;
        SmtpClient SmtpMail = new SmtpClient();
        System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("postmaster@haithem-araissia.com", "haithem759163");
        SmtpMail.Host = "mail.haithem-araissia.com";
        SmtpMail.UseDefaultCredentials = false;
        SmtpMail.Credentials = basicAuthenticationInfo;
        SmtpMail.Send(MailMsg);
    }
    private void SavedToDatabase(IPNHolder pdt, string CustomerID)
    {
        ////Customer IPN ////
        CustomerPDTDataSetTableAdapters.CustomerIPNTableAdapter customerIpnAdapter = new CustomerPDTDataSetTableAdapters.CustomerIPNTableAdapter();
        customerIpnAdapter.AddTransaction(Convert.ToDouble(pdt._paymentGross), pdt._invoice, pdt._paymentStatus, pdt._firstName, pdt._lastName,
                                          Convert.ToDouble(pdt._paymentFee), pdt._business, pdt._receiverEmail, pdt._itemName, pdt._currency, pdt._txnID, pdt._custom, "No Subscriber",
                                         Convert.ToInt32(CustomerID), Convert.ToInt32(pdt._custom), pdt._txnType, pdt._pendingReason, System.DateTime.UtcNow, pdt._address, pdt._city, pdt._state,
                                          pdt._zip, pdt._country, pdt._countryCode, pdt._addressStatus, pdt._payerStatus, pdt._payerID, pdt._paymentType,
                                          pdt._notifyVersion, pdt._payerPhone, pdt._tax, pdt._payerBusinessName);
        ProcessIpn(pdt, CustomerID);
    }
    protected void ProcessIpn(IPNHolder pdt, string CustomerID)
    {
        //   1  //check that receiver_email is your Primary PayPal email
        //   2  //check the payment_status is Completed
        //   3  //check that payment_amount/payment_currency are correct
        //   4  //check that txn_id has not been previously processed
        //   5  //process payment

        //Customer IPN//
        CustomerPDTDataSetTableAdapters.CustomerIPNTableAdapter CustomerIPNTPDTAdapter = new CustomerPDTDataSetTableAdapters.CustomerIPNTableAdapter();
        CustomerPDTDataSet.CustomerIPNDataTable CustomerIPNTable = new CustomerPDTDataSet.CustomerIPNDataTable();
        CustomerIPNTPDTAdapter.FillCustomerIPN(CustomerIPNTable);

        //Successful PDT//
        CustomerPDTDataSetTableAdapters.CustomerSuccessfulPDTTableAdapter CustomerSuccessfulPDTAdapter = new CustomerPDTDataSetTableAdapters.CustomerSuccessfulPDTTableAdapter();
        CustomerPDTDataSet.CustomerSuccessfulPDTDataTable CustomerSuccessfulPDTTable = new CustomerPDTDataSet.CustomerSuccessfulPDTDataTable();

        //Suspicious IPN//
        CustomerPDTDataSetTableAdapters.CustomerSuspiciousIPNTableAdapter CustomerSuspiciousIPNAdapter = new CustomerPDTDataSetTableAdapters.CustomerSuspiciousIPNTableAdapter();
        CustomerPDTDataSet.CustomerSuspiciousIPNDataTable CustomerSuspiciousIPNTable = new CustomerPDTDataSet.CustomerSuspiciousIPNDataTable();
         
        //Transaction History//              
        CustomerPDTDataSetTableAdapters.QueriesTableAdapter CustomerPDT = new CustomerPDTDataSetTableAdapters.QueriesTableAdapter();

        foreach (DataRow row in CustomerIPNTable.Rows)
        {
            //1///check that receiver_email is your Primary PayPal email
            if (row["ReceiverEmail"].ToString() == "admin_1329938514_biz@yahoo.com")
            {
                //2//check the payment_status is Completed
                if (row["PaymentStatus"].ToString() == "Completed")
                {
                    //3//check that payment_amount/payment_currency are correct
                    CustomerSuccessfulPDTAdapter.FillCustomerSuccededPDT(CustomerSuccessfulPDTTable, Convert.ToInt32(CustomerID), Convert.ToInt32(row["ProjectID"].ToString()));
                    foreach (DataRow row1 in CustomerSuccessfulPDTTable.Rows)
                    {
                        if ((string.Equals(row1["CurrencyCode"].ToString(), row["CurrencyCode"].ToString())) && (string.Equals(row1["GrossTotal"].ToString(), row["GrossTotal"].ToString())))
                        {
                            //Customer had the confirmation page and the amount is right
                            //Successful IPN//
                            CustomerPDTDataSetTableAdapters.CustomerSuccesfulIPNTableAdapter CustomerSuccessfulIPNAdapter = new CustomerPDTDataSetTableAdapters.CustomerSuccesfulIPNTableAdapter();
                            CustomerPDTDataSet.CustomerSuccesfulIPNDataTable CustomerSuccessfulIPNTable = new CustomerPDTDataSet.CustomerSuccesfulIPNDataTable();

                            //4//check that txn_id has not been previously processed
                            CustomerSuccessfulIPNAdapter.FillByTransactionID(CustomerSuccessfulIPNTable, Convert.ToInt32(row["ProjectID"].ToString()), Convert.ToInt32(CustomerID), row["TransactionId"].ToString());
                            if (CustomerSuccessfulIPNTable.Rows.Count == 0)
                            {
                                //Insert a new record
                                CustomerSuccessfulIPNAdapter.AddTransaction(Convert.ToInt32(row["IPNID"].ToString()));
                                //Successful IPN
                                CustomerPDT.AddCustomerTransactionHistory(Convert.ToInt32(CustomerID),
                                                                          Convert.ToInt32(row["ProjectID"].ToString()), 0);
                                //EmailBuyer
                                EmailBuyer(Resources.Resource.PaypalSuccessfulHeader, "Success", pdt._payerEmail.ToString(), pdt);
                                //EmailAdmin
                                EmailAdmin(("Successful Payment"), pdt);
                            }
                            else
                            {
                                //the record already exist.Don't do anything.  
                            }
                        }
                        else
                        {

                            //Suspicicous GrossTotal , CurrencyCode or ProjectID
                            //Customer Close the window or Hacked
                            //Insert a new record to Suspicious
                            ///Suspicious Checking IPN////
                            CustomerPDTDataSetTableAdapters.CustomerSuspiousVerificationTableAdapter CustomerSuspiciousCheckinIPNAdapter = new CustomerPDTDataSetTableAdapters.CustomerSuspiousVerificationTableAdapter();
                            CustomerPDTDataSet.CustomerSuspiousVerificationDataTable CustomerSuspiciousCheckinIPNTable = new CustomerPDTDataSet.CustomerSuspiousVerificationDataTable();
                            CustomerSuspiciousCheckinIPNAdapter.FillCheck(CustomerSuspiciousCheckinIPNTable, Convert.ToInt32(row["ProjectID"].ToString()), Convert.ToInt32(CustomerID.ToString()));
                            //4//check that IPNID has not been previously processed
                            if (CustomerSuspiciousCheckinIPNTable.Rows.Count == 0)
                            {
                                CustomerSuspiciousIPNAdapter.AddTransactionByID(Convert.ToInt32(row["IPNID"].ToString()));
                                CustomerSuspiciousIPNAdapter.UpdatePendingReason("Suspicious Amount", (Convert.ToInt32(row["IPNID"].ToString())));

                                //EmailAdmin
                                EmailAdmin(("Suspicious Payment"), pdt);

                                //Suspicious IPN
                                CustomerPDT.AddCustomerTransactionHistory(Convert.ToInt32(CustomerID),
                                                                          Convert.ToInt32(row["ProjectID"].ToString()), 1);

                            }
                        }
                    } //3//check that payment_amount/payment_currency are correct

                }//2//
                else
                {
                    
                }//2//check the payment_status is Completed
            }//1//
            else
            {
                
            } //1//check that receiver_email is your Primary PayPal email
        }
    }

    protected string GetCustomerID(IPNHolder pdt)
    {
        CustomerPDTDataSetTableAdapters.CustomerTransactionForIPNTableAdapter  CustomerTransactionForIpnAdapter =
            new CustomerPDTDataSetTableAdapters.CustomerTransactionForIPNTableAdapter();
        CustomerPDTDataSet.CustomerTransactionForIPNDataTable CustomerTransactionForIpnTable =
            new CustomerPDTDataSet.CustomerTransactionForIPNDataTable();
        CustomerTransactionForIpnAdapter.FillCustomerIDForIPN(CustomerTransactionForIpnTable,
                                                              Convert.ToInt32(pdt._custom));
        return CustomerTransactionForIpnTable.Rows[0]["CustomerID"].ToString();
    }
}