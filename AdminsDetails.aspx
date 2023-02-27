<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminsDetails.aspx.cs" Inherits="AdminsDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="direction:rtl; text-align:right; float:right; font-size:35px; background-color:white; color:darkblue">
    <script type="text/javascript">
        document.getElementById("label1").innerHTML = "נתוני מנהלים";
    </script>
        <br />
        <br />
        <br />
    <table><%=str %></table>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

