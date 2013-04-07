
Partial Class Authenticated_Contracts_Report
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load


        'Return PDF
        Response.Clear()
        Response.ContentType = "application/pdf"


        Response.AddHeader("Content-disposition", "attachment; filename=Contract.pdf")
        Response.BinaryWrite(DirectCast(Session("rpt"), Byte()))


    End Sub
End Class
