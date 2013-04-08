
Imports System
Imports System.Linq
Imports System.Web.Security
Imports System.Globalization
Imports System.IO
Imports SidejobModel
Imports System.Threading

Namespace NotAuthenticated

    Partial Public Class NotAuthenticatedSignUp
        Inherits Page
        ReadOnly _nextCustomerID As Integer = GetNextCustomer()
        ReadOnly _nextProID As Integer = GetNextProfessional()
        Dim _totalSkills As Integer = 1
        ReadOnly _skills(4) As String
        Private _language As Integer

        Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
            If Page.IsPostBack = False Then
                Dim lang As String = Request.QueryString("l")
                If lang IsNot Nothing Or lang <> "" Then
                    Thread.CurrentThread.CurrentUICulture = New CultureInfo(lang)
                    Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang)
                End If
                ClearSession()
            End If
            SEO()
        End Sub

        Public Sub CreateCustomer()
            Dim customeruser = Membership.GetUser()
            If customeruser IsNot Nothing Then
                Dim userKey = customeruser.ProviderUserKey
                If userKey IsNot Nothing Then
                    InsertNewCustomer(_nextCustomerID, customeruser.UserName.ToString(), Language, Utility.GetUserID())
                    InsertCustomerTables(customeruser.UserName.ToString())
                    CustomerSpecificInformation()
                    InsertCustomerPicture(_nextCustomerID, GetNextAlbumID())
                    InsertCustomerPhoto(GetNextPhotoID(), GetPath(), GetNextAlbumID() - 1, _nextCustomerID)
                    InsertEvents()
                    InsertMessage()
                    InsertCustomerMessageInbox()
                    InsertCustomerPortfolio()
                    InsertCommentReceivedSummary()
                    InsertCustomerAdditionalInformation()
                    InsertCustomerRating()
                End If
            End If
        End Sub

        Public Sub InsertNewCustomer(nextcustomerID As Integer, userName As String, customerLCID As Integer, userId As Guid)
            Dim sidejobcontext = New SidejobEntities()
            sidejobcontext.InsertNewCustomer(nextcustomerID, userName, customerLCID, userId)
        End Sub

        Public Sub InsertCustomerTables(username As String)
            Dim firstNameTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("FirstNameTextBox"), TextBox)
            Dim lastNameTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("LastNameTextBox"), TextBox)
            Dim addressTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AddressTextBox"), TextBox)
            Dim homeTelephoneTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("HomeTelephoneTextBox"), TextBox)
            Dim mobilePhoneTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("MobilePhoneTextBox"), TextBox)
            Dim genderDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("GenderDropDownList"), DropDownList)
            Dim ageTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AgeTextBox"), TextBox)
            Dim zipcodeTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("ZipcodeTextBox"), TextBox)
            Dim countryDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CountryDropDownList"), DropDownList)
            Dim regionsDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("RegionsDropDownList"), DropDownList)
            Dim cityDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CitiesDropDownList"), DropDownList)
            Dim cityIdTextBox As String
            Dim cityName As String = ""
            If cityDropDownList.Items.Count = 0 Then
                cityIdTextBox = "-1"
            Else
                cityIdTextBox = cityDropDownList.SelectedValue.ToString
                cityName = cityDropDownList.SelectedItem.Text.ToString
            End If
            Dim usaZipCodeRegex As Regex = New Regex("\d{5}(-\d{4})?")
            Dim canadaZipCodeRegex As Regex = New Regex("[A-Z]\d[A-Z] \d[A-Z]\d")
            If (String.Compare(countryDropDownList.SelectedValue.ToString, "USA") = 0) Then
                If usaZipCodeRegex.IsMatch(zipcodeTextBox.Text) Then
                End If
            ElseIf (String.Compare(countryDropDownList.SelectedValue.ToString, "Canada") = 0) Then
                If canadaZipCodeRegex.IsMatch(zipcodeTextBox.Text) Then
                End If
            End If
            Dim sidejobcontext = New SidejobEntities()
            Dim customerGeneral = New CustomerGeneral() With { _
                    .CustomerID = _nextCustomerID, _
                    .FirstName = firstNameTextBox.Text, _
                    .LastName = lastNameTextBox.Text, _
                    .UserName = username, _
                    .Address = addressTextBox.Text, _
                    .CountryID = CType(countryDropDownList.SelectedValue, Integer), _
                    .CountryName = countryDropDownList.SelectedItem.Text.ToString, _
                    .RegionID = CType(regionsDropDownList.SelectedValue, Integer), _
                    .RegionName = regionsDropDownList.SelectedItem.Text.ToString, _
                    .CityID = CType(cityIdTextBox.ToString, Integer?), _
                    .CityName = cityName, _
                    .Zipcode = zipcodeTextBox.Text, _
                    .HomePhoneNumber = homeTelephoneTextBox.Text, _
                    .MobilePhoneNumber = mobilePhoneTextBox.Text, _
                    .Age = CType(ageTextBox.Text, Integer), _
                    .Gender = CType(genderDropDownList.SelectedValue, Integer), _
                    .EmailAddress = SignUpCreateWizard.Email.ToString, _
                    .PhotoPath = GetPath() _
                    }
            sidejobcontext.AddToCustomerGenerals(customerGeneral)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub CustomerSpecificInformation()
            Dim ageTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AgeTextBox"), TextBox)
            Dim genderDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("GenderDropDownList"), DropDownList)
            Dim sidejobcontext = New SidejobEntities()
            Dim customspecificinformation = New CustomerSpecificInformation() With { _
                    .Age = CType(ageTextBox.Text, Integer), _
                    .EmailAddress = SignUpCreateWizard.Email.ToString, _
                    .Gender = CType(genderDropDownList.SelectedValue, Integer), _
                    .CustomerID = _nextCustomerID _
                    }
            sidejobcontext.AddToCustomerSpecificInformations(customspecificinformation)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub InsertCustomerPicture(nextCustomerId As Integer, nextAlbumID As Integer)
            Dim sidejobcontext = New SidejobEntities()
            sidejobcontext.InsertCustomerPicture(nextCustomerId, nextAlbumID)
        End Sub

        Public Sub InsertCustomerPhoto(nextPhotoID As Integer, photoPath As String, nextAlbumID As Integer, nextCustomerid As Integer)
            Dim sidejobcontext = New SidejobEntities()
            sidejobcontext.InsertCustomerPhoto(nextPhotoID, photoPath, nextAlbumID, nextCustomerid)
        End Sub

        Public Sub InsertEvents()
            Dim nextEventID As Integer = GetNextEventID()
            Dim sidejobcontext = New SidejobEntities()
            sidejobcontext.InsertEvent(nextEventID, DateTime.Now.[Date], Language)
            Dim customerEvent = New CustomerEvent() With { _
                    .CustomerID = _nextCustomerID, _
                    .EventID = GetNextEventID(), _
                    .NumberofEvents = 1, _
                    .Type = 1 _
                    }
            sidejobcontext.AddToCustomerEvents(customerEvent)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub InsertMessage()
            Dim sidejobcontext = New SidejobEntities()
            sidejobcontext.InsertMessage(GetNextMessageID(), _nextCustomerID, User.Identity.Name, DateTime.Now.[Date])
        End Sub

        Public Sub InsertCustomerMessageInbox()
            Dim sidejobcontext = New SidejobEntities()
            Dim customerMessageInbox = New CustomerMessageInbox() With { _
                    .MessageID = GetNextMessageID(), _
                    .CustomerID = _nextCustomerID, _
                    .SenderName = Resources.Resource.MySideJobTeam, _
                    .ReceiverName = User.Identity.Name, _
                    .[Date] = DateTime.Now.[Date], _
                    .Title = Resources.Resource.WelcomeToMySideJob, _
                    .Description = Resources.Resource.ThankyouForJoining, _
                    .Checked = 1, _
                    .Response = 0 _
                    }
            sidejobcontext.AddToCustomerMessageInboxes(customerMessageInbox)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub InsertCustomerPortfolio()
            Dim sidejobcontext = New SidejobEntities()
            Dim customerportfolio = New CustomerPortfolio() With { _
                    .CustomerID = _nextCustomerID, _
                    .About = "", _
                    .SpecialNotes = "", _
                    .Modified = 0 _
                    }
            sidejobcontext.AddToCustomerPortfolios(customerportfolio)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub InsertCommentReceivedSummary()
            Dim sidejobcontext = New SidejobEntities()
            Dim customercommentreceivedsummary = New CustomerCommentReceivedSummary() With { _
                    .CustomerID = _nextCustomerID, _
                    .NumberofPositive = 0, _
                    .NumberofNegative = 0, _
                    .NumberofNeutral = 0, _
                    .Total = 0, _
                    .Percentage = 100 _
                    }
            sidejobcontext.AddToCustomerCommentReceivedSummaries(customercommentreceivedsummary)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub InsertCustomerAdditionalInformation()
            Dim sidejobcontext = New SidejobEntities()
            Dim customeradditionalinformation = New CustomerAdditionalInformation() With { _
                    .CustomerID = _nextCustomerID, _
                    .DateCreated = DateTime.Now.[Date], _
                    .PeopleVisited = 0, _
                    .InvitationSent = 0, _
                    .Points = 0, _
                    .ProjectPosted = 0 _
                    }
            sidejobcontext.AddToCustomerAdditionalInformations(customeradditionalinformation)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub InsertCustomerRating()
            Dim sidejobcontext = New SidejobEntities()
            Dim customerrating = New CustomerRating() With { _
                    .RateID = GetNextRatingID(), _
                    .CustomerID = _nextCustomerID, _
                    .Postive = 0, _
                    .Negative = 0, _
                    .Neutral = 0, _
                    .Total = 0, _
                    .Percentage = 0, _
                    .IntRate1 = 0, _
                    .DoubleRate = 0, _
                    .IntRate = 0 _
                    }
            sidejobcontext.AddToCustomerRatings(customerrating)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub CreateProfessional()
            Dim professionalUser As MembershipUser = Membership.GetUser()
            If professionalUser IsNot Nothing Then
                Dim userKey = professionalUser.ProviderUserKey
                If userKey IsNot Nothing Then
                    InsertNewProfessional(_nextProID, professionalUser.UserName.ToString(), Language, Utility.GetUserID())
                    InsertProfessionalTables(professionalUser.UserName.ToString())
                    ProfessionalSpecificInformation()
                    ProfessionalOptional()
                    InsertProfessionalPicture(_nextProID, GetNextProfessionalAlbumID())
                    InsertProfessionalPhoto(GetNextProfessionalPhotoID(), GetPath(), GetNextProfessionalAlbumID() - 1, _nextProID)
                    InsertProfessionalWorkPicture(_nextProID, GetNextProfessionalAlbumID())
                    InsertProfessionalWorkPhoto(GetNextProfessionalWorkPhotoID(), GetPath(), GetNextProfessionalAlbumID() - 1, _nextProID)
                    InsertProfessionalEvents()
                    InsertProfessionalMessage()
                    InsertProfessionalMessageInbox()
                    InsertProfessionalPortfolio()
                    InsertProfessionalCommentReceivedSummary()
                    InsertProfessionalAdditionalInformation()
                    InsertProfessionalRating()
                    Processkills()
                End If
            End If
        End Sub

        Public Sub InsertNewProfessional(nextProID As Integer, userName As String, professioanlLCID As Integer, userId As Guid)
            Dim sidejobcontext = New SidejobEntities()
            sidejobcontext.InsertNewProfessional(nextProID, userName, professioanlLCID, userId)
        End Sub

        Public Sub InsertProfessionalTables(username As String)
            Dim firstNameTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("FirstNameTextBox"), TextBox)
            Dim lastNameTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("LastNameTextBox"), TextBox)
            Dim addressTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AddressTextBox"), TextBox)
            Dim homeTelephoneTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("HomeTelephoneTextBox"), TextBox)
            Dim mobilePhoneTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("MobilePhoneTextBox"), TextBox)
            Dim genderDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("GenderDropDownList"), DropDownList)
            Dim ageTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AgeTextBox"), TextBox)
            Dim zipcodeTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("ZipcodeTextBox"), TextBox)
            Dim countryDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CountryDropDownList"), DropDownList)
            Dim regionsDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("RegionsDropDownList"), DropDownList)
            Dim cityDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CitiesDropDownList"), DropDownList)
            Dim cityIdTextBox As String
            Dim cityName As String = ""
            If cityDropDownList.Items.Count = 0 Then
                cityIdTextBox = "-1"
            Else
                cityIdTextBox = cityDropDownList.SelectedValue.ToString
                cityName = cityDropDownList.SelectedItem.Text.ToString
            End If
            Dim zipcodeValue As String = "0"
            Dim usaZipCodeRegex As Regex = New Regex("\d{5}(-\d{4})?")
            Dim canadaZipCodeRegex As Regex = New Regex("[A-Z]\d[A-Z] \d[A-Z]\d")
            If (String.Compare(countryDropDownList.SelectedValue.ToString, "USA") = 0) Then
                If usaZipCodeRegex.IsMatch(zipcodeTextBox.Text) Then
                    zipcodeValue = zipcodeTextBox.Text
                End If
            ElseIf (String.Compare(countryDropDownList.SelectedValue.ToString, "Canada") = 0) Then
                If canadaZipCodeRegex.IsMatch(zipcodeTextBox.Text) Then
                    zipcodeValue = zipcodeTextBox.Text
                End If
            End If
            Dim sidejobcontext = New SidejobEntities()
            Dim professionalGeneral = New ProfessionalGeneral() With { _
                    .ProID = _nextProID, _
                    .FirstName = firstNameTextBox.Text, _
                    .LastName = lastNameTextBox.Text, _
                    .UserName = username, _
                    .Address = addressTextBox.Text, _
                    .CountryID = CType(countryDropDownList.SelectedValue, Integer), _
                    .CountryName = countryDropDownList.SelectedItem.Text.ToString, _
                    .RegionID = CType(regionsDropDownList.SelectedValue, Integer), _
                    .RegionName = regionsDropDownList.SelectedItem.Text.ToString, _
                    .CityID = CType(cityIdTextBox.ToString, Integer?), _
                    .CityName = cityName, _
                    .Zipcode = zipcodeValue, _
                    .HomePhoneNumber = homeTelephoneTextBox.Text, _
                    .MobilePhoneNumber = mobilePhoneTextBox.Text, _
                    .Age = CType(ageTextBox.Text, Integer), _
                    .Gender = CType(genderDropDownList.SelectedValue, Integer), _
                    .EmailAddress = SignUpCreateWizard.Email.ToString, _
                    .PhotoPath = GetPath() _
                    }
            sidejobcontext.AddToProfessionalGenerals(professionalGeneral)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub ProfessionalSpecificInformation()
            Dim ageTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AgeTextBox"), TextBox)
            Dim genderDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("GenderDropDownList"), DropDownList)
            Dim sidejobcontext = New SidejobEntities()
            Dim customspecificinformation = New ProfessionalSpecificInformation() With { _
                    .Age = CType(ageTextBox.Text, Integer), _
                    .EmailAddress = SignUpCreateWizard.Email.ToString, _
                    .Gender = CType(genderDropDownList.SelectedValue, Integer), _
                    .ProID = _nextProID _
                    }
            sidejobcontext.AddToProfessionalSpecificInformations(customspecificinformation)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub ProfessionalOptional()
            Dim homeTelephoneTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("HomeTelephoneTextBox"), TextBox)
            Dim zipcodeTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("ZipcodeTextBox"), TextBox)
            Dim addressTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AddressTextBox"), TextBox)
            Dim countryDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CountryDropDownList"), DropDownList)
            Dim regionsDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("RegionsDropDownList"), DropDownList)
            Dim cityDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CitiesDropDownList"), DropDownList)
            Dim cityIdTextBox As String
            Dim cityName As String = ""
            If cityDropDownList.Items.Count = 0 Then
                cityIdTextBox = "-1"
            Else
                cityIdTextBox = cityDropDownList.SelectedValue.ToString
                cityName = cityDropDownList.SelectedItem.Text.ToString
            End If
            Dim zipcodeValue As String = "0"
            Dim usaZipCodeRegex As Regex = New Regex("\d{5}(-\d{4})?")
            Dim canadaZipCodeRegex As Regex = New Regex("[A-Z]\d[A-Z] \d[A-Z]\d")
            If (String.Compare(countryDropDownList.SelectedValue.ToString, "USA") = 0) Then
                If usaZipCodeRegex.IsMatch(zipcodeTextBox.Text) Then
                    zipcodeValue = zipcodeTextBox.Text
                End If
            ElseIf (String.Compare(countryDropDownList.SelectedValue.ToString, "Canada") = 0) Then
                If canadaZipCodeRegex.IsMatch(zipcodeTextBox.Text) Then
                    zipcodeValue = zipcodeTextBox.Text
                End If
            End If
            Dim sidejobcontext As SidejobEntities = New SidejobEntities()
            Dim professionalOptional = New ProfessionalOptional With { _
                    .ProID = _nextProID,
                    .Shopaddress = addressTextBox.Text,
                    .CountryID = CType(countryDropDownList.SelectedValue, Integer),
                    .CountryName = countryDropDownList.SelectedItem.Text.ToString,
                    .RegionID = CType(regionsDropDownList.SelectedValue, Integer),
                    .RegionName = regionsDropDownList.SelectedItem.Text.ToString,
                    .CityID = CType(cityIdTextBox.ToString, Integer?),
                    .CityName = cityName,
                    .Zipcode = zipcodeValue,
                    .PhoneNumber = homeTelephoneTextBox.Text
                    }
            sidejobcontext.AddToProfessionalOptionals(professionalOptional)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub InsertProfessionalPicture(nextProID As Integer, nextAlbumID As Integer)
            Dim sidejobcontext = New SidejobEntities()
            sidejobcontext.InsertProfessionalPicture(nextProID, nextAlbumID)
        End Sub

        Public Sub InsertProfessionalPhoto(nextPhotoID As Integer, photoPath As String, nextAlbumID As Integer, nextProID As Integer)
            Dim sidejobcontext = New SidejobEntities()
            sidejobcontext.InsertProfessionalPhoto(nextPhotoID, photoPath, nextAlbumID, nextProID)
        End Sub

        Public Sub InsertProfessionalWorkPicture(nextProID As Integer, nextAlbumID As Integer)
            Dim sidejobcontext = New SidejobEntities()
            sidejobcontext.InsertProfessionalWorkPicture(nextProID, nextAlbumID, Resources.Resource.FirstAlbum)
        End Sub

        Public Sub InsertProfessionalWorkPhoto(nextPhotoID As Integer, photoPath As String, nextAlbumID As Integer, nextProID As Integer)
            Dim sidejobcontext = New SidejobEntities()
            sidejobcontext.InsertProfessionalWorkPhoto(nextPhotoID, photoPath, nextAlbumID, nextProID, Resources.Resource.NoCaption)
        End Sub

        Public Sub InsertProfessionalEvents()
            Dim nextEventID As Integer = GetNextEventID()
            Dim sidejobcontext = New SidejobEntities()
            sidejobcontext.InsertEvent(nextEventID, DateTime.Now.[Date], Language)
            Dim professionalEvent = New ProfessionalEvent() With { _
                    .ProID = _nextProID, _
                    .EventID = GetNextEventID(), _
                    .NumberofEvents = 1, _
                    .Type = 2 _
                    }
            sidejobcontext.AddToProfessionalEvents(professionalEvent)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub InsertProfessionalMessage()
            Dim sidejobcontext = New SidejobEntities()
            sidejobcontext.InsertMessage(GetNextMessageID(), _nextProID, User.Identity.Name, DateTime.Now.[Date])
        End Sub

        Public Sub InsertProfessionalMessageInbox()
            Dim sidejobcontext = New SidejobEntities()
            Dim professionalMessageInbox = New ProfessionalMessageInbox() With { _
                    .MessageID = GetNextMessageID(), _
                    .ProID = _nextProID, _
                    .SenderName = Resources.Resource.MySideJobTeam, _
                    .ReceiverName = User.Identity.Name, _
                    .[Date] = DateTime.Now.[Date], _
                    .Title = Resources.Resource.WelcomeToMySideJob, _
                    .Description = Resources.Resource.ThankyouForJoining, _
                    .Checked = 1, _
                    .Response = 0 _
                    }
            sidejobcontext.AddToProfessionalMessageInboxes(professionalMessageInbox)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub InsertProfessionalPortfolio()
            Dim sidejobcontext = New SidejobEntities()
            Dim professionalportfolio = New ProfessionalPortfolio() With { _
                    .ProID = _nextProID, _
                    .About = "", _
                    .SpecialNotes = "", _
                    .Modified = 0 _
                    }
            sidejobcontext.AddToProfessionalPortfolios(professionalportfolio)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub InsertProfessionalCommentReceivedSummary()
            Dim sidejobcontext = New SidejobEntities()
            Dim professionalcommentreceivedsummary = New ProfessionalCommentReceivedSummary() With { _
                    .ProID = _nextProID, _
                    .NumberofPositive = 0, _
                    .NumberofNegative = 0, _
                    .NumberofNeutral = 0, _
                    .Total = 0, _
                    .Percentage = 100 _
                    }
            sidejobcontext.AddToProfessionalCommentReceivedSummaries(professionalcommentreceivedsummary)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub InsertProfessionalAdditionalInformation()
            Dim sidejobcontext = New SidejobEntities()
            Dim professionaladditionalinformation = New ProfessionalAdditionalInformation() With { _
                    .ProID = _nextProID, _
                    .PeopleVisited = 0, _
                    .WorkAccomplished = 0, _
                    .Rank = 0, _
                    .Points = 0, _
                    .Reputation = 0, _
                    .InvitedToProject = 0, _
                    .ProjectCompleted = 0, _
                    .ProjectCanceled = 0, _
                    .MoneyEarned = 0, _
                    .DateCreated = DateTime.Now.[Date]
                    }
            sidejobcontext.AddToProfessionalAdditionalInformations(professionaladditionalinformation)
            sidejobcontext.SaveChanges()
        End Sub

        Public Sub InsertProfessionalRating()
            Dim sidejobcontext = New SidejobEntities()
            Dim professionalrating = New ProfessionalRating() With { _
                    .RateID = GetNextProfessionalRatingID(), _
                    .ProID = _nextProID, _
                    .Postive = 0, _
                    .Negative = 0, _
                    .Neutral = 0, _
                    .Total = 0, _
                    .Percentage = 0, _
                    .IntRate1 = 0, _
                    .DoubleRate = 0, _
                    .IntRate = 0 _
                    }
            sidejobcontext.AddToProfessionalRatings(professionalrating)
            sidejobcontext.SaveChanges()
        End Sub

        Public Shared Function GetNextCustomer() As Integer
            Dim id As Integer
            Dim sidejobcontext = New SidejobEntities()
            Dim max = sidejobcontext.Customers.OrderByDescending(Function(s) s.CustomerID).FirstOrDefault()

            If max Is Nothing Then
                id = 0
            Else
                id = max.CustomerID + 1
            End If
            Return id
        End Function

        Public Shared Function GetNextAlbumID() As Integer
            Dim id As Integer
            Dim sidejobcontext = New SidejobEntities()
            Dim max = sidejobcontext.CustomerPictures.OrderByDescending(Function(s) s.AlbumID).FirstOrDefault()

            If max Is Nothing Then
                id = 0
            Else
                id = max.AlbumID + 1
            End If
            Return id
        End Function

        Public Shared Function GetNextPhotoID() As Integer
            Dim id As Integer
            Dim sidejobcontext = New SidejobEntities()
            Dim max = sidejobcontext.CustomerPhotoes.OrderByDescending(Function(s) s.PhotoID).FirstOrDefault()

            If max Is Nothing Then
                id = 0
            Else
                id = max.PhotoID + 1
            End If
            Return id
        End Function

        Public Shared Function GetNextRatingID() As Integer
            Dim id As Integer
            Dim sidejobcontext = New SidejobEntities()
            Dim max = sidejobcontext.CustomerRatings.OrderByDescending(Function(s) s.RateID).FirstOrDefault()

            If max Is Nothing Then
                id = 0
            Else
                id = max.RateID + 1
            End If
            Return id
        End Function

        Public Shared Function GetNextProfessionalRatingID() As Integer
            Dim id As Integer
            Dim sidejobcontext = New SidejobEntities()
            Dim max = sidejobcontext.ProfessionalRatings.OrderByDescending(Function(s) s.RateID).FirstOrDefault()

            If max Is Nothing Then
                id = 0
            Else
                id = max.RateID + 1
            End If
            Return id
        End Function

        ''Shared between Customer and Professional
        Public Function GetPath() As String
            Dim genderDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("GenderDropDownList"), DropDownList)
            Dim gender = CType(genderDropDownList.SelectedValue, Integer)
            If (gender = 1) Then
                Return "http://www.my-side-job.com/Images/Profile/male-user.png"
            Else
                Return "http://www.my-side-job.com/Images/Profile/female-user.png"
            End If
        End Function

        Public Shared Function GetNextEventID() As Integer
            Dim id As Integer
            Dim sidejobcontext = New SidejobEntities()
            Dim max = sidejobcontext.Events.OrderByDescending(Function(s) s.EventID).FirstOrDefault()

            If max Is Nothing Then
                id = 0
            Else
                id = max.EventID + 1
            End If
            Return id
        End Function

        Public Shared Function GetNextMessageID() As Integer
            Dim id As Integer
            Dim sidejobcontext = New SidejobEntities()
            Dim max = sidejobcontext.Messages.OrderByDescending(Function(s) s.MessageID).FirstOrDefault()

            If max Is Nothing Then
                id = 0
            Else
                id = max.MessageID + 1
            End If
            Return id
        End Function
        ''Shared between Customer and Professional

        Public Shared Function GetNextProfessional() As Integer
            Dim id As Integer
            Dim sidejobcontext = New SidejobEntities()
            Dim max = sidejobcontext.Professionals.OrderByDescending(Function(s) s.ProID).FirstOrDefault()

            If max Is Nothing Then
                id = 0
            Else
                id = max.ProID + 1
            End If
            Return id
        End Function

        Public Shared Function GetNextProfessionalAlbumID() As Integer
            Dim id As Integer
            Dim sidejobcontext = New SidejobEntities()
            Dim max = sidejobcontext.ProfessionalPictures.OrderByDescending(Function(s) s.AlbumID).FirstOrDefault()

            If max Is Nothing Then
                id = 0
            Else
                id = max.AlbumID + 1
            End If
            Return id
        End Function

        Public Shared Function GetNextProfessionalPhotoID() As Integer
            Dim id As Integer
            Dim sidejobcontext = New SidejobEntities()
            Dim max = sidejobcontext.ProfessionalPhotoes.OrderByDescending(Function(s) s.PhotoID).FirstOrDefault()

            If max Is Nothing Then
                id = 0
            Else
                id = max.PhotoID + 1
            End If
            Return id
        End Function

        Public Shared Function GetNextProfessionalWorkPhotoID() As Integer
            Dim id As Integer
            Dim sidejobcontext = New SidejobEntities()
            Dim max = sidejobcontext.ProfessionalWorkPhotoes.OrderByDescending(Function(s) s.PhotoID).FirstOrDefault()

            If max Is Nothing Then
                id = 0
            Else
                id = max.PhotoID + 1
            End If
            Return id
        End Function

        Protected Sub SEO()
            Title.Text = Resources.Resource.SignUpTitle.ToString
            Page.Title = Resources.Resource.SignUpTitle.ToString
            Page.MetaDescription = Resources.Resource.SignUpDescription.ToString
            Page.MetaKeywords = Resources.Resource.SignUpKeywords.ToString

            metaTitle.Content = Resources.Resource.SignUpTitle.ToString
            metaKeyword.Content = Resources.Resource.SignUpKeywords.ToString
            MetaDescription.Content = Resources.Resource.SignUpDescription.ToString
        End Sub

        Protected Overrides Sub InitializeCulture()
            Utility.InitializeAllCulture(Session("LCID"), Request.QueryString("l"))
            ActivateLanguage()
        End Sub

        Public Property Language() As Integer
            Get
                Return _language
            End Get
            Set(ByVal value As Integer)
                value = _language
            End Set
        End Property

        Private _path As String
        Public Property Path() As String
            Get
                Return _path
            End Get
            Set(ByVal value As String)
                _path = value
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

        Protected Sub CountryDropDownListSelectedIndexChanged1(ByVal sender As Object, ByVal e As EventArgs)
            RegionsDropDownList.DataBind()
            CityUpdatePanel.Update()
            DelayModalPopUpExtender.Hide()
        End Sub

        Protected Sub RegionDropDownListSelectedIndexChanged1(ByVal sender As Object, ByVal e As EventArgs)
            DelayModalPopUpExtender.Hide()
        End Sub

        Protected Sub IndustrySelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
            DelayModalPopUpExtender.Hide()
        End Sub

        Protected Sub SignInButtonClick(ByVal sender As Object, ByVal e As EventArgs)
            Response.Redirect("SignIn.aspx")
        End Sub

        Protected Sub ContinueButtonClick(ByVal sender As Object, ByVal e As EventArgs)
            If RoleLabel.Text = Resources.Resource.Customer.ToString Then
                CreateCustomer()
                Roles.AddUserToRole(SignUpCreateWizard.UserName, "Customer")
                SignUpCreateWizard.ContinueDestinationPageUrl = "~/Authenticated/Customer/CustomerProfile.aspx"
                CreateDirectory()
            Else
                CreateProfessional()
                Roles.AddUserToRole(SignUpCreateWizard.UserName, "Professional")
                SignUpCreateWizard.ContinueDestinationPageUrl = "~/Authenticated/Professional/ProfessionalProfile.aspx"
                CreateDirectoryProfessional()
            End If
        End Sub

        Protected Sub CustomerLinkButtonClick(ByVal sender As Object, ByVal e As EventArgs) Handles CustomerLinkButton.Click
            RoleLabel.Text = Resources.Resource.Customer.ToString
            RoleLabel.ForeColor = Drawing.ColorTranslator.FromHtml("#800000")
            customercolumn.BgColor = "#800000"
            professionalcolumn.BgColor = "white"
        End Sub

        Protected Sub ProfessionalLinkButtonClick(ByVal sender As Object, ByVal e As EventArgs) Handles ProfessionalLinkButton.Click
            RoleLabel.Text = Resources.Resource.Professional.ToString
            RoleLabel.ForeColor = Drawing.ColorTranslator.FromHtml("#003366")
            ProfessionalPanelModalPopupExtender.Show()
            professionalcolumn.BgColor = "#003366"
            customercolumn.BgColor = "#ffffff"
        End Sub

        Protected Sub ClearSkillsButtonClick(ByVal sender As Object, ByVal e As EventArgs) Handles ClearSkillsButton.Click
            ClearSkills()
            ClearSession()
        End Sub

        Protected Sub SaveSkillsButtonClick(ByVal sender As Object, ByVal e As EventArgs) Handles SaveSkillsButton.Click
            RoleLabel.Text = Resources.Resource.Professional.ToString
            ProfessionalPanelModalPopupExtender.Hide()
        End Sub

        Protected Sub CancelSkillsButtonClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles CancelSkillsButton.Click
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
                            Skill1JobId = CType(SpecialtyListBox1.Items(k).Value, Integer)
                        Case 2
                            Skill1JobId = CType(SpecialtyListBox2.Items(k).Value, Integer)
                        Case 3
                            Skill1JobId = CType(SpecialtyListBox3.Items(k).Value, Integer)
                    End Select
                    Skill1Category = CType(IndustryDropDownList.SelectedValue, Integer)
                    Skill1Experience = CType(ExperienceDropDownList.SelectedValue, Integer)
                    Skill1Crew = CType(CrewNumberDropDownList.SelectedValue, Integer)
                    Skill1Licensed = CType(LicensedDropDownList.SelectedValue, Integer)
                    Skill1Insured = CType(InsuredDropDownList.SelectedValue, Integer)
                    Skill1Relocation = CType(RelocationDropDownList.SelectedValue, Integer)

                Case 2
                    Select Case j
                        Case 1
                            Skill2JobId = CType(SpecialtyListBox1.Items(k).Value, Integer)
                        Case 2
                            Skill2JobId = CType(SpecialtyListBox2.Items(k).Value, Integer)
                        Case 3
                            Skill2JobId = CType(SpecialtyListBox3.Items(k).Value, Integer)
                    End Select
                    Skill2Category = CType(IndustryDropDownList.SelectedValue, Integer)
                    Skill2Experience = CType(ExperienceDropDownList.SelectedValue, Integer)
                    Skill2Crew = CType(CrewNumberDropDownList.SelectedValue, Integer)
                    Skill2Licensed = CType(LicensedDropDownList.SelectedValue, Integer)
                    Skill2Insured = CType(InsuredDropDownList.SelectedValue, Integer)
                    Skill2Relocation = CType(RelocationDropDownList.SelectedValue, Integer)

                Case 3
                    Select Case j
                        Case 1
                            Skill3JobId = CType(SpecialtyListBox1.Items(k).Value, Integer)
                        Case 2
                            Skill3JobId = CType(SpecialtyListBox2.Items(k).Value, Integer)
                        Case 3
                            Skill3JobId = CType(SpecialtyListBox3.Items(k).Value, Integer)
                    End Select
                    Skill3Category = CType(IndustryDropDownList.SelectedValue, Integer)
                    Skill3Experience = CType(ExperienceDropDownList.SelectedValue, Integer)
                    Skill3Crew = CType(CrewNumberDropDownList.SelectedValue, Integer)
                    Skill3Licensed = CType(LicensedDropDownList.SelectedValue, Integer)
                    Skill3Insured = CType(InsuredDropDownList.SelectedValue, Integer)
                    Skill3Relocation = CType(RelocationDropDownList.SelectedValue, Integer)

                Case 4
                    Select Case j
                        Case 1
                            Skill4JobId = CType(SpecialtyListBox1.Items(k).Value, Integer)
                        Case 2
                            Skill4JobId = CType(SpecialtyListBox2.Items(k).Value, Integer)
                        Case 3
                            Skill4JobId = CType(SpecialtyListBox3.Items(k).Value, Integer)
                    End Select
                    Skill4Category = CType(IndustryDropDownList.SelectedValue, Integer)
                    Skill4Experience = CType(ExperienceDropDownList.SelectedValue, Integer)
                    Skill4Crew = CType(CrewNumberDropDownList.SelectedValue, Integer)
                    Skill4Licensed = CType(LicensedDropDownList.SelectedValue, Integer)
                    Skill4Insured = CType(InsuredDropDownList.SelectedValue, Integer)
                    Skill4Relocation = CType(RelocationDropDownList.SelectedValue, Integer)

            End Select
            NumberofSkills += 1
        End Sub

        Protected Sub ClearSession()
            NumberofSkills = 0
        End Sub

        Protected Sub AddSkillsButtonClick(ByVal sender As Object, ByVal e As EventArgs) Handles AddSkillsButton.Click

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
                _totalSkills = previoustotalskills + 1
            End If

            For i As Integer = 0 To SpecialtyListBox1.Items.Count - 1
                If SpecialtyListBox1.Items(i).Selected = True Then
                    If _totalSkills < 5 Then
                        If (Checkskillexistence(SpecialtyListBox1.Items(i).ToString()) = False) Then
                            _skills(_totalSkills) = SpecialtyListBox1.Items(i).ToString()
                            SaveSession(_totalSkills, 1, i)
                            _totalSkills += 1
                        End If
                    Else
                        Exit For
                    End If
                End If
            Next

            If _totalSkills < 5 Then
                For i As Integer = 0 To SpecialtyListBox2.Items.Count - 1
                    If SpecialtyListBox2.Items(i).Selected = True Then
                        If _totalSkills < 5 Then
                            If (Checkskillexistence(SpecialtyListBox2.Items(i).ToString()) = False) Then
                                _skills(_totalSkills) = SpecialtyListBox2.Items(i).ToString()
                                SaveSession(_totalSkills, 2, i)
                                _totalSkills += 1
                            End If
                        Else
                            Exit For
                        End If
                    End If
                Next
            End If

            If _totalSkills < 5 Then
                For i As Integer = 0 To SpecialtyListBox3.Items.Count - 1
                    If SpecialtyListBox3.Items(i).Selected = True Then
                        If _totalSkills < 5 Then
                            If (Checkskillexistence(SpecialtyListBox3.Items(i).ToString()) = False) Then
                                _skills(_totalSkills) = SpecialtyListBox3.Items(i).ToString()
                                SaveSession(_totalSkills, 3, i)
                                _totalSkills += 1
                            End If
                        Else
                            Exit For
                        End If
                    End If
                Next
            End If

            If _skills(1) <> "" Then
                Skill1Label.Text = _skills(1).ToString
            End If

            If _skills(2) <> "" Then
                Skill2Label.Text = _skills(2).ToString
            End If

            If _skills(3) <> "" Then
                Skill3Label.Text = _skills(3).ToString
            End If

            If _skills(4) <> "" Then
                Skill4Label.Text = _skills(4).ToString
            End If

        End Sub

        Function Checkskillexistence(ByVal oldskills As String) As Boolean

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
            _totalSkills = 1
            For i As Integer = 1 To 4
                _skills(i) = ""
            Next
            Skill1Label.Text = ""
            Skill2Label.Text = ""
            Skill3Label.Text = ""
            Skill4Label.Text = ""
            CityUpdatePanel.Update()
        End Sub

        Sub CreateDirectory()

            Dim username As String = User.Identity.Name
            Dim rootPath As String = Server.MapPath("~/Authenticated/Customer/Images/")
            Dim newCustomerDirectory As String = rootPath & username

            If Directory.Exists(newCustomerDirectory) = False Then
                Directory.CreateDirectory(newCustomerDirectory)
            Else
                Directory.Delete(newCustomerDirectory, True)
                Directory.CreateDirectory(newCustomerDirectory)
            End If

            Dim customerProjectDirectory As String = newCustomerDirectory & "/Projects/"

            If Directory.Exists(customerProjectDirectory) = False Then
                Directory.CreateDirectory(customerProjectDirectory)
            Else
                Directory.Delete(customerProjectDirectory, True)
                Directory.CreateDirectory(customerProjectDirectory)
            End If

        End Sub

        Sub CreateDirectoryProfessional()

            Dim username As String = User.Identity.Name
            Dim rootPath As String = Server.MapPath("~/Authenticated/Professional/Images/")
            Dim newProfessionalDirectory As String = rootPath & username

            If Directory.Exists(newProfessionalDirectory) = False Then
                Directory.CreateDirectory(newProfessionalDirectory)
            Else
                Directory.Delete(newProfessionalDirectory, True)
                Directory.CreateDirectory(newProfessionalDirectory)
            End If

            Dim professionalProjectDirectory As String = newProfessionalDirectory & "/Projects/"

            If Directory.Exists(professionalProjectDirectory) = False Then
                Directory.CreateDirectory(professionalProjectDirectory)
            Else
                Directory.Delete(professionalProjectDirectory, True)
                Directory.CreateDirectory(professionalProjectDirectory)
            End If

            Dim rootWorkPath As String = Server.MapPath("~/Authenticated/Professional/WorkImages/")
            Dim newProfessionalWorkDirectory As String = rootWorkPath & username

            If Directory.Exists(newProfessionalWorkDirectory) = False Then
                Directory.CreateDirectory(newProfessionalWorkDirectory)
            Else
                Directory.Delete(newProfessionalWorkDirectory, True)
                Directory.CreateDirectory(newProfessionalWorkDirectory)
            End If

        End Sub

        Public Sub Processkills()
            Select Case NumberofSkills
                Case 1
                    AddOneNewSkill()
                Case 2
                    AddTwoNewSkill()
                Case 3
                    AddThreeNewSkill()
                Case 4
                    AddFourNewSkill()
            End Select
            ClearSession()
        End Sub

        Public Sub AddOneNewSkill()
            Using sidejobcontext = New SidejobEntities()
                Dim nextSkillID As Integer = Utility.GetNextSkillId()
                sidejobcontext.InsertProfessionalSkill(nextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
                Dim newSkill1 As New Skill
                newSkill1.SkillID = nextSkillID
                newSkill1.CategoryID = Skill1Category
                newSkill1.JobID = Skill1JobId
                newSkill1.CategoryName = Utility.GetCategoryName(Skill1Category, _language)
                newSkill1.JobTitle = Utility.GetJobTitle(Skill1JobId, _language)
                newSkill1.Experience = Skill1Experience
                newSkill1.Crew = Skill1Crew
                newSkill1.Licensed = Skill1Licensed
                newSkill1.Insured = Skill1Insured
                newSkill1.Insured = Skill1Insured
                sidejobcontext.AddToSkills(newSkill1)
                sidejobcontext.SaveChanges()
            End Using
        End Sub

        Public Sub AddTwoNewSkill()
            Using sidejobcontext = New SidejobEntities()
                Dim firstnextSkillID As Integer = Utility.GetNextSkillId()
                sidejobcontext.InsertProfessionalSkill(firstnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
                Dim newSkill1 As New Skill
                newSkill1.SkillID = firstnextSkillID
                newSkill1.CategoryID = Skill1Category
                newSkill1.JobID = Skill1JobId
                newSkill1.CategoryName = Utility.GetCategoryName(Skill1Category, _language)
                newSkill1.JobTitle = Utility.GetJobTitle(Skill1JobId, _language)
                newSkill1.Experience = Skill1Experience
                newSkill1.Crew = Skill1Crew
                newSkill1.Licensed = Skill1Licensed
                newSkill1.Insured = Skill1Insured
                sidejobcontext.AddToSkills(newSkill1)
                sidejobcontext.SaveChanges()

                Dim secondnextSkillID As Integer = Utility.GetNextSkillId()
                sidejobcontext.InsertProfessionalSkill(secondnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
                Dim newSkill2 As New Skill
                newSkill2.SkillID = secondnextSkillID
                newSkill2.CategoryID = Skill2Category
                newSkill2.JobID = Skill2JobId
                newSkill2.CategoryName = Utility.GetCategoryName(Skill2Category, _language)
                newSkill2.JobTitle = Utility.GetJobTitle(Skill2JobId, _language)
                newSkill2.Experience = Skill2Experience
                newSkill2.Crew = Skill2Crew
                newSkill2.Licensed = Skill2Licensed
                newSkill2.Insured = Skill2Insured
                sidejobcontext.AddToSkills(newSkill2)
                sidejobcontext.SaveChanges()
            End Using
        End Sub

        Public Sub AddThreeNewSkill()
            Using sidejobcontext = New SidejobEntities()
                Dim firstnextSkillID As Integer = Utility.GetNextSkillId()
                sidejobcontext.InsertProfessionalSkill(firstnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
                Dim newSkill1 As New Skill
                newSkill1.SkillID = firstnextSkillID
                newSkill1.CategoryID = Skill1Category
                newSkill1.JobID = Skill1JobId
                newSkill1.CategoryName = Utility.GetCategoryName(Skill1Category, _language)
                newSkill1.JobTitle = Utility.GetJobTitle(Skill1JobId, _language)
                newSkill1.Experience = Skill1Experience
                newSkill1.Crew = Skill1Crew
                newSkill1.Licensed = Skill1Licensed
                sidejobcontext.AddToSkills(newSkill1)
                sidejobcontext.SaveChanges()

                Dim secondnextSkillID As Integer = Utility.GetNextSkillId()
                sidejobcontext.InsertProfessionalSkill(secondnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
                Dim newSkill2 As New Skill
                newSkill2.SkillID = secondnextSkillID
                newSkill2.CategoryID = Skill2Category
                newSkill2.JobID = Skill2JobId
                newSkill2.CategoryName = Utility.GetCategoryName(Skill2Category, _language)
                newSkill2.JobTitle = Utility.GetJobTitle(Skill2JobId, _language)
                newSkill2.Experience = Skill2Experience
                newSkill2.Crew = Skill2Crew
                newSkill2.Licensed = Skill2Licensed
                newSkill2.Insured = Skill2Insured
                sidejobcontext.AddToSkills(newSkill2)
                sidejobcontext.SaveChanges()

                Dim thirdnextSkillID As Integer = Utility.GetNextSkillId()
                sidejobcontext.InsertProfessionalSkill(thirdnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
                Dim newSkill3 As New Skill
                newSkill3.SkillID = secondnextSkillID
                newSkill3.CategoryID = Skill3Category
                newSkill3.JobID = Skill3JobId
                newSkill3.CategoryName = Utility.GetCategoryName(Skill3Category, _language)
                newSkill3.JobTitle = Utility.GetJobTitle(Skill3JobId, _language)
                newSkill3.Experience = Skill3Experience
                newSkill3.Crew = Skill3Crew
                newSkill3.Licensed = Skill3Licensed
                newSkill3.Insured = Skill3Insured
                sidejobcontext.AddToSkills(newSkill3)
                sidejobcontext.SaveChanges()
            End Using
        End Sub

        Public Sub AddFourNewSkill()
            Using sidejobcontext = New SidejobEntities()
                Dim firstnextSkillID As Integer = Utility.GetNextSkillId()
                sidejobcontext.InsertProfessionalSkill(firstnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
                Dim newSkill1 As New Skill
                newSkill1.SkillID = firstnextSkillID
                newSkill1.CategoryID = Skill1Category
                newSkill1.JobID = Skill1JobId
                newSkill1.CategoryName = Utility.GetCategoryName(Skill1Category, _language)
                newSkill1.JobTitle = Utility.GetJobTitle(Skill1JobId, _language)
                newSkill1.Experience = Skill1Experience
                newSkill1.Crew = Skill1Crew
                newSkill1.Licensed = Skill1Licensed
                newSkill1.Insured = Skill1Insured
                sidejobcontext.AddToSkills(newSkill1)
                sidejobcontext.SaveChanges()

                Dim secondnextSkillID As Integer = Utility.GetNextSkillId()
                sidejobcontext.InsertProfessionalSkill(secondnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
                Dim newSkill2 As New Skill
                newSkill2.SkillID = secondnextSkillID
                newSkill2.CategoryID = Skill2Category
                newSkill2.JobID = Skill2JobId
                newSkill2.CategoryName = Utility.GetCategoryName(Skill2Category, _language)
                newSkill2.JobTitle = Utility.GetJobTitle(Skill2JobId, _language)
                newSkill2.Experience = Skill2Experience
                newSkill2.Crew = Skill2Crew
                newSkill2.Licensed = Skill2Licensed
                newSkill2.Insured = Skill2Insured
                sidejobcontext.AddToSkills(newSkill2)
                sidejobcontext.SaveChanges()


                Dim thirdnextSkillID As Integer = Utility.GetNextSkillId()
                sidejobcontext.InsertProfessionalSkill(thirdnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
                Dim newSkill3 As New Skill
                newSkill3.SkillID = thirdnextSkillID
                newSkill3.CategoryID = Skill3Category
                newSkill3.JobID = Skill3JobId
                newSkill3.CategoryName = Utility.GetCategoryName(Skill3Category, _language)
                newSkill3.JobTitle = Utility.GetJobTitle(Skill3JobId, _language)
                newSkill3.Experience = Skill3Experience
                newSkill3.Crew = Skill3Crew
                newSkill3.Licensed = Skill3Licensed
                newSkill3.Insured = Skill3Insured
                sidejobcontext.AddToSkills(newSkill3)
                sidejobcontext.SaveChanges()


                Dim fourthnextSkillID As Integer = Utility.GetNextSkillId()
                sidejobcontext.InsertProfessionalSkill(fourthnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
                Dim newSkill4 As New Skill
                newSkill4.SkillID = fourthnextSkillID
                newSkill4.CategoryID = Skill4Category
                newSkill4.JobID = Skill4JobId
                newSkill4.CategoryName = Utility.GetCategoryName(Skill4Category, _language)
                newSkill4.JobTitle = Utility.GetJobTitle(Skill4JobId, _language)
                newSkill4.Experience = Skill4Experience
                newSkill4.Crew = Skill4Crew
                newSkill4.Licensed = Skill4Licensed
                newSkill4.Insured = Skill4Insured
                sidejobcontext.AddToSkills(newSkill4)
                sidejobcontext.SaveChanges()
            End Using
        End Sub

        Public Sub AddFiveNewSkill()
            Using sidejobcontext = New SidejobEntities()
                Dim firstnextSkillID As Integer = Utility.GetNextSkillId()
                sidejobcontext.InsertProfessionalSkill(firstnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
                Dim newSkill1 As New Skill
                newSkill1.SkillID = firstnextSkillID
                newSkill1.CategoryID = Skill1Category
                newSkill1.JobID = Skill1JobId
                newSkill1.CategoryName = Utility.GetCategoryName(Skill1Category, _language)
                newSkill1.JobTitle = Utility.GetJobTitle(Skill1JobId, _language)
                newSkill1.Experience = Skill1Experience
                newSkill1.Crew = Skill1Crew
                newSkill1.Licensed = Skill1Licensed
                newSkill1.Insured = Skill1Insured
                sidejobcontext.AddToSkills(newSkill1)
                sidejobcontext.SaveChanges()

                Dim secondnextSkillID As Integer = Utility.GetNextSkillId()
                sidejobcontext.InsertProfessionalSkill(secondnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
                Dim newSkill2 As New Skill
                newSkill2.SkillID = secondnextSkillID
                newSkill2.CategoryID = Skill2Category
                newSkill2.JobID = Skill2JobId
                newSkill2.CategoryName = Utility.GetCategoryName(Skill2Category, _language)
                newSkill2.JobTitle = Utility.GetJobTitle(Skill2JobId, _language)
                newSkill2.Experience = Skill2Experience
                newSkill2.Crew = Skill2Crew
                newSkill2.Licensed = Skill2Licensed
                newSkill2.Insured = Skill2Insured
                sidejobcontext.AddToSkills(newSkill2)
                sidejobcontext.SaveChanges()

                Dim thirdnextSkillID As Integer = Utility.GetNextSkillId()
                sidejobcontext.InsertProfessionalSkill(thirdnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
                Dim newSkill3 As New Skill
                newSkill3.SkillID = thirdnextSkillID
                newSkill3.CategoryID = Skill3Category
                newSkill3.JobID = Skill3JobId
                newSkill3.CategoryName = Utility.GetCategoryName(Skill3Category, _language)
                newSkill3.JobTitle = Utility.GetJobTitle(Skill3JobId, _language)
                newSkill3.Experience = Skill3Experience
                newSkill3.Crew = Skill3Crew
                newSkill3.Licensed = Skill3Licensed
                newSkill3.Insured = Skill3Insured
                sidejobcontext.AddToSkills(newSkill3)
                sidejobcontext.SaveChanges()

                Dim fourthnextSkillID As Integer = Utility.GetNextSkillId()
                sidejobcontext.InsertProfessionalSkill(fourthnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
                Dim newSkill4 As New Skill
                newSkill4.SkillID = fourthnextSkillID
                newSkill4.CategoryID = Skill4Category
                newSkill4.JobID = Skill4JobId
                newSkill4.CategoryName = Utility.GetCategoryName(Skill4Category, _language)
                newSkill4.JobTitle = Utility.GetJobTitle(Skill4JobId, _language)
                newSkill4.Experience = Skill4Experience
                newSkill4.Crew = Skill4Crew
                newSkill4.Licensed = Skill4Licensed
                newSkill4.Insured = Skill4Insured
                sidejobcontext.AddToSkills(newSkill4)
                sidejobcontext.SaveChanges()

                Dim fifthnextSkillID As Integer = Utility.GetNextSkillId()
                sidejobcontext.InsertProfessionalSkill(fifthnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
                Dim newSkill5 As New Skill
                newSkill5.SkillID = fifthnextSkillID
                newSkill5.CategoryID = Skill5Category
                newSkill5.JobID = Skill5JobId
                newSkill5.CategoryName = Utility.GetCategoryName(Skill5Category, _language)
                newSkill5.JobTitle = Utility.GetJobTitle(Skill5JobId, _language)
                newSkill5.Experience = Skill5Experience
                newSkill5.Crew = Skill5Crew
                newSkill5.Licensed = Skill5Licensed
                newSkill5.Insured = Skill5Insured
                sidejobcontext.AddToSkills(newSkill5)
                sidejobcontext.SaveChanges()
            End Using
        End Sub

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''SKILLS''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        ''//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////''
        ''//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////''
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 1'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        Public Property NumberofSkills() As Integer
            Get
                Return CType(IIf(Session("_numberofSkills") IsNot Nothing, Session("_numberofSkills"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_numberofSkills") = value
            End Set
        End Property
        Public Property Skill1Category() As Integer
            Get
                Return CType(IIf(Session("_skill1Category") IsNot Nothing, Session("_skill1Category"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill1Category") = value
            End Set
        End Property
        Public Property Skill1JobId() As Integer
            Get
                Return CType(IIf(Session("_skill1JobId") IsNot Nothing, Session("_skill1JobId"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill1JobId") = value
            End Set
        End Property
        Public Property Skill1Experience() As Integer
            Get
                Return CType(IIf(Session("_skill1Experience") IsNot Nothing, Session("_skill1Experience"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill1Experience") = value
            End Set
        End Property
        Public Property Skill1Crew() As Integer
            Get
                Return CType(IIf(Session("_skill1Crew") IsNot Nothing, Session("_skill1Crew"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill1Crew") = value
            End Set
        End Property
        Public Property Skill1Licensed() As Integer
            Get
                Return CType(IIf(Session("_skill1Licensed") IsNot Nothing, Session("_skill1Licensed"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill1Licensed") = value
            End Set
        End Property
        Public Property Skill1Insured() As Integer
            Get
                Return CType(IIf(Session("_skill1Insured") IsNot Nothing, Session("_skill1Insured"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill1Insured") = value
            End Set
        End Property
        Public Property Skill1Relocation() As Integer
            Get
                Return CType(IIf(Session("_skill1Relocation") IsNot Nothing, Session("_skill1Relocation"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill1Relocation") = value
            End Set
        End Property
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 2'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 2'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Property Skill2Category() As Integer
            Get
                Return CType(IIf(Session("_skill2Category") IsNot Nothing, Session("_skill2Category"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill2Category") = value
            End Set
        End Property
        Public Property Skill2JobId() As Integer
            Get
                Return CType(IIf(Session("_skill2JobId") IsNot Nothing, Session("_skill2JobId"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill2JobId") = value
            End Set
        End Property
        Public Property Skill2Experience() As Integer
            Get
                Return CType(IIf(Session("_skill2Experience") IsNot Nothing, Session("_skill2Experience"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill2Experience") = value
            End Set
        End Property
        Public Property Skill2Crew() As Integer
            Get
                Return CType(IIf(Session("_skill2Crew") IsNot Nothing, Session("_skill2Crew"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill2Crew") = value
            End Set
        End Property
        Public Property Skill2Licensed() As Integer
            Get
                Return CType(IIf(Session("_skill2Licensed") IsNot Nothing, Session("_skill2Licensed"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill2Licensed") = value
            End Set
        End Property
        Public Property Skill2Insured() As Integer
            Get
                Return CType(IIf(Session("_skill2Insured") IsNot Nothing, Session("_skill2Insured"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill2Insured") = value
            End Set
        End Property
        Public Property Skill2Relocation() As Integer
            Get
                Return CType(IIf(Session("_skill2Relocation") IsNot Nothing, Session("_skill2Relocation"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill2Relocation") = value
            End Set
        End Property
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 2'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 3'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Property Skill3Category() As Integer
            Get
                Return CType(IIf(Session("_skill3Category") IsNot Nothing, Session("_skill3Category"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill3Category") = value
            End Set
        End Property
        Public Property Skill3JobId() As Integer
            Get
                Return CType(IIf(Session("_skill3JobId") IsNot Nothing, Session("_skill3JobId"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill3JobId") = value
            End Set
        End Property
        Public Property Skill3Experience() As Integer
            Get
                Return CType(IIf(Session("_skill3Experience") IsNot Nothing, Session("_skill3Experience"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill3Experience") = value
            End Set
        End Property
        Public Property Skill3Crew() As Integer
            Get
                Return CType(IIf(Session("_skill3Crew") IsNot Nothing, Session("_skill3Crew"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill3Crew") = value
            End Set
        End Property
        Public Property Skill3Licensed() As Integer
            Get
                Return CType(IIf(Session("_skill3Licensed") IsNot Nothing, Session("_skill3Licensed"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill3Licensed") = value
            End Set
        End Property
        Public Property Skill3Insured() As Integer
            Get
                Return CType(IIf(Session("_skill3Insured") IsNot Nothing, Session("_skill3Insured"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill3Insured") = value
            End Set
        End Property
        Public Property Skill3Relocation() As Integer
            Get
                Return CType(IIf(Session("_skill3Relocation") IsNot Nothing, Session("_skill3Relocation"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill3Relocation") = value
            End Set
        End Property
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 3'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 4'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Property Skill4Category() As Integer
            Get
                Return CType(IIf(Session("_skill4Category") IsNot Nothing, Session("_skill4Category"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill4Category") = value
            End Set
        End Property
        Public Property Skill4JobId() As Integer
            Get
                Return CType(IIf(Session("_skill4JobId") IsNot Nothing, Session("_skill4JobId"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill4JobId") = value
            End Set
        End Property
        Public Property Skill4Experience() As Integer
            Get
                Return CType(IIf(Session("_skill4Experience") IsNot Nothing, Session("_skill4Experience"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill4Experience") = value
            End Set
        End Property
        Public Property Skill4Crew() As Integer
            Get
                Return CType(IIf(Session("_skill4Crew") IsNot Nothing, Session("_skill4Crew"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill4Crew") = value
            End Set
        End Property
        Public Property Skill4Licensed() As Integer
            Get
                Return CType(IIf(Session("_skill4Licensed") IsNot Nothing, Session("_skill4Licensed"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill4Licensed") = value
            End Set
        End Property
        Public Property Skill4Insured() As Integer
            Get
                Return CType(IIf(Session("_skill4Insured") IsNot Nothing, Session("_skill4Insured"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill4Insured") = value
            End Set
        End Property
        Public Property Skill4Relocation() As Integer
            Get
                Return CType(IIf(Session("_skill4Relocation") IsNot Nothing, Session("_skill4Relocation"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill4Relocation") = value
            End Set
        End Property
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 4'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 5'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Property Skill5Category() As Integer
            Get
                Return CType(IIf(Session("_skill5Category") IsNot Nothing, Session("_skill5Category"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill5Category") = value
            End Set
        End Property
        Public Property Skill5JobId() As Integer
            Get
                Return CType(IIf(Session("_skill5JobId") IsNot Nothing, Session("_skill5JobId"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill5JobId") = value
            End Set
        End Property
        Public Property Skill5Experience() As Integer
            Get
                Return CType(IIf(Session("_skill5Experience") IsNot Nothing, Session("_skill5Experience"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill5Experience") = value
            End Set
        End Property
        Public Property Skill5Crew() As Integer
            Get
                Return CType(IIf(Session("_skill5Crew") IsNot Nothing, Session("_skill5Crew"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill5Crew") = value
            End Set
        End Property
        Public Property Skill5Licensed() As Integer
            Get
                Return CType(IIf(Session("_skill5Licensed") IsNot Nothing, Session("_skill5Licensed"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill5Licensed") = value
            End Set
        End Property
        Public Property Skill5Insured() As Integer
            Get
                Return CType(IIf(Session("_skill5Insured") IsNot Nothing, Session("_skill5Insured"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill5Insured") = value
            End Set
        End Property
        Public Property Skill5Relocation() As Integer
            Get
                Return CType(IIf(Session("_skill5Relocation") IsNot Nothing, Session("_skill5Relocation"), String.Empty), Integer)
            End Get
            Set(ByVal value As Integer)
                Session("_skill5Relocation") = value
            End Set
        End Property
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 5'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''SKILLS''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        ''//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////''
        ''//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////''

    End Class
End Namespace