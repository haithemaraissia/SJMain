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



//http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Authenticated/Professional/Paypal/PDTSuccess.aspx?tx=0G0384714B839305M&st=Pending&amt=2800.00&cc=USD&cm=19&item_number=

public partial class Authenticated_Professional_PayPal_PDTSuccess : System.Web.UI.Page
{
    string authToken, txToken, query;
    string strResponse;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Used parts from https://www.paypaltech.com/PDTGen/
            // Visit above URL to auto-generate PDT script

            authToken = WebConfigurationManager.AppSettings["PROPDTToken"];

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
            string ProID = GetProfessionalID();

            Response.Write(strResponse);
            //PDTHolder pdt = PDTHolder.Parse(strResponse);

            //ProfessionalPDTDataSetTableAdapters.ProfessionalStartingPaymentTableAdapter ProfessionalPDTAdapter = new ProfessionalPDTDataSetTableAdapters.ProfessionalStartingPaymentTableAdapter();
            //ProfessionalPDTDataSet.ProfessionalStartingPaymentDataTable ProfessionalPDTTable = new ProfessionalPDTDataSet.ProfessionalStartingPaymentDataTable();
            //ProfessionalPDTAdapter.FillVerifyTransaction(ProfessionalPDTTable, Convert.ToInt32(pdt.Custom));


            //// If response was SUCCESS, parse response string and output details
            ////The payment is succesful
            //if (strResponse.StartsWith("SUCCESS"))
            //{
            //    //If there is no match
            //    //The Professional close the windows.

            //    //If There is a match
            //    //The Professional return back to the confirmation page.

            //    foreach (DataRow row in ProfessionalPDTTable)
            //    {
            //        ProfessionalPDTDataSetTableAdapters.QueriesTableAdapter ProfessionalPDT = new ProfessionalPDTDataSetTableAdapters.QueriesTableAdapter();

            //        if (pdt.Custom.ToString() == row["ProjectID"].ToString() && pdt.Currency.ToString() == row["CurrencyCode"].ToString() && (row["Amount"].ToString() == pdt.GrossTotal.ToString()))
            //        {
            //            //Insert it only 1 time
            //            ////Sucessful PDT////
            //            ProfessionalPDTDataSetTableAdapters.ProfessionalSuccessfulPDTTableAdapter ProfessionalSuccessfulPDTAdapter = new ProfessionalPDTDataSetTableAdapters.ProfessionalSuccessfulPDTTableAdapter();
            //            ProfessionalPDTDataSet.ProfessionalSuccessfulPDTDataTable ProfessionalSuccessfulPDTTable = new ProfessionalPDTDataSet.ProfessionalSuccessfulPDTDataTable();
            //            ProfessionalSuccessfulPDTAdapter.FillProfessionalSuccededPDT(ProfessionalSuccessfulPDTTable, Convert.ToInt32(ProID), Convert.ToInt32(pdt.Custom.ToString()));

            //            if (ProfessionalSuccessfulPDTTable.Rows.Count == 0)
            //            {
            //                ProfessionalPDT.SuccessPDT(pdt.GrossTotal, pdt.InvoiceNumber, pdt.PaymentStatus, pdt.PayerFirstName, pdt.PayerLastName, pdt.PaymentFee, pdt.BusinessEmail, txToken
            //         , pdt.ReceiverEmail, pdt.ItemName, pdt.Currency, pdt.TransactionId, pdt.Custom, "no subscriber", Convert.ToInt32(ProID), Convert.ToInt32(pdt.Custom));

            //                ProfessionalPDT.AddProfessionalPendingTransaction(Convert.ToInt32(ProID),
            //                                                          Convert.ToInt32(pdt.Custom));

            //                string sucessmessage = pdt.PayerFirstName + " " +
            //                    pdt.PayerFirstName + "<br/>";
            //                sucessmessage += Resources.Resource.PaymentOf + " ";
            //                sucessmessage += pdt.Currency + " " + pdt.GrossTotal +
            //                    Resources.Resource.PaymentProcessed + "<br/>";
            //                sucessmessage += Resources.Resource.Sincerely + "<br/>";
            //                sucessmessage += Resources.Resource.YourSideJobTeam + "<br/>";
            //            }
            //            else
            //            {
            //                HiddenLabel.Text = Resources.Resource.AlreadyPaid;
            //            }
            //        }
            //        else
            //        {
            //            //Potential Hack
            //            ProfessionalPDT.HackedPDT(pdt.GrossTotal, pdt.InvoiceNumber, pdt.PaymentStatus, pdt.PayerFirstName, pdt.PayerLastName, pdt.PaymentFee, pdt.BusinessEmail, txToken
            //              , pdt.ReceiverEmail, pdt.ItemName, pdt.Currency, pdt.TransactionId, pdt.Custom, "no subscriber", Convert.ToInt32(ProID), Convert.ToInt32(pdt.Custom));

            //            //Email The Hacker and Admin
            //            string failuremessage = pdt.PayerFirstName + " " +
            //                    pdt.PayerFirstName + "<br/>";
            //            failuremessage += Resources.Resource.FailedTransaction + "<br/>";
            //            failuremessage += Resources.Resource.FailurePDT;
            //            HiddenLabel.Text = failuremessage;

            //        }

            //    }
            //}
            //else
            //{
            //    string failuremessage = pdt.PayerFirstName + " " +
            //                     pdt.PayerFirstName + "<br/>";
            //    failuremessage += Resources.Resource.FailedTransaction + "<br/>";
            //    failuremessage += Resources.Resource.FailurePDT;
            //    HiddenLabel.Text = failuremessage;
            //}
        }
    }

    public string GetProfessionalID()
    {
        string ProID = "";
        if (!String.IsNullOrEmpty(Session["ProfessionalId"].ToString()))
        {
            ProID = Session["ProfessionalId"].ToString();
        }
        else
        {
            Response.Redirect("ProfessionalProfile.aspx");
        }
        return ProID;
    }
}