<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="otobus_otomasyon.admin.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/css">
        font-family:Arial, Helvetica, sans-serif;
        margin-top:20px;
        margin-bottom:40px;
	    background:url(/images/admin.jpg) center top white no-repeat fixed;
        line-height:12px;    
    </script>
    <style type="text/css">
        .auto-style1
        {
            width: 31%;
        }
        .auto-style2
        {
            width: 143px;
        }
        .auto-style3
        {
            width: 183px;
        }
        #form1
        {
            height: 287px;
        }
    </style>
</head>
<body >

    <form id="form1" runat="server">
        <br />
        <br />
        <center> 
        <table class="auto-style1" border="0">
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Label ID="lblBaslik" runat="server" Font-Bold="True" Text="YÖNETİCİ GİRİŞİ"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Image ID="imgAdmin" runat="server" ImageUrl="~/images/Admin2.png" Height="57px" Width="64px"  />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="lblAd" runat="server" Text="Yönetici Adı"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAd" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/kilit.gif" />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="lblSifre" runat="server" Text="Şifre"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtSifre" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2" style="text-align:center">
                    <asp:Button ID="btnGiris" runat="server" Font-Bold="True" Text="GİRİŞ" OnClick="btnGiris_Click"  />
                </td>
            </tr>
        </table>
            <br />
            <asp:Label ID="lblUyari" runat="server" Text="" ForeColor="Red"></asp:Label>
       </center>
    </form>
</body>
</html>
