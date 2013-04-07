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
                                       CType(ProfessionalOptionalObjectDataSource.Select, DataView)
                    ProfileFormView.DataBind()
                    RegionsDropDownList.SelectedValue = dv.Table.Rows(0).Item(3)

                Catch ex As Exception
                    Response.Redirect("~/Authenticated/Professional/ProfessionalProfile.aspx")
                End Try
            End If
        End If

    End Sub

    Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Page.Validate()

        If Page.IsValid = True Then

            Dim AddressTextBox As TextBox = CType(Me.ProfileFormView.FindControl("AddressTextBox"), TextBox)
            Dim ZipcodeTextBox As TextBox = CType(Me.ProfileFormView.FindControl("ZipcodeTextBox"), TextBox)
            Dim TelephoneTextBox As TextBox = CType(Me.ProfileFormView.FindControl("TelephoneTextBox"), TextBox)
            Dim EmailAddressTextBox As TextBox = CType(Me.ProfileFormView.FindControl("EmailAddressTextBox"), TextBox)

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

            ProfessionalOptionalObjectDataSource.UpdateParameters(0).DefaultValue = Session("ProfessionalID").ToString
            ProfessionalOptionalObjectDataSource.UpdateParameters(1).DefaultValue = AddressTextBox.Text.ToString
            ProfessionalOptionalObjectDataSource.UpdateParameters(2).DefaultValue = CountryID.ToString
            ProfessionalOptionalObjectDataSource.UpdateParameters(3).DefaultValue = CountryName.ToString
            ProfessionalOptionalObjectDataSource.UpdateParameters(4).DefaultValue = RegionID.ToString
            ProfessionalOptionalObjectDataSource.UpdateParameters(5).DefaultValue = RegionName.ToString
            ProfessionalOptionalObjectDataSource.UpdateParameters(6).DefaultValue = CityId.ToString
            ProfessionalOptionalObjectDataSource.UpdateParameters(7).DefaultValue = ZipcodeTextBox.Text.ToString
            ProfessionalOptionalObjectDataSource.UpdateParameters(8).DefaultValue = TelephoneTextBox.Text.ToString
            ProfessionalOptionalObjectDataSource.Update()
            Response.Redirect("ProfessionalProfile.aspx")
        End If

    End Sub

    Protected Sub CountryDropDownList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.RegionsDropDownList.SelectedIndex = 0
        RegionsDropDownList.DataBind()
    End Sub


End Class
