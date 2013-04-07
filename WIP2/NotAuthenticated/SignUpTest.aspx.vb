Imports System.Threading
Imports System.Globalization
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO


Partial Class NotAuthenticated_SignUpTest
    Inherits System.Web.UI.Page

    Dim totalSkills As Integer = 1
    Dim skills(4) As String
    Dim ChosenRole As String = "Customer"
    Public _language As Integer

    Protected Sub SEOSiteMap()
        Page.Title = Resources.Resource.SignUpTitle.ToString

        Dim nl1 As New Web.UI.WebControls.Literal
        nl1.Text = Environment.NewLine
        Dim Title As New HtmlMeta()
        Title.Name = "title"
        Title.Content = Resources.Resource.SignUpTitle.ToString
        Page.Header.Controls.AddAt(1, Title)

        Dim Description As New HtmlMeta()
        Description.Name = "description"
        Description.Content = Resources.Resource.SignUpDescription.ToString
        Page.Header.Controls.AddAt(2, Description)

        Dim keywords As New HtmlMeta()
        keywords.Name = "keywords"
        keywords.Content = Resources.Resource.SignUpKeywords.ToString
        Page.Header.Controls.AddAt(3, keywords)
    End Sub

    Protected Overrides Sub InitializeCulture()

        Dim lang As String = Request.QueryString("l")
        If lang IsNot Nothing Or lang <> "" Then
            Thread.CurrentThread.CurrentUICulture = New CultureInfo(lang)
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang)
            Session("LCID") = lang
        Else
            If Session("LCID") IsNot Nothing Or Session("LCID") <> "" Then
                Thread.CurrentThread.CurrentUICulture = New CultureInfo(Session("LCID").ToString())
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Session("LCID").ToString())
            End If
        End If
        ActivateLanguage()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            Dim lang As String = Request.QueryString("l")
            If lang IsNot Nothing Or lang <> "" Then
                Thread.CurrentThread.CurrentUICulture = New CultureInfo(lang)
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang)
            End If

            ClearSession()
        End If
    End Sub

    Public Property Language() As Integer
        Get
            Return _language
        End Get
        Set(ByVal value As Integer)
            value = _language
        End Set
    End Property

    Protected Sub ActivateLanguage()
        Select Case Thread.CurrentThread.CurrentUICulture.TwoLetterISOLanguageName.ToString
            Case "en"
                ''English
                _language = 1

            Case "fr"
                '"French
                _language = 2
        End Select
    End Sub

    Protected Sub CountryDropDownList_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs)
        RegionsDropDownList.DataBind()
        CityUpdatePanel.Update()
        DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub RegionDropDownList_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs)
        DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub Industry_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        DelayModalPopUpExtender.Hide()
    End Sub

    Protected Sub SignInButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("SignIn.aspx")
    End Sub

    Protected Sub ContinueButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If RoleLabel.Text = Resources.Resource.Customer.ToString Then
            CreateCustomer()
        Else
            CreateProfessional()
        End If
    End Sub

    Protected Sub CreateCustomer()
        Dim FirstNameTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("FirstNameTextBox"), TextBox)
        Dim LastNameTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("LastNameTextBox"), TextBox)
        Dim AddressTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AddressTextBox"), TextBox)
        Dim HomeTelephoneTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("HomeTelephoneTextBox"), TextBox)
        Dim MobilePhoneTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("MobilePhoneTextBox"), TextBox)
        Dim GenderDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("GenderDropDownList"), DropDownList)
        Dim AgeTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AgeTextBox"), TextBox)
        Dim ZipcodeTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("ZipcodeTextBox"), TextBox)
        Dim CountryDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CountryDropDownList"), DropDownList)
        Dim RegionsDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("RegionsDropDownList"), DropDownList)
        Dim CityDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CitiesDropDownList"), DropDownList)
        Dim CityIdTextBox As String
        If CityDropDownList.Items.Count = 0 Then
            CityIdTextBox = -1
        Else
            CityIdTextBox = CityDropDownList.SelectedValue.ToString
        End If
        Dim ZipcodeValue As String
        Dim USAZipCodeRegex As Regex = New Regex("\d{5}(-\d{4})?")
        Dim CanadaZipCodeRegex As Regex = New Regex("[A-Z]\d[A-Z] \d[A-Z]\d")
        If (String.Compare(CountryDropDownList.SelectedValue.ToString, "USA") = 0) Then
            If USAZipCodeRegex.IsMatch(ZipcodeTextBox.Text) Then
                ZipcodeValue = ZipcodeTextBox.Text
            Else
                ZipcodeValue = "0"
            End If
        ElseIf (String.Compare(CountryDropDownList.SelectedValue.ToString, "Canada") = 0) Then
            If CanadaZipCodeRegex.IsMatch(ZipcodeTextBox.Text) Then
                ZipcodeValue = ZipcodeTextBox.Text
            Else
                ZipcodeValue = "0"
            End If
        End If
        Dim user As MembershipUser = Membership.GetUser(SignUpCreateWizard.UserName)
        If user Is Nothing Then
            Throw New ApplicationException("Can't find the user.")
            Response.Redirect("index.aspx")
        End If
        Roles.AddUserToRole(SignUpCreateWizard.UserName, "Customer")

        Dim ProfileConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("SideJobConnectionString").ConnectionString)
        ProfileConnection.Open()
        Dim ProfileTransaction As SqlTransaction = ProfileConnection.BeginTransaction()

        Try
            Dim ProfileCommand As New SqlCommand("CreateCustomer", ProfileConnection, ProfileTransaction)
            ProfileCommand.CommandType = CommandType.StoredProcedure

            Dim CustomerResult As New SqlParameter("@ErrorCode", SqlDbType.Int)
            CustomerResult.Direction = ParameterDirection.Output
            CustomerResult.Value = 0
            ProfileCommand.Parameters.Add(CustomerResult)

            Dim LCID As New SqlParameter("@LCID ", SqlDbType.Int)
            LCID.Value = _language
            ProfileCommand.Parameters.Add(LCID)

            Dim USERNAME1 As New SqlParameter("@USERNAME", SqlDbType.NVarChar, 255)
            USERNAME1.Value = SignUpCreateWizard.UserName.ToString
            ProfileCommand.Parameters.Add(USERNAME1)

            Dim FirstName As New SqlParameter("@FirstName", SqlDbType.NVarChar, 10)
            FirstName.Value = FirstNameTextBox.Text
            ProfileCommand.Parameters.Add(FirstName)

            Dim LastName As New SqlParameter("@LastName", SqlDbType.NVarChar, 20)
            LastName.Value = LastNameTextBox.Text
            ProfileCommand.Parameters.Add(LastName)

            Dim Address As New SqlParameter("@Address", SqlDbType.NVarChar, 60)
            Address.Value = AddressTextBox.Text
            ProfileCommand.Parameters.Add(Address)

            Dim CountryID As New SqlParameter("@CountryID", SqlDbType.Int)
            CountryID.Value = CountryDropDownList.SelectedValue.ToString()
            ProfileCommand.Parameters.Add(CountryID)

            Dim CountryValue As New SqlParameter("@CountryName", SqlDbType.VarChar, 128)
            CountryValue.Value = CountryDropDownList.SelectedItem.Text.ToString
            ProfileCommand.Parameters.Add(CountryValue)

            Dim RegionID As New SqlParameter("@RegionID", SqlDbType.Int)
            RegionID.Value = RegionsDropDownList.SelectedValue.ToString()
            ProfileCommand.Parameters.Add(RegionID)

            Dim RegionName As New SqlParameter("@RegionName", SqlDbType.VarChar, 128)
            RegionName.Value = RegionsDropDownList.SelectedItem.Text.ToString
            ProfileCommand.Parameters.Add(RegionName)

            Dim CityID As New SqlParameter("@CityID", SqlDbType.Int)
            CityID.Value = CityIdTextBox.ToString
            ProfileCommand.Parameters.Add(CityID)

            Dim HomePhoneNumber As New SqlParameter("@HomePhoneNumber", SqlDbType.NVarChar, 24)
            HomePhoneNumber.Value = HomeTelephoneTextBox.Text
            ProfileCommand.Parameters.Add(HomePhoneNumber)

            Dim Zipcode As New SqlParameter("@Zipcode", SqlDbType.NVarChar, 20)
            Zipcode.Value = ZipcodeTextBox.Text
            ProfileCommand.Parameters.Add(Zipcode)

            Dim MobilePhoneNumber As New SqlParameter("@MobilePhoneNumber", SqlDbType.NVarChar, 24)
            MobilePhoneNumber.Value = MobilePhoneTextBox.Text
            ProfileCommand.Parameters.Add(MobilePhoneNumber)

            Dim Age As New SqlParameter("@Age", SqlDbType.Int)
            Age.Value = AgeTextBox.Text
            ProfileCommand.Parameters.Add(Age)

            Dim EmailAddress As New SqlParameter("@EmailAddress", SqlDbType.NVarChar, 256)
            EmailAddress.Value = Me.SignUpCreateWizard.Email.ToString
            ProfileCommand.Parameters.Add(EmailAddress)

            Dim Gender As New SqlParameter("@Gender", SqlDbType.Int)
            Gender.Value = GenderDropDownList.SelectedValue
            ProfileCommand.Parameters.Add(Gender)

            Dim DateEvent As New SqlParameter("@DateEvent", SqlDbType.SmallDateTime)
            DateEvent.Value = DateTime.Now.ToShortDateString.ToString
            ProfileCommand.Parameters.Add(DateEvent)

            Dim DateMessage As New SqlParameter("@DateMessage", SqlDbType.SmallDateTime)
            DateMessage.Value = DateTime.Now.ToShortDateString.ToString
            ProfileCommand.Parameters.Add(DateMessage)

            Dim reader As SqlDataReader = ProfileCommand.ExecuteReader()
            Dim Result As Integer = Convert.ToInt32(CustomerResult.Value)
            If Result = 99 Then
                Server.Transfer("../NotAuthonitizated/LockedUser.aspx")
            End If
            reader.Close()
            ProfileTransaction.Commit()
            SignUpCreateWizard.ContinueDestinationPageUrl = "~/Authenticated/Customer/CustomerProfile.aspx"
            CreateDirectory()

        Catch ex As Exception
            Throw
            Response.Redirect("index.aspx")
        Finally
            ProfileConnection.Close()
        End Try

    End Sub

    Protected Sub CustomerLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CustomerLinkButton.Click
        RoleLabel.Text = Resources.Resource.Customer.ToString
        RoleLabel.ForeColor = System.Drawing.ColorTranslator.FromHtml("#800000")
        customercolumn.BgColor = "#800000"
        professionalcolumn.BgColor = "white"
    End Sub

    Protected Sub CreateProfessional()

        Dim FirstNameTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("FirstNameTextBox"), TextBox)
        Dim LastNameTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("LastNameTextBox"), TextBox)
        Dim AddressTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AddressTextBox"), TextBox)
        Dim HomeTelephoneTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("HomeTelephoneTextBox"), TextBox)
        Dim MobilePhoneTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("MobilePhoneTextBox"), TextBox)
        Dim GenderDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("GenderDropDownList"), DropDownList)
        Dim AgeTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AgeTextBox"), TextBox)
        Dim ZipcodeTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("ZipcodeTextBox"), TextBox)
        Dim CountryDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CountryDropDownList"), DropDownList)
        Dim RegionsDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("RegionsDropDownList"), DropDownList)
        Dim CityDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CitiesDropDownList"), DropDownList)
        Dim CityIdTextBox As String
        If CityDropDownList.Items.Count = 0 Then
            CityIdTextBox = -1
        Else
            CityIdTextBox = CityDropDownList.SelectedValue.ToString
        End If
        Dim ZipcodeValue As String
        Dim USAZipCodeRegex As Regex = New Regex("\d{5}(-\d{4})?")
        Dim CanadaZipCodeRegex As Regex = New Regex("[A-Z]\d[A-Z] \d[A-Z]\d")
        If (String.Compare(CountryDropDownList.SelectedValue.ToString, "USA") = 0) Then
            If USAZipCodeRegex.IsMatch(ZipcodeTextBox.Text) Then
                ZipcodeValue = ZipcodeTextBox.Text
            Else
                ZipcodeValue = "0"
            End If
        ElseIf (String.Compare(CountryDropDownList.SelectedValue.ToString, "Canada") = 0) Then
            If CanadaZipCodeRegex.IsMatch(ZipcodeTextBox.Text) Then
                ZipcodeValue = ZipcodeTextBox.Text
            Else
                ZipcodeValue = "0"
            End If
        End If
        Dim user As MembershipUser = Membership.GetUser(SignUpCreateWizard.UserName)
        If user Is Nothing Then
            Throw New ApplicationException("Can't find the user.")
            Response.Redirect("index.aspx")
        End If
        Roles.AddUserToRole(SignUpCreateWizard.UserName, "Professional")
        Dim ProfileConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("SideJobConnectionString").ConnectionString)
        ProfileConnection.Open()
        Dim ProfileTransaction As SqlTransaction = ProfileConnection.BeginTransaction()

        Try
            Dim ProfileCommand As New SqlCommand("CreateProfessional", ProfileConnection, ProfileTransaction)
            ProfileCommand.CommandType = CommandType.StoredProcedure
            Dim ProfessionalResult As New SqlParameter("@ErrorCode", SqlDbType.Int)
            ProfessionalResult.Direction = ParameterDirection.Output
            ProfessionalResult.Value = 0
            ProfileCommand.Parameters.Add(ProfessionalResult)

            Dim LCID As New SqlParameter("@LCID ", SqlDbType.Int)
            LCID.Value = _language
            ProfileCommand.Parameters.Add(LCID)

            Dim USERNAME1 As New SqlParameter("@USERNAME", SqlDbType.NVarChar, 255)
            USERNAME1.Value = SignUpCreateWizard.UserName.ToString
            ProfileCommand.Parameters.Add(USERNAME1) '    

            Dim FirstName As New SqlParameter("@FirstName", SqlDbType.NVarChar, 10)
            FirstName.Value = FirstNameTextBox.Text
            ProfileCommand.Parameters.Add(FirstName)

            Dim LastName As New SqlParameter("@LastName", SqlDbType.NVarChar, 20)
            LastName.Value = LastNameTextBox.Text
            ProfileCommand.Parameters.Add(LastName)

            Dim Address As New SqlParameter("@Address", SqlDbType.NVarChar, 60)
            Address.Value = AddressTextBox.Text
            ProfileCommand.Parameters.Add(Address)

            Dim CountryID As New SqlParameter("@CountryID", SqlDbType.Int)
            CountryID.Value = CountryDropDownList.SelectedValue.ToString()
            ProfileCommand.Parameters.Add(CountryID)

            Dim CountryValue As New SqlParameter("@CountryName", SqlDbType.VarChar, 128)
            CountryValue.Value = CountryDropDownList.SelectedItem.Text.ToString
            ProfileCommand.Parameters.Add(CountryValue)

            Dim RegionID As New SqlParameter("@RegionID", SqlDbType.Int)
            RegionID.Value = RegionsDropDownList.SelectedValue.ToString()
            ProfileCommand.Parameters.Add(RegionID)

            Dim RegionName As New SqlParameter("@RegionName", SqlDbType.VarChar, 128)
            RegionName.Value = RegionsDropDownList.SelectedItem.Text.ToString
            ProfileCommand.Parameters.Add(RegionName)

            Dim CityID As New SqlParameter("@CityID", SqlDbType.Int)
            CityID.Value = CityIdTextBox.ToString
            ProfileCommand.Parameters.Add(CityID)

            Dim HomePhoneNumber As New SqlParameter("@HomePhoneNumber", SqlDbType.NVarChar, 24)
            HomePhoneNumber.Value = HomeTelephoneTextBox.Text
            ProfileCommand.Parameters.Add(HomePhoneNumber)

            Dim Zipcode As New SqlParameter("@Zipcode", SqlDbType.NVarChar, 20)
            Zipcode.Value = ZipcodeTextBox.Text
            ProfileCommand.Parameters.Add(Zipcode)

            Dim MobilePhoneNumber As New SqlParameter("@MobilePhoneNumber", SqlDbType.NVarChar, 24)
            MobilePhoneNumber.Value = MobilePhoneTextBox.Text
            ProfileCommand.Parameters.Add(MobilePhoneNumber)

            Dim Age As New SqlParameter("@Age", SqlDbType.Int)
            Age.Value = AgeTextBox.Text
            ProfileCommand.Parameters.Add(Age)

            Dim EmailAddress As New SqlParameter("@EmailAddress", SqlDbType.NVarChar, 256)
            EmailAddress.Value = Me.SignUpCreateWizard.Email.ToString
            ProfileCommand.Parameters.Add(EmailAddress)

            Dim Gender As New SqlParameter("@Gender", SqlDbType.Int)
            Gender.Value = GenderDropDownList.SelectedValue
            ProfileCommand.Parameters.Add(Gender)

            Dim DateEvent As New SqlParameter("@DateEvent", SqlDbType.SmallDateTime)
            DateEvent.Value = DateTime.Now.ToShortDateString.ToString
            ProfileCommand.Parameters.Add(DateEvent)

            Dim DateMessage As New SqlParameter("@DateMessage", SqlDbType.SmallDateTime)
            DateMessage.Value = DateTime.Now.ToShortDateString.ToString
            ProfileCommand.Parameters.Add(DateMessage)

            ''THE FIRST SKILL
            Dim Job1ID As New SqlParameter("@Job1ID", SqlDbType.Int)
            Job1ID.Value = 0

            Dim Category1ID As New SqlParameter("@Category1ID", SqlDbType.Int)
            Category1ID.Value = 0

            Dim Experience1 As New SqlParameter("@Experience1ID", SqlDbType.Int)
            Experience1.Value = 0

            Dim Crew1 As New SqlParameter("@Crew1ID", SqlDbType.Int)
            Crew1.Value = 0

            Dim Licensed1 As New SqlParameter("@Licensed1ID", SqlDbType.Int)
            Licensed1.Value = 0

            Dim Insured1 As New SqlParameter("@Insured1ID", SqlDbType.Int)
            Insured1.Value = 0

            Dim Relocation1 As New SqlParameter("@Relocation1ID", SqlDbType.Int)
            Relocation1.Value = 0

            ''THE SECOND SKILL
            Dim Job2ID As New SqlParameter("@Job2ID", SqlDbType.Int)
            Job2ID.Value = 0

            Dim Category2ID As New SqlParameter("@Category2ID", SqlDbType.Int)
            Category2ID.Value = 0

            Dim Experience2 As New SqlParameter("@Experience2ID", SqlDbType.Int)
            Experience2.Value = 0

            Dim Crew2 As New SqlParameter("@Crew2ID", SqlDbType.Int)
            Crew2.Value = 0

            Dim Licensed2 As New SqlParameter("@Licensed2ID", SqlDbType.Int)
            Licensed2.Value = 0

            Dim Insured2 As New SqlParameter("@Insured2ID", SqlDbType.Int)
            Insured2.Value = 0

            Dim Relocation2 As New SqlParameter("@Relocation2ID", SqlDbType.Int)
            Relocation2.Value = 0

            ''THE THIRDS SKILL
            Dim Job3ID As New SqlParameter("@Job3ID", SqlDbType.Int)
            Job3ID.Value = 0

            Dim Category3ID As New SqlParameter("@Category3ID", SqlDbType.Int)
            Category3ID.Value = 0

            Dim Experience3 As New SqlParameter("@Experience3ID", SqlDbType.Int)
            Experience3.Value = 0

            Dim Crew3 As New SqlParameter("@Crew3ID", SqlDbType.Int)
            Crew3.Value = 0

            Dim Licensed3 As New SqlParameter("@Licensed3ID", SqlDbType.Int)
            Licensed3.Value = 0

            Dim Insured3 As New SqlParameter("@Insured3ID", SqlDbType.Int)
            Insured3.Value = 0

            Dim Relocation3 As New SqlParameter("@Relocation3ID", SqlDbType.Int)
            Relocation3.Value = 0

            ''THE FOURTH SKILL
            Dim Job4ID As New SqlParameter("@Job4ID", SqlDbType.Int)
            Job4ID.Value = 0

            Dim Category4ID As New SqlParameter("@Category4ID", SqlDbType.Int)
            Category4ID.Value = 0

            Dim Experience4 As New SqlParameter("@Experience4ID", SqlDbType.Int)
            Experience4.Value = 0

            Dim Crew4 As New SqlParameter("@Crew4ID", SqlDbType.Int)
            Crew4.Value = 0

            Dim Licensed4 As New SqlParameter("@Licensed4ID", SqlDbType.Int)
            Licensed4.Value = 0

            Dim Insured4 As New SqlParameter("@Insured4ID", SqlDbType.Int)
            Insured4.Value = 0

            Dim Relocation4 As New SqlParameter("@Relocation4ID", SqlDbType.Int)
            Relocation4.Value = 0

            Dim NumberofSkills As New SqlParameter("@NumberofSkills", SqlDbType.Int)
            If Session("numberofskills") = Nothing Then
                NumberofSkills.Value = 0
            Else
                NumberofSkills.Value = Session("numberofskills")
                Select Case NumberofSkills.Value
                    Case 1
                        Dim skillsvariables() As String = Nothing
                        skillsvariables = Session("Skill1Value").ToString.Split(",")
                        Category1ID.Value = skillsvariables(0).ToString
                        Job1ID.Value = skillsvariables(1).ToString
                        Experience1.Value = skillsvariables(2).ToString
                        Crew1.Value = skillsvariables(3).ToString
                        Licensed1.Value = skillsvariables(4).ToString
                        Insured1.Value = skillsvariables(5).ToString
                        Relocation1.Value = skillsvariables(6).ToString

                    Case 2
                        Dim skillsvariables() As String = Nothing
                        skillsvariables = Session("Skill1Value").ToString.Split(",")
                        Category1ID.Value = skillsvariables(0).ToString
                        Job1ID.Value = skillsvariables(1).ToString
                        Experience1.Value = skillsvariables(2).ToString
                        Crew1.Value = skillsvariables(3).ToString
                        Licensed1.Value = skillsvariables(4).ToString
                        Insured1.Value = skillsvariables(5).ToString
                        Relocation1.Value = skillsvariables(6).ToString
                        skillsvariables = Nothing
                        skillsvariables = Session("Skill2Value").ToString.Split(",")
                        Category2ID.Value = skillsvariables(0).ToString
                        Job2ID.Value = skillsvariables(1).ToString
                        Experience2.Value = skillsvariables(2).ToString
                        Crew2.Value = skillsvariables(3).ToString
                        Licensed2.Value = skillsvariables(4).ToString
                        Insured2.Value = skillsvariables(5).ToString
                        Relocation2.Value = skillsvariables(6).ToString

                    Case 3
                        Dim skillsvariables() As String = Nothing
                        skillsvariables = Session("Skill1Value").ToString.Split(",")
                        Category1ID.Value = skillsvariables(0).ToString
                        Job1ID.Value = skillsvariables(1).ToString
                        Experience1.Value = skillsvariables(2).ToString
                        Crew1.Value = skillsvariables(3).ToString
                        Licensed1.Value = skillsvariables(4).ToString
                        Insured1.Value = skillsvariables(5).ToString
                        Relocation1.Value = skillsvariables(6).ToString
                        skillsvariables = Nothing
                        skillsvariables = Session("Skill2Value").ToString.Split(",")
                        Category2ID.Value = skillsvariables(0).ToString
                        Job2ID.Value = skillsvariables(1).ToString
                        Experience2.Value = skillsvariables(2).ToString
                        Crew2.Value = skillsvariables(3).ToString
                        Licensed2.Value = skillsvariables(4).ToString
                        Insured2.Value = skillsvariables(5).ToString
                        Relocation2.Value = skillsvariables(6).ToString
                        skillsvariables = Nothing
                        skillsvariables = Session("Skill3Value").ToString.Split(",")
                        Category3ID.Value = skillsvariables(0).ToString
                        Job3ID.Value = skillsvariables(1).ToString
                        Experience3.Value = skillsvariables(2).ToString
                        Crew3.Value = skillsvariables(3).ToString
                        Licensed3.Value = skillsvariables(4).ToString
                        Insured3.Value = skillsvariables(5).ToString
                        Relocation3.Value = skillsvariables(6).ToString

                    Case 4
                        Dim skillsvariables() As String = Nothing
                        skillsvariables = Session("Skill1Value").ToString.Split(",")
                        Category1ID.Value = skillsvariables(0).ToString
                        Job1ID.Value = skillsvariables(1).ToString
                        Experience1.Value = skillsvariables(2).ToString
                        Crew1.Value = skillsvariables(3).ToString
                        Licensed1.Value = skillsvariables(4).ToString
                        Insured1.Value = skillsvariables(5).ToString
                        Relocation1.Value = skillsvariables(6).ToString
                        skillsvariables = Nothing
                        skillsvariables = Session("Skill2Value").ToString.Split(",")
                        Category2ID.Value = skillsvariables(0).ToString
                        Job2ID.Value = skillsvariables(1).ToString
                        Experience2.Value = skillsvariables(2).ToString
                        Crew2.Value = skillsvariables(3).ToString
                        Licensed2.Value = skillsvariables(4).ToString
                        Insured2.Value = skillsvariables(5).ToString
                        Relocation2.Value = skillsvariables(6).ToString
                        skillsvariables = Nothing
                        skillsvariables = Session("Skill3Value").ToString.Split(",")
                        Category3ID.Value = skillsvariables(0).ToString
                        Job3ID.Value = skillsvariables(1).ToString
                        Experience3.Value = skillsvariables(2).ToString
                        Crew3.Value = skillsvariables(3).ToString
                        Licensed3.Value = skillsvariables(4).ToString
                        Insured3.Value = skillsvariables(5).ToString
                        Relocation3.Value = skillsvariables(6).ToString
                        skillsvariables = Nothing
                        skillsvariables = Session("Skill4Value").ToString.Split(",")
                        Category4ID.Value = skillsvariables(0).ToString
                        Job4ID.Value = skillsvariables(1).ToString
                        Experience4.Value = skillsvariables(2).ToString
                        Crew4.Value = skillsvariables(3).ToString
                        Licensed4.Value = skillsvariables(4).ToString
                        Insured4.Value = skillsvariables(5).ToString
                        Relocation4.Value = skillsvariables(6).ToString
                End Select
            End If

            ClearSession()
            ProfileCommand.Parameters.Add(NumberofSkills)

            '''''''''''''''Adding the Skills''''''''''''
            ProfileCommand.Parameters.Add(Category1ID)
            ProfileCommand.Parameters.Add(Job1ID)
            ProfileCommand.Parameters.Add(Experience1)
            ProfileCommand.Parameters.Add(Crew1)
            ProfileCommand.Parameters.Add(Licensed1)
            ProfileCommand.Parameters.Add(Insured1)
            ProfileCommand.Parameters.Add(Relocation1)

            ProfileCommand.Parameters.Add(Category2ID)
            ProfileCommand.Parameters.Add(Job2ID)
            ProfileCommand.Parameters.Add(Experience2)
            ProfileCommand.Parameters.Add(Crew2)
            ProfileCommand.Parameters.Add(Licensed2)
            ProfileCommand.Parameters.Add(Insured2)
            ProfileCommand.Parameters.Add(Relocation2)

            ProfileCommand.Parameters.Add(Category3ID)
            ProfileCommand.Parameters.Add(Job3ID)
            ProfileCommand.Parameters.Add(Experience3)
            ProfileCommand.Parameters.Add(Crew3)
            ProfileCommand.Parameters.Add(Licensed3)
            ProfileCommand.Parameters.Add(Insured3)
            ProfileCommand.Parameters.Add(Relocation3)

            ProfileCommand.Parameters.Add(Category4ID)
            ProfileCommand.Parameters.Add(Job4ID)
            ProfileCommand.Parameters.Add(Experience4)
            ProfileCommand.Parameters.Add(Crew4)
            ProfileCommand.Parameters.Add(Licensed4)
            ProfileCommand.Parameters.Add(Insured4)
            ProfileCommand.Parameters.Add(Relocation4)

            Dim reader As SqlDataReader = ProfileCommand.ExecuteReader()
            Dim Result As Integer = Convert.ToInt32(ProfessionalResult.Value)
            If Result = 99 Then
                Server.Transfer("../NotAuthonitizated/LockedUser.aspx")
            End If
            reader.Close()
            ProfileTransaction.Commit()
            SignUpCreateWizard.ContinueDestinationPageUrl = "~/Authenticated/Professional/ProfessionalProfile.aspx"
            CreateDirectoryProfessional()
        Catch ex As Exception
            Throw
            Response.Redirect("index.aspx")
        Finally
            ProfileConnection.Close()
        End Try

    End Sub

    Protected Sub ProfessionalLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ProfessionalLinkButton.Click
        RoleLabel.Text = Resources.Resource.Professional.ToString
        RoleLabel.ForeColor = System.Drawing.ColorTranslator.FromHtml("#003366")
        ProfessionalPanelModalPopupExtender.Show()
        professionalcolumn.BgColor = "#003366"
        customercolumn.BgColor = "#ffffff"
    End Sub

    Protected Sub ClearSkillsButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ClearSkillsButton.Click
        ClearSkills()
        ClearSession()
    End Sub

    Protected Sub SaveSkillsButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SaveSkillsButton.Click
        RoleLabel.Text = Resources.Resource.Professional.ToString
        ProfessionalPanelModalPopupExtender.Hide()
    End Sub

    Protected Sub CancelSkillsButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelSkillsButton.Click
        RoleLabel.Text = Resources.Resource.Customer.ToString
        ProfessionalPanelModalPopupExtender.Hide()
        ClearSkills()
        ClearSession()
    End Sub

    Protected Sub SaveSession(ByVal i As Integer, ByVal j As Integer, ByVal k As Integer)

        Select Case i

            Case 1

                Select Case j

                    Case 1
                        Session("Skill1Value") = IndustryDropDownList.SelectedValue.ToString + ","
                        Session("Skill1Value") += SpecialtyListBox1.Items(k).Value + ","

                    Case 2
                        Session("Skill1Value") = IndustryDropDownList.SelectedValue.ToString + ","
                        Session("Skill1Value") += SpecialtyListBox2.Items(k).Value + ","

                    Case 3
                        Session("Skill1Value") = IndustryDropDownList.SelectedValue.ToString + ","
                        Session("Skill1Value") += SpecialtyListBox3.Items(k).Value + ","

                End Select

                Session("Skill1Value") += ExperienceDropDownList.SelectedValue.ToString() + ","
                Session("Skill1Value") += CrewNumberDropDownList.SelectedValue.ToString + ","
                Session("Skill1Value") += LicensedDropDownList.SelectedValue.ToString + ","
                Session("Skill1Value") += InsuredDropDownList.SelectedValue.ToString + ","
                Session("Skill1Value") += RelocationDropDownList.SelectedValue.ToString

            Case 2

                Select Case j

                    Case 1
                        Session("Skill2Value") = IndustryDropDownList.SelectedValue.ToString + ","
                        Session("Skill2Value") += SpecialtyListBox1.Items(k).Value + ","

                    Case 2
                        Session("Skill2Value") = IndustryDropDownList.SelectedValue.ToString + ","
                        Session("Skill2Value") += SpecialtyListBox2.Items(k).Value + ","

                    Case 3
                        Session("Skill2Value") = IndustryDropDownList.SelectedValue.ToString + ","
                        Session("Skill2Value") += SpecialtyListBox3.Items(k).Value + ","

                End Select

                Session("Skill2Value") += ExperienceDropDownList.SelectedValue.ToString() + ","
                Session("Skill2Value") += CrewNumberDropDownList.SelectedValue.ToString + ","
                Session("Skill2Value") += LicensedDropDownList.SelectedValue.ToString + ","
                Session("Skill2Value") += InsuredDropDownList.SelectedValue.ToString + ","
                Session("Skill2Value") += RelocationDropDownList.SelectedValue.ToString

            Case 3

                Select Case j

                    Case 1
                        Session("Skill3Value") = IndustryDropDownList.SelectedValue.ToString + ","
                        Session("Skill3Value") += SpecialtyListBox1.Items(k).Value + ","

                    Case 2
                        Session("Skill3Value") = IndustryDropDownList.SelectedValue.ToString + ","
                        Session("Skill3Value") += SpecialtyListBox2.Items(k).Value + ","

                    Case 3
                        Session("Skill3Value") = IndustryDropDownList.SelectedValue.ToString + ","
                        Session("Skill3Value") += SpecialtyListBox3.Items(k).Value + ","

                End Select

                Session("Skill3Value") += ExperienceDropDownList.SelectedValue.ToString() + ","
                Session("Skill3Value") += CrewNumberDropDownList.SelectedValue.ToString + ","
                Session("Skill3Value") += LicensedDropDownList.SelectedValue.ToString + ","
                Session("Skill3Value") += InsuredDropDownList.SelectedValue.ToString + ","
                Session("Skill3Value") += RelocationDropDownList.SelectedValue.ToString

            Case 4

                Select Case j

                    Case 1
                        Session("Skill4Value") = IndustryDropDownList.SelectedValue.ToString + ","
                        Session("Skill4Value") += SpecialtyListBox1.Items(k).Value + ","

                    Case 2
                        Session("Skill4Value") = IndustryDropDownList.SelectedValue.ToString + ","
                        Session("Skill4Value") += SpecialtyListBox2.Items(k).Value + ","

                    Case 3
                        Session("Skill4Value") = IndustryDropDownList.SelectedValue.ToString + ","
                        Session("Skill4Value") += SpecialtyListBox3.Items(k).Value + ","

                End Select

                Session("Skill4Value") += ExperienceDropDownList.SelectedValue.ToString() + ","
                Session("Skill4Value") += CrewNumberDropDownList.SelectedValue.ToString + ","
                Session("Skill4Value") += LicensedDropDownList.SelectedValue.ToString + ","
                Session("Skill4Value") += InsuredDropDownList.SelectedValue.ToString + ","
                Session("Skill4Value") += RelocationDropDownList.SelectedValue.ToString

        End Select

        Session("numberofSkills") += 1

    End Sub

    Protected Sub ClearSession()
        Session("Skill1Value") = Nothing
        Session("Skill2Value") = Nothing
        Session("Skill3Value") = Nothing
        Session("Skill4Value") = Nothing
        Session("numberofSkills") = 0
    End Sub

    Protected Sub AddSkillsButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddSkillsButton.Click

        Dim previoustotalskills As Integer = 0
        If Skill1Label.Text <> "" Then
            previoustotalskills += 1
        End If

        If Skill2Label.Text <> "" Then
            previoustotalskills += 1
        End If

        If Skill3Label.Text <> "" Then
            previoustotalskills += 1
        End If

        If Skill4Label.Text <> "" Then
            previoustotalskills += 1
        End If

        If previoustotalskills <> 0 Then
            totalSkills = previoustotalskills + 1
        End If

        For i As Integer = 0 To SpecialtyListBox1.Items.Count - 1
            If SpecialtyListBox1.Items(i).Selected = True Then
                If totalSkills < 5 Then
                    If (checkskillexistence(SpecialtyListBox1.Items(i).ToString()) = False) Then
                        skills(totalSkills) = SpecialtyListBox1.Items(i).ToString()
                        SaveSession(totalSkills, 1, i)
                        totalSkills += 1
                    End If
                Else
                    Exit For
                End If
            End If
        Next

        If totalSkills < 5 Then
            For i As Integer = 0 To SpecialtyListBox2.Items.Count - 1
                If SpecialtyListBox2.Items(i).Selected = True Then
                    If totalSkills < 5 Then
                        If (checkskillexistence(SpecialtyListBox2.Items(i).ToString()) = False) Then
                            skills(totalSkills) = SpecialtyListBox2.Items(i).ToString()
                            SaveSession(totalSkills, 2, i)
                            totalSkills += 1
                        End If
                    Else
                        Exit For
                    End If
                End If
            Next
        End If

        If totalSkills < 5 Then
            For i As Integer = 0 To SpecialtyListBox3.Items.Count - 1
                If SpecialtyListBox3.Items(i).Selected = True Then
                    If totalSkills < 5 Then
                        If (checkskillexistence(SpecialtyListBox3.Items(i).ToString()) = False) Then
                            skills(totalSkills) = SpecialtyListBox3.Items(i).ToString()
                            SaveSession(totalSkills, 3, i)
                            totalSkills += 1
                        End If
                    Else
                        Exit For
                    End If
                End If
            Next
        End If

        If skills(1) <> "" Then
            Skill1Label.Text = skills(1).ToString
        End If

        If skills(2) <> "" Then
            Skill2Label.Text = skills(2).ToString
        End If

        If skills(3) <> "" Then
            Skill3Label.Text = skills(3).ToString
        End If

        If skills(4) <> "" Then
            Skill4Label.Text = skills(4).ToString
        End If

    End Sub

    Function checkskillexistence(ByVal oldskills As String) As Boolean

        Dim result As Boolean = False

        If Skill1Label.Text = oldskills Then
            result = True
        End If

        If Skill2Label.Text = oldskills Then
            result = True
        End If

        If Skill3Label.Text = oldskills Then
            result = True
        End If

        If Skill4Label.Text = oldskills Then
            result = True
        End If

        Return result

    End Function

    Protected Sub ClearSkills()
        totalSkills = 1
        For i As Integer = 1 To 4
            skills(i) = ""
        Next
        Skill1Label.Text = ""
        Skill2Label.Text = ""
        Skill3Label.Text = ""
        Skill4Label.Text = ""
        CityUpdatePanel.Update()
    End Sub

    Sub CreateDirectory()

        Dim Username As String = User.Identity.Name
        Dim rootPath As String = Server.MapPath("~/Authenticated/Customer/Images/")
        Dim NewCustomerDirectory As String = rootPath & Username

        If Directory.Exists(NewCustomerDirectory) = False Then
            Directory.CreateDirectory(NewCustomerDirectory)
        Else
            Directory.Delete(NewCustomerDirectory, True)
            Directory.CreateDirectory(NewCustomerDirectory)
        End If

        Dim CustomerProjectDirectory As String = NewCustomerDirectory & "/Projects/"

        If Directory.Exists(CustomerProjectDirectory) = False Then
            Directory.CreateDirectory(CustomerProjectDirectory)
        Else
            Directory.Delete(CustomerProjectDirectory, True)
            Directory.CreateDirectory(CustomerProjectDirectory)
        End If

    End Sub

    Sub CreateDirectoryProfessional()

        Dim Username As String = User.Identity.Name
        Dim rootPath As String = Server.MapPath("~/Authenticated/Professional/Images/")
        Dim NewProfessionalDirectory As String = rootPath & Username

        If Directory.Exists(NewProfessionalDirectory) = False Then
            Directory.CreateDirectory(NewProfessionalDirectory)
        Else
            Directory.Delete(NewProfessionalDirectory, True)
            Directory.CreateDirectory(NewProfessionalDirectory)
        End If

        Dim ProfessionalProjectDirectory As String = NewProfessionalDirectory & "/Projects/"

        If Directory.Exists(ProfessionalProjectDirectory) = False Then
            Directory.CreateDirectory(ProfessionalProjectDirectory)
        Else
            Directory.Delete(ProfessionalProjectDirectory, True)
            Directory.CreateDirectory(ProfessionalProjectDirectory)
        End If

        Dim rootWorkPath As String = Server.MapPath("~/Authenticated/Professional/WorkImages/")
        Dim NewProfessionalWorkDirectory As String = rootWorkPath & Username

        If Directory.Exists(NewProfessionalWorkDirectory) = False Then
            Directory.CreateDirectory(NewProfessionalWorkDirectory)
        Else
            Directory.Delete(NewProfessionalWorkDirectory, True)
            Directory.CreateDirectory(NewProfessionalWorkDirectory)
        End If

    End Sub

End Class
