<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="anasayfa.aspx.cs" Inherits="BusTicketReservation.anasayfa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
        <center>
            <div style="background-color:turquoise">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <b style="font-size:large ; color:white ">ONLINE OTOBÜS BİLETİ SORGULAMA SİSTEMİ</b>
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#0066FF" Text="Kalkış : "></asp:Label>
            <asp:DropDownList ID="ddLtNereden" runat="server" AppendDataBoundItems="true" AutoPostBack="true" Height="32px" OnSelectedIndexChanged="ddLtNereden_SelectedIndexChanged">
                <asp:ListItem>--Seçiniz--</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#0099FF" Text="Varış :"></asp:Label>
            <asp:DropDownList ID="ddLtNereye" runat="server" AppendDataBoundItems="false" AutoPostBack="true" Height="32px" OnSelectedIndexChanged="ddLtNereye_SelectedIndexChanged">
                <asp:ListItem>--Seçiniz-- </asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="#0099FF" Text="Tarih :"></asp:Label>
            <asp:TextBox ID="txbTarih" runat="server"></asp:TextBox>
            <asp:ScriptManager ID="scrptmngr" runat="server">
            </asp:ScriptManager>
            <br />
            <br />
            <br />
            <asp:Label ID="lblUyari" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="btnSeferListele" runat="server" Font-Bold="True" Font-Names="Times New Roman" Height="45px" OnClick="btnSeferListele_Click" Text="Seferleri Listele" Width="150px" />
        </center>
        <br />
        <div style="background-color:turquoise">
            <p class="auto-style1">
                &nbsp;<br />
&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <br />
            </p>
            <center>
                Designed by Saliha ACAR </center>
            <br />
            <br />
            <br />
            <br />
            <br />
            </p>
        </div>
    </form>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
