<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="seferler.aspx.cs" Inherits="BusTicketReservation.seferler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
        <center>
            <div style="background-image: url('http://localhost:49219/images/italya-otobus.jpg'); background-size: contain; background-repeat: no-repeat; height: 384px; width: 596px;">
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
            <asp:Label ID="lblTarih" runat="server" Font-Bold="True"></asp:Label>
        </center>
        <br />
        <center>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="Turquoise" CellPadding="4" EnableSortingAndPagingCallbacks="True" forecolor="White" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="margin-left: 0px" Width="632px">
                <Columns>
                    <asp:BoundField DataField="SeferNo" HeaderText="Sefer No" ReadOnly="true" SortExpression="Kalkis" />
                    <asp:BoundField DataField="Kalkis" HeaderText="Kalkış" ReadOnly="true" SortExpression="Kalkis" />
                    <asp:BoundField DataField="Varis" HeaderText="Varış" ReadOnly="true" SortExpression="Varis" />
                    <asp:BoundField DataField="Saat" HeaderText="Saat" ReadOnly="true" SortExpression="Tarih" />
                    <asp:BoundField DataField="Fiyat" DataFormatString="{0:c}" HeaderText="Fiyat" ReadOnly="true" SortExpression="Fiyat" />
                    <asp:BoundField DataField="SeferTip" HeaderText="Sefer Tipi" ReadOnly="true" SortExpression="SeferTip" />
                    <asp:BoundField DataField="OtobusTip" HeaderText="Otobüs Tipi" ReadOnly="true" SortExpression="OtobusTip" />
                    <asp:ButtonField CommandName="Select" Text="Koltuk Seç" />
                </Columns>
            </asp:GridView>
        </center>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <center>
            <p style="position: inherit; margin:auto;">
                Designed by Saliha ACAR
            </p>
        </center>
    </form>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
