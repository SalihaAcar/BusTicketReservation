<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="koltuksecim.aspx.cs" Inherits="otobus_otomasyon.koltuksecim" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Otobüs Bileti Sorgulama Sistemi</title>
    <link type="text/css" href="CCSS/a.css" rel="stylesheet" />
    <script type="text/javascript" src="script/jquery-1.10.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.koltuk').click(function (event) {
                $(this).css('background', 'green');
                return false;
            });
        });


        function onlyNumber(e) {
            var keyCode = event.keyCode;
            if ((keyCode < 46 || keyCode > 57) && keyCode != 8 && keyCode != 9 && keyCode != 0 && keyCode != 47 && (keyCode < 96 || keyCode > 105))
            { return false; }
        }
    </script>

</head>



<body style="height: 494px">
    <form id="form1" runat="server">
        <center>
        <asp:ImageButton ID="btnAnaSayfa" runat="server" ImageUrl="~/resimler/anasayfa.png" OnClick="btnAnaSayfa_Click" />
        Anasayfa<br /> 
            <asp:Panel style=" background-position:center; background-repeat:no-repeat " ID="pnlOtobus" runat="server" BackImageUrl="~/images/mavi-otobüs.jpg"  Height="167px">
            </asp:Panel>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;KOLTUK SEÇİMİ<br />
            &nbsp;&nbsp;&nbsp; 

            <asp:Panel ID="PnlBaslik" runat="server" Height="50px" Font-Italic="True" Font-Names="Times New Roman" ForeColor="black">
                      Koltuk Bilgileri:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Boş Koltuk:&nbsp;&nbsp;
                      <asp:Image ID="ImgBosKoltuk" runat="server" Height="24px" ImageUrl="~/images/ykoltuk.png" Width="20px" />
                      &nbsp;&nbsp;&nbsp;&nbsp; Dolu Koltuk (Bay) :&nbsp;
                      <asp:Image ID="ImgDoluBay" runat="server" Height="24px" ImageUrl="~/images/bay-koltuk.png" Width="20px" />
                      &nbsp;&nbsp;&nbsp;&nbsp; Dolu Koltuk (Bayan) :&nbsp;
                      <asp:Image ID="ImgDoluBayan" runat="server" Height="24px" ImageUrl="~/images/bayan-koltuk.png" Width="20px" />
                      <br />
        
            </asp:Panel>
            </center>
        <asp:Panel ID="PnlComfortlessBus" runat="server" Visible="False">
            <div id="ComfortlessBus">
                <table style="background-color: #FFFF99">
                    <tr>
                        <td rowspan="2">
                            <asp:Image class="kapi" runat="server" ImageUrl="~/images/koltuk_kapi.png" />
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal4" class="koltuk" runat="server" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>04</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal8" class="koltuk" runat="server" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>08</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal12" class="koltuk" runat="server" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>12</p>

                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal16" class="koltuk" runat="server" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" />
                                <p>16</p>

                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal20" class="koltuk" runat="server" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>20</p>

                            </div>
                        </td>
                        <td rowspan="2">
                            <asp:Image class="kapi" runat="server" ImageUrl="~/images/koltuk_kapi.png" />
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal26" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>26</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal30" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>30</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal34" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>34</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal38" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>38</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal42" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>42</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal46" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>46</p>
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal3" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>03</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal7" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>07</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal11" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>11</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal15" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>15</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal19" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>19</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal25" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>25</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal29" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>29</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal33" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>33</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal37" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>37</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal41" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>41</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal45" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>45</p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="2">
                            <div>
                                <asp:Image ID="normalsofor" runat="server" ImageUrl="~/images/SOFOR.jpg" />
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal2" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>02</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal6" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>06</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal10" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>10</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal14" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>14</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal18" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>18</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal22" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>22</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal24" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>24</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal28" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>28</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal32" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>32</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal36" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>36</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal40" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>40</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal44" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>44</p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal1" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>01</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal5" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>05</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal9" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>09</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal13" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>13</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal17" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>17</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal21" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>21</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal23" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>23</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal27" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>27</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal31" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>31</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal35" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>35</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal39" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>39</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="normal43" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>43</p>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Panel ID="PnlComfortableBus" runat="server" Visible="False">
            <div id="ComfortableBus">
                <table style="background-color: #FFFF99">
                    <tr>
                        <td rowspan="2">
                            <asp:Image ID="Image1" class="kapi" runat="server" ImageUrl="~/images/koltuk_kapi.png" />
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat3" class="koltuk" runat="server" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>03</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat6" class="koltuk" runat="server" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>06</p>

                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat9" class="koltuk" runat="server" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" />
                                <p>09</p>

                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat12" class="koltuk" runat="server" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" />
                                <p>12</p>

                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat15" class="koltuk" runat="server" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>15</p>

                            </div>
                        </td>
                        <td rowspan="2">
                            <asp:Image ID="Image2" class="kapi" runat="server" ImageUrl="~/images/koltuk_kapi.png" />
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat19" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>19</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat22" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>22</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat25" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>25</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat28" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>28</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat31" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>31</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat34" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>34</p>
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat2" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>02</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat5" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>05</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat8" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>08</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat11" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>11</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat14" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>14</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat18" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>18</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat21" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>21</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat24" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>24</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat27" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>27</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat30" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>30</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat33" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>33</p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                        <td>
                            <div class="koridor"></div>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="2">
                            <div>
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/SOFOR.jpg" />
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat1" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>01</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat4" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>04</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat7" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>07</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat10" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>10</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat13" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>13</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat16" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>16</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat17" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>17</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat20" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>20</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat23" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>23</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat26" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>26</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat29" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>29</p>
                            </div>
                        </td>
                        <td>
                            <div class="koltuk">
                                <asp:ImageButton ID="rahat32" runat="server" class="koltuk" ImageUrl="~/images/ykoltuk.png" OnClick="imgswitch" /><p>32</p>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <br />
        <center>
        
            <br />
        <center> 
            <asp:Panel ID="pnlYolcular" runat="server" Height="216px" Visible="False" Width="1004px">
                <asp:Panel ID="pnlBilgi" runat="server" Height="59px" BackColor="#FFFF99" Width="937px">
            <asp:Label style="margin-left:0px; margin-right:0px " ID="Label27" runat="server" Font-Bold="True" Font-Italic="False" ForeColor="Black" Text="YOLCU BİLGİLERİ " BorderColor="Gray" Font-Names="Times New Roman"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label28" runat="server" Font-Bold="True" Text="Kalkış :"></asp:Label>
                &nbsp;<asp:Label ID="lblKalkis" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label29" runat="server" Font-Bold="True" Text="Varış :"></asp:Label>
                &nbsp;<asp:Label ID="lblVaris" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label31" runat="server" Font-Bold="True" Text="Bilet Fiyatı :"></asp:Label>
                &nbsp;<asp:Label ID="lblFiyat" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label32" runat="server" Font-Bold="True" Text="Sefer Tipi : "></asp:Label>
                <asp:Label ID="lblSeferTip" runat="server"></asp:Label>
                <br />
     
       
                <asp:Panel ID="pnlBirinciYolcu" runat="server" BackColor="#FFFF99" Height="76px" Width="937px">
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;<asp:Label ID="Label16" runat="server" Font-Size="Small" Text="Cinsiyet:"></asp:Label>
                    &nbsp;<asp:DropDownList ID="ddlCinsiyet1" runat="server" AutoPostBack="True" Height="36px" OnSelectedIndexChanged="ddlCinsiyet1_SelectedIndexChanged" style="margin-bottom: 0px" Width="82px">
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
                    &nbsp;<asp:Label ID="lblKoltukNo1" runat="server" Font-Size="Small" Width="25px"></asp:Label>
                    &nbsp;&nbsp;&nbsp; <asp:ImageButton ID="imgKapat1" runat="server" OnClick="imgKapat1_Click" ImageUrl="~/images/kapat_buton.png" style="height: 15px" />
                    &nbsp;<asp:ImageButton ID="imgYazdir1" runat="server" Height="20px" ImageUrl="~/images/yazici.jpg" OnClick="imgYazdir1_Click" Visible="False" Width="25px" />
                </asp:Panel>
                <asp:Panel ID="pnlIkinciYolcu" runat="server" BackColor="#FFFF99" Height="58px" Visible="False" Width="937px">
                    <br />
                    &nbsp;&nbsp;<asp:Label ID="Label21" runat="server" Font-Size="Small" Text="Cinsiyet:"></asp:Label>
                    &nbsp;<asp:DropDownList ID="ddlCinsiyet2" runat="server" AutoPostBack="True" Height="29px" OnSelectedIndexChanged="ddlCinsiyet2_SelectedIndexChanged" Width="82px">
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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:ImageButton ID="imgKapat2" runat="server" OnClick="imgKapat2_Click" ImageUrl="~/images/kapat_buton.png" />
                    &nbsp;<asp:ImageButton ID="imgYazdir2" runat="server" Height="20px" ImageUrl="~/images/yazici.jpg" OnClick="imgYazdir2_Click" Visible="False" Width="25px" />
                </asp:Panel>

 </asp:Panel>
            </asp:Panel>

  </center>
            </center>
            <br />
        <center> 
        <asp:Label ID="lblSonucBasarili" runat="server" Text="İşlem başarıyla gerçekleştirilmiştir...Bileti yazdırmak için Yazdır ikonuna basınız..." Visible="False" Font-Bold="True" ForeColor="Blue"></asp:Label>

        <asp:HiddenField ID="hdn2" runat="server" />
        <asp:HiddenField ID="hdn1" runat="server" />
        <asp:CompareValidator ID="cmvTcNo1" runat="server" ControlToValidate="txtTcNo1" ErrorMessage="Geçersiz bir kimlik no girdiniz..." Font-Bold="True" ForeColor="Red" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
        <br /> 
        <asp:CompareValidator ID="cmvTel" runat="server" ControlToValidate="txtTel1" ErrorMessage="Geçersiz bir telefon numarası girdiniz..." Font-Bold="True" ForeColor="Red" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
        <br />
        </center>

        <br />
        <asp:Panel ID="pnlButonlar" runat="server" Height="28px" Visible="False">
            <center style="height: 29px">
                <asp:Button ID="btnIptal" runat="server" Font-Bold="True" OnClick="btnIptal_Click" Text="&lt; İptal" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSatinAl" runat="server" Font-Bold="True" Height="27px" OnClick="btnSatinAl_Click" Text="Satın Al &gt;" Width="72px" />
            </center>
        </asp:Panel>
        <br />
        <br />
    </form>
</body>
</html>
