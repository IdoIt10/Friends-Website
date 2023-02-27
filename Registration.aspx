<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>
<%@ Import Namespace="System.Data.SqlClient" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div style="direction:rtl; text-align:right; float:right; font-size:35px; background-color:white; color:darkblue">
    <script type="text/javascript">
        document.getElementById("label1").innerHTML = "דף רישום";
        

   function ValidateForm() {
        var b = "";
        if (!CheckUserName()) {
            b = "Error";
        }
        if (!CheckPassword()) {
            b = "Error";
        }
        if (!CheckPassword1()) {
            b = "Error";
        }
        if (!CheckMail()) {
            b = "Error"
        }
        if (!CheckFirstName()) {
            b = "Error";
        }
        if (!CheckLastName()) {
            b = "Error";
        }
        if (!CheckPhone()) {
            b = "Error";
        }
        return b=="";
    }
    function CheckUserName() {
        var x = document.getElementById("userName").value;
        if (x == "" || x.length < 2) {
            document.getElementById("errorUserName").innerHTML = "השם משתמש אינו תקין";
            return false;
        }
        for (var s = 0; s < x.length; s++) {
            if (!('a' <= x.charAt(s) && x.charAt(s) <= 'z') && !('A' <= x.charAt(s) && x.charAt(s) <= 'Z')
                && !('0' <= x.charAt(s) && x.charAt(s) <= '9')) {
                document.getElementById("errorUserName").innerHTML =
                    "<span style='color:Red'> שם המשתמש יכול להכיל תווים a-z או 0-9 </span>";
                return false;
            }
        }
        document.getElementById("errorUserName").innerHTML = " ";
        return true;
    }
    
   
    function CheckPassword() {
        var x = document.getElementById("password").value;
        if (x == "" || x.length < 6) {
            document.getElementById("errorPassword").innerHTML = "הסיסמה אינה תקינה"
            return false;
        }
        document.getElementById("errorPassword").innerHTML = " ";
        return true;
    }
    function CheckPassword1() {
        var x = document.getElementById("password").value;
        var y = document.getElementById("password1").value;
        if (x != y) {
            document.getElementById("errorPassword1").innerHTML = "הסיסמאות אינן זהות"
            return false;

        }

        document.getElementById("errorPassword1").innerHTML = " ";
        return true;
    }
    function CheckMail() {
        var x = document.getElementById("email").value;
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(x)) {
            document.getElementById("errorMail").innerHTML = "";
            return true;

        }
        document.getElementById("errorMail").innerHTML = "המייל אינו תקין";
        return false;

    }
    function CheckFirstName() {
        var x = document.getElementById("firstName").value;
        if (x == "" || x.length < 2) {
            document.getElementById("errorFirstName").innerHTML = "השם אינו תקין";
            return false;
        }
        var n = document.getElementById("firstName").value;
        var string = "!@#$%^&*()_+=|\}]{[?/.><,`~/";
        if (n.length == 0) {
            document.getElementById("errorFirstName").innerHTML =
                "<span style='color:Red'>חובה להזין שם פרטי</span>";
            return false;
        }
        for (var i = 0; i < n.length; i++) {
            for (var j = 0; j < string.length; j++) {
                if (n.charAt(i) == string.charAt(j)) {
                    document.getElementById("errorFirstName").innerHTML =
                        "<span style='color:Red'>הכנסת תווים לא חוקיים</span>";
                    return false;
                }
            }
        }
        for (var s = 0; s < n.length; s++) {
            if ('0' <= n.charAt(s) && n.charAt(s) <= '9') {
                document.getElementById("errorFirstName").innerHTML =
                    "<span style='color:Red'>אסור שהשם הפרטי יכיל מספרים</span>";
                return false;
            }
            if ('a' <= n.charAt(s) && n.charAt(s) <= 'z') {
                document.getElementById("errorFirstName").innerHTML =
                    "<span style='color:Red'>השם הפרטי יכול להכיל רק אותיות בעברית</span>";
                return false;
            }
            if ('A' <= n.charAt(s) && n.charAt(s) <= 'Z') {
                document.getElementById("errorFirstName").innerHTML =
                    "<span style='color:Red'>השם הפרטי יכול להכיל רק אותיות בעברית</span>";
                return false;
            }
        }
        document.getElementById("errorFirstName").innerHTML = "";
        return true;
    }
    function CheckLastName() {
        var x = document.getElementById("lastName").value;
        if (x == "" || x.length < 2) {
            document.getElementById("errorLastName").innerHTML = "השם משפחה אינו תקין";
            return false;
        }

        var n = document.getElementById("lastName").value;
        var string = "!@#$%^&*()_+=|\}]{[?/.><,`~/";
        if (n == "") {
            document.getElementById("errorLastName").innerHTML = "<span style='color:Red'>חובה להזין שם משפחה</span>";
            return false;
        }
        for (var i = 0; i < n.length; i++) {
            for (var j = 0; j < string.length; j++) {
                if (n.charAt(i) == string.charAt(j)) {
                    document.getElementById("errorLastName").innerHTML = "<span style='color:Red'>הכנסת תווים לא חוקיים</span>";
                    return false;
                }
            }
        }
        for (var s = 0; s < n.length; s++) {
            if ('0' <= n.charAt(s) && n.charAt(s) <= '9') {
                document.getElementById("errorLastName").innerHTML = "<span style='color:Red'>אסור שהשם הפרטי יכיל מספרים</span>";
                return false;
            }
            if ('a' <= n.charAt(s) && n.charAt(s) <= 'z') {
                document.getElementById("errorLastName").innerHTML = "<span style='color:Red'>השם הפרטי יכול להכיל רק אותיות בעברית</span>";
                return false;
            }
            if ('A' <= n.charAt(s) && n.charAt(s) <= 'Z') {
                document.getElementById("errorLastName").innerHTML = "<span style='color:Red'>השם הפרטי יכול להכיל רק אותיות בעברית</span>";
                return false;
            }
        }
        document.getElementById("errorLastName").innerHTML = "";
        return true;
    }
    function CheckPhone() {
        return true;
    }


