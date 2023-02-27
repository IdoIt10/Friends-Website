<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>


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
        document.getElementById("label1").innerHTML = "דף כניסה";
        
        function ValidateForm() {

            return CheckUserName() && CheckPassword();
        }

        function CheckUserName() {
            var x = document.getElementById("userName").value;
            if (x == "" || x.length < 2) {
                document.getElementById("ErrorUserName").innerHTML = "השם אינו תקין";
                return false;
            }
            document.getElementById("ErrorUserName").innerHTML = "";
            return true;
        }

        function CheckPassword() {
            var x = document.getElementById("password").value;
            if (x == "" || x.length < 6) {
                document.getElementById("ErrorPassword").innerHTML = "הסיסמה אינה תקינה"
                return false;
            }
            document.getElementById("ErrorPassword").innerHTML = " ";
            return true;
        }

    </script>
    <form action="Login.aspx" method="post" style="background-color:azure; text-align: right; line-height: 1.8;  word-spacing: 3.5px; font-size:35px; direction:rtl">
        
        <table style="direction:rtl">
            <tr>
                <td>שם משתמש</td>
                <td><input type="text" name="userName" id="userName"/></td>
                <td style="color:Red" id="ErrorUserName"></td>
            </tr>
            <tr>
                <td>סיסמה</td>
                <td><input type="password" name="password" id="password"/></td>
                <td style="color:Red" id="ErrorPassword"></td>
            </tr>
        </table>
            
        <input type="submit" name="submit" value="היכנס" onclick="return ValidateForm()" />
        <input type="reset" value="נקה"/>
    </form>
        </div>
</asp:Content>


