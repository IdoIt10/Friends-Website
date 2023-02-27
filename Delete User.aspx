<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Delete User.aspx.cs" Inherits="UserDelete" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script> document.getElementById("label1").innerHTML = "מחיקת משתמש";
              document.getElementById("ManagerPageRef")
     </script>
    <form id="frm" method="post" action="UserDelete.aspx">
        <table>
            <tr><td>אתה בטוח שאתה רוצה למחוק את המשתמש <%=Session["Login"] %></td></tr>
            <tr><td><input type="submit" value=" מחק" name="Btn" /></td></tr>
        </table>
    </form>
</asp:Content>


