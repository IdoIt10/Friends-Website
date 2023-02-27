<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        Application["counter"] = 0;
        Application["Online"] = 0;
        Application.Lock();
        Application["Online"] = int.Parse(Application["Online"].ToString()) + 1;
        Application.UnLock();

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        Application.Lock();
        Application["Online"] = int.Parse(Application["Online"].ToString()) - 1;
        Application.UnLock();

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started
        Session["Login"] = "אורח";
        Session["Admin"] = "N";
        Session["ConnectionString"]=@"Data Source=(LocalDB)\MSSQLLocalDB; ;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        //Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename="C:\Users\user\Documents\Visual Studio 2015\WebSites\InternetExampleProject\App_Data\Database.mdf";Integrated Security=True;Connect Timeout=30
        Application.Lock();
        Application["counter"] = (int)Application["counter"] + 1;
        Application.UnLock();

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
