Imports Microsoft.VisualBasic
Imports System.Collections

Public Class CustomerAlbum


    Public Shared _AlbumList As ArrayList = New ArrayList

    Private Shared _AlbumID As Integer = 1

    ''Gender :
    ''Male

    ''Gender :
    ''Male
    ''Female
    ''Don't know . In this case it is a male

    'Public Sub addItem(ByVal myvalue As String)


    '    _Listofimages.Add(myvalue)

    'End Sub

    Public Shared Property AlbumID() As Integer
        Get
            Return _AlbumID

        End Get
        Set(ByVal value As Integer)
            _AlbumID = value

        End Set
    End Property








End Class