</script>

    <form  name="Registration" action="Registration.aspx" method="post" >
        <table>
            <tr>
                <td>שם משתמש</td>
                <td><input type="text" name="userName" id="userName" size="30" /></td>
                <td style="color:Red" id="errorUserName"></td>
            </tr>
            <tr>
                <td>סיסמה</td>
                <td><input type="password" name="password" id="password" size="30" /></td>
                <td style="color:Red" id="errorPassword"></td>
            </tr>
            <tr>
                <td>הקש סיסמה שנית</td>
                <td><input type="password" name="password1" id="password1" size="30"/></td>
                <td style="color:Red" id="errorPassword1"></td>
            </tr>
            <tr>
                <td>אימייל</td>
                <td><input type="text" name="email" id="email" size="30" /></td>
                <td style="color:Red" id="errorMail"></td>
            </tr>
            <tr>
                <td>שם פרטי</td>
                <td><input type="text" name="firstName" id="firstName" size="30" /></td> 
                    <td style="color:Red" id="errorFirstName"></td>
            </tr>
            <tr>
                <td>שם משפחה</td>
                <td><input type="text" name="lastName" id="lastName" size="30" /></td>
                <td style="color:Red" id="errorLastName"></td>
            </tr>
            <tr>
                <td>טלפון</td>
                <td><input type="text" name="phone" id="phone" size="30" /></td>
                <td style="color:Red" id="errorPhone"></td>
            </tr>

</table>
    <br />
    <input type="submit" name="submit" value="שלח" onclick="return ValidateForm()"/>
    <input type="reset" value="נקה" onclick="return ResetForm()"/> &nbsp  &nbsp
</form>
        </div>
 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

