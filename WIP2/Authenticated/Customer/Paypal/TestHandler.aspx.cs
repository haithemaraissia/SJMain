using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Authenticated_Customer_Paypal_TestHandler : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string ipnPost =
        //    "test_ipn=1&payment_type=echeck&payment_date=14%3A01%3A09+May+08%2C+2012+PDT&payment_status=Completed&address_status=confirmed&payer_status=verified&first_name=John&last_name=Smith&payer_email=haraissia%40sosland.com&payer_id=168&address_name=mark+docusis&address_country=United+States&address_country_code=US&address_zip=95131&address_state=CA&address_city=San+Jose&address_street=123%2C+any+street&business=admin_1329938514_biz%40yahoo.com&receiver_email=admin_1329938514_biz%40yahoo.com&receiver_id=100&residence_country=US&item_name=something&item_number=AK-1234&quantity=1&shipping=3.04&tax=2.02&mc_currency=USD&mc_fee=22.35&mc_gross=760.5&txn_type=web_accept&txn_id=61G66267YD4931245&notify_version=2.1&custom=5&invoice=123&charset=windows-1252&verify_sign=AtGcvIirMxIE9oVdTZmqYR9yliRwAtmzRBonR661EPhW9c7XM0A-CNrO";
        //IPNHolder pdt = IPNHolder.Parse(ipnPost);

        //Response.Write(pdt._paymentGross.ToString());

        string CustomerID = GetCustomerID("5");
        Response.Write(CustomerID);
    }


    protected string GetCustomerID(string pdt)
    {
        CustomerPDTDataSetTableAdapters.CustomerTransactionForIPNTableAdapter CustomerTransactionForIpnAdapter =
            new CustomerPDTDataSetTableAdapters.CustomerTransactionForIPNTableAdapter();
        CustomerPDTDataSet.CustomerTransactionForIPNDataTable CustomerTransactionForIpnTable =
            new CustomerPDTDataSet.CustomerTransactionForIPNDataTable();
        CustomerTransactionForIpnAdapter.FillCustomerIDForIPN(CustomerTransactionForIpnTable,
                                                              Convert.ToInt32(pdt));
        return CustomerTransactionForIpnTable.Rows[0]["CustomerID"].ToString();
    }
}