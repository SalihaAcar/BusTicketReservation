using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace otobus_otomasyon
{
    public partial class sonadim : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(@"data source=.\SQLEXPRESS; initial catalog=otobus;integrated security=true;");
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Select * from yolcubilgi where yolcuid=@yolcuid", baglanti);
            if (baglanti.State == ConnectionState.Closed)
                baglanti.Open();
            string tmp = Request.QueryString["yolcuid"].ToString();
            cmd.Parameters.AddWithValue("@yolcuid", Request.QueryString["yolcuid"].ToString());
            SqlDataAdapter d = new SqlDataAdapter(cmd);
            d.SelectCommand = cmd;
            DataTable dt = new DataTable();
            d.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lblNereden.Text = dt.Rows[0]["Kalkis"].ToString();
                lblNereye.Text = dt.Rows[0]["Varis"].ToString();
                lblTopFiyat.Text = String.Format("{0:c}", dt.Rows[0]["Fiyat"]);
                lblAd.Text = dt.Rows[0]["Ad"].ToString();
                lblSoyad.Text = dt.Rows[0]["Soyad"].ToString();
                lblTel.Text = dt.Rows[0]["Telefon"].ToString();
                lblKoltukNo.Text = dt.Rows[0]["koltukno"].ToString();
                lblTarih.Text = DateTime.Parse(dt.Rows[0]["Tarih"].ToString()).ToShortDateString();
                lblSaat.Text = DateTime.Parse(dt.Rows[0]["Tarih"].ToString()).ToShortTimeString();
            }
        }
        protected void btnYazdir_Click(object sender, EventArgs e)
        {

        }




    }
}
