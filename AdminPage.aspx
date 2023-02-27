<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        document.getElementById("label1").innerHTML = "דף מנהלים";
    </script>

    <p style="font-size:50px"><b><u> שלום מנהל:</u></b></p>
    <br />
    <br />
<p style="font-size:30px"><a href="AdminShowUsers.aspx">הצג משתמשים</a></p>
    <br />
    <br />
<p style="font-size:30px"><a href="AdminsDetails.aspx">הצגת פרטי מנהלים</a></p>
    <br />
    <br />
<p style="font-size:30px"><a href="qlb.html">הצגת השחקנים הכי פעילים</a></p>
    <br />
    <br />
<p style="font-size:30px"><a href="qlb1.html">הצגת השחקנים המובילים</a></p>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

