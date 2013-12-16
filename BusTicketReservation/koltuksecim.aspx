<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="koltuksecim.aspx.cs" Inherits="BusTicketReservation.koltuksecim" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="panelyolcu" runat="server" Visible="False">
            <asp:Panel ID="pnlBilgi" runat="server" BackColor="#FFFF99" Height="56px" Width="937px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label35" runat="server" BorderColor="Gray" Font-Bold="True" Font-Italic="False" Font-Names="Times New Roman" ForeColor="Black" style="margin-left:0px; margin-right:0px " Text="YOLCU BİLGİLERİ "></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label28" runat="server" Font-Bold="True" Text="Kalkış :"></asp:Label>
                &nbsp;<asp:Label ID="lblKalkis" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label29" runat="server" Font-Bold="True" Text="Varış :"></asp:Label>
                &nbsp;<asp:Label ID="lblVaris" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label31" runat="server" Font-Bold="True" Text="Bilet Fiyatı :"></asp:Label>
                &nbsp;<asp:Label ID="lblFiyat" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label32" runat="server" Font-Bold="True" Text="Sefer Tipi : "></asp:Label>
                <asp:Label ID="lblSeferTip" runat="server"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="pnlBirinciYolcu" runat="server" BackColor="#FFFF99" Height="56px" Width="937px">
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label16" runat="server" Font-Size="Small" Text="Cinsiyet:"></asp:Label>
                &nbsp;<asp:DropDownList ID="ddlCinsiyet1" runat="server" AutoPostBack="True" Height="29px" OnSelectedIndexChanged="ddlCinsiyet_SelectedIndexChanged" style="margin-bottom: 0px" Width="82px">
                    <asp:ListItem> </asp:ListItem>
                    <asp:ListItem>Bay</asp:ListItem>
                    <asp:ListItem>Bayan</asp:ListItem>
                </asp:DropDownList>
                &nbsp;<asp:Label ID="Label17" runat="server" Font-Size="Small" Text="Ad:"></asp:Label>
                &nbsp;<asp:TextBox ID="txtAd1" runat="server" Height="16px" Width="98px"></asp:TextBox>
                &nbsp;<asp:Label ID="Label18" runat="server" Font-Size="Small" Text="Soyad:"></asp:Label>
                &nbsp;<asp:TextBox ID="txtSoyad1" runat="server" Height="16px" Width="101px"></asp:TextBox>
                &nbsp;<asp:Label ID="Label19" runat="server" Font-Size="Small" Text="T.C. No:"></asp:Label>
                &nbsp;<asp:TextBox ID="txtTcNo1" runat="server" Height="16px" onkeydown="return onlyNumber(event)" Width="90px"></asp:TextBox>
                &nbsp;<asp:Label ID="Label20" runat="server" Font-Size="Small" Text="Telefon:"></asp:Label>
                &nbsp;<asp:TextBox ID="txtTel1" runat="server" Height="18px" Width="80px"></asp:TextBox>
                &nbsp;<asp:Label ID="Label33" runat="server" Font-Bold="False" Font-Size="Small" Text="Koltuk No:"></asp:Label>
                <asp:Label ID="lblKoltukNo1" runat="server" Font-Size="Small" Width="25px"></asp:Label>
                <asp:ImageButton ID="imgKapat1" runat="server" ImageUrl="~/images/kapat_buton.png" OnClick="imgKapat1_Click" style="height: 15px" />
            </asp:Panel>
            <asp:Panel ID="pnlIkinciYolcu" runat="server" BackColor="#FFFF99" Height="58px" Visible="False" Width="937px">
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label21" runat="server" Font-Size="Small" Text="Cinsiyet:"></asp:Label>
                &nbsp;<asp:DropDownList ID="ddlCinsiyet2" runat="server" AutoPostBack="True" Height="29px" OnSelectedIndexChanged="ddlCinsiyet_SelectedIndexChanged" Width="82px">
                    <asp:ListItem> </asp:ListItem>
                    <asp:ListItem>Bay</asp:ListItem>
                    <asp:ListItem>Bayan</asp:ListItem>
                </asp:DropDownList>
                &nbsp;<asp:Label ID="Label22" runat="server" Font-Size="Small" Text="Ad:"></asp:Label>
                &nbsp;<asp:TextBox ID="txtAd2" runat="server" Height="16px" Width="98px"></asp:TextBox>
                &nbsp;<asp:Label ID="Label23" runat="server" Font-Size="Small" Text="Soyad:"></asp:Label>
                &nbsp;<asp:TextBox ID="txtSoyad2" runat="server" Height="16px" Width="101px"></asp:TextBox>
                &nbsp;<asp:Label ID="Label24" runat="server" Font-Size="Small" Text="T.C. No:"></asp:Label>
                &nbsp;<asp:TextBox ID="txtTcNo2" runat="server" Height="16px" onkeydown="return onlyNumber(event)" Width="90px"></asp:TextBox>
                &nbsp;<asp:Label ID="Label25" runat="server" Font-Size="Small" Text="Telefon:"></asp:Label>
                &nbsp;<asp:TextBox ID="txtTel2" runat="server" Height="19px" Width="80px"></asp:TextBox>
                &nbsp;<asp:Label ID="Label34" runat="server" Font-Bold="False" Font-Size="Small" Text="Koltuk No:"></asp:Label>
                &nbsp;<asp:Label ID="lblKoltukNo2" runat="server" Font-Size="Small" Width="25px"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="imgKapat2" runat="server" ImageUrl="~/images/kapat_buton.png" OnClick="imgKapat2_Click" />
            </asp:Panel>
                <br />
            </asp:Panel>
    <div>
    
    </div>
    </form>
</body>
</html>
