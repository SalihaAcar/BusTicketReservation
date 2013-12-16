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
        

        }
    }
}