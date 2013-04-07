Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports SidejobModel

''' <summary>
''' Summary description for NewProjectBidProcess
''' Process the new bid and the new opportunity
''' after both the poster and the bidder had 
''' selected that they want to extend the project
''' </summary>
''' 

Public Class NewProjectBidProcess
    Public Sub New(newprod As Integer, projectid1 As Integer)
        NewProID = newprod

        ProjectID = projectid1
    End Sub
    Public Sub StartProcess()
        Process()
    End Sub

    Public Property NewProID() As Integer
        Get
            Return _mNewProID
        End Get
        Set(value As Integer)
            _mNewProID = value
        End Set
    End Property
    Private _mNewProID As Integer
    Public Property ProjectID() As Integer
        Get
            Return _mProjectID
        End Get
        Set(value As Integer)
            _mProjectID = value
        End Set
    End Property
    Private _mProjectID As Integer

    Private Sub Process()
        Using context = New SidejobEntities()

            Dim newopportunity = (From cp In context.ProjectSecondChances
                                  Where cp.ProjectID = ProjectID
                                  Select cp)
            If newopportunity.Count() = 2 Then

                'Save to ArchivedProjectSecondChance
                SavedToArchivedProjectSecondChance(context, newopportunity)

                'Delete Previous BidderWin and Bids
                DeletePreviousBidderWin(context, ProjectID)

                'Add Current BidderWin
                AddNewBidderWin(context, ProjectID)

                'update project 
                Updateproject(context)

                'delete from Response Delay
                DeleteFromResponseDelay(context)

                For Each o As ProjectSecondChance In newopportunity.ToList()
                    context.DeleteObject(o)
                Next
            End If


            context.SaveChanges()
        End Using

    End Sub

    Private Sub SavedToArchivedProjectSecondChance(context As SidejobEntities, newopportunity As IEnumerable(Of ProjectSecondChance))
        'Saved to ArchivedProjectSecondChance
        For Each o As ProjectSecondChance In newopportunity
            Dim p1 = New ArchivedProjectSecondChance() With { _
             .AgreerID = o.AgreerID, _
             .AgreerRole = o.AgreerRole, _
             .AgreerProjectRole = o.AgreerProjectRole, _
             .ProjectID = o.ProjectID, _
             .DateTime = DateTime.Now.[Date] _
            }

            context.AddToArchivedProjectSecondChances(p1)
        Next
        context.SaveChanges()
    End Sub

    Private Sub Updateproject(context As SidejobEntities)
        'Delete From ClosedProject
        Dim closedproject = (From c In context.ClosedProjects
   Where c.ProjectID = ProjectID).FirstOrDefault()
        If closedproject IsNot Nothing Then
            context.DeleteObject(closedproject)
        End If

        'Update Project Requirement End Date to Today
        Dim projectrequirement = (From c In context.ProjectRequirements
   Where c.ProjectID = ProjectID).FirstOrDefault()
        If projectrequirement IsNot Nothing Then
            projectrequirement.EndDate = DateTime.Now.[Date]
            projectrequirement.AmountOffered = CDbl(GetCurrentNewBid(ProjectID, NewProID).AmountOffered)
            context.SaveChanges()
        End If

        'Update HighestBid and BidderID 
        Dim project = (From c In context.Projects
   Where c.ProjectID = ProjectID).FirstOrDefault()
        If project IsNot Nothing Then
            project.HighestBid = GetCurrentNewBid(ProjectID, NewProID).AmountOffered
            project.HighestBidderID = NewProID
            project.HighestBidUsername = GetProfessional().UserName
            project.StatusInt = 0
            context.SaveChanges()
        End If
    End Sub

    Public Sub DeletePreviousBidderWin(context As SidejobEntities, projectId As Integer)
        Dim previous = (From c In context.ClosedProjects
   Where c.ProjectID = projectId).FirstOrDefault()

        If previous IsNot Nothing Then
            Dim bids = (From c In context.Bids Where c.ProjectID = projectId AndAlso c.BidderID = DirectCast(previous, Object) Order By c.AmountOffered Descending).FirstOrDefault()


            If bids IsNot Nothing Then
                Dim previousbidid As Integer = bids.BidID
                context.DeleteObject(bids)
                Dim previouswinnerbid = (From c In context.ProfessionalWinBids Where c.ProID = DirectCast(previous, Object) AndAlso c.BidID = previousbidid).FirstOrDefault()
                If previouswinnerbid IsNot Nothing Then
                    context.DeleteObject(previouswinnerbid)

                End If
            End If

            context.SaveChanges()
        End If
    End Sub

    Public Sub DeletePreviousBidderWinFromNewOptionSelection(context As SidejobEntities, projectId As Integer, bidderid As Integer)
        Dim bids = (From c In context.Bids
   Where c.ProjectID = projectId AndAlso c.BidderID = bidderid _
   Order By c.AmountOffered Descending).FirstOrDefault()
        If bids IsNot Nothing Then
            Dim previousbidid As Integer = bids.BidID
            context.DeleteObject(bids)
            Dim previouswinnerbid = (From c In context.ProfessionalWinBids
    Where c.ProID = bidderid AndAlso c.BidID = previousbidid).FirstOrDefault()
            If previouswinnerbid IsNot Nothing Then
                context.DeleteObject(previouswinnerbid)

            End If
        End If

        context.SaveChanges()


    End Sub

    Public Sub DeleteAllBids(context As SidejobEntities, projectId As Integer, bidderid As Integer)
        Dim bids = (From c In context.Bids
   Where c.ProjectID = projectId _
   Order By c.AmountOffered Descending).ToList()
        If bids.Count <> 0 Then
            For Each b As Bid In bids
                context.DeleteObject(b)
            Next
        End If

        context.SaveChanges()


    End Sub
    Public Sub AddNewBidderWin(context As SidejobEntities, projectId As Integer)
        Dim newBid = GetCurrentNewBid(projectId, NewProID)
        If newBid Is Nothing Then
            Return
        End If
        Try
            Dim newwin = New ProfessionalWinBid() With { _
             .BidID = newBid.BidID, _
             .ProID = NewProID, _
             .NumberofBids = GetNumberofBids(context) _
            }
            context.AddToProfessionalWinBids(newwin)

            context.SaveChanges()
        Catch e As Exception

            Dim i = e
        End Try

    End Sub

    Public Sub DeleteFromResponseDelay(context As SidejobEntities)
        Dim rd = (From c In context.ResponseDelays
   Where c.ProjectID = ProjectID).FirstOrDefault()

        If rd IsNot Nothing Then
            context.DeleteObject(rd)
            context.SaveChanges()
        End If
    End Sub

    Public Function GetCurrentNewBid(projectid As Integer, professionalid As Integer) As Bid
        Using context = New SidejobEntities()
            Dim newbid = (From c In context.Bids
    Where c.ProjectID = projectid AndAlso c.BidderID = professionalid _
    Order By c.AmountOffered).FirstOrDefault()

            Return newbid
        End Using
    End Function

    Public Function GetProfessional() As ProfessionalGeneral
        Using context = New SidejobEntities()
            Return (From c In context.ProfessionalGenerals
    Where c.ProID = NewProID).FirstOrDefault()
        End Using
    End Function

    Private Function GetNumberofBids(context As SidejobEntities) As Integer
        Dim c = (From p In context.ProfessionalWinBids
   Where p.ProID = NewProID).Count()
        Return c + 1
    End Function

End Class
