using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing.Imaging;


namespace BusTicketReservation
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
                    SqlCommand kmt = new SqlCommand("SELECT koltukno,cinsiyet FROM yolcubilgi WHERE SeferNo=@SeferNo", con);
                    kmt.Parameters.AddWithValue("@SeferNo", Session["SeferNo"].ToString());
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = kmt;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        if (dt.Rows[0]["cinsiyet"].ToString() == "Bay")
                            ((ImageButton)Page.FindControl("normal" + dt.Rows[0]["koltukno"].ToString())).ImageUrl = "~images/bay-koltuk.png";
                        if (dt.Rows[0]["cinsiyet"].ToString() == "Bayan")
                            ((ImageButton)Page.FindControl("normal" + dt.Rows[0]["koltukno"].ToString())).ImageUrl = "~images/bayan-koltuk.png";
                        ((ImageButton)Page.FindControl("normal" + dt.Rows[0]["koltukno"].ToString())).Enabled = false;
                    }
                }
                else if (lblSeferTip.Text == "Rahat")
                {
                    PnlComfortableBus.Visible = true;
                    if (con.State == ConnectionState.Closed)
                        con.Open();
                    SqlCommand kmtt = new SqlCommand("SELECT koltukno,cinsiyet FROM yolcubilgi WHERE SeferNo=@SeferNo", con);
                    kmtt.Parameters.AddWithValue("@SeferNo", Session["SeferNo"].ToString());
                    SqlDataAdapter daa = new SqlDataAdapter();
                    daa.SelectCommand = kmtt;
                    DataTable dtt = new DataTable();
                    daa.Fill(dtt);
                    if (dtt.Rows.Count > 0)
                    {

                        if (dtt.Rows[0]["cinsiyet"].ToString() == "Bay")
                            ((ImageButton)Page.FindControl("rahat" + dtt.Rows[0]["koltukno"].ToString())).ImageUrl = "~images/bay-koltuk.png";
                        if (dtt.Rows[0]["cinsiyet"].ToString() == "Bayan")
                            ((ImageButton)Page.FindControl("rahat" + dtt.Rows[0]["koltukno"].ToString())).ImageUrl = "~images/bayan-koltuk.png";
                        ((ImageButton)Page.FindControl("rahat" + dtt.Rows[0]["koltukno"].ToString())).Enabled = false;
                    }

                }
            }
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand komut = new SqlCommand("SELECT koltukno, cinsiyet FROM yolcubilgi WHERE SeferNo=@SeferNo", con);
            komut.Parameters.AddWithValue("@SeferNo", Session["SeferNo"].ToString());
            SqlDataAdapter dta = new SqlDataAdapter();
            dta.SelectCommand = komut;
            DataTable dttt = new DataTable();
            dta.Fill(dttt);
            if (dttt.Rows.Count > 0)
            {

                if (lblSeferTip.Text == "Rahat")
                {
                    if (dttt.Rows[0]["cinsiyet"].ToString() == "Bay")
                    {
                        ((ImageButton)Page.FindControl("rahat" + dttt.Rows[0]["koltukno"].ToString())).ImageUrl = "~images/bay-koltuk.png";
                    }
                    else
                    {
                        ((ImageButton)Page.FindControl("rahat" + dttt.Rows[0]["koltukno"].ToString())).ImageUrl = "~images/bayan-koltuk.png";
                    }
                }
                if (lblSeferTip.Text == "Normal")
                {
                    if (dttt.Rows[0]["cinsiyet"].ToString() == "Bay")
                    {
                        ((ImageButton)Page.FindControl("rahat" + dttt.Rows[0]["koltukno"].ToString())).ImageUrl = "~images/bay-koltuk.png";
                    }
                    else
                    {
                        ((ImageButton)Page.FindControl("rahat" + dttt.Rows[0]["koltukno"].ToString())).ImageUrl = "~images/bayan-koltuk.png";
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

            SqlCommand cmd = new SqlCommand("insert into yolcular(tc, SeferNo,Ad,Soyad,Tel, cinsiyet,koltukno)values(@tc, @SeferNo,@Ad,@Soyad,@Tel,@cinsiyet,@koltukno)", con);
            string k = lblKoltukNo1.Text;
            int koltuk = Convert.ToInt16(k);

            if (con.State == ConnectionState.Closed)
                con.Open();
            if (PnlComfortlessBus.Visible == true)
            {
                if (pnlBirinciYolcu.Visible == true)
                {
                    if (txtAd1.Text.Length > 0 && txtSoyad1.Text.Length > 0 && txtTcNo1.Text.Length > 0 && txtTel1.Text.Length > 0)
                    {
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
                        cmd.ExecuteNonQuery();
                        cmd.Dispose();
                        con.Close();

                    }
                }
            }
        }
            protected void ddlCinsiyet_SelectedIndexChanged(object sender, EventArgs e)
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
            if (PnlComfortlessBus.Visible==true)
                ((ImageButton)Page.FindControl("normal" + lblKoltukNo1.Text)).ImageUrl = "~/images/ykoltuk.png";
            else ((ImageButton)Page.FindControl("rahat" + lblKoltukNo1.Text)).ImageUrl = "~/images/ykoltuk.png";
            pnlBirinciYolcu.Visible = false;
            pnlIkinciYolcu.Visible = false;
        }
        
        protected void imgKapat1_Click(object sender, ImageClickEventArgs e)
        {

            pnlBirinciYolcu.Visible = false;
        }

        protected void imgKapat2_Click(object sender, ImageClickEventArgs e)
        {
            pnlIkinciYolcu.Visible = false;
        }
            
        }
    }
