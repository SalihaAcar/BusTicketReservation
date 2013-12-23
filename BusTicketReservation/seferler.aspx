<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="seferler.aspx.cs" Inherits="BusTicketReservation.seferler"   %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Online Otobüs Bileti Sorgulama Sistemi</title>
</head>
<body>
    <form id="form1" runat="server">
        <center> 
        <div style="background-image:url('images/italya-otobus.jpg');background-size:contain; background-repeat:no-repeat; height: 384px; width:596px;" >
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
        </div>
        </center>
        <center> 
        <asp:Label ID="lblTarih" runat="server" Font-Bold="True"></asp:Label> </center>
        <br />
            <center> 
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" forecolor="White" BackColor="Turquoise" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" GridLines="None"  style="margin-left: 0px" Width="632px" AutoGenerateColumns="False" AllowSorting="True" EnableSortingAndPagingCallbacks="True">
                <Columns>
                    <asp:BoundField SortExpression="Kalkis" ReadOnly="true" DataField="SeferNo" HeaderText="Sefer No" /> 
                    <asp:BoundField SortExpression="Kalkis" ReadOnly="true" DataField="Kalkis" HeaderText="Kalkış" />
                    <asp:BoundField SortExpression="Varis" ReadOnly="true" DataField="Varis" HeaderText="Varış" />
                    <asp:BoundField SortExpression="Tarih" ReadOnly="true" DataField="Saat" HeaderText="Saat" />
                    <asp:BoundField SortExpression="Fiyat" ReadOnly="true" DataField="Fiyat" HeaderText="Fiyat" DataFormatString="{0:c}"/>
                    <asp:BoundField SortExpression="SeferTip" ReadOnly="true" DataField="SeferTip" HeaderText="Sefer Tipi" />
                    <asp:BoundField SortExpression="OtobusTip" ReadOnly="true" DataField="OtobusTip" HeaderText="Otobüs Tipi" />
                    <asp:ButtonField Text="Koltuk Seç" CommandName="Select" />
                </Columns>
           
            </asp:GridView> 
                </center>
        <center> 
        </center>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
            <center> 
                <asp:ImageButton ID="btnAnaSayfa" visible="false" runat="server" ImageUrl="~/resimler/anasayfa.png" OnClick="btnAnaSayfa_Click" /> &nbsp;<asp:Label ID="lblAnaSayfa" runat="server" Text="Anasayfaya Dön" Visible="False"></asp:Label>
            </center>
        </p>
        <center> 
        <p style="position: inherit; margin:auto;">&nbsp;</p>
            <p style="position: inherit; margin:auto;">&nbsp;</p>
            <p style="position: inherit; margin:auto;">&nbsp;</p>
            <p style="position: inherit; margin:auto;">&nbsp;</p>
            <p style="position: inherit; margin:auto;">Designed by Saliha ACAR
        </p>
        </center>
    </form>
</body>
</html>
