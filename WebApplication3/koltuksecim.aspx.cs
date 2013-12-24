using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace otobus_otomasyon
{
    public partial class koltuksecim : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"data source=.\SQLEXPRESS; initial catalog=otobus;integrated security=true;");
        DataTable table = new DataTable(); // Bir tane tablo tutar.
        protected void Page_Load(object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand("Select * from seferliste where SeferNo=@SeferNo", con);
            string tmp = Request.QueryString["SeferNo"].ToString();
            cmd.Parameters.AddWithValue("@SeferNo", Request.QueryString["SeferNo"].ToString());
            SqlDataAdapter d = new SqlDataAdapter(cmd);
            d.Fill(table);
            if (con.State == ConnectionState.Closed)
                con.Open();
            if (table.Rows.Count > 0)
            {
                lblKalkis.Text = table.Rows[0]["Kalkis"].ToString();
                lblVaris.Text = table.Rows[0]["Varis"].ToString();
                lblFiyat.Text = String.Format("{0:c}", table.Rows[0]["Fiyat"]);
                lblSeferTip.Text = table.Rows[0]["SeferTip"].ToString();

                if (lblSeferTip.Text == "Normal")
                {
                    PnlComfortlessBus.Visible = true;
                    if (con.State == ConnectionState.Closed)
                        con.Open();
                    SqlCommand kmt = new SqlCommand("SELECT * FROM yolcubilgi WHERE SeferNo=@SeferNo", con);
                    kmt.Parameters.AddWithValue("@SeferNo", Request.QueryString["SeferNo"]);
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = kmt;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (dt.Rows[i]["cinsiyet"].ToString() == "Bay")
                            {
                                ((ImageButton)Page.FindControl("normal" + dt.Rows[i]["koltukno"].ToString())).ImageUrl = "~/images/bay-koltuk.png";
                                ((ImageButton)Page.FindControl("normal" + dt.Rows[i]["koltukno"].ToString())).Enabled = false;
                                ((ImageButton)Page.FindControl("normal" + dt.Rows[i]["koltukno"].ToString())).Height = 45 ;
                                ((ImageButton)Page.FindControl("normal" + dt.Rows[i]["koltukno"].ToString())).Width = 45;
                                
                            }
                            else if (dt.Rows[0]["cinsiyet"].ToString() == "Bayan")
                            {
                                ((ImageButton)Page.FindControl("normal" + dt.Rows[i]["koltukno"].ToString())).ImageUrl = "~/images/bayan-koltuk.png";
                                ((ImageButton)Page.FindControl("normal" + dt.Rows[i]["koltukno"].ToString())).Enabled = false;
                                ((ImageButton)Page.FindControl("normal" + dt.Rows[i]["koltukno"].ToString())).Height = 45;
                                ((ImageButton)Page.FindControl("normal" + dt.Rows[i]["koltukno"].ToString())).Width = 45;
                            }
                        }
                    }
                }
                else if (lblSeferTip.Text == "Rahat")
                {
                    PnlComfortableBus.Visible = true;
                    if (con.State == ConnectionState.Closed)
                        con.Open();
                    SqlCommand kmt = new SqlCommand("SELECT * FROM yolcubilgi WHERE SeferNo=@SeferNo", con);
                    kmt.Parameters.AddWithValue("@SeferNo", Request.QueryString["SeferNo"]);

                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = kmt;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (dt.Rows[i]["cinsiyet"].ToString() == "Bay")
                            {
                                ((ImageButton)Page.FindControl("rahat" + dt.Rows[i]["koltukno"].ToString())).ImageUrl = "~/images/bay-koltuk.png";
                                ((ImageButton)Page.FindControl("rahat" + dt.Rows[i]["koltukno"].ToString())).Enabled = false;
                                ((ImageButton)Page.FindControl("rahat" + dt.Rows[i]["koltukno"].ToString())).Height = 45;
                                ((ImageButton)Page.FindControl("rahat" + dt.Rows[i]["koltukno"].ToString())).Width = 45;
                            }
                            else if (dt.Rows[i]["cinsiyet"].ToString() == "Bayan")
                            {
                                ((ImageButton)Page.FindControl("rahat" + dt.Rows[i]["koltukno"].ToString())).ImageUrl = "~/images/bayan-koltuk.png";
                                ((ImageButton)Page.FindControl("rahat" + dt.Rows[i]["koltukno"].ToString())).Enabled = false;
                                ((ImageButton)Page.FindControl("rahat" + dt.Rows[i]["koltukno"].ToString())).Height = 45;
                                ((ImageButton)Page.FindControl("rahat" + dt.Rows[i]["koltukno"].ToString())).Width = 45;
                            }
                        }
                    }

                }


            }
        }
        protected void btnAnaSayfa_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("anasayfa.aspx");
        }

        protected void btnGeri_Click(object sender, EventArgs e)
        {
            Response.Redirect("seferler.aspx");
        }

        protected void btnSatinAl_Click(object sender, EventArgs e)
        {
            try
            {
                 if (pnlBirinciYolcu.Visible == true)
                {
                    if (txtAd1.Text.Length > 0 && txtSoyad1.Text.Length > 0 && txtTcNo1.Text.Length > 0 && txtTel1.Text.Length > 0)
                    {
                        if (con.State == ConnectionState.Closed)
                            con.Open();
                        SqlCommand cmd = new SqlCommand("insert into yolcular(tc, SeferNo,Ad,Soyad,Tel, cinsiyet,koltukno) values(@tc, @SeferNo,@Ad,@Soyad,@Tel,@cinsiyet,@koltukno) select @@IDENTITY", con);
           
                        cmd.Parameters.AddWithValue("@tc", txtTcNo1.Text);
                        cmd.Parameters.AddWithValue("@SeferNo", Request.QueryString["SeferNo"]);
                        cmd.Parameters.AddWithValue("@Ad", txtAd1.Text);
                        cmd.Parameters.AddWithValue("@Soyad", txtSoyad1.Text);
                        string cinsiyet = "";
                        if (ddlCinsiyet1.SelectedValue == "Bay")
                            cinsiyet = "Bay";
                        if (ddlCinsiyet1.SelectedValue == "Bayan")
                            cinsiyet = "Bayan";
                        cmd.Parameters.AddWithValue("@Tel", txtTel1.Text.ToString());
                        cmd.Parameters.AddWithValue("@cinsiyet", cinsiyet);
                        cmd.Parameters.AddWithValue("@koltukno", lblKoltukNo1.Text.ToString());
                        object id = cmd.ExecuteScalar();
                        cmd.Dispose();
                        con.Close();
                        hdn1.Value = id.ToString();
                    }
                 }
              
                if (pnlIkinciYolcu.Visible == true)
                {
                    if (txtAd2.Text.Length > 0 && txtSoyad2.Text.Length > 0 && txtTcNo2.Text.Length > 0 && txtTel2.Text.Length > 0)
                    {
                        if (con.State == ConnectionState.Closed)
                            con.Open();
                        SqlCommand cmd = new SqlCommand("insert into yolcular(tc, SeferNo,Ad,Soyad,Tel, cinsiyet,koltukno) values(@tc, @SeferNo,@Ad,@Soyad,@Tel,@cinsiyet,@koltukno) select @@IDENTITY", con);
           
                        cmd.Parameters.AddWithValue("@tc", txtTcNo2.Text);
                        cmd.Parameters.AddWithValue("@SeferNo", Request.QueryString["SeferNo"]);
                        cmd.Parameters.AddWithValue("@Ad", txtAd2.Text);
                        cmd.Parameters.AddWithValue("@Soyad", txtSoyad2.Text);
                        string cinsiyet = "";
                        if (ddlCinsiyet2.SelectedValue == "Bay")
                            cinsiyet = "Bay";
                        if (ddlCinsiyet2.SelectedValue == "Bayan")
                            cinsiyet = "Bayan";
                        cmd.Parameters.AddWithValue("@Tel", txtTel2.Text.ToString());
                        cmd.Parameters.AddWithValue("@cinsiyet", cinsiyet);
                        cmd.Parameters.AddWithValue("@koltukno", lblKoltukNo2.Text.ToString());
                        object id = cmd.ExecuteScalar();
                        cmd.Dispose();
                        con.Close();
                        hdn2.Value = id.ToString();
                    }
                }
                lblSonucBasarili.Visible = true;
                imgYazdir1.Visible = true;
                imgYazdir2.Visible = true;
            }
           
            catch(Exception ex)
            {
            }
                 
        }


        protected void imgswitch(object sender, ImageClickEventArgs e)
        {
            lblFiyat.Text = Request.QueryString["fiyat"];
            lblKalkis.Text = Request.QueryString["Kalkis"];
            lblVaris.Text = Request.QueryString["Varis"];
            pnlYolcular.Visible = true;
            txtTcNo1.MaxLength = 11;
            txtTel1.MaxLength = 11;
            if (pnlButonlar.Visible == false) pnlButonlar.Visible = true;
            if (lblKoltukNo1.Text != "")
            {
                pnlIkinciYolcu.Visible = true;
                txtTcNo2.MaxLength = 11;
                txtTel2.MaxLength = 11;
                ddlCinsiyet2.Items.Clear();
                #region cinsiyetbelirle
                if (PnlComfortableBus.Visible == true)
                {
                    #region koltuk1
                    for (int t = 2; t <= 14; t += 3)
                    {
                        if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png" || ((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                        {
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t + 1).ToString()))
                                {
                                    
                                     ddlCinsiyet2.Items.Add("Bay");
                                    

                                }
                            }
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t + 1).ToString()))
                                {
                                    
                                     ddlCinsiyet2.Items.Add("Bayan");

                                }
                            }
                        }

                    }
                    #endregion
                    #region koltuk2
                    for (int t = 3; t <= 15; t += 3)
                    {
                        if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png" || ((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                        {
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t - 1).ToString()))
                                {
                                    
                                     ddlCinsiyet2.Items.Add("Bay");

                                }
                            }
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t - 1).ToString()))
                                {
                                    
                                     ddlCinsiyet2.Items.Add("Bayan");


                                }
                            }
                        }

                    }
                    #endregion
                    #region koltuk3
                    for (int t = 18; t <= 33; t += 3)
                    {
                        if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png" || ((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                        {
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t + 1).ToString()))
                                {
                                   
                                     ddlCinsiyet2.Items.Add("Bay");
                                }
                            }
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t + 1).ToString()))
                                {
                                   
                                     ddlCinsiyet2.Items.Add("Bayan");

                                }
                            }
                        }

                    }
                    #endregion
                    #region koltuk4
                    for (int t = 19; t <= 34; t += 3)
                    {
                        if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png" || ((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                        {
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t - 1).ToString()))
                                {
                                    
                                     ddlCinsiyet2.Items.Add("Bay");
                                }
                            }
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t - 1).ToString()))
                                {
                                    
                                     ddlCinsiyet2.Items.Add("Bayan");

                                }
                            }
                        }

                    }
                    #endregion
                }
                else if (PnlComfortlessBus.Visible == true)
                {
                    #region koltuk1
                    for (int t = 1; t <= 46; t += 2)
                    {
                        if (((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bay-koltuk.png" || ((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                        {
                            if (((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bay-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("normal" + (t + 1).ToString()))
                                {

                                    ddlCinsiyet2.Items.Add("Bay");

                                }
                            }
                            if (((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("normal" + (t + 1).ToString()))
                                {

                                    ddlCinsiyet2.Items.Add("Bayan");

                                }
                            }

                        }
                    }
                    #endregion
                    #region koltuk2
                    for (int t = 2; t <= 46; t += 2)
                    {
                        if (((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bay-koltuk.png" || ((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                        {
                            if (((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bay-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("normal" + (t - 1).ToString()))
                                {

                                    ddlCinsiyet2.Items.Add("Bay");

                                }
                            }
                            if (((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("normal" + (t - 1).ToString()))
                                {

                                    ddlCinsiyet2.Items.Add("Bayan");

                                }
                            }
                        }
                    }
                    #endregion
                }
                #endregion
                #region cinsiyetdoldur
                if (ddlCinsiyet2.Items.Count == 0)
                {

                    ddlCinsiyet2.Items.Add("Bay");
                    ddlCinsiyet2.Items.Add("Bayan");
                }
                #endregion
                #region koltukdoldur
                if (PnlComfortlessBus.Visible == true)
                {
                    lblKoltukNo2.Text = ((ImageButton)sender).ID.Replace("normal", "");
                   
                }
                else if (PnlComfortableBus.Visible == true)
                {
                    lblKoltukNo2.Text = ((ImageButton)sender).ID.Replace("rahat", "");
                   
                }
                #endregion
                ddlCinsiyet2.Height = 29;
                ddlCinsiyet2.Items.Add("--Seçiniz--");
                ddlCinsiyet2.SelectedValue = "--Seçiniz--";
            }
            else
            {
                pnlBirinciYolcu.Visible = true;
                ddlCinsiyet1.Items.Clear();
                #region cinsiyetbelirle
                if (PnlComfortableBus.Visible == true)
                {
                    #region koltuk1
                    for (int t = 2; t <= 14; t += 3)
                    {
                        if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png" || ((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                        {
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t + 1).ToString()))
                                {
                                    
                                     ddlCinsiyet1.Items.Add("Bay");
                                    

                                }
                            }
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t + 1).ToString()))
                                {
                                    
                                     ddlCinsiyet1.Items.Add("Bayan");

                                }
                            }
                        }

                    }
                    #endregion
                    #region koltuk2
                    for (int t = 3; t <= 15; t += 3)
                    {
                        if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png" || ((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                        {
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t - 1).ToString()))
                                {
                                    
                                     ddlCinsiyet1.Items.Add("Bay");

                                }
                            }
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t - 1).ToString()))
                                {
                                    
                                     ddlCinsiyet1.Items.Add("Bayan");


                                }
                            }
                        }

                    }
                    #endregion
                    #region koltuk3
                    for (int t = 18; t <= 33; t += 3)
                    {
                        if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png" || ((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                        {
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t + 1).ToString()))
                                {
                                   
                                     ddlCinsiyet1.Items.Add("Bay");
                                }
                            }
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t + 1).ToString()))
                                {
                                   
                                     ddlCinsiyet1.Items.Add("Bayan");

                                }
                            }
                        }

                    }
                    #endregion
                    #region koltuk4
                    for (int t = 19; t <= 34; t += 3)
                    {
                        if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png" || ((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                        {
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bay-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t - 1).ToString()))
                                {
                                    
                                     ddlCinsiyet1.Items.Add("Bay");
                                }
                            }
                            if (((ImageButton)Page.FindControl("rahat" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("rahat" + (t - 1).ToString()))
                                {
                                    
                                     ddlCinsiyet1.Items.Add("Bayan");

                                }
                            }
                        }

                    }
                    #endregion
                }
                else if (PnlComfortlessBus.Visible == true)
                {
                    #region koltuk1
                    for (int t = 1; t <= 46; t += 2)
                    {
                        if (((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bay-koltuk.png" || ((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                        {
                            if (((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bay-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("normal" + (t + 1).ToString()))
                                {
                                    
                                     ddlCinsiyet1.Items.Add("Bay");

                                }
                            }
                            if (((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("normal" + (t + 1).ToString()))
                                {
                                    
                                     ddlCinsiyet1.Items.Add("Bayan");

                                }
                            }

                        }
                    }
                    #endregion
                    #region koltuk2
                    for (int t = 2; t <= 46; t += 2)
                    {
                        if (((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bay-koltuk.png" || ((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                        {
                            if (((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bay-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("normal" + (t - 1).ToString()))
                                {
                                    
                                     ddlCinsiyet1.Items.Add("Bay");

                                }
                            }
                            if (((ImageButton)Page.FindControl("normal" + t)).ImageUrl == "~/images/bayan-koltuk.png")
                            {
                                if (((ImageButton)sender).ID == ("normal" + (t - 1).ToString()))
                                {
                                    
                                     ddlCinsiyet1.Items.Add("Bayan");

                                }
                            }
                        }
                    }
                    #endregion

                }
                #endregion               
                #region cinsiyetdoldur
                if (ddlCinsiyet1.Items.Count == 0)
                {

                    ddlCinsiyet1.Items.Add("Bay");
                    ddlCinsiyet1.Items.Add("Bayan");
                }
                #endregion
                #region koltukdoldur
                if (PnlComfortlessBus.Visible == true)
                {
                    lblKoltukNo1.Text = ((ImageButton)sender).ID.Replace("normal", "");
                
                }
                else if (PnlComfortableBus.Visible == true)
                {
                    lblKoltukNo1.Text = ((ImageButton)sender).ID.Replace("rahat", "");
                   
                }
                #endregion
                ddlCinsiyet1.Height = 29;
                ddlCinsiyet1.Items.Add("--Seçiniz--");
                ddlCinsiyet1.SelectedValue = "--Seçiniz--";
            }
            lblFiyat.Text = Request.QueryString["fiyat"];
            lblKalkis.Text = Request.QueryString["Kalkis"];
            lblVaris.Text = Request.QueryString["Varis"];

        }

        private void txtTcNo_Changed(object sender, EventArgs e)
        {
            decimal cost = 9999;
            txtTcNo1.Text = string.Format("{0:c}", cost);
        }
        protected void ddlCinsiyet1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (PnlComfortlessBus.Visible == true)
            {
                if (ddlCinsiyet1.SelectedValue == "Bay")
                    ((ImageButton)Page.FindControl("normal" + lblKoltukNo1.Text)).ImageUrl = "~/images/bay-koltuk.png";
                else if (ddlCinsiyet1.SelectedValue == "Bayan")
                    ((ImageButton)Page.FindControl("normal" + lblKoltukNo1.Text)).ImageUrl = "~/images/bayan-koltuk.png";
            }
            else if (PnlComfortableBus.Visible == true)
            {
                if (ddlCinsiyet1.SelectedValue == "Bay")
                    ((ImageButton)Page.FindControl("rahat" + lblKoltukNo1.Text)).ImageUrl = "~/images/bay-koltuk.png";
                else if (ddlCinsiyet1.SelectedValue == "Bayan")
                    ((ImageButton)Page.FindControl("rahat" + lblKoltukNo1.Text)).ImageUrl = "~/images/bayan-koltuk.png";
            }
        }

        protected void btnIptal_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("seferler.aspx");
        }

        protected void imgKapat1_Click(object sender, ImageClickEventArgs e)
        {
            if (PnlComfortlessBus.Visible == true)
            {
                ((ImageButton)Page.FindControl("normal" + lblKoltukNo1.Text)).ImageUrl = "~/images/ykoltuk.png";
                ((ImageButton)Page.FindControl("normal" + lblKoltukNo1.Text)).Enabled = true;
                ((ImageButton)Page.FindControl("normal" + lblKoltukNo1.Text)).Height = 45;
                ((ImageButton)Page.FindControl("normal" + lblKoltukNo1.Text)).Width = 45;
            }
            else
            {
                ((ImageButton)Page.FindControl("rahat" + lblKoltukNo1.Text)).ImageUrl = "~/images/ykoltuk.png";
                ((ImageButton)Page.FindControl("rahat" + lblKoltukNo1.Text)).ImageUrl = "~/images/ykoltuk.png";
                ((ImageButton)Page.FindControl("rahat" + lblKoltukNo1.Text)).Enabled = true;
                ((ImageButton)Page.FindControl("rahat" + lblKoltukNo1.Text)).Height = 45;
                ((ImageButton)Page.FindControl("rahat" + lblKoltukNo1.Text)).Width = 45;
            }

            pnlBirinciYolcu.Visible = false;
            pnlIkinciYolcu.Visible = false;
            pnlButonlar.Visible = false;

        }

        protected void imgKapat2_Click(object sender, ImageClickEventArgs e)
        {
            if (PnlComfortlessBus.Visible == true)
            {
                ((ImageButton)Page.FindControl("normal" + lblKoltukNo2.Text)).ImageUrl = "~/images/ykoltuk.png";
                ((ImageButton)Page.FindControl("normal" + lblKoltukNo2.Text)).Enabled = true;
                ((ImageButton)Page.FindControl("normal" + lblKoltukNo2.Text)).Height = 45;
                ((ImageButton)Page.FindControl("normal" + lblKoltukNo2.Text)).Width = 45;
            }
            else
            {
                ((ImageButton)Page.FindControl("rahat" + lblKoltukNo2.Text)).ImageUrl = "~/images/ykoltuk.png";
                ((ImageButton)Page.FindControl("rahat" + lblKoltukNo2.Text)).ImageUrl = "~/images/ykoltuk.png";
                ((ImageButton)Page.FindControl("rahat" + lblKoltukNo2.Text)).Enabled = true;
                ((ImageButton)Page.FindControl("rahat" + lblKoltukNo2.Text)).Height = 45;
                ((ImageButton)Page.FindControl("rahat" + lblKoltukNo2.Text)).Width = 45;
            }

            
            pnlIkinciYolcu.Visible = false;
           
        }

        protected void imgYazdir1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("sonadim.aspx?yolcuid=" + hdn1.Value + "");
        }

        protected void imgYazdir2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("sonadim.aspx?yolcuid=" + hdn2.Value + "");
        }

        protected void ddlCinsiyet2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (PnlComfortlessBus.Visible == true)
            {
                if (ddlCinsiyet2.SelectedValue == "Bay")
                    ((ImageButton)Page.FindControl("normal" + lblKoltukNo2.Text)).ImageUrl = "~/images/bay-koltuk.png";
                else if (ddlCinsiyet2.SelectedValue == "Bayan")
                    ((ImageButton)Page.FindControl("normal" + lblKoltukNo2.Text)).ImageUrl = "~/images/bayan-koltuk.png";
            }
            else if (PnlComfortableBus.Visible == true)
            {
                if (ddlCinsiyet2.SelectedValue == "Bay")
                    ((ImageButton)Page.FindControl("rahat" + lblKoltukNo2.Text)).ImageUrl = "~/images/bay-koltuk.png";
                else if (ddlCinsiyet2.SelectedValue == "Bayan")
                    ((ImageButton)Page.FindControl("rahat" + lblKoltukNo2.Text)).ImageUrl = "~/images/bayan-koltuk.png";
            }
        }

    }
}