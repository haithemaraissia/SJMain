Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System

Public Class PDTHolder
    Public Property GrossTotal() As Double
        Get
            Return m_GrossTotal
        End Get
        Set(value As Double)
            m_GrossTotal = Value
        End Set
    End Property
    Private m_GrossTotal As Double
    Public Property InvoiceNumber() As Integer
        Get
            Return m_InvoiceNumber
        End Get
        Set(value As Integer)
            m_InvoiceNumber = Value
        End Set
    End Property
    Private m_InvoiceNumber As Integer
    Public Property PaymentStatus() As String
        Get
            Return m_PaymentStatus
        End Get
        Set(value As String)
            m_PaymentStatus = Value
        End Set
    End Property
    Private m_PaymentStatus As String
    Public Property PayerFirstName() As String
        Get
            Return m_PayerFirstName
        End Get
        Set(value As String)
            m_PayerFirstName = Value
        End Set
    End Property
    Private m_PayerFirstName As String
    Public Property PaymentFee() As Double
        Get
            Return m_PaymentFee
        End Get
        Set(value As Double)
            m_PaymentFee = Value
        End Set
    End Property
    Private m_PaymentFee As Double
    Public Property BusinessEmail() As String
        Get
            Return m_BusinessEmail
        End Get
        Set(value As String)
            m_BusinessEmail = Value
        End Set
    End Property
    Private m_BusinessEmail As String
    Public Property PayerEmail() As String
        Get
            Return m_PayerEmail
        End Get
        Set(value As String)
            m_PayerEmail = Value
        End Set
    End Property
    Private m_PayerEmail As String
    Public Property TxToken() As String
        Get
            Return m_TxToken
        End Get
        Set(value As String)
            m_TxToken = Value
        End Set
    End Property
    Private m_TxToken As String
    Public Property PayerLastName() As String
        Get
            Return m_PayerLastName
        End Get
        Set(value As String)
            m_PayerLastName = Value
        End Set
    End Property
    Private m_PayerLastName As String
    Public Property ReceiverEmail() As String
        Get
            Return m_ReceiverEmail
        End Get
        Set(value As String)
            m_ReceiverEmail = Value
        End Set
    End Property
    Private m_ReceiverEmail As String
    Public Property ItemName() As String
        Get
            Return m_ItemName
        End Get
        Set(value As String)
            m_ItemName = Value
        End Set
    End Property
    Private m_ItemName As String
    Public Property Currency() As String
        Get
            Return m_Currency
        End Get
        Set(value As String)
            m_Currency = Value
        End Set
    End Property
    Private m_Currency As String
    Public Property TransactionId() As String
        Get
            Return m_TransactionId
        End Get
        Set(value As String)
            m_TransactionId = Value
        End Set
    End Property
    Private m_TransactionId As String
    Public Property SubscriberId() As String
        Get
            Return m_SubscriberId
        End Get
        Set(value As String)
            m_SubscriberId = Value
        End Set
    End Property
    Private m_SubscriberId As String
    Public Property [Custom]() As String
        Get
            Return m_Custom
        End Get
        Set(value As String)
            m_Custom = Value
        End Set
    End Property
    Private m_Custom As String

    Public Shared Function Parse(postData As String) As PDTHolder
        Dim sKey As [String], sValue As [String]
        Dim ph As New PDTHolder()

        Try
            'split response into string array using whitespace delimeter
            Dim StringArray As [String]() = postData.Split(ControlChars.Lf)

            ' NOTE:
            '
            '            * loop is set to start at 1 rather than 0 because first
            '            string in array will be single word SUCCESS or FAIL
            '            Only used to verify post data
            '            


            ' use split to split array we already have using "=" as delimiter
            Dim i As Integer
            For i = 1 To StringArray.Length - 2
                Dim StringArray1 As [String]() = StringArray(i).Split("="c)

                sKey = StringArray1(0)
                sValue = HttpUtility.UrlDecode(StringArray1(1))

                ' set string vars to hold variable names using a switch
                Select Case sKey
                    Case "mc_gross"
                        ph.GrossTotal = Convert.ToDouble(sValue)
                        Exit Select

                    Case "invoice"
                        ph.InvoiceNumber = Convert.ToInt32(sValue)
                        Exit Select

                    Case "payment_status"
                        ph.PaymentStatus = Convert.ToString(sValue)
                        Exit Select

                    Case "first_name"
                        ph.PayerFirstName = Convert.ToString(sValue)
                        Exit Select

                    Case "mc_fee"
                        ph.PaymentFee = Convert.ToDouble(sValue)
                        Exit Select

                    Case "business"
                        ph.BusinessEmail = Convert.ToString(sValue)
                        Exit Select

                    Case "payer_email"
                        ph.PayerEmail = Convert.ToString(sValue)
                        Exit Select

                    Case "Tx Token"
                        ph.TxToken = Convert.ToString(sValue)
                        Exit Select

                    Case "last_name"
                        ph.PayerLastName = Convert.ToString(sValue)
                        Exit Select

                    Case "receiver_email"
                        ph.ReceiverEmail = Convert.ToString(sValue)
                        Exit Select

                    Case "item_name"
                        ph.ItemName = Convert.ToString(sValue)
                        Exit Select

                    Case "mc_currency"
                        ph.Currency = Convert.ToString(sValue)
                        Exit Select

                    Case "txn_id"
                        ph.TransactionId = Convert.ToString(sValue)
                        Exit Select

                    Case "custom"
                        ph.[Custom] = Convert.ToString(sValue)
                        Exit Select

                    Case "subscr_id"
                        ph.SubscriberId = Convert.ToString(sValue)
                        Exit Select
                End Select
            Next

            Return ph
        Catch ex As Exception
            Throw ex
        End Try
    End Function
End Class
