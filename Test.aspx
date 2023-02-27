<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form name="TestForm" action="Test.aspx" method="post">

        <table>
            <tr>
                <td>First name:</td>
                <td><input type="text" name="txt1" id="txt-i-1"/></td>
                <td style="color:Red" id="errorUserName">err</td>
            </tr>
             <tr>
                <td>Gender:</td>
                <td><select name="gender" id="gender">
            <option value="mail">Male</option>
             <option value="femail">Female</option>
             <option value="other">Other</option>     
               </select></td>
                <td></td>
            </tr>
             <tr>
                <td>Password:</td>
                <td><input type="password" name="pass" id="pass" /></td>
                <td></td>
            </tr>
             <tr>
                <td>Birth date:</td>
                <td><input type="date" /></td>
                <td></td>
            </tr>
             <tr>
                <td>Gender:</td>
                <td><input type="radio" name="gender" value="male" checked="checked"/> Male <br/>
        <input type="radio" name="gender" value="female"/> Female<br/>
        <input type="radio" name="gender" value="other"/> Other</td>
                <td></td>
            </tr>
            <tr>
                <td>Choose Vehichle:</td>
                <td><input type="checkbox" name="vehicle1" value="Bike"/> I have a bike<br/>
        <input type="checkbox" name="vehicle2" value="Car"/> I have a car </td>
                <td></td>
            </tr>

        </table>
         
        
        
    
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

