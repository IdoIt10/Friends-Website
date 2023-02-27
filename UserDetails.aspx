<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="UserDetails" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="direction:rtl; text-align:right; float:right; font-size:35px; background-color:white; color:darkblue">
    <script>
        document.getElementById("label1").innerHTML = "<%=PageTitle()%>";
    </script>
    <span id="UserDetails">
        <u>
        <%if (Session["Login"] != null)
        {
            Response.Write("שלום:" + fullName);
        }
        %>
        </u>
        <br /> <br />
        נתונים:
    </span>
    <table dir="rtl">
        <tr>
            <td><%=userColumnsTable %></td>
            <td><%=userDetailsTable %></td>
        </tr>
    </table>
    <br />
    <a href="UpdateUD.aspx">עדכון פרטים</a>
    &nbsp&nbsp&nbsp&nbsp&nbsp
    <a href="Delete User.aspx">מחק משתמש</a>
    </div>
</asp:Content>


