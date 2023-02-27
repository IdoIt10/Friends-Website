<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateUD.aspx.cs" Inherits="UpdateUserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>document.getElementById("label1").innerHTML = "עדכון נתוני משתמש";</script>
    <form action="UpdateUserDetails.aspx" dir="rtl" method="post" onsubmit="return chkform()">
        <h2>עדכון</h2>
        <br />

        <table dir="rtl">
            <tr>
                <td>שם פרטי</td>
                <td><input type="text" id="name" name="name" value="<%=fname %>"/></td>
                <td id="nickname-error" class="error"></td>
            </tr>
            <tr>
                <td>שם משפחה</td>
                <td><input type="text" id="lname" name="lname" value="<%=lname %>"/></td>
                <td id="name-error" class="error"></td>
            </tr>
            <tr>
                <td>שם משתמש</td>
                <td><input type="text" id="user" name="user" value="<%=user %>" disabled="disabled"/></td>
                <td id="password-error" class="error"></td>
            </tr>
            <tr>
                <td>סיסמה</td>
                <td><input type="password" maxlength="16" id="pass" name="password1" value="<%=password %>" /></td>
                <td id="ver_pass-error" class="error"></td>
            </tr>
            <tr>
                <td>דוא"ל</td>
                <td><input type="text" size="30" id="email" name="email" value="<%=email %>" /></td>
                <td id="email-error" class="error"></td>
            </tr>
           <tr>
                <td>דוא"ל</td>
                <td><input type="text" size="10" id="phone" name="phone" value="<%=phone %>" /></td>
                <td id="phone-error" class="error"></td>
            </tr>
            
            <tr>
                <td>
                    <input type="submit" name="btn" value="עדכן"/>
                    <input type="reset" value="אפס"/>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>