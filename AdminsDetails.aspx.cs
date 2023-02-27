using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AdminsDetails : System.Web.UI.Page
{
    public string str = "<table border='1'><tr><td>שם משתמש</td><td>שם פרטי</td><td>שם משפחה</td><td>כתובת דוא&quotל</td><td>טלפון</td><tr>";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"].ToString() != "Y")
        {
            Session["ErrorText"] = "רק מנהל יכול לגשת לדף זה";
            Response.Redirect("ErrorPage.aspx");
        }
        DataSet ds = new DataSet();
        ds.ReadXml(MapPath("App_Data/XMLFile.xml"));
        foreach (DataRow rw in ds.Tables[0].Rows)
        {
            str += ("<td>" + rw["UserName"] + "</td><td>" + rw["FirstName"] + "</td><td>" + rw["LastName"] + "</td><td>" + rw["Email"] + "</td><td>" + rw["Phone"] + "</td>");
            str += "</tr>";
        }
    }
}