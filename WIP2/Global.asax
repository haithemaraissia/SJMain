<%@ Application Language="VB" %>

<script RunAt="server">


  Private Const CacheKey As String = "WebScheduler"
    ' Private Const ResetPage As String = "http://localhost/SIDEJOB//Authenticated/Admin/Automation.aspx"
    Private ResetPage As String = "http://localhost/Side/Authenticated/Admin/Automation.aspx"
  

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
        Application("UserCount") = 0
        System.Data.SqlClient.SqlDependency.Start(ConfigurationManager.ConnectionStrings("SideJobConnectionString").ConnectionString)
        RegisterCacheEntry()
        '//////////////////////////////////
        ''  Dim app As HttpApplication = DirectCast(sender, HttpApplication)

        'Dim context As HttpContext = app.Context
        'Dim context As HttpContext = Response.c

        ' Attempt to peform first request initialization

        FirstRequestInitialization.Initialize(context)

        ''DEPENDING ON THE HOST SETTING
        ' ResetPage += HttpContext.Current.Request.Url.Authority.ToString
        
        '//////////////////////////////////
        '' ResetPage += context.ToString
        ''ResetPage += "/SIDEJOB/Authenticated/Admin/Automation.aspx"
        
        'Dim client As New Net.WebClient
        
        
        ''Maybe needed , maybe not depending on the setting of permission on the host
        'client.Credentials = New Net.NetworkCredential("HAITHEM", "759163")
       
        
       
        'client.DownloadString(ResetPage.ToString)
        
        
        ' Dim client As New Net.WebClient
        
       
        ' client.Credentials = New Net.NetworkCredential("Administrator", "759163")
        ' client.DownloadString(ResetPage.ToString)
        
        'Dim req As Net.WebRequest = Net.WebRequest.Create(New Uri(Url))
        'If UserName <> "" And Password <> "" Then
        '    req.Credentials = New Net.NetworkCredential(UserName, Password)
        'End If
        

        
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
    
    
    
    Private Sub RegisterCacheEntry()
        If HttpContext.Current.Cache(CacheKey) Is Nothing Then
            HttpContext.Current.Cache.Add(CacheKey, "WebScheduler", Nothing, Caching.Cache.NoAbsoluteExpiration, _
                                          TimeSpan.FromMinutes(1), CacheItemPriority.NotRemovable, _
                                          New CacheItemRemovedCallback(AddressOf CacheItemRemovedCallback))

        End If
    End Sub
    
    Private Sub CacheItemRemovedCallback(ByVal key As String, ByVal value As Object, ByVal reason As CacheItemRemovedReason)
        ''Do the scheduling

      
        HitPage()
        
    End Sub
    
    
    Private Sub HitPage()
        Dim client As New Net.WebClient
        
        'Dim httpCurrent As HttpContext = HttpContext.Current
        
        
        ''DEPENDING ON THE SETTING OF THE HOST
        'Dim ConstructedUrl As String = HttpContext.Current.Request.Url.Authority.ToString
        'ConstructedUrl += "/SIDEJOB/Authenticated/Admin/Automation.aspx"
        'ResetPage = ConstructedUrl
        'Dim test As String = Request.Url.AbsolutePath.ToString
        'client.Credentials = New Net.NetworkCredential("HAITHEM", "759163")
       
        
       
        client.DownloadString(ResetPage.ToString)
        

    End Sub
    

    
    
    
    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        If HttpContext.Current.Request.Url.ToString = ResetPage Then
            RegisterCacheEntry()
        End If
    End Sub
    
    
    Private Class FirstRequestInitialization


        Private Shared s_InitializedAlready As Boolean = False

        Private Shared s_lock As New [Object]()

        ' Initialize only on the first request

        Public Shared Sub Initialize(ByVal context As HttpContext)


            If s_InitializedAlready Then



                Return
            End If

            SyncLock s_lock


                If s_InitializedAlready Then



                    Return
                End If

                ' Perform first-request initialization here ...


                s_InitializedAlready = True
            End SyncLock

        End Sub

    End Class

 
 
</script>

