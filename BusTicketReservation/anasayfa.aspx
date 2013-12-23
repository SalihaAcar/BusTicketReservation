<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="anasayfa.aspx.cs" Inherits="BusTicketReservation.anasayfa" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Online Otobüs Bileti Sorgulama Sistemi</title>
    <script type="text/javascript">
        function checkDate(sender, args) {
            if (sender._selectedDate < new Date()) {
                alert("Geçmiş bir tarihi seçemezseniz!");
                sender._selectedDate = new Date();
                // set the date back to the current date
                sender._textbox.set_Value(sender._selectedDate.format(sender._format))
            }
        }

    </script>
    <style>
        .calenderstyle
        {
            background-color: turquoise;
            color: white;
        }
        body
        {
            font-family:Arial, Helvetica, sans-serif;
            margin-bottom:60px;
            margin-top:60px;
            margin-left:15px;
            margin-right:90px;
	        background:url("/resimler/otobus.png") center left  white fixed;
            background-repeat:no-repeat;
            background-attachment:scroll;
            
            
        }
        
    </style>
</head>
<body  >
    <form id="form1" runat="server"> <center>
        <div style="background-color:turquoise" >
            <br />
            <br />
            <br />
            <br />
            <br />
            <br /><b style="font-size:large ; color:white ">ONLINE OTOBÜS BİLETİ SORGULAMA SİSTEMİ</b>
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#0066FF" Text="Kalkış : "></asp:Label>
                <asp:DropDownList ID="ddLtNereden" runat="server" Height="32px" OnSelectedIndexChanged="ddLtNereden_SelectedIndexChanged" AutoPostBack="true" AppendDataBoundItems="true">
                    <asp:ListItem>--Seçiniz--</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#0099FF" Text="Varış :"></asp:Label>
                <asp:DropDownList ID="ddLtNereye" runat="server"   Height="32px" AutoPostBack="true" AppendDataBoundItems="false">
                    <asp:ListItem>--Seçiniz-- </asp:ListItem>
                </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="#0099FF" Text="Tarih :"></asp:Label>
                <asp:TextBox  ID="txbTarih" runat="server" AutoPostBack="True" ></asp:TextBox>
                <asp:ScriptManager ID="scrptmngr" runat="server"></asp:ScriptManager>
                <br />
            <br />
            <br />
            <asp:Label ID="lblUyari" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
        
                <asp:CalendarExtender ID="calex" runat="server" OnClientDateSelectionChanged="checkDate" CssClass="calenderstyle"  TargetControlID="txbTarih" Format="dd.MM.yyyy"></asp:CalendarExtender>
                <asp:Button ID="btnSeferListele" runat="server"  Font-Bold="True" Font-Names="Times New Roman"  Text="Seferleri Listele" Height="45px" OnClick="btnSeferListele_Click" Width="150px" />
            &nbsp;</center>
        <br />
        <div style="background-color:turquoise">
            <p class="auto-style1">
&nbsp;<br />
&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <br /><center> Designed by Saliha ACAR </center>
                <br />
            <br />
                <br />
            <br />
            <br />
            </p>
        </div>
    </form>
</body>
</html>
