using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"].ToString() != "אורח")
        {
            Session["ErrorText"] = "יש לבצע 'יציאה' לפני התחלת הרישום";
            Response.Redirect("ErrorPage.aspx");
        }
        Session["ErrorText"] = null;
        // if the user click on Submit button
        // Before reaching here the validateForm is called
        if (/*IsPostBack && */Request.Form["submit"] != null)
        {
            string userName = Request.Form["userName"];
            string pass = Request.Form["password"];
            string email = Request.Form["email"];
            string firstName = Request.Form["firstName"];
            string lastName = Request.Form["lastName"];
            string phone = Request.Form["phone"];
            if (email != "" && userName != "")
            {
                // email should be unique
                if (isExistsMail(email))
                {
                    Session["ErrorText"] = email + " קיים במערכת";
                    Response.Redirect("ErrorPage.aspx");
                    Response.End();
                }
                // user name should be unique
                if (isExistsUserName(userName))
                {
                    Session["ErrorText"] = userName + " קיים במערכת";
                    Response.Redirect("ErrorPage.aspx");
                    Response.End();
                }

                // this parameter is taken from database property "Connection String"
                //string conStr = Session["ConnectionString"].ToString();
                string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
                //string conStr = @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\user\Documents\Visual Studio 2015\WebSites\InternetExampleProject\App_Data\Database.mdf; Integrated Security = True";
            
                string cmdStr = string.Format("INSERT INTO TbUsers(userName, password, email, firstName, lastName, phone, userType) VALUES (N'{0}', N'{1}', N'{2}', N'{3}', N'{4}', N'{5}',  N'{6}')", userName, pass, email, firstName, lastName, phone, "False");
                SqlConnection conObj = new SqlConnection(conStr);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                conObj.Open();
                int n = cmdObj.ExecuteNonQuery();
                conObj.Close();
                if (n==1)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }

    bool isExistsMail(string mail)
    {
        bool b = false;
        string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        //string conStr = @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\user\Documents\Visual Studio 2015\WebSites\InternetExampleProject\App_Data\Database.mdf; Integrated Security = True";
        SqlConnection conn = new SqlConnection(conStr);
        string cmdString = string.Format("SELECT * FROM TbUsers WHERE (email = N'{0}')", mail);
        SqlCommand cmd = new SqlCommand(cmdString, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
            b = true;
        conn.Close();
        return b;
    }
    bool isExistsUserName(string name)
    {
        bool b = false;
        string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
        //string conStr = @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\user\Documents\Visual Studio 2015\WebSites\InternetExampleProject\App_Data\Database.mdf; Integrated Security = True; Connect Timeout = 30";
        SqlConnection conn = new SqlConnection(conStr);
        string cmdString = string.Format("SELECT * FROM TbUsers WHERE (userName = N'{0}')", name);
        SqlCommand cmd = new SqlCommand(cmdString, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
            b = true;
        conn.Close();
        return b;

    }
}