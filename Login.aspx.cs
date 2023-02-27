using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    public bool IsExist(string username, string password)
    {
        bool flag = false;
        
        string conStr = Session["ConnectionString"].ToString();
        //string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C: \Users\user\Documents\Visual Studio 2015\WebSites\InternetExampleProject\App_Data\Database.mdf;Integrated Security=True";
        SqlConnection conObj = new SqlConnection(conStr);
        string cmdStr = string.Format("SELECT * FROM TbUsers WHERE userName=N'{0}' and password=N'{1}'", username, password);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();

        if (dr.HasRows)
            flag = true;

        conObj.Close();
        return flag;

    }
    public bool IsExistUser(string username)
    {
        bool flag = false;
        string conStr = Session["ConnectionString"].ToString();
        SqlConnection conObj = new SqlConnection(conStr);
        string cmdStr = string.Format("SELECT * FROM TbUsers WHERE UserName=N'{0}'", username);
        SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();

        if (dr.HasRows)
            flag = true;

        conObj.Close();
        return flag;

    }

    public static bool IsAdminExists(string user, string password)
    {
        bool flag = false;
        DataSet ds = new DataSet();
        ds.ReadXml(System.Web.HttpContext.Current.Server.MapPath("App_Data/XMLFile.xml"));
        foreach (DataRow r in ds.Tables[0].Rows)
        {
            if (user.Equals(r[0]) && password.Equals(r[1]))
            {
                flag = true;
            }
        }

        return flag;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            string user = Request.Form["userName"];
            string pass = Request.Form["password"];
            
            if (IsExist(user, pass))
            {
                Session["Login"] = user;
                Session["Password"] = pass;
                Session["StartGameDate"] = DateTime.Now.ToString();
                Session["Admin"] = "N";
                Response.Redirect("UserDetails.aspx");
            }
            else
            {
                if (IsAdminExists(user, pass))
                {
                    Session["Login"] = user;
                    Session["Password"] = pass;
                    Session["StartGameDate"] = DateTime.Now.ToString();
                    Session["Admin"] = "Y";
                    Response.Redirect("UserDetails.aspx");
                }
                else
                {
                    Session["ErrorText"] = "שגיאה בשם משתמש או סיסמה";
                    Response.Redirect("ErrorPage.aspx");
                }

                if (Session["username"] != null)
                    Response.Write("שלום " + Session["username"]);
                else
                {
                    Response.Write("<a href=login.aspx> דף כניסה</a>");
                    Response.End();
                }
            }
        }
    }
}