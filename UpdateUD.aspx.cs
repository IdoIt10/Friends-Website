using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class UpdateUserDetails : System.Web.UI.Page
{
    public string fname = "";
    public string lname = "";
    public string user = "";
    protected string password = "";
    public string email = "";
    protected string phone = "";

    public void updateTable(string command)
    {
        string constr = Session["ConnectionString"].ToString();
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand(command, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"].ToString() == "אורח")
        {
            Session["ErrorText"] = "לאורח אין נתונים במערכת";
            Response.Redirect("ErrorPage.aspx");
        }
        if (Session["Admin"].ToString() == "Y")
        {
            Session["ErrorText"] = "נתוני מנהל מעודכנים במערכת אחרת";
            Response.Redirect("ErrorPage.aspx");
        }

        user = Session["Login"].ToString();
        string conStr = Session["ConnectionString"].ToString();
        string cmdStr = string.Format("SELECT  * FROM  TbUsers WHERE (UserName = N'{0}')", user);
        SqlDataAdapter da = new SqlDataAdapter(cmdStr, conStr);
        DataSet ds = new DataSet(); // יצירת דאטה סט
        da.Fill(ds); // מילוי דאטה סט
        lname = ds.Tables[0].Rows[0]["lastName"].ToString();
        fname = ds.Tables[0].Rows[0]["firstName"].ToString();
        user = ds.Tables[0].Rows[0]["userName"].ToString();
        password = ds.Tables[0].Rows[0]["password"].ToString();
        email = ds.Tables[0].Rows[0]["email"].ToString();
        phone = ds.Tables[0].Rows[0]["phone"].ToString();
        if (Request.Form["btn"] != null) // אם נלחץ הכפתור
        {
            fname = Request.Form["name"].ToString(); // קליטת נתונים מהטופס
            lname = Request.Form["lname"].ToString();
            password = Request.Form["password1"].ToString();
            email = Request.Form["email"].ToString();
            phone = Request.Form["phone"].ToString();

            ds.Tables[0].Rows[0]["lastName"] = lname;
            ds.Tables[0].Rows[0]["firstName"] = fname;
            ds.Tables[0].Rows[0]["password"] = password;
            ds.Tables[0].Rows[0]["email"] = email;
            ds.Tables[0].Rows[0]["phone"] = phone;
            SqlCommandBuilder builder = new SqlCommandBuilder(da);
            da.UpdateCommand = builder.GetUpdateCommand();
            da.Update(ds);
            //string cmd = string.Format("UPDATE TbUsers     SET firstName = N'{1}', lastName = N'{2}', password = N'{3}', email = N'{4}', phone = N'{5}' WHERE  (userName = N'{0}')", Session["Login"].ToString(), fname, lname, password,email,phone);
            //updateTable(cmd);
            Response.Redirect("UserDetails.aspx");
        }
    }
}