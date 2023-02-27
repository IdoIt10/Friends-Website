<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorPage" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color:Red; text-align:center"><%=errorStr %></h1>
    <script>document.getElementById("label1").innerHTML = "דף שגיאה";</script>

</asp:Content>


