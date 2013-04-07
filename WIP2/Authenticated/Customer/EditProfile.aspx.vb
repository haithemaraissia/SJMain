Imports System.Data

Partial Class Authoniticated_Customer_EditProfile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Page.IsPostBack = False Then
            Dim user As MembershipUser = Membership.GetUser
            Dim role As String = Me.User.IsInRole("Customer").ToString

            If user Is Nothing Or Session("CustomerID") Is Nothing Then
                Response.Redirect("~/NotAuthenticated/SignIn.aspx")
            ElseIf role = True Then
                Try
                    Dim dv As DataView = _
                                       CType(CustomerProfileObjectDataSource.Select, DataView)
                    ProfileFormView.DataBind()
                    RegionsDropDownList.SelectedValue = dv.Table.Rows(0).Item(7)
                Catch ex As Exception
                    Response.Redirect("~/Authenticated/Customer/CustomerProfile.aspx")
                End Try
            End If
        End If

    End Sub

    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Page.Validate()

        If Page.IsValid = True Then

            Dim FirstNameTextBox As TextBox = CType(Me.ProfileFormView.FindControl("FirstNameTextBox"), TextBox)
            Dim LastNameTextBox As TextBox = CType(Me.ProfileFormView.FindControl("LastNameTextBox"), TextBox)
            Dim AddressTextBox As TextBox = CType(Me.ProfileFormView.FindControl("AddressTextBox"), TextBox)
            Dim ZipcodeTextBox As TextBox = CType(Me.ProfileFormView.FindControl("ZipcodeTextBox"), TextBox)
            Dim AgeTextBox As TextBox = CType(Me.ProfileFormView.FindControl("AgeTextBox"), TextBox)
            Dim HomeTelephoneTextBox As TextBox = CType(Me.ProfileFormView.FindControl("HomeTelephoneTextBox"), TextBox)
            Dim EmailAddressTextBox As TextBox = CType(Me.ProfileFormView.FindControl("EmailAddressTextBox"), TextBox)
            Dim MobilePhoneTextBox As TextBox = CType(Me.ProfileFormView.FindControl("MobilePhoneTextBox"), TextBox)

            Dim CountryDropDownList As DropDownList = CType(Me.ProfileFormView.FindControl("CountryDropDownList"), DropDownList)
            Dim RegionsDropDownList As DropDownList = CType(Me.ProfileFormView.FindControl("RegionsDropDownList"), DropDownList)

            Dim CountryID As String = CountryDropDownList.SelectedValue.ToString()
            Dim CountryName As String = CountryDropDownList.SelectedItem.Text.ToString

            If CountryID = "254" Then
                Try
                    ZipcodeTextBox.Text = Convert.ToInt32(ZipcodeTextBox.Text.ToString)
                Catch ex As Exception
                    ZipcodeTextBox.Text = 0
                End Try
            End If

            Dim RegionID As String = RegionsDropDownList.SelectedValue.ToString()
            Dim RegionName As String = RegionsDropDownList.SelectedItem.Text.ToString

            Dim DetailView1 As DetailsView = CType(Me.ProfileFormView.FindControl("CityDetailView"), DetailsView)
            Dim CityId As String
            If DetailView1.SelectedValue Is Nothing Then
                CityId = -1
            Else
                CityId = DetailView1.SelectedValue.ToString
            End If

            Dim GenderDropDownList As DropDownList = CType(Me.ProfileFormView.FindControl("GenderDropDownList"), DropDownList)

            CustomerProfileObjectDataSource.UpdateParameters(0).DefaultValue = Session("CustomerID").ToString
            CustomerProfileObjectDataSource.UpdateParameters(1).DefaultValue = FirstNameTextBox.Text.ToString
            CustomerProfileObjectDataSource.UpdateParameters(2).DefaultValue = LastNameTextBox.Text.ToString
            CustomerProfileObjectDataSource.UpdateParameters(3).DefaultValue = AddressTextBox.Text.ToString
            CustomerProfileObjectDataSource.UpdateParameters(4).DefaultValue = CountryID.ToString
            CustomerProfileObjectDataSource.UpdateParameters(5).DefaultValue = CountryName.ToString
            CustomerProfileObjectDataSource.UpdateParameters(6).DefaultValue = RegionID.ToString
            CustomerProfileObjectDataSource.UpdateParameters(7).DefaultValue = RegionName.ToString
            CustomerProfileObjectDataSource.UpdateParameters(8).DefaultValue = CityId.ToString
            CustomerProfileObjectDataSource.UpdateParameters(9).DefaultValue = ZipcodeTextBox.Text.ToString
            CustomerProfileObjectDataSource.UpdateParameters(10).DefaultValue = HomeTelephoneTextBox.Text.ToString
            CustomerProfileObjectDataSource.UpdateParameters(11).DefaultValue = MobilePhoneTextBox.Text.ToString
            CustomerProfileObjectDataSource.UpdateParameters(12).DefaultValue = AgeTextBox.Text.ToString
            CustomerProfileObjectDataSource.UpdateParameters(13).DefaultValue = GenderDropDownList.SelectedValue.ToString
            CustomerProfileObjectDataSource.UpdateParameters(14).DefaultValue = EmailAddressTextBox.Text.ToString

            CustomerProfileObjectDataSource.Update()
            Response.Redirect("CustomerProfile.aspx")
        End If

    End Sub

    Protected Sub CountryDropDownList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.RegionsDropDownList.SelectedIndex = 0
        RegionsDropDownList.DataBind()
    End Sub

End Class
