using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Net;
using System.IO;
using System.Data;

public partial class Authenticated_Customer_Paypal_PDTSuccess : System.Web.UI.Page
{
    string authToken, txToken, query;
    string strResponse;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Used parts from https://www.paypaltech.com/PDTGen/
            // Visit above URL to auto-generate PDT script

            authToken = WebConfigurationManager.AppSettings["PDTToken"];

            //read in txn token from querystring
            txToken = Request.QueryString.Get("tx");

            query = string.Format("cmd=_notify-synch&tx={0}&at={1}", txToken, authToken);

            // Create the request back
            string url = WebConfigurationManager.AppSettings["PayPalSubmitUrl"];
            HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);

            // Set values for the request back
            req.Method = "POST";
            req.ContentType = "application/x-www-form-urlencoded";
            req.ContentLength = query.Length;

            // Write the request back IPN strings
            StreamWriter stOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
            stOut.Write(query);
            stOut.Close();

            // Do the request to PayPal and get the response
            StreamReader stIn = new StreamReader(req.GetResponse().GetResponseStream());
            strResponse = stIn.ReadToEnd();
            stIn.Close();
            string CustomerID = GetCustomerID();

             PDTHolder pdt = PDTHolder.Parse(strResponse);

                CustomerPDTDataSetTableAdapters.CustomerStartingPaymentTableAdapter CustomerPDTAdapter = new CustomerPDTDataSetTableAdapters.CustomerStartingPaymentTableAdapter();
                CustomerPDTDataSet.CustomerStartingPaymentDataTable CustomerPDTTable = new CustomerPDTDataSet.CustomerStartingPaymentDataTable();
                CustomerPDTAdapter.FillVerifyTransaction(CustomerPDTTable, Convert.ToInt32(pdt.Custom));

 
            // If response was SUCCESS, parse response string and output details
            //The payment is succesful
            if (strResponse.StartsWith("SUCCESS"))
            {
                           //If there is no match
                //The customer close the windows.

                //If There is a match
                //The customer return back to the confirmation page.

                foreach (DataRow row in CustomerPDTTable)
                {
                    CustomerPDTDataSetTableAdapters.QueriesTableAdapter CustomerPDT = new CustomerPDTDataSetTableAdapters.QueriesTableAdapter();

                    if (pdt.Custom.ToString() == row["ProjectID"].ToString() && pdt.Currency.ToString() == row["CurrencyCode"].ToString() && (row["Amount"].ToString() == pdt.GrossTotal.ToString()))
                    {
                        //Insert it only 1 time
                        ////Sucessful PDT////
                        CustomerPDTDataSetTableAdapters.CustomerSuccessfulPDTTableAdapter CustomerSuccessfulPDTAdapter = new CustomerPDTDataSetTableAdapters.CustomerSuccessfulPDTTableAdapter();
                        CustomerPDTDataSet.CustomerSuccessfulPDTDataTable CustomerSuccessfulPDTTable = new CustomerPDTDataSet.CustomerSuccessfulPDTDataTable();
                        CustomerSuccessfulPDTAdapter.FillCustomerSuccededPDT(CustomerSuccessfulPDTTable, Convert.ToInt32(CustomerID), Convert.ToInt32(pdt.Custom.ToString()));

                        if (CustomerSuccessfulPDTTable.Rows.Count == 0)
                        {
                            CustomerPDT.SuccessPDT(pdt.GrossTotal, pdt.InvoiceNumber, pdt.PaymentStatus, pdt.PayerFirstName, pdt.PayerLastName, pdt.PaymentFee, pdt.BusinessEmail, txToken
                     , pdt.ReceiverEmail, pdt.ItemName, pdt.Currency, pdt.TransactionId, pdt.Custom, "no subscriber", Convert.ToInt32(CustomerID), Convert.ToInt32(pdt.Custom));

                            CustomerPDT.AddCustomerPendingTransaction(Convert.ToInt32(CustomerID),
                                                                      Convert.ToInt32(pdt.Custom));

                            string sucessmessage = pdt.PayerFirstName + " " +
                                pdt.PayerFirstName + "<br/>";
                            sucessmessage += Resources.Resource.PaymentOf + " ";
                            sucessmessage += pdt.Currency + " " + pdt.GrossTotal +
                                Resources.Resource.PaymentProcessed + "<br/>";
                            sucessmessage += Resources.Resource.Sincerely + "<br/>";
                            sucessmessage += Resources.Resource.YourSideJobTeam + "<br/>";
                        }
                        else
                        {
                            HiddenLabel.Text = Resources.Resource.AlreadyPaid;
                        }
                    }
                    else
                    {
                        //Potential Hack
                        CustomerPDT.HackedPDT(pdt.GrossTotal, pdt.InvoiceNumber, pdt.PaymentStatus, pdt.PayerFirstName, pdt.PayerLastName, pdt.PaymentFee, pdt.BusinessEmail, txToken
                          , pdt.ReceiverEmail, pdt.ItemName, pdt.Currency, pdt.TransactionId, pdt.Custom, "no subscriber", Convert.ToInt32(CustomerID), Convert.ToInt32(pdt.Custom));

                        //Email The Hacker and Admin
                        string failuremessage = pdt.PayerFirstName + " " +
                                pdt.PayerFirstName + "<br/>";
                        failuremessage += Resources.Resource.FailedTransaction + "<br/>";
                        failuremessage += Resources.Resource.FailurePDT;
                        HiddenLabel.Text = failuremessage;
                       
                    }

                }
            }
            else
            {
                string failuremessage = pdt.PayerFirstName + " " +
                                 pdt.PayerFirstName + "<br/>";
                failuremessage += Resources.Resource.FailedTransaction + "<br/>";
                failuremessage += Resources.Resource.FailurePDT;
                HiddenLabel.Text = failuremessage;
            }
        }
    }

    public string GetCustomerID()
    {
        string customer_id = "";
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
}