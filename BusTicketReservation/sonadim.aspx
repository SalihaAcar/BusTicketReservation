<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sonadim.aspx.cs" Inherits="otobus_otomasyon.sonadim" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js">     
    </script>
   <script type="text/javascript">
       function tcDogrula(source, args) {
           var tcno = args.Value;
           if (tcno.Length != 11) {
               args.IsValid = false;
               return;
           }
           var sonHane = Convert.ToInt32(tcno.Substring(10));
           if (sonHane % 2 == 1) {
               args.IsValid = false;
               return;
           }
           var ilk10hane = tcno.Substring(0, 10);
           var toplam = 0;
           for (var ch in ilk10hane) {
               toplam += parseInt(ilk10hane[ch]);
           }
           if (toplam % 10 == sonHane) {
               args.IsValid = true;
           }
           else {
               args.IsValid = false;
           }
       }
       </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center> 
        <asp:Panel ID="pnlSonAdim" runat="server" Height="383px" Font-Italic="True" >
            <div id="SonAdim"> 
                <br />
                <br />
                <table id="Table1" runat="server" style="background-color: #FFFF99; height: 211px; width: 285px;" >
                    <tr style="height=36px; width=70px; ">
                        <td colspan="2" >
                            <center> 
                             <asp:Label ID="baslik" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="turquoise" Text="YOLCU BİLGİLERİ :"></asp:Label>
                            </center>
                              </td>
                    </tr>
                    <tr>
                        <td> </td>
                    </tr>
                    <tr style="height=36px; width=70px; ">
                        <td >
                            <asp:Label runat="server" ID="Kalkis" text="Kalkış:"  Font-Bold="True" />
                        </td>
                        <td> 
                            <asp:Label runat="server" ID="lblNereden" />
                        </td>
                    </tr>
                    <tr style="height=36px; width=70px; "> 
                        <td >
                            <asp:Label runat="server"  text="Varış:" ID="Varis"  Font-Bold="True" />
                        </td>
                        <td> 
                            <asp:Label runat="server" ID="lblNereye" />
                        </td>
                     </tr>
                    <tr style="height=36px; width=70px; "> 
                        <td >
                            <asp:Label runat="server" text="Tarih:" ID="Tarih"  Font-Bold="True" />
                        </td>
                        <td> 
                            <asp:Label runat="server" ID="lblTarih" />
                        </td>
                    </tr>
                    <tr style="height=36px; width=70px; "> 
                        <td >
                            <asp:Label runat="server" text="Saat:" ID="Saat"  Font-Bold="True" />
                        </td>
                        <td> 
                            <asp:Label runat="server" ID="lblSaat" />
                        </td>
                    </tr>
                    <tr style="height=36px; width=70px; ">
                        <td >
                            <asp:Label runat="server" text="Ad:" ID="Ad" Font-Bold="True" />
                        </td>
                        <td> 
                            <asp:Label runat="server" ID="lblAd" />
                        </td>
                    </tr>
                    <tr style="height=36px; width=70px; "> 
                        <td >
                            <asp:Label runat="server" Text="Soyad:" ID="Soyad"  Font-Bold="True" />
                        </td>
                        <td> 
                            <asp:Label runat="server" ID="lblSoyad" />
                        </td>
                    </tr>
                    <tr style="height=36px; width=70px; "> 
                        <td >
                            <asp:Label runat="server" text="Telefon:" ID="Telefon"  Font-Bold="True" />
                        </td>
                        <td> 
                            <asp:Label runat="server" ID="lblTel" />
                        </td>
                    </tr>
                    <tr style="height=36px; width=70px; "> 
                        <td >
                            <asp:Label runat="server" text="Koltuk No:" ID="Koltuk" Font-Bold="True" />
                        </td>
                        <td> 
                            <asp:Label runat="server" ID="lblKoltukNo" />
                        </td>
                    </tr>
                    <tr style="height=36px; width=70px; "> 
                        <td >
                            <asp:Label runat="server" text="Toplam Fiyat:" ID="Fiyat"  Font-Bold="True" />
                        </td>
                        <td> 
                            <asp:Label runat="server" ID="lblTopFiyat" />
                        </td>
                        </tr>
                    </table>
            </div>
            <br />
            <br />
            <input id="btnYazdir" type="button" value="Yazdır" onclick="window.print();" name="Yazdir"  />
        </asp:Panel>
    </center>
    </div>
    </form>
</body>
</html>
