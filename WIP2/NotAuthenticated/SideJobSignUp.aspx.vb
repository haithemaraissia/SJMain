
Imports System
Imports System.Linq
Imports System.Web.Security
Imports System.Globalization
Imports System.Data
Imports System.IO
Imports SidejobModel
Imports System.Threading
Imports System.Data.SqlClient

Partial Public Class NotAuthenticated_SideJobSignUp
    Inherits System.Web.UI.Page
    ReadOnly _nextCustomerID As Integer = GetNextCustomer()
    ReadOnly _nextProID As Integer = GetNextProfessional()
    Dim totalSkills As Integer = 1
    Dim skills(4) As String
    Dim ChosenRole As String = "Customer"
    Public _language As Integer


    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Page.IsPostBack = False Then
            Dim lang As String = Request.QueryString("l")
            If lang IsNot Nothing Or lang <> "" Then
                Thread.CurrentThread.CurrentUICulture = New CultureInfo(lang)
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang)
            End If
            ClearSession()
        End If
    End Sub

    Public Sub CreateCustomer()
        Dim user = Membership.GetUser()
        If user IsNot Nothing Then
            Dim userKey = user.ProviderUserKey
            If userKey IsNot Nothing Then
                InsertNewCustomer(_nextCustomerID, user.ToString(), Language, Utility.GetUserID())
                InsertCustomerTables(user.ToString())
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

    Public Sub InsertNewCustomer(nextcustomerID As Integer, userName As String, lcid As Integer, userId As Guid)
        Dim context = New SidejobEntities()
        context.InsertNewCustomer(nextcustomerID, userName, lcid, userId)
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
        Dim ZipcodeValue As String = "0"
        Dim usaZipCodeRegex As Regex = New Regex("\d{5}(-\d{4})?")
        Dim canadaZipCodeRegex As Regex = New Regex("[A-Z]\d[A-Z] \d[A-Z]\d")
        If (String.Compare(countryDropDownList.SelectedValue.ToString, "USA") = 0) Then
            If usaZipCodeRegex.IsMatch(zipcodeTextBox.Text) Then
                ZipcodeValue = zipcodeTextBox.Text
            End If
        ElseIf (String.Compare(countryDropDownList.SelectedValue.ToString, "Canada") = 0) Then
            If canadaZipCodeRegex.IsMatch(zipcodeTextBox.Text) Then
                ZipcodeValue = zipcodeTextBox.Text
            End If
        End If
        Dim context = New SidejobModel.SidejobEntities()
        Dim customerGeneral = New SidejobModel.CustomerGeneral() With { _
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
        context.AddToCustomerGenerals(customerGeneral)
        context.SaveChanges()
    End Sub

    Public Sub CustomerSpecificInformation()
        Dim ageTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AgeTextBox"), TextBox)
        Dim genderDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("GenderDropDownList"), DropDownList)
        Dim context = New SidejobModel.SidejobEntities()
        Dim customspecificinformation = New SidejobModel.CustomerSpecificInformation() With { _
         .Age = CType(ageTextBox.Text, Integer), _
         .EmailAddress = SignUpCreateWizard.Email.ToString, _
         .Gender = CType(genderDropDownList.SelectedValue, Integer), _
         .CustomerID = _nextCustomerID _
        }
        context.AddToCustomerSpecificInformations(customspecificinformation)
        context.SaveChanges()
    End Sub

    Public Sub InsertCustomerPicture(nextCustomerId As Integer, nextAlbumID As Integer)
        Dim context = New SidejobModel.SidejobEntities()
        context.InsertCustomerPicture(nextCustomerId, nextAlbumID)
    End Sub

    Public Sub InsertCustomerPhoto(nextPhotoID As Integer, photoPath As String, nextAlbumID As Integer, nextCustomerid As Integer)
        Dim context = New SidejobModel.SidejobEntities()
        context.InsertCustomerPhoto(nextPhotoID, photoPath, nextAlbumID, nextCustomerid)
    End Sub

    Public Sub InsertEvents()
        Dim nextEventID As Integer = GetNextEventID()
        Dim context = New SidejobModel.SidejobEntities()
        context.InsertEvent(nextEventID, DateTime.Now.[Date], Language)
        Dim customerEvent = New SidejobModel.CustomerEvent() With { _
         .CustomerID = _nextCustomerID, _
         .EventID = GetNextEventID(), _
         .NumberofEvents = 1, _
         .Type = 1 _
        }
        context.AddToCustomerEvents(customerEvent)
        context.SaveChanges()
    End Sub

    Public Sub InsertMessage()
        Dim context = New SidejobEntities()
        context.InsertMessage(GetNextMessageID(), _nextCustomerID, User.Identity.Name, DateTime.Now.[Date])
    End Sub

    Public Sub InsertCustomerMessageInbox()
        Dim context = New SidejobModel.SidejobEntities()
        Dim customerMessageInbox = New SidejobModel.CustomerMessageInbox() With { _
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
        context.AddToCustomerMessageInboxes(customerMessageInbox)
        context.SaveChanges()
    End Sub

    Public Sub InsertCustomerPortfolio()
        Dim context = New SidejobModel.SidejobEntities()
        Dim customerportfolio = New SidejobModel.CustomerPortfolio() With { _
         .CustomerID = _nextCustomerID, _
         .About = "", _
         .SpecialNotes = "", _
         .Modified = 0 _
        }
        context.AddToCustomerPortfolios(customerportfolio)
        context.SaveChanges()
    End Sub

    Public Sub InsertCommentReceivedSummary()
        Dim context = New SidejobModel.SidejobEntities()
        Dim customercommentreceivedsummary = New SidejobModel.CustomerCommentReceivedSummary() With { _
         .CustomerID = _nextCustomerID, _
         .NumberofPositive = 0, _
         .NumberofNegative = 0, _
         .NumberofNeutral = 0, _
         .Total = 0, _
         .Percentage = 100 _
        }
        context.AddToCustomerCommentReceivedSummaries(customercommentreceivedsummary)
        context.SaveChanges()
    End Sub

    Public Sub InsertCustomerAdditionalInformation()
        Dim context = New SidejobModel.SidejobEntities()
        Dim customeradditionalinformation = New SidejobModel.CustomerAdditionalInformation() With { _
         .CustomerID = _nextCustomerID, _
         .DateCreated = DateTime.Now.[Date], _
         .PeopleVisited = 0, _
         .InvitationSent = 0, _
         .Points = 0, _
         .ProjectPosted = 0 _
        }
        context.AddToCustomerAdditionalInformations(customeradditionalinformation)
        context.SaveChanges()
    End Sub

    Public Sub InsertCustomerRating()
        Dim context = New SidejobModel.SidejobEntities()
        Dim customerrating = New SidejobModel.CustomerRating() With { _
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
        context.AddToCustomerRatings(customerrating)
        context.SaveChanges()
    End Sub























    Public Sub CreateProfessional()
        Dim user = Membership.GetUser()
        If user IsNot Nothing Then
            Dim userKey = user.ProviderUserKey
            If userKey IsNot Nothing Then
                InsertNewProfessional(_nextProID, user.ToString(), Language, Utility.GetUserID())
                InsertProfessionalTables(user.ToString())
                ProfessionalSpecificInformation()
                ProfessionalOptional()
                InsertProfessionalPicture(_nextProID, GetNextProfessionalAlbumID())
                InsertProfessionalPhoto(GetNextProfessionalPhotoID(), GetPath(), GetNextProfessionalAlbumID() - 1, _nextProID)
                InsertProfessionalWorkPicture(_nextProID, GetNextProfessionalAlbumID())
                InsertProfessionalWorkPhoto(GetNextProfessionalPhotoID(), GetPath(), GetNextProfessionalAlbumID() - 1, _nextProID)
                InsertProfessionalEvents()
                InsertProfessionalMessage()
                InsertProfessionalMessageInbox()
                InsertProfessionalPortfolio()
                InsertProfessionalCommentReceivedSummary()
                InsertProfessionalAdditionalInformation()
                InsertProfessionalRating()
            End If
        End If
    End Sub

    Public Sub InsertNewProfessional(nextProID As Integer, userName As String, lcid As Integer, userId As Guid)
        Dim context = New SidejobEntities()
        context.InsertNewProfessional(nextProID, userName, lcid, userId)
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
        Dim ZipcodeValue As String = "0"
        Dim usaZipCodeRegex As Regex = New Regex("\d{5}(-\d{4})?")
        Dim canadaZipCodeRegex As Regex = New Regex("[A-Z]\d[A-Z] \d[A-Z]\d")
        If (String.Compare(countryDropDownList.SelectedValue.ToString, "USA") = 0) Then
            If usaZipCodeRegex.IsMatch(zipcodeTextBox.Text) Then
                ZipcodeValue = zipcodeTextBox.Text
            End If
        ElseIf (String.Compare(countryDropDownList.SelectedValue.ToString, "Canada") = 0) Then
            If canadaZipCodeRegex.IsMatch(zipcodeTextBox.Text) Then
                ZipcodeValue = zipcodeTextBox.Text
            End If
        End If
        Dim context = New SidejobModel.SidejobEntities()
        Dim ProfessionalGeneral = New SidejobModel.ProfessionalGeneral() With { _
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
         .Zipcode = ZipcodeValue, _
         .HomePhoneNumber = homeTelephoneTextBox.Text, _
         .MobilePhoneNumber = mobilePhoneTextBox.Text, _
         .Age = CType(ageTextBox.Text, Integer), _
         .Gender = CType(genderDropDownList.SelectedValue, Integer), _
         .EmailAddress = SignUpCreateWizard.Email.ToString, _
         .PhotoPath = GetPath() _
        }
        context.AddToProfessionalGenerals(ProfessionalGeneral)
        context.SaveChanges()
    End Sub

    Public Sub ProfessionalSpecificInformation()
        Dim ageTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AgeTextBox"), TextBox)
        Dim genderDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("GenderDropDownList"), DropDownList)
        Dim context = New SidejobModel.SidejobEntities()
        Dim customspecificinformation = New SidejobModel.ProfessionalSpecificInformation() With { _
         .Age = CType(ageTextBox.Text, Integer), _
         .EmailAddress = SignUpCreateWizard.Email.ToString, _
         .Gender = CType(genderDropDownList.SelectedValue, Integer), _
         .ProID = _nextProID _
        }
        context.AddToProfessionalSpecificInformations(customspecificinformation)
        context.SaveChanges()
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
        Dim ZipcodeValue As String = "0"
        Dim usaZipCodeRegex As Regex = New Regex("\d{5}(-\d{4})?")
        Dim canadaZipCodeRegex As Regex = New Regex("[A-Z]\d[A-Z] \d[A-Z]\d")
        If (String.Compare(countryDropDownList.SelectedValue.ToString, "USA") = 0) Then
            If usaZipCodeRegex.IsMatch(zipcodeTextBox.Text) Then
                ZipcodeValue = zipcodeTextBox.Text
            End If
        ElseIf (String.Compare(countryDropDownList.SelectedValue.ToString, "Canada") = 0) Then
            If canadaZipCodeRegex.IsMatch(zipcodeTextBox.Text) Then
                ZipcodeValue = zipcodeTextBox.Text
            End If
        End If
        Dim context = New SidejobModel.SidejobEntities()
        Dim ProfessionalOptional = New SidejobModel.ProfessionalOptional With { _
            .ProID = _nextProID,
            .Shopaddress = addressTextBox.Text,
            .CountryID = CType(countryDropDownList.SelectedValue, Integer),
            .CountryName = countryDropDownList.SelectedItem.Text.ToString,
            .RegionID = CType(regionsDropDownList.SelectedValue, Integer),
            .RegionName = regionsDropDownList.SelectedItem.Text.ToString,
            .CityID = CType(cityIdTextBox.ToString, Integer?),
            .CityName = cityName,
            .Zipcode = ZipcodeValue,
            .PhoneNumber = homeTelephoneTextBox.Text
        }
        context.AddToProfessionalOptionals(ProfessionalOptional)
        context.SaveChanges()
    End Sub

    Public Sub InsertProfessionalPicture(nextProID As Integer, nextAlbumID As Integer)
        Dim context = New SidejobModel.SidejobEntities()
        context.InsertProfessionalPicture(nextProID, nextAlbumID)
    End Sub

    Public Sub InsertProfessionalPhoto(nextPhotoID As Integer, photoPath As String, nextAlbumID As Integer, nextProID As Integer)
        Dim context = New SidejobModel.SidejobEntities()
        context.InsertProfessionalPhoto(nextPhotoID, photoPath, nextAlbumID, nextProID)
    End Sub

    Public Sub InsertProfessionalWorkPicture(nextProID As Integer, nextAlbumID As Integer)
        Dim context = New SidejobModel.SidejobEntities()
        context.InsertProfessionalWorkPicture(nextProID, nextAlbumID, Resources.Resource.FirstAlbum)
    End Sub

    Public Sub InsertProfessionalWorkPhoto(nextPhotoID As Integer, photoPath As String, nextAlbumID As Integer, nextProID As Integer)
        Dim context = New SidejobModel.SidejobEntities()
        context.InsertProfessionalWorkPhoto(nextPhotoID, photoPath, nextAlbumID, nextProID, Resources.Resource.NoCaption)
    End Sub

    Public Sub InsertProfessionalEvents()
        Dim nextEventID As Integer = GetNextEventID()
        Dim context = New SidejobModel.SidejobEntities()
        context.InsertEvent(nextEventID, DateTime.Now.[Date], Language)
        Dim ProfessionalEvent = New SidejobModel.ProfessionalEvent() With { _
         .ProID = _nextProID, _
         .EventID = GetNextEventID(), _
         .NumberofEvents = 1, _
         .Type = 2 _
        }
        context.AddToProfessionalEvents(ProfessionalEvent)
        context.SaveChanges()
    End Sub

    Public Sub InsertProfessionalMessage()
        Dim context = New SidejobEntities()
        context.InsertMessage(GetNextMessageID(), _nextProID, User.Identity.Name, DateTime.Now.[Date])
    End Sub

    Public Sub InsertProfessionalMessageInbox()
        Dim context = New SidejobModel.SidejobEntities()
        Dim ProfessionalMessageInbox = New SidejobModel.ProfessionalMessageInbox() With { _
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
        context.AddToProfessionalMessageInboxes(ProfessionalMessageInbox)
        context.SaveChanges()
    End Sub

    Public Sub InsertProfessionalPortfolio()
        Dim context = New SidejobModel.SidejobEntities()
        Dim Professionalportfolio = New SidejobModel.ProfessionalPortfolio() With { _
         .ProID = _nextProID, _
         .About = "", _
         .SpecialNotes = "", _
         .Modified = 0 _
        }
        context.AddToProfessionalPortfolios(Professionalportfolio)
        context.SaveChanges()
    End Sub

    Public Sub InsertProfessionalCommentReceivedSummary()
        Dim context = New SidejobModel.SidejobEntities()
        Dim Professionalcommentreceivedsummary = New SidejobModel.ProfessionalCommentReceivedSummary() With { _
         .ProID = _nextProID, _
         .NumberofPositive = 0, _
         .NumberofNegative = 0, _
         .NumberofNeutral = 0, _
         .Total = 0, _
         .Percentage = 100 _
        }
        context.AddToProfessionalCommentReceivedSummaries(Professionalcommentreceivedsummary)
        context.SaveChanges()
    End Sub

    Public Sub InsertProfessionalAdditionalInformation()
        Dim context = New SidejobModel.SidejobEntities()
        Dim Professionaladditionalinformation = New SidejobModel.ProfessionalAdditionalInformation() With { _
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
        context.AddToProfessionalAdditionalInformations(ProfessionalAdditionalInformation)
        context.SaveChanges()
    End Sub

    Public Sub InsertProfessionalRating()
        Dim context = New SidejobModel.SidejobEntities()
        Dim Professionalrating = New SidejobModel.ProfessionalRating() With { _
         .RateID = GetNextRatingID(), _
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
        context.AddToProfessionalRatings(Professionalrating)
        context.SaveChanges()
    End Sub
























































    Public Shared Function GetNextCustomer() As Integer
        Dim id As Integer
        Dim context = New SidejobModel.SidejobEntities()
        Dim max = context.Customers.OrderByDescending(Function(s) s.CustomerID).FirstOrDefault()

        If max Is Nothing Then
            id = 0
        Else
            id = max.CustomerID + 1
        End If
        Return id
    End Function

    Public Shared Function GetNextAlbumID() As Integer
        Dim id As Integer
        Dim context = New SidejobModel.SidejobEntities()
        Dim max = context.CustomerPictures.OrderByDescending(Function(s) s.AlbumID).FirstOrDefault()

        If max Is Nothing Then
            id = 0
        Else
            id = max.AlbumID + 1
        End If
        Return id
    End Function

    Public Shared Function GetNextPhotoID() As Integer
        Dim id As Integer
        Dim context = New SidejobModel.SidejobEntities()
        Dim max = context.CustomerPhotoes.OrderByDescending(Function(s) s.PhotoID).FirstOrDefault()

        If max Is Nothing Then
            id = 0
        Else
            id = max.PhotoID + 1
        End If
        Return id
    End Function

    Public Shared Function GetNextRatingID() As Integer
        Dim id As Integer
        Dim context = New SidejobModel.SidejobEntities()
        Dim max = context.CustomerRatings.OrderByDescending(Function(s) s.RateID).FirstOrDefault()

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
            Return "http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/Profile/male-user.png"
        Else
            Return "http://www.haithem-araissia.com/WIP2/RightCleanSideJOB2008FromInetpub/CleanSIDEJOB2008/Images/Profile/female-user.png"
        End If
    End Function

    Public Shared Function GetNextEventID() As Integer
        Dim id As Integer
        Dim context = New SidejobModel.SidejobEntities()
        Dim max = context.Events.OrderByDescending(Function(s) s.EventID).FirstOrDefault()

        If max Is Nothing Then
            id = 0
        Else
            id = max.EventID + 1
        End If
        Return id
    End Function

    Public Shared Function GetNextMessageID() As Integer
        Dim id As Integer
        Dim context = New SidejobModel.SidejobEntities()
        Dim max = context.Messages.OrderByDescending(Function(s) s.MessageID).FirstOrDefault()

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
        Dim context = New SidejobModel.SidejobEntities()
        Dim max = context.Professionals.OrderByDescending(Function(s) s.ProID).FirstOrDefault()

        If max Is Nothing Then
            id = 0
        Else
            id = max.ProID + 1
        End If
        Return id
    End Function

    Public Shared Function GetNextProfessionalAlbumID() As Integer
        Dim id As Integer
        Dim context = New SidejobModel.SidejobEntities()
        Dim max = context.ProfessionalPictures.OrderByDescending(Function(s) s.AlbumID).FirstOrDefault()

        If max Is Nothing Then
            id = 0
        Else
            id = max.AlbumID + 1
        End If
        Return id
    End Function

    Public Shared Function GetNextProfessionalPhotoID() As Integer
        Dim id As Integer
        Dim context = New SidejobModel.SidejobEntities()
        Dim max = context.ProfessionalPhotoes.OrderByDescending(Function(s) s.PhotoID).FirstOrDefault()

        If max Is Nothing Then
            id = 0
        Else
            id = max.PhotoID + 1
        End If
        Return id
    End Function

    Public Shared Function GetNextProfessionalRatingID() As Integer
        Dim id As Integer
        Dim context = New SidejobModel.SidejobEntities()
        Dim max = context.ProfessionalRatings.OrderByDescending(Function(s) s.RateID).FirstOrDefault()

        If max Is Nothing Then
            id = 0
        Else
            id = max.RateID + 1
        End If
        Return id
    End Function










































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
            Roles.AddUserToRole(SignUpCreateWizard.UserName, "Customer")
            SignUpCreateWizard.ContinueDestinationPageUrl = "~/Authenticated/Customer/CustomerProfileEntity.aspx"
            CreateDirectory()
        Else
            CreateProfessional()
            Roles.AddUserToRole(SignUpCreateWizard.UserName, "Professional")
            SignUpCreateWizard.ContinueDestinationPageUrl = "~/Authenticated/Customer/ProfessionalProfileEntity.aspx"
            CreateDirectoryProfessional()
        End If
    End Sub

    'Protected Sub CreateCustomer2()
    '    Dim FirstNameTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("FirstNameTextBox"), TextBox)
    '    Dim LastNameTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("LastNameTextBox"), TextBox)
    '    Dim AddressTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AddressTextBox"), TextBox)
    '    Dim HomeTelephoneTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("HomeTelephoneTextBox"), TextBox)
    '    Dim MobilePhoneTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("MobilePhoneTextBox"), TextBox)
    '    Dim GenderDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("GenderDropDownList"), DropDownList)
    '    Dim AgeTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AgeTextBox"), TextBox)
    '    Dim ZipcodeTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("ZipcodeTextBox"), TextBox)
    '    Dim CountryDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CountryDropDownList"), DropDownList)
    '    Dim RegionsDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("RegionsDropDownList"), DropDownList)
    '    Dim CityDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CitiesDropDownList"), DropDownList)
    '    Dim CityIdTextBox As String
    '    If CityDropDownList.Items.Count = 0 Then
    '        CityIdTextBox = -1
    '    Else
    '        CityIdTextBox = CityDropDownList.SelectedValue.ToString
    '    End If
    '    Dim ZipcodeValue As String
    '    Dim USAZipCodeRegex As Regex = New Regex("\d{5}(-\d{4})?")
    '    Dim CanadaZipCodeRegex As Regex = New Regex("[A-Z]\d[A-Z] \d[A-Z]\d")
    '    If (String.Compare(CountryDropDownList.SelectedValue.ToString, "USA") = 0) Then
    '        If USAZipCodeRegex.IsMatch(ZipcodeTextBox.Text) Then
    '            ZipcodeValue = ZipcodeTextBox.Text
    '        Else
    '            ZipcodeValue = "0"
    '        End If
    '    ElseIf (String.Compare(CountryDropDownList.SelectedValue.ToString, "Canada") = 0) Then
    '        If CanadaZipCodeRegex.IsMatch(ZipcodeTextBox.Text) Then
    '            ZipcodeValue = ZipcodeTextBox.Text
    '        Else
    '            ZipcodeValue = "0"
    '        End If
    '    End If
    '    Dim user As MembershipUser = Membership.GetUser(SignUpCreateWizard.UserName)
    '    If user Is Nothing Then
    '        Throw New ApplicationException("Can't find the user.")
    '        Response.Redirect("index.aspx")
    '    End If
    '    Roles.AddUserToRole(SignUpCreateWizard.UserName, "Customer")

    '    Dim ProfileConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("SideJobConnectionString").ConnectionString)
    '    ProfileConnection.Open()
    '    Dim ProfileTransaction As SqlTransaction = ProfileConnection.BeginTransaction()

    '    Try
    '        Dim ProfileCommand As New SqlCommand("CreateCustomer", ProfileConnection, ProfileTransaction)
    '        ProfileCommand.CommandType = CommandType.StoredProcedure

    '        Dim CustomerResult As New SqlParameter("@ErrorCode", SqlDbType.Int)
    '        CustomerResult.Direction = ParameterDirection.Output
    '        CustomerResult.Value = 0
    '        ProfileCommand.Parameters.Add(CustomerResult)

    '        Dim LCID As New SqlParameter("@LCID ", SqlDbType.Int)
    '        LCID.Value = _language
    '        ProfileCommand.Parameters.Add(LCID)

    '        Dim USERNAME1 As New SqlParameter("@USERNAME", SqlDbType.NVarChar, 255)
    '        USERNAME1.Value = SignUpCreateWizard.UserName.ToString
    '        ProfileCommand.Parameters.Add(USERNAME1)

    '        Dim FirstName As New SqlParameter("@FirstName", SqlDbType.NVarChar, 10)
    '        FirstName.Value = FirstNameTextBox.Text
    '        ProfileCommand.Parameters.Add(FirstName)

    '        Dim LastName As New SqlParameter("@LastName", SqlDbType.NVarChar, 20)
    '        LastName.Value = LastNameTextBox.Text
    '        ProfileCommand.Parameters.Add(LastName)

    '        Dim Address As New SqlParameter("@Address", SqlDbType.NVarChar, 60)
    '        Address.Value = AddressTextBox.Text
    '        ProfileCommand.Parameters.Add(Address)

    '        Dim CountryID As New SqlParameter("@CountryID", SqlDbType.Int)
    '        CountryID.Value = CountryDropDownList.SelectedValue.ToString()
    '        ProfileCommand.Parameters.Add(CountryID)

    '        Dim CountryValue As New SqlParameter("@CountryName", SqlDbType.VarChar, 128)
    '        CountryValue.Value = CountryDropDownList.SelectedItem.Text.ToString
    '        ProfileCommand.Parameters.Add(CountryValue)

    '        Dim RegionID As New SqlParameter("@RegionID", SqlDbType.Int)
    '        RegionID.Value = RegionsDropDownList.SelectedValue.ToString()
    '        ProfileCommand.Parameters.Add(RegionID)

    '        Dim RegionName As New SqlParameter("@RegionName", SqlDbType.VarChar, 128)
    '        RegionName.Value = RegionsDropDownList.SelectedItem.Text.ToString
    '        ProfileCommand.Parameters.Add(RegionName)

    '        Dim CityID As New SqlParameter("@CityID", SqlDbType.Int)
    '        CityID.Value = CityIdTextBox.ToString
    '        ProfileCommand.Parameters.Add(CityID)

    '        Dim HomePhoneNumber As New SqlParameter("@HomePhoneNumber", SqlDbType.NVarChar, 24)
    '        HomePhoneNumber.Value = HomeTelephoneTextBox.Text
    '        ProfileCommand.Parameters.Add(HomePhoneNumber)

    '        Dim Zipcode As New SqlParameter("@Zipcode", SqlDbType.NVarChar, 20)
    '        Zipcode.Value = ZipcodeTextBox.Text
    '        ProfileCommand.Parameters.Add(Zipcode)

    '        Dim MobilePhoneNumber As New SqlParameter("@MobilePhoneNumber", SqlDbType.NVarChar, 24)
    '        MobilePhoneNumber.Value = MobilePhoneTextBox.Text
    '        ProfileCommand.Parameters.Add(MobilePhoneNumber)

    '        Dim Age As New SqlParameter("@Age", SqlDbType.Int)
    '        Age.Value = AgeTextBox.Text
    '        ProfileCommand.Parameters.Add(Age)

    '        Dim EmailAddress As New SqlParameter("@EmailAddress", SqlDbType.NVarChar, 256)
    '        EmailAddress.Value = Me.SignUpCreateWizard.Email.ToString
    '        ProfileCommand.Parameters.Add(EmailAddress)

    '        Dim Gender As New SqlParameter("@Gender", SqlDbType.Int)
    '        Gender.Value = GenderDropDownList.SelectedValue
    '        ProfileCommand.Parameters.Add(Gender)

    '        Dim DateEvent As New SqlParameter("@DateEvent", SqlDbType.SmallDateTime)
    '        DateEvent.Value = DateTime.Now.ToShortDateString.ToString
    '        ProfileCommand.Parameters.Add(DateEvent)

    '        Dim DateMessage As New SqlParameter("@DateMessage", SqlDbType.SmallDateTime)
    '        DateMessage.Value = DateTime.Now.ToShortDateString.ToString
    '        ProfileCommand.Parameters.Add(DateMessage)

    '        Dim reader As SqlDataReader = ProfileCommand.ExecuteReader()
    '        Dim Result As Integer = Convert.ToInt32(CustomerResult.Value)
    '        If Result = 99 Then
    '            Server.Transfer("../NotAuthonitizated/LockedUser.aspx")
    '        End If
    '        reader.Close()
    '        ProfileTransaction.Commit()
    '        SignUpCreateWizard.ContinueDestinationPageUrl = "~/Authenticated/Customer/CustomerProfile.aspx"
    '        CreateDirectory()

    '    Catch ex As Exception
    '        Throw
    '        Response.Redirect("index.aspx")
    '    Finally
    '        ProfileConnection.Close()
    '    End Try

    'End Sub

    Protected Sub CustomerLinkButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CustomerLinkButton.Click
        RoleLabel.Text = Resources.Resource.Customer.ToString
        RoleLabel.ForeColor = System.Drawing.ColorTranslator.FromHtml("#800000")
        customercolumn.BgColor = "#800000"
        professionalcolumn.BgColor = "white"
    End Sub

    'Protected Sub CreateProfessional2()

    '    Dim FirstNameTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("FirstNameTextBox"), TextBox)
    '    Dim LastNameTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("LastNameTextBox"), TextBox)
    '    Dim AddressTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AddressTextBox"), TextBox)
    '    Dim HomeTelephoneTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("HomeTelephoneTextBox"), TextBox)
    '    Dim MobilePhoneTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("MobilePhoneTextBox"), TextBox)
    '    Dim GenderDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("GenderDropDownList"), DropDownList)
    '    Dim AgeTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("AgeTextBox"), TextBox)
    '    Dim ZipcodeTextBox As TextBox = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("ZipcodeTextBox"), TextBox)
    '    Dim CountryDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CountryDropDownList"), DropDownList)
    '    Dim RegionsDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("RegionsDropDownList"), DropDownList)
    '    Dim CityDropDownList As DropDownList = CType(SignUpCreateWizard.CreateUserStep.ContentTemplateContainer.FindControl("CitiesDropDownList"), DropDownList)
    '    Dim CityIdTextBox As String
    '    If CityDropDownList.Items.Count = 0 Then
    '        CityIdTextBox = -1
    '    Else
    '        CityIdTextBox = CityDropDownList.SelectedValue.ToString
    '    End If
    '    Dim ZipcodeValue As String
    '    Dim USAZipCodeRegex As Regex = New Regex("\d{5}(-\d{4})?")
    '    Dim CanadaZipCodeRegex As Regex = New Regex("[A-Z]\d[A-Z] \d[A-Z]\d")
    '    If (String.Compare(CountryDropDownList.SelectedValue.ToString, "USA") = 0) Then
    '        If USAZipCodeRegex.IsMatch(ZipcodeTextBox.Text) Then
    '            ZipcodeValue = ZipcodeTextBox.Text
    '        Else
    '            ZipcodeValue = "0"
    '        End If
    '    ElseIf (String.Compare(CountryDropDownList.SelectedValue.ToString, "Canada") = 0) Then
    '        If CanadaZipCodeRegex.IsMatch(ZipcodeTextBox.Text) Then
    '            ZipcodeValue = ZipcodeTextBox.Text
    '        Else
    '            ZipcodeValue = "0"
    '        End If
    '    End If
    '    Dim user As MembershipUser = Membership.GetUser(SignUpCreateWizard.UserName)
    '    If user Is Nothing Then
    '        Throw New ApplicationException("Can't find the user.")
    '        Response.Redirect("index.aspx")
    '    End If
    '    Roles.AddUserToRole(SignUpCreateWizard.UserName, "Professional")
    '    Dim ProfileConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("SideJobConnectionString").ConnectionString)
    '    ProfileConnection.Open()
    '    Dim ProfileTransaction As SqlTransaction = ProfileConnection.BeginTransaction()

    '    Try
    '        Dim ProfileCommand As New SqlCommand("CreateProfessional", ProfileConnection, ProfileTransaction)
    '        ProfileCommand.CommandType = CommandType.StoredProcedure
    '        Dim ProfessionalResult As New SqlParameter("@ErrorCode", SqlDbType.Int)
    '        ProfessionalResult.Direction = ParameterDirection.Output
    '        ProfessionalResult.Value = 0
    '        ProfileCommand.Parameters.Add(ProfessionalResult)

    '        Dim LCID As New SqlParameter("@LCID ", SqlDbType.Int)
    '        LCID.Value = _language
    '        ProfileCommand.Parameters.Add(LCID)

    '        Dim USERNAME1 As New SqlParameter("@USERNAME", SqlDbType.NVarChar, 255)
    '        USERNAME1.Value = SignUpCreateWizard.UserName.ToString
    '        ProfileCommand.Parameters.Add(USERNAME1) '    

    '        Dim FirstName As New SqlParameter("@FirstName", SqlDbType.NVarChar, 10)
    '        FirstName.Value = FirstNameTextBox.Text
    '        ProfileCommand.Parameters.Add(FirstName)

    '        Dim LastName As New SqlParameter("@LastName", SqlDbType.NVarChar, 20)
    '        LastName.Value = LastNameTextBox.Text
    '        ProfileCommand.Parameters.Add(LastName)

    '        Dim Address As New SqlParameter("@Address", SqlDbType.NVarChar, 60)
    '        Address.Value = AddressTextBox.Text
    '        ProfileCommand.Parameters.Add(Address)

    '        Dim CountryID As New SqlParameter("@CountryID", SqlDbType.Int)
    '        CountryID.Value = CountryDropDownList.SelectedValue.ToString()
    '        ProfileCommand.Parameters.Add(CountryID)

    '        Dim CountryValue As New SqlParameter("@CountryName", SqlDbType.VarChar, 128)
    '        CountryValue.Value = CountryDropDownList.SelectedItem.Text.ToString
    '        ProfileCommand.Parameters.Add(CountryValue)

    '        Dim RegionID As New SqlParameter("@RegionID", SqlDbType.Int)
    '        RegionID.Value = RegionsDropDownList.SelectedValue.ToString()
    '        ProfileCommand.Parameters.Add(RegionID)

    '        Dim RegionName As New SqlParameter("@RegionName", SqlDbType.VarChar, 128)
    '        RegionName.Value = RegionsDropDownList.SelectedItem.Text.ToString
    '        ProfileCommand.Parameters.Add(RegionName)

    '        Dim CityID As New SqlParameter("@CityID", SqlDbType.Int)
    '        CityID.Value = CityIdTextBox.ToString
    '        ProfileCommand.Parameters.Add(CityID)

    '        Dim HomePhoneNumber As New SqlParameter("@HomePhoneNumber", SqlDbType.NVarChar, 24)
    '        HomePhoneNumber.Value = HomeTelephoneTextBox.Text
    '        ProfileCommand.Parameters.Add(HomePhoneNumber)

    '        Dim Zipcode As New SqlParameter("@Zipcode", SqlDbType.NVarChar, 20)
    '        Zipcode.Value = ZipcodeTextBox.Text
    '        ProfileCommand.Parameters.Add(Zipcode)

    '        Dim MobilePhoneNumber As New SqlParameter("@MobilePhoneNumber", SqlDbType.NVarChar, 24)
    '        MobilePhoneNumber.Value = MobilePhoneTextBox.Text
    '        ProfileCommand.Parameters.Add(MobilePhoneNumber)

    '        Dim Age As New SqlParameter("@Age", SqlDbType.Int)
    '        Age.Value = AgeTextBox.Text
    '        ProfileCommand.Parameters.Add(Age)

    '        Dim EmailAddress As New SqlParameter("@EmailAddress", SqlDbType.NVarChar, 256)
    '        EmailAddress.Value = Me.SignUpCreateWizard.Email.ToString
    '        ProfileCommand.Parameters.Add(EmailAddress)

    '        Dim Gender As New SqlParameter("@Gender", SqlDbType.Int)
    '        Gender.Value = GenderDropDownList.SelectedValue
    '        ProfileCommand.Parameters.Add(Gender)

    '        Dim DateEvent As New SqlParameter("@DateEvent", SqlDbType.SmallDateTime)
    '        DateEvent.Value = DateTime.Now.ToShortDateString.ToString
    '        ProfileCommand.Parameters.Add(DateEvent)

    '        Dim DateMessage As New SqlParameter("@DateMessage", SqlDbType.SmallDateTime)
    '        DateMessage.Value = DateTime.Now.ToShortDateString.ToString
    '        ProfileCommand.Parameters.Add(DateMessage)

    '        ''THE FIRST SKILL
    '        Dim Job1ID As New SqlParameter("@Job1ID", SqlDbType.Int)
    '        Job1ID.Value = 0

    '        Dim Category1ID As New SqlParameter("@Category1ID", SqlDbType.Int)
    '        Category1ID.Value = 0

    '        Dim Experience1 As New SqlParameter("@Experience1ID", SqlDbType.Int)
    '        Experience1.Value = 0

    '        Dim Crew1 As New SqlParameter("@Crew1ID", SqlDbType.Int)
    '        Crew1.Value = 0

    '        Dim Licensed1 As New SqlParameter("@Licensed1ID", SqlDbType.Int)
    '        Licensed1.Value = 0

    '        Dim Insured1 As New SqlParameter("@Insured1ID", SqlDbType.Int)
    '        Insured1.Value = 0

    '        Dim Relocation1 As New SqlParameter("@Relocation1ID", SqlDbType.Int)
    '        Relocation1.Value = 0

    '        ''THE SECOND SKILL
    '        Dim Job2ID As New SqlParameter("@Job2ID", SqlDbType.Int)
    '        Job2ID.Value = 0

    '        Dim Category2ID As New SqlParameter("@Category2ID", SqlDbType.Int)
    '        Category2ID.Value = 0

    '        Dim Experience2 As New SqlParameter("@Experience2ID", SqlDbType.Int)
    '        Experience2.Value = 0

    '        Dim Crew2 As New SqlParameter("@Crew2ID", SqlDbType.Int)
    '        Crew2.Value = 0

    '        Dim Licensed2 As New SqlParameter("@Licensed2ID", SqlDbType.Int)
    '        Licensed2.Value = 0

    '        Dim Insured2 As New SqlParameter("@Insured2ID", SqlDbType.Int)
    '        Insured2.Value = 0

    '        Dim Relocation2 As New SqlParameter("@Relocation2ID", SqlDbType.Int)
    '        Relocation2.Value = 0

    '        ''THE THIRDS SKILL
    '        Dim Job3ID As New SqlParameter("@Job3ID", SqlDbType.Int)
    '        Job3ID.Value = 0

    '        Dim Category3ID As New SqlParameter("@Category3ID", SqlDbType.Int)
    '        Category3ID.Value = 0

    '        Dim Experience3 As New SqlParameter("@Experience3ID", SqlDbType.Int)
    '        Experience3.Value = 0

    '        Dim Crew3 As New SqlParameter("@Crew3ID", SqlDbType.Int)
    '        Crew3.Value = 0

    '        Dim Licensed3 As New SqlParameter("@Licensed3ID", SqlDbType.Int)
    '        Licensed3.Value = 0

    '        Dim Insured3 As New SqlParameter("@Insured3ID", SqlDbType.Int)
    '        Insured3.Value = 0

    '        Dim Relocation3 As New SqlParameter("@Relocation3ID", SqlDbType.Int)
    '        Relocation3.Value = 0

    '        ''THE FOURTH SKILL
    '        Dim Job4ID As New SqlParameter("@Job4ID", SqlDbType.Int)
    '        Job4ID.Value = 0

    '        Dim Category4ID As New SqlParameter("@Category4ID", SqlDbType.Int)
    '        Category4ID.Value = 0

    '        Dim Experience4 As New SqlParameter("@Experience4ID", SqlDbType.Int)
    '        Experience4.Value = 0

    '        Dim Crew4 As New SqlParameter("@Crew4ID", SqlDbType.Int)
    '        Crew4.Value = 0

    '        Dim Licensed4 As New SqlParameter("@Licensed4ID", SqlDbType.Int)
    '        Licensed4.Value = 0

    '        Dim Insured4 As New SqlParameter("@Insured4ID", SqlDbType.Int)
    '        Insured4.Value = 0

    '        Dim Relocation4 As New SqlParameter("@Relocation4ID", SqlDbType.Int)
    '        Relocation4.Value = 0

    '        Dim NumberofSkills As New SqlParameter("@NumberofSkills", SqlDbType.Int)
    '        If numberofSkills != Nothing Then
    '            NumberofSkills.Value = 0
    '        Else
    '            NumberofSkills.Value = numberofSkills
    '            Select Case NumberofSkills.Value
    '                Case 1
    '                    Dim skillsvariables() As String = Nothing
    '                    skillsvariables = Session("Skill1Value").ToString.Split(",")
    '                    Category1ID.Value = skillsvariables(0).ToString
    '                    Job1ID.Value = skillsvariables(1).ToString
    '                    Experience1.Value = skillsvariables(2).ToString
    '                    Crew1.Value = skillsvariables(3).ToString
    '                    Licensed1.Value = skillsvariables(4).ToString
    '                    Insured1.Value = skillsvariables(5).ToString
    '                    Relocation1.Value = skillsvariables(6).ToString

    '                Case 2
    '                    Dim skillsvariables() As String = Nothing
    '                    skillsvariables = Session("Skill1Value").ToString.Split(",")
    '                    Category1ID.Value = skillsvariables(0).ToString
    '                    Job1ID.Value = skillsvariables(1).ToString
    '                    Experience1.Value = skillsvariables(2).ToString
    '                    Crew1.Value = skillsvariables(3).ToString
    '                    Licensed1.Value = skillsvariables(4).ToString
    '                    Insured1.Value = skillsvariables(5).ToString
    '                    Relocation1.Value = skillsvariables(6).ToString
    '                    skillsvariables = Nothing
    '                    skillsvariables = Session("Skill2Value").ToString.Split(",")
    '                    Category2ID.Value = skillsvariables(0).ToString
    '                    Job2ID.Value = skillsvariables(1).ToString
    '                    Experience2.Value = skillsvariables(2).ToString
    '                    Crew2.Value = skillsvariables(3).ToString
    '                    Licensed2.Value = skillsvariables(4).ToString
    '                    Insured2.Value = skillsvariables(5).ToString
    '                    Relocation2.Value = skillsvariables(6).ToString

    '                Case 3
    '                    Dim skillsvariables() As String = Nothing
    '                    skillsvariables = Session("Skill1Value").ToString.Split(",")
    '                    Category1ID.Value = skillsvariables(0).ToString
    '                    Job1ID.Value = skillsvariables(1).ToString
    '                    Experience1.Value = skillsvariables(2).ToString
    '                    Crew1.Value = skillsvariables(3).ToString
    '                    Licensed1.Value = skillsvariables(4).ToString
    '                    Insured1.Value = skillsvariables(5).ToString
    '                    Relocation1.Value = skillsvariables(6).ToString
    '                    skillsvariables = Nothing
    '                    skillsvariables = Session("Skill2Value").ToString.Split(",")
    '                    Category2ID.Value = skillsvariables(0).ToString
    '                    Job2ID.Value = skillsvariables(1).ToString
    '                    Experience2.Value = skillsvariables(2).ToString
    '                    Crew2.Value = skillsvariables(3).ToString
    '                    Licensed2.Value = skillsvariables(4).ToString
    '                    Insured2.Value = skillsvariables(5).ToString
    '                    Relocation2.Value = skillsvariables(6).ToString
    '                    skillsvariables = Nothing
    '                    skillsvariables = Session("Skill3Value").ToString.Split(",")
    '                    Category3ID.Value = skillsvariables(0).ToString
    '                    Job3ID.Value = skillsvariables(1).ToString
    '                    Experience3.Value = skillsvariables(2).ToString
    '                    Crew3.Value = skillsvariables(3).ToString
    '                    Licensed3.Value = skillsvariables(4).ToString
    '                    Insured3.Value = skillsvariables(5).ToString
    '                    Relocation3.Value = skillsvariables(6).ToString

    '                Case 4
    '                    Dim skillsvariables() As String = Nothing
    '                    skillsvariables = Session("Skill1Value").ToString.Split(",")
    '                    Category1ID.Value = skillsvariables(0).ToString
    '                    Job1ID.Value = skillsvariables(1).ToString
    '                    Experience1.Value = skillsvariables(2).ToString
    '                    Crew1.Value = skillsvariables(3).ToString
    '                    Licensed1.Value = skillsvariables(4).ToString
    '                    Insured1.Value = skillsvariables(5).ToString
    '                    Relocation1.Value = skillsvariables(6).ToString
    '                    skillsvariables = Nothing
    '                    skillsvariables = Session("Skill2Value").ToString.Split(",")
    '                    Category2ID.Value = skillsvariables(0).ToString
    '                    Job2ID.Value = skillsvariables(1).ToString
    '                    Experience2.Value = skillsvariables(2).ToString
    '                    Crew2.Value = skillsvariables(3).ToString
    '                    Licensed2.Value = skillsvariables(4).ToString
    '                    Insured2.Value = skillsvariables(5).ToString
    '                    Relocation2.Value = skillsvariables(6).ToString
    '                    skillsvariables = Nothing
    '                    skillsvariables = Session("Skill3Value").ToString.Split(",")
    '                    Category3ID.Value = skillsvariables(0).ToString
    '                    Job3ID.Value = skillsvariables(1).ToString
    '                    Experience3.Value = skillsvariables(2).ToString
    '                    Crew3.Value = skillsvariables(3).ToString
    '                    Licensed3.Value = skillsvariables(4).ToString
    '                    Insured3.Value = skillsvariables(5).ToString
    '                    Relocation3.Value = skillsvariables(6).ToString
    '                    skillsvariables = Nothing
    '                    skillsvariables = Session("Skill4Value").ToString.Split(",")
    '                    Category4ID.Value = skillsvariables(0).ToString
    '                    Job4ID.Value = skillsvariables(1).ToString
    '                    Experience4.Value = skillsvariables(2).ToString
    '                    Crew4.Value = skillsvariables(3).ToString
    '                    Licensed4.Value = skillsvariables(4).ToString
    '                    Insured4.Value = skillsvariables(5).ToString
    '                    Relocation4.Value = skillsvariables(6).ToString
    '            End Select
    '        End If

    '        ClearSession()
    '        ProfileCommand.Parameters.Add(NumberofSkills)

    '        '''''''''''''''Adding the Skills''''''''''''
    '        ProfileCommand.Parameters.Add(Category1ID)
    '        ProfileCommand.Parameters.Add(Job1ID)
    '        ProfileCommand.Parameters.Add(Experience1)
    '        ProfileCommand.Parameters.Add(Crew1)
    '        ProfileCommand.Parameters.Add(Licensed1)
    '        ProfileCommand.Parameters.Add(Insured1)
    '        ProfileCommand.Parameters.Add(Relocation1)

    '        ProfileCommand.Parameters.Add(Category2ID)
    '        ProfileCommand.Parameters.Add(Job2ID)
    '        ProfileCommand.Parameters.Add(Experience2)
    '        ProfileCommand.Parameters.Add(Crew2)
    '        ProfileCommand.Parameters.Add(Licensed2)
    '        ProfileCommand.Parameters.Add(Insured2)
    '        ProfileCommand.Parameters.Add(Relocation2)

    '        ProfileCommand.Parameters.Add(Category3ID)
    '        ProfileCommand.Parameters.Add(Job3ID)
    '        ProfileCommand.Parameters.Add(Experience3)
    '        ProfileCommand.Parameters.Add(Crew3)
    '        ProfileCommand.Parameters.Add(Licensed3)
    '        ProfileCommand.Parameters.Add(Insured3)
    '        ProfileCommand.Parameters.Add(Relocation3)

    '        ProfileCommand.Parameters.Add(Category4ID)
    '        ProfileCommand.Parameters.Add(Job4ID)
    '        ProfileCommand.Parameters.Add(Experience4)
    '        ProfileCommand.Parameters.Add(Crew4)
    '        ProfileCommand.Parameters.Add(Licensed4)
    '        ProfileCommand.Parameters.Add(Insured4)
    '        ProfileCommand.Parameters.Add(Relocation4)

    '        Dim reader As SqlDataReader = ProfileCommand.ExecuteReader()
    '        Dim Result As Integer = Convert.ToInt32(ProfessionalResult.Value)
    '        If Result = 99 Then
    '            Server.Transfer("../NotAuthonitizated/LockedUser.aspx")
    '        End If
    '        reader.Close()
    '        ProfileTransaction.Commit()
    '        SignUpCreateWizard.ContinueDestinationPageUrl = "~/Authenticated/Professional/ProfessionalProfile.aspx"
    '        CreateDirectoryProfessional()
    '    Catch ex As Exception
    '        Throw
    '        Response.Redirect("index.aspx")
    '    Finally
    '        ProfileConnection.Close()
    '    End Try

    'End Sub

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
                        Skill1Category = CType(SpecialtyListBox1.Items(k).Value, Integer)
                    Case 2
                        Skill1Category = CType(SpecialtyListBox2.Items(k).Value, Integer)
                    Case 3
                        Skill1Category = CType(SpecialtyListBox3.Items(k).Value, Integer)
                End Select
                Skill1Experience = CType(ExperienceDropDownList.SelectedValue, Integer)
                Skill1Crew = CType(CrewNumberDropDownList.SelectedValue, Integer)
                Skill1Licensed = CType(LicensedDropDownList.SelectedValue, Integer)
                Skill1Insured = CType(InsuredDropDownList.SelectedValue, Integer)
                Skill1Relocation = CType(RelocationDropDownList.SelectedValue, Integer)

            Case 2
                Select Case j
                    Case 1
                        skill2Category = CType(SpecialtyListBox1.Items(k).Value, Integer)
                    Case 2
                        skill2Category = CType(SpecialtyListBox2.Items(k).Value, Integer)
                    Case 3
                        skill2Category = CType(SpecialtyListBox3.Items(k).Value, Integer)
                End Select
                skill2Experience = CType(ExperienceDropDownList.SelectedValue, Integer)
                skill2Crew = CType(CrewNumberDropDownList.SelectedValue, Integer)
                skill2Licensed = CType(LicensedDropDownList.SelectedValue, Integer)
                skill2Insured = CType(InsuredDropDownList.SelectedValue, Integer)
                skill2Relocation = CType(RelocationDropDownList.SelectedValue, Integer)

            Case 3
                Select Case j
                    Case 1
                        skill3Category = CType(SpecialtyListBox1.Items(k).Value, Integer)
                    Case 2
                        skill3Category = CType(SpecialtyListBox2.Items(k).Value, Integer)
                    Case 3
                        skill3Category = CType(SpecialtyListBox3.Items(k).Value, Integer)
                End Select
                skill3Experience = CType(ExperienceDropDownList.SelectedValue, Integer)
                skill3Crew = CType(CrewNumberDropDownList.SelectedValue, Integer)
                skill3Licensed = CType(LicensedDropDownList.SelectedValue, Integer)
                skill3Insured = CType(InsuredDropDownList.SelectedValue, Integer)
                skill3Relocation = CType(RelocationDropDownList.SelectedValue, Integer)

            Case 4
                Select Case j
                    Case 1
                        skill4Category = CType(SpecialtyListBox1.Items(k).Value, Integer)
                    Case 2
                        skill4Category = CType(SpecialtyListBox2.Items(k).Value, Integer)
                    Case 3
                        skill4Category = CType(SpecialtyListBox3.Items(k).Value, Integer)
                End Select
                skill4Experience = CType(ExperienceDropDownList.SelectedValue, Integer)
                skill4Crew = CType(CrewNumberDropDownList.SelectedValue, Integer)
                skill4Licensed = CType(LicensedDropDownList.SelectedValue, Integer)
                skill4Insured = CType(InsuredDropDownList.SelectedValue, Integer)
                skill4Relocation = CType(RelocationDropDownList.SelectedValue, Integer)

        End Select
        numberofSkills += 1
    End Sub

    Protected Sub ClearSession()
        numberofSkills = 0
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










    Public Sub Processkills()
        Select Case numberofSkills
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
        Using context = New SidejobEntities()
            Dim nextSkillID As Integer = Utility.GetNextSkillId()
            context.InsertProfessionalSkill(nextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
            Dim newSkill1 As New SidejobModel.Skill
            newSkill1.SkillID = nextSkillID
            newSkill1.CategoryID = Skill1Category
            newSkill1.JobID = Skill1JobId
            newSkill1.CategoryName = Utility.GetCategoryName(Skill1Category, LCID)
            newSkill1.JobTitle = Utility.GetJobTitle(Skill1JobId, LCID)
            newSkill1.Experience = Skill1Experience
            newSkill1.Crew = Skill1Crew
            newSkill1.Licensed = Skill1Licensed
            newSkill1.Insured = Skill1Insured
            newSkill1.Insured = Skill1Insured
            context.AddToSkills(newSkill1)
            context.SaveChanges()
        End Using
    End Sub

    Public Sub AddTwoNewSkill()
        Using context = New SidejobEntities()
            Dim firstnextSkillID As Integer = Utility.GetNextSkillId()
            context.InsertProfessionalSkill(firstnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
            Dim newSkill1 As New SidejobModel.Skill
            newSkill1.SkillID = firstnextSkillID
            newSkill1.CategoryID = Skill1Category
            newSkill1.JobID = Skill1JobId
            newSkill1.CategoryName = Utility.GetCategoryName(Skill1Category, LCID)
            newSkill1.JobTitle = Utility.GetJobTitle(Skill1JobId, LCID)
            newSkill1.Experience = Skill1Experience
            newSkill1.Crew = Skill1Crew
            newSkill1.Licensed = Skill1Licensed
            newSkill1.Insured = Skill1Insured
            newSkill1.Insured = Skill1Insured

            Dim secondnextSkillID As Integer = Utility.GetNextSkillId()
            context.InsertProfessionalSkill(secondnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
            Dim newSkill2 As New SidejobModel.Skill
            newSkill2.SkillID = secondnextSkillID
            newSkill2.CategoryID = skill2Category
            newSkill2.JobID = skill2JobId
            newSkill2.CategoryName = Utility.GetCategoryName(skill2Category, LCID)
            newSkill2.JobTitle = Utility.GetJobTitle(skill2JobId, LCID)
            newSkill2.Experience = skill2Experience
            newSkill2.Crew = skill2Crew
            newSkill2.Licensed = skill2Licensed
            newSkill2.Insured = skill2Insured
            newSkill2.Insured = skill2Insured

            context.AddToSkills(newSkill1)
            context.AddToSkills(newSkill2)
            context.SaveChanges()
        End Using
    End Sub

    Public Sub AddThreeNewSkill()
        Using context = New SidejobEntities()
            Dim firstnextSkillID As Integer = Utility.GetNextSkillId()
            context.InsertProfessionalSkill(firstnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
            Dim newSkill1 As New SidejobModel.Skill
            newSkill1.SkillID = firstnextSkillID
            newSkill1.CategoryID = Skill1Category
            newSkill1.JobID = Skill1JobId
            newSkill1.CategoryName = Utility.GetCategoryName(Skill1Category, LCID)
            newSkill1.JobTitle = Utility.GetJobTitle(Skill1JobId, LCID)
            newSkill1.Experience = Skill1Experience
            newSkill1.Crew = Skill1Crew
            newSkill1.Licensed = Skill1Licensed
            newSkill1.Insured = Skill1Insured
            newSkill1.Insured = Skill1Insured

            Dim secondnextSkillID As Integer = Utility.GetNextSkillId()
            context.InsertProfessionalSkill(secondnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
            Dim newSkill2 As New SidejobModel.Skill
            newSkill2.SkillID = secondnextSkillID
            newSkill2.CategoryID = skill2Category
            newSkill2.JobID = skill2JobId
            newSkill2.CategoryName = Utility.GetCategoryName(skill2Category, LCID)
            newSkill2.JobTitle = Utility.GetJobTitle(skill2JobId, LCID)
            newSkill2.Experience = skill2Experience
            newSkill2.Crew = skill2Crew
            newSkill2.Licensed = skill2Licensed
            newSkill2.Insured = skill2Insured
            newSkill2.Insured = skill2Insured

            Dim thirdnextSkillID As Integer = Utility.GetNextSkillId()
            context.InsertProfessionalSkill(thirdnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
            Dim newSkill3 As New SidejobModel.Skill
            newSkill3.SkillID = secondnextSkillID
            newSkill3.CategoryID = skill3Category
            newSkill3.JobID = skill3JobId
            newSkill3.CategoryName = Utility.GetCategoryName(skill3Category, LCID)
            newSkill3.JobTitle = Utility.GetJobTitle(skill3JobId, LCID)
            newSkill3.Experience = skill3Experience
            newSkill3.Crew = skill3Crew
            newSkill3.Licensed = skill3Licensed
            newSkill3.Insured = skill3Insured
            newSkill3.Insured = skill3Insured

            context.AddToSkills(newSkill1)
            context.AddToSkills(newSkill2)
            context.AddToSkills(newSkill3)
            context.SaveChanges()
        End Using
    End Sub

    Public Sub AddFourNewSkill()
        Using context = New SidejobEntities()
            Dim firstnextSkillID As Integer = Utility.GetNextSkillId()
            context.InsertProfessionalSkill(firstnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
            Dim newSkill1 As New SidejobModel.Skill
            newSkill1.SkillID = firstnextSkillID
            newSkill1.CategoryID = Skill1Category
            newSkill1.JobID = Skill1JobId
            newSkill1.CategoryName = Utility.GetCategoryName(Skill1Category, LCID)
            newSkill1.JobTitle = Utility.GetJobTitle(Skill1JobId, LCID)
            newSkill1.Experience = Skill1Experience
            newSkill1.Crew = Skill1Crew
            newSkill1.Licensed = Skill1Licensed
            newSkill1.Insured = Skill1Insured
            newSkill1.Insured = Skill1Insured

            Dim secondnextSkillID As Integer = Utility.GetNextSkillId()
            context.InsertProfessionalSkill(secondnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
            Dim newSkill2 As New SidejobModel.Skill
            newSkill2.SkillID = secondnextSkillID
            newSkill2.CategoryID = skill2Category
            newSkill2.JobID = skill2JobId
            newSkill2.CategoryName = Utility.GetCategoryName(skill2Category, LCID)
            newSkill2.JobTitle = Utility.GetJobTitle(skill2JobId, LCID)
            newSkill2.Experience = skill2Experience
            newSkill2.Crew = skill2Crew
            newSkill2.Licensed = skill2Licensed
            newSkill2.Insured = skill2Insured
            newSkill2.Insured = skill2Insured

            Dim thirdnextSkillID As Integer = Utility.GetNextSkillId()
            context.InsertProfessionalSkill(thirdnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
            Dim newSkill3 As New SidejobModel.Skill
            newSkill3.SkillID = secondnextSkillID
            newSkill3.CategoryID = skill3Category
            newSkill3.JobID = skill3JobId
            newSkill3.CategoryName = Utility.GetCategoryName(skill3Category, LCID)
            newSkill3.JobTitle = Utility.GetJobTitle(skill3JobId, LCID)
            newSkill3.Experience = skill3Experience
            newSkill3.Crew = skill3Crew
            newSkill3.Licensed = skill3Licensed
            newSkill3.Insured = skill3Insured
            newSkill3.Insured = skill3Insured

            Dim fourthnextSkillID As Integer = Utility.GetNextSkillId()
            context.InsertProfessionalSkill(fourthnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
            Dim newSkill4 As New SidejobModel.Skill
            newSkill4.SkillID = secondnextSkillID
            newSkill4.CategoryID = skill4Category
            newSkill4.JobID = skill4JobId
            newSkill4.CategoryName = Utility.GetCategoryName(skill4Category, LCID)
            newSkill4.JobTitle = Utility.GetJobTitle(skill4JobId, LCID)
            newSkill4.Experience = skill4Experience
            newSkill4.Crew = skill4Crew
            newSkill4.Licensed = skill4Licensed
            newSkill4.Insured = skill4Insured
            newSkill4.Insured = skill4Insured

            context.AddToSkills(newSkill1)
            context.AddToSkills(newSkill2)
            context.AddToSkills(newSkill3)
            context.AddToSkills(newSkill4)
            context.SaveChanges()
        End Using
    End Sub

    Public Sub AddFiveNewSkill()
        Using context = New SidejobEntities()
            Dim firstnextSkillID As Integer = Utility.GetNextSkillId()
            context.InsertProfessionalSkill(firstnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
            Dim newSkill1 As New SidejobModel.Skill
            newSkill1.SkillID = firstnextSkillID
            newSkill1.CategoryID = Skill1Category
            newSkill1.JobID = Skill1JobId
            newSkill1.CategoryName = Utility.GetCategoryName(Skill1Category, LCID)
            newSkill1.JobTitle = Utility.GetJobTitle(Skill1JobId, LCID)
            newSkill1.Experience = Skill1Experience
            newSkill1.Crew = Skill1Crew
            newSkill1.Licensed = Skill1Licensed
            newSkill1.Insured = Skill1Insured
            newSkill1.Insured = Skill1Insured

            Dim secondnextSkillID As Integer = Utility.GetNextSkillId()
            context.InsertProfessionalSkill(secondnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
            Dim newSkill2 As New SidejobModel.Skill
            newSkill2.SkillID = secondnextSkillID
            newSkill2.CategoryID = skill2Category
            newSkill2.JobID = skill2JobId
            newSkill2.CategoryName = Utility.GetCategoryName(skill2Category, LCID)
            newSkill2.JobTitle = Utility.GetJobTitle(skill2JobId, LCID)
            newSkill2.Experience = skill2Experience
            newSkill2.Crew = skill2Crew
            newSkill2.Licensed = skill2Licensed
            newSkill2.Insured = skill2Insured
            newSkill2.Insured = skill2Insured

            Dim thirdnextSkillID As Integer = Utility.GetNextSkillId()
            context.InsertProfessionalSkill(thirdnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
            Dim newSkill3 As New SidejobModel.Skill
            newSkill3.SkillID = secondnextSkillID
            newSkill3.CategoryID = skill3Category
            newSkill3.JobID = skill3JobId
            newSkill3.CategoryName = Utility.GetCategoryName(skill3Category, LCID)
            newSkill3.JobTitle = Utility.GetJobTitle(skill3JobId, LCID)
            newSkill3.Experience = skill3Experience
            newSkill3.Crew = skill3Crew
            newSkill3.Licensed = skill3Licensed
            newSkill3.Insured = skill3Insured
            newSkill3.Insured = skill3Insured

            Dim fourthnextSkillID As Integer = Utility.GetNextSkillId()
            context.InsertProfessionalSkill(fourthnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
            Dim newSkill4 As New SidejobModel.Skill
            newSkill4.SkillID = secondnextSkillID
            newSkill4.CategoryID = skill4Category
            newSkill4.JobID = skill4JobId
            newSkill4.CategoryName = Utility.GetCategoryName(skill4Category, LCID)
            newSkill4.JobTitle = Utility.GetJobTitle(skill4JobId, LCID)
            newSkill4.Experience = skill4Experience
            newSkill4.Crew = skill4Crew
            newSkill4.Licensed = skill4Licensed
            newSkill4.Insured = skill4Insured
            newSkill4.Insured = skill4Insured

            Dim fifthnextSkillID As Integer = Utility.GetNextSkillId()
            context.InsertProfessionalSkill(fifthnextSkillID, CType(Utility.GetProfessionalID(Utility.GetUserID()), Integer?))
            Dim newSkill5 As New SidejobModel.Skill
            newSkill5.SkillID = secondnextSkillID
            newSkill5.CategoryID = skill5Category
            newSkill5.JobID = skill5JobId
            newSkill5.CategoryName = Utility.GetCategoryName(skill5Category, LCID)
            newSkill5.JobTitle = Utility.GetJobTitle(skill5JobId, LCID)
            newSkill5.Experience = skill5Experience
            newSkill5.Crew = skill5Crew
            newSkill5.Licensed = skill5Licensed
            newSkill5.Insured = skill5Insured
            newSkill5.Insured = skill5Insured

            context.AddToSkills(newSkill1)
            context.AddToSkills(newSkill2)
            context.AddToSkills(newSkill3)
            context.AddToSkills(newSkill4)
            context.AddToSkills(newSkill5)
            context.SaveChanges()
        End Using
    End Sub

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''SKILLS''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    ''//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////''
    ''//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////''
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 1'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    Private _numberofSkills As Integer
    Public Property numberofSkills() As Integer
        Get
            Return _numberofSkills
        End Get
        Set(ByVal value As Integer)
            _numberofSkills = value
        End Set
    End Property

    Private _skill1Category As Integer
    Public Property Skill1Category() As Integer
        Get
            Return _skill1Category
        End Get
        Set(ByVal value As Integer)
            _skill1Category = value
        End Set
    End Property
    Private _skill1JobId As Integer
    Public Property Skill1JobId() As Integer
        Get
            Return _skill1JobId
        End Get
        Set(ByVal value As Integer)
            _skill1JobId = value
        End Set
    End Property
    Private _skill1Experience As Integer
    Public Property Skill1Experience() As Integer
        Get
            Return _skill1Experience
        End Get
        Set(ByVal value As Integer)
            _skill1Experience = value
        End Set
    End Property
    Private _skill1Crew As Integer
    Public Property Skill1Crew() As Integer
        Get
            Return _skill1Crew
        End Get
        Set(ByVal value As Integer)
            _skill1Crew = value
        End Set
    End Property
    Private _skill1Licensed As Integer
    Public Property Skill1Licensed() As Integer
        Get
            Return _skill1Licensed
        End Get
        Set(ByVal value As Integer)
            _skill1Licensed = value
        End Set
    End Property
    Private _skill1Insured As Integer
    Public Property Skill1Insured() As Integer
        Get
            Return _skill1Insured
        End Get
        Set(ByVal value As Integer)
            _skill1Insured = value
        End Set
    End Property
    Private _skill1Relocation As Integer
    Public Property Skill1Relocation() As Integer
        Get
            Return _skill1Relocation
        End Get
        Set(ByVal value As Integer)
            _skill1Relocation = value
        End Set
    End Property
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 2'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 2'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Private _skill2Category As Integer
    Public Property skill2Category() As Integer
        Get
            Return _skill2Category
        End Get
        Set(ByVal value As Integer)
            _skill2Category = value
        End Set
    End Property
    Private _skill2JobId As Integer
    Public Property skill2JobId() As Integer
        Get
            Return _skill2JobId
        End Get
        Set(ByVal value As Integer)
            _skill2JobId = value
        End Set
    End Property
    Private _skill2Experience As Integer
    Public Property skill2Experience() As Integer
        Get
            Return _skill2Experience
        End Get
        Set(ByVal value As Integer)
            _skill2Experience = value
        End Set
    End Property
    Private _skill2Crew As Integer
    Public Property skill2Crew() As Integer
        Get
            Return _skill2Crew
        End Get
        Set(ByVal value As Integer)
            _skill2Crew = value
        End Set
    End Property
    Private _skill2Licensed As Integer
    Public Property skill2Licensed() As Integer
        Get
            Return _skill2Licensed
        End Get
        Set(ByVal value As Integer)
            _skill2Licensed = value
        End Set
    End Property
    Private _skill2Insured As Integer
    Public Property skill2Insured() As Integer
        Get
            Return _skill2Insured
        End Get
        Set(ByVal value As Integer)
            _skill2Insured = value
        End Set
    End Property
    Private _skill2Relocation As Integer
    Public Property skill2Relocation() As Integer
        Get
            Return _skill2Relocation
        End Get
        Set(ByVal value As Integer)
            _skill2Relocation = value
        End Set
    End Property
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 2'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 3'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Private _skill3Category As Integer
    Public Property skill3Category() As Integer
        Get
            Return _skill3Category
        End Get
        Set(ByVal value As Integer)
            _skill3Category = value
        End Set
    End Property
    Private _skill3JobId As Integer
    Public Property skill3JobId() As Integer
        Get
            Return _skill3JobId
        End Get
        Set(ByVal value As Integer)
            _skill3JobId = value
        End Set
    End Property
    Private _skill3Experience As Integer
    Public Property skill3Experience() As Integer
        Get
            Return _skill3Experience
        End Get
        Set(ByVal value As Integer)
            _skill3Experience = value
        End Set
    End Property
    Private _skill3Crew As Integer
    Public Property skill3Crew() As Integer
        Get
            Return _skill3Crew
        End Get
        Set(ByVal value As Integer)
            _skill3Crew = value
        End Set
    End Property
    Private _skill3Licensed As Integer
    Public Property skill3Licensed() As Integer
        Get
            Return _skill3Licensed
        End Get
        Set(ByVal value As Integer)
            _skill3Licensed = value
        End Set
    End Property
    Private _skill3Insured As Integer
    Public Property skill3Insured() As Integer
        Get
            Return _skill3Insured
        End Get
        Set(ByVal value As Integer)
            _skill3Insured = value
        End Set
    End Property
    Private _skill3Relocation As Integer
    Public Property skill3Relocation() As Integer
        Get
            Return _skill3Relocation
        End Get
        Set(ByVal value As Integer)
            _skill3Relocation = value
        End Set
    End Property
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 3'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 4'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Private _skill4Category As Integer
    Public Property skill4Category() As Integer
        Get
            Return _skill4Category
        End Get
        Set(ByVal value As Integer)
            _skill4Category = value
        End Set
    End Property
    Private _skill4JobId As Integer
    Public Property skill4JobId() As Integer
        Get
            Return _skill4JobId
        End Get
        Set(ByVal value As Integer)
            _skill4JobId = value
        End Set
    End Property
    Private _skill4Experience As Integer
    Public Property skill4Experience() As Integer
        Get
            Return _skill4Experience
        End Get
        Set(ByVal value As Integer)
            _skill4Experience = value
        End Set
    End Property
    Private _skill4Crew As Integer
    Public Property skill4Crew() As Integer
        Get
            Return _skill4Crew
        End Get
        Set(ByVal value As Integer)
            _skill4Crew = value
        End Set
    End Property
    Private _skill4Licensed As Integer
    Public Property skill4Licensed() As Integer
        Get
            Return _skill4Licensed
        End Get
        Set(ByVal value As Integer)
            _skill4Licensed = value
        End Set
    End Property
    Private _skill4Insured As Integer
    Public Property skill4Insured() As Integer
        Get
            Return _skill4Insured
        End Get
        Set(ByVal value As Integer)
            _skill4Insured = value
        End Set
    End Property
    Private _skill4Relocation As Integer
    Public Property skill4Relocation() As Integer
        Get
            Return _skill4Relocation
        End Get
        Set(ByVal value As Integer)
            _skill4Relocation = value
        End Set
    End Property
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 4'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 5'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Private _skill5Category As Integer
    Public Property skill5Category() As Integer
        Get
            Return _skill5Category
        End Get
        Set(ByVal value As Integer)
            _skill5Category = value
        End Set
    End Property
    Private _skill5JobId As Integer
    Public Property skill5JobId() As Integer
        Get
            Return _skill5JobId
        End Get
        Set(ByVal value As Integer)
            _skill5JobId = value
        End Set
    End Property
    Private _skill5Experience As Integer
    Public Property skill5Experience() As Integer
        Get
            Return _skill5Experience
        End Get
        Set(ByVal value As Integer)
            _skill5Experience = value
        End Set
    End Property
    Private _skill5Crew As Integer
    Public Property skill5Crew() As Integer
        Get
            Return _skill5Crew
        End Get
        Set(ByVal value As Integer)
            _skill5Crew = value
        End Set
    End Property
    Private _skill5Licensed As Integer
    Public Property skill5Licensed() As Integer
        Get
            Return _skill5Licensed
        End Get
        Set(ByVal value As Integer)
            _skill5Licensed = value
        End Set
    End Property
    Private _skill5Insured As Integer
    Public Property skill5Insured() As Integer
        Get
            Return _skill5Insured
        End Get
        Set(ByVal value As Integer)
            _skill5Insured = value
        End Set
    End Property
    Private _skill5Relocation As Integer
    Public Property skill5Relocation() As Integer
        Get
            Return _skill5Relocation
        End Get
        Set(ByVal value As Integer)
            _skill5Relocation = value
        End Set
    End Property
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''Skill 5'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''SKILLS''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    ''//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////''
    ''//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////''




End Class


'=======================================================
'Service provided by Telerik (www.telerik.com)
'Conversion powered by NRefactory.
'Twitter: @telerik, @toddanglin
'Facebook: facebook.com/telerik
'=======================================================


'//public static void InsertCustomer()
'//{


'//    using (SidejobModel.SidejobEntities context = new SidejobModel.SidejobEntities())
'//    {


'//        //Anything with identity have to be created in store procedure and execute it.
'//            context.Connection.Open();
'//            int i = context.ExecuteStoreCommand("SET IDENTITY_INSERT dbo.Customer ON");
'//            var c = new SidejobModel.Customer();
'//            c.CustomerID = 500;
'//            c.UserName = "test";
'//            c.LCID = 1;
'//            context.Customers.AddObject(c);
'//            context.SaveChanges();
'//            i = context.ExecuteStoreCommand("SET IDENTITY_INSERT dbo.Customer OFF");

'//        }
'//    }











'//////////////////////////////////////////////////////LEFT///////////////////////////////////////////////////////////////////
'// EXEC @RC = [dbo].[GetUserIdByUserName] @USERNAME, @UserIdConverted OUTPUT 	
'//SET @UserId = @UseridConverted
'//--LOOK UP TABLE : 
'//--THINK ABOUT THE USER WHO ALREADY SIGN UP BUT GOT KICK AND WANT TO REGISTER AGAIN

'//--RECHECK THIS TABLE

'//SELECT     FirstName, LastName, Country, Region, Age, Gender, EmailAddress
'//FROM         LockedUser
'//WHERE     (FirstName = LOWER(@FirstName)) AND (LastName = LOWER(@LastName)) AND (Country = @CountryName) AND 
'//                      (EmailAddress = LOWER(@EmailAddress)) AND (Gender = @Gender) AND (Age = @Age) AND (Region = @RegionName)
'//Set @RowCount = @@RowCount
'//    IF @RowCount = 1   
'//     BEGIN
'//        SET @ErrorCode = 99
'//        GOTO Cleanup
'//    END


'//--2--Look Up 
'//    INSERT INTO LookUpRoles
'//                          (UserId, CustomerId, ProfessionalId)
'//    VALUES     (@UserId,@NextCustomerID, 0)
'//////////////////////////////////////////////////////LEFT///////////////////////////////////////////////////////////////////

