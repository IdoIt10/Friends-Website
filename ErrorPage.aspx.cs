using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ErrorPage : System.Web.UI.Page
{
    public string errorStr;

    protected void Page_Load(object sender, EventArgs e)
    {
        errorStr = (string)Session["ErrorText"];

        if (errorStr == null)
        {
            errorStr = "שגיאה בהכנסת הנתונים";
        }
    }
}