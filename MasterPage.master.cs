using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        visibleStatus();
    }
    public void visibleStatus()
    {
        if (Session["Admin"].ToString()=="Y")
            ManagerPageRef.Visible = true;
        else
            ManagerPageRef.Visible = false;
    }
}
