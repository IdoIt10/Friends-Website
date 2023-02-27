using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"].ToString()!="אורח" && Session["Admin"].ToString() != "Y")
        {
            string conStr = Session["ConnectionString"].ToString();
            string cmdStr="";
            if (Session["Sum"] != null)
            {
                cmdStr = string.Format("INSERT INTO TbHistory(gameStartDate, userName, numOfMoves, scoreOfAllMoves, gameEndDate) VALUES (N'{0}', N'{1}', N'{2}', N'{3}', N'{4}')", Session["StartGameDate"].ToString(), Session["Login"].ToString(), Session["roundsNo"].ToString(), Session["Sum"].ToString(), DateTime.Now.ToString());
                SqlConnection conObj = new SqlConnection(conStr);
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                conObj.Open();
                int n = cmdObj.ExecuteNonQuery();
                conObj.Close();
            }
        }
        Session.Abandon();
        Response.Redirect("Home.aspx");
    }
}