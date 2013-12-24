<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="otobus_otomasyon.admin.admin1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            height: 30px;
        }

        .style2
        {
            width: 227px;
            background-color: #D34B3F;
        }

        .style3
        {
            background-color: #FDD2CC;
        }

        .style4
        {
            width: 227px;
            height: 186px;
            background-color: #D34B3F;
        }

        .style6
        {
            width: 18px;
            height: 19px;
        }

        .auto-style1
        {
            height: 7px;
        }
    </style>
</head>
<body alink="#00ff00">
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%; height: 634px;">
                <tr>
                    <td align="center" class="auto-style1" colspan="2"
                        style="background-color: #D34B3F; font-family: Verdana; font-size: medium; font-weight: bold;"
                        valign="top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; YÖNETİCİ İŞLEMLERİ</td>
                </tr>
                <tr>
                    <td class="style2"><asp:Button ID="btnSeferEkle" runat="server" BackColor="#FF5050" Font-Bold="True" Height="28px" Text="Sefer Ekle" Width="223px" OnClick="btnSeferEkle_Click" />
                        </td>
                    <td align="center" class="style3" rowspan="2" valign="top">
                        <asp:Panel ID="pnlEkle" runat="server" Height="302px">
                            <br />
                            <table id="tblSeferBilgi" runat="server" style="background-color: #D34B3F; height: 211px; width: 285px;">
                                <tr style="height=36px; width=70px;">
                                    <td colspan="2">
                                        <center> 
                             <asp:Label ID="baslik" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="black" Text="SEFER BİLGİLERİ :"></asp:Label>
                            </center>
                                    </td>
                                </tr>
                                <tr style="height=36px; width=70px;">
                                    <td>
                                        <asp:Label runat="server" Text="Sefer No:" Font-Bold="True" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSeferNo" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="height=36px; width=70px;">
                                    <td>
                                        <asp:Label runat="server" Text="Nereden:" Font-Bold="True" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNereden" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="height=36px; width=70px;">
                                    <td>
                                        <asp:Label runat="server" Text="Nereye:" Font-Bold="True" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNereye" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="height=36px; width=70px;">
                                    <td>
                                        <asp:Label runat="server" Text="Tarih:" Font-Bold="True" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTarih" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="height=36px; width=70px;">
                                    <td>
                                        <asp:Label runat="server" Text="Sefer Tipi:" Font-Bold="True" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSeferTip" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="height=36px; width=70px;">
                                    <td>
                                        <asp:Label runat="server" Text="Otobüs Tipi:" Font-Bold="True" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtOtobusTip" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="height=36px; width=70px;">
                                    <td>
                                        <asp:Label runat="server" Text="Fiyat:" Font-Bold="True" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFiyat" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                
                            </table>
                            <br />
                            <br />
                            <asp:Button ID="btnEkle" runat="server" Text="EKLE" BackColor="#FF5050" Font-Bold="True" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="style4" valign="top">&nbsp;<asp:Button ID="btnSilGuncelle" runat="server" BackColor="#FF5050" Font-Bold="True" Height="28px" Text="Sefer Sil/Güncelle" Width="223px" OnClick="btnSilGuncelle_Click" />
                        <br />
                        <hr style="border: thin dotted #FFFFFF" />
                        &nbsp;<asp:Button ID="btnYoneticiEkle" runat="server" BackColor="#FF5050" Font-Bold="True" Height="28px" Text="Yönetici Ekle/Sil" Width="223px" />
                        <br />
                        <hr style="border: thin dotted #FFFFFF" />
                        &nbsp;
                        </td>
                </tr>
        </div>
    </form>
</body>
</html>
