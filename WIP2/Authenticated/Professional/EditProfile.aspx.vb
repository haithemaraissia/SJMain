Imports System.Data

Partial Class Authoniticated_Professional_EditProfile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Page.IsPostBack = False Then
            Dim user As MembershipUser = Membership.GetUser
            Dim role As String = Me.User.IsInRole("Professional").ToString

            If user Is Nothing Or Session("ProfessionalID") Is Nothing Then
                Response.Redirect("~/NotAuthenticated/SignIn.aspx")
            ElseIf role = True Then
                Try
                    Dim dv As DataView = _
                                       CType(ProfessionalProfileObjectDataSource.Select, DataView)
                    ProfileFormView.DataBind()
                    RegionsDropDownList.SelectedValue = dv.Table.Rows(0).Item(7)
                Catch ex As Exception
                    Response.Redirect("~/Authenticated/Professional/ProfessionalProfile.aspx")
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

            ProfessionalProfileObjectDataSource.UpdateParameters(0).DefaultValue = Session("ProfessionalID").ToString
            ProfessionalProfileObjectDataSource.UpdateParameters(1).DefaultValue = FirstNameTextBox.Text.ToString
            ProfessionalProfileObjectDataSource.UpdateParameters(2).DefaultValue = LastNameTextBox.Text.ToString
            ProfessionalProfileObjectDataSource.UpdateParameters(3).DefaultValue = AddressTextBox.Text.ToString
            ProfessionalProfileObjectDataSource.UpdateParameters(4).DefaultValue = CountryID.ToString
            ProfessionalProfileObjectDataSource.UpdateParameters(5).DefaultValue = CountryName.ToString
            ProfessionalProfileObjectDataSource.UpdateParameters(6).DefaultValue = RegionID.ToString
            ProfessionalProfileObjectDataSource.UpdateParameters(7).DefaultValue = RegionName.ToString
            ProfessionalProfileObjectDataSource.UpdateParameters(8).DefaultValue = CityId.ToString
            ProfessionalProfileObjectDataSource.UpdateParameters(9).DefaultValue = ZipcodeTextBox.Text.ToString
            ProfessionalProfileObjectDataSource.UpdateParameters(10).DefaultValue = HomeTelephoneTextBox.Text.ToString
            ProfessionalProfileObjectDataSource.UpdateParameters(11).DefaultValue = MobilePhoneTextBox.Text.ToString
            ProfessionalProfileObjectDataSource.UpdateParameters(12).DefaultValue = AgeTextBox.Text.ToString
            ProfessionalProfileObjectDataSource.UpdateParameters(13).DefaultValue = GenderDropDownList.SelectedValue.ToString
            ProfessionalProfileObjectDataSource.UpdateParameters(14).DefaultValue = EmailAddressTextBox.Text.ToString

            ProfessionalProfileObjectDataSource.Update()
            Response.Redirect("ProfessionalProfile.aspx")
        End If

    End Sub

    Protected Sub CountryDropDownList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.RegionsDropDownList.SelectedIndex = 0
        RegionsDropDownList.DataBind()
    End Sub

End Class
