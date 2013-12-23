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
    public partial class anasayfa : System.Web.UI.Page
    {
        static string constr = @"data source=.\SQLEXPRESS; initial catalog=otobus;integrated security=true;"; // SQL Server'dan otobus veritabanına localhost (.) olarak bağlanacak.
        SqlConnection con = new SqlConnection(constr); // SQL Server'a bağlantı nesnesi oluşturduk.
        SqlCommand cmd = new SqlCommand(); // SqlCommand, bağlantı açıldığında çalışacak SQL Komutu (sorgusu) nu belirtmemize yarar.
        SqlDataReader dr; // SqlDataReader ile veritabanından bilgi almak istediğimizi belirttik.
        protected void goster(string tablo) // goster isimli fonksiyon tanımladık tablo isimli değişkeni fonksiyona tanımladık. Fonksiyona yolladığımız tablo ismiyle bağlantı kuracak.
        {
            if (!this.IsPostBack) // Sayfa ilk defa yükleniyorsa Page_Load'da formun hepsini doldur.
            {
                txbTarih.Text = "--Seçiniz--";
                cmd.CommandText = "Select * from " + tablo;
                cmd.Connection = con; // Komut text'i ile bağlantı kurduk.
                con.Open(); // Bağlantıyı açtık.
                dr = cmd.ExecuteReader();
                ddLtNereden.DataSource = dr;
                ddLtNereden.DataTextField = "sehir";
                ddLtNereden.DataValueField = "id";
                ddLtNereden.DataBind();
                dr.Close(); // con.Close();

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            goster("sehirler"); // Sayfa yüklenirken fonksiyonu çağırdık ve tablo ismini yolladık.
            ddLtNereye.Width = 100;


        }

        protected void btnltsefer_Click(object sender, EventArgs e)
        {

            Response.Redirect("seferler.aspx?Nereden=" + ddLtNereden.SelectedValue.ToString() + "&Nereye=" + ddLtNereye.SelectedValue.ToString() + "&Tarih=" + txbTarih.Text); // '&' sembolü taşınan verileri birbirinden ayırmaktadır.
        }

        public void seferleriYenile(string secim)
        {
            if (secim != " ")
            {
                cmd.CommandText = "Select * from sehirler where id<>'" + secim + "'";
                cmd.Connection = con;
                con.Open();
                dr = cmd.ExecuteReader();
                ddLtNereye.Items.Clear();
                ddLtNereye.Items.Add(" ");
                ddLtNereye.DataSource = dr;
                ddLtNereye.DataTextField = "sehir";
                ddLtNereye.DataValueField = "id";
                ddLtNereye.DataBind();
                con.Close();
            }
        }
        protected void ddLtNereden_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                seferleriYenile(ddLtNereden.SelectedItem.Value.ToString());
                con.Open();
                SqlDataAdapter adapter = new SqlDataAdapter("select distinct S2.id,S2.sehir from seferler INNER JOIN dbo.sehirler S1 ON dbo.seferler.Nereden = S1.id INNER JOIN  dbo.sehirler S2 ON dbo.seferler.Nereye = S2.id where S1.id  like '%" + ddLtNereden.SelectedItem.Value.ToString() + "%'", con);
                DataTable tbl = new DataTable();
                ddLtNereye.Items.Clear();
                adapter.Fill(tbl);
                ddLtNereye.DataSource = tbl;
                ddLtNereye.DataTextField = "sehir";
                ddLtNereye.DataValueField = "id";
                ddLtNereye.DataBind();
                con.Close();

            }
            catch (Exception ex)
            {

                return;
            }
            ddLtNereye.Items.Add("--Seçiniz--");
            ddLtNereye.SelectedValue = "--Seçiniz--";
        }
        protected void btnSeferListele_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddLtNereden.SelectedValue == "--Seçiniz--" && ddLtNereye.SelectedValue == "--Seçiniz--")
                {
                    lblUyari.Text = "Lütfen kalkış ve varış yerini seçiniz...";

                }
                else if (ddLtNereden.SelectedValue == "--Seçiniz--")
                {
                    lblUyari.Text = "Lütfen kalkış yeri seçiniz...";
                }
                else if (ddLtNereye.SelectedValue == "--Seçiniz--")
                {
                    lblUyari.Text = "Lütfen varış yeri seçiniz...";
                }
                else if (txbTarih.Text == "--Seçiniz--")
                {
                    lblUyari.Text = "Lütfen tarih seçiniz...";
                }
                else
                {

                    Session.Add("Nereden", ddLtNereden.SelectedItem.ToString());
                    Session.Add("Nereye", ddLtNereye.SelectedItem.ToString());
                    Session.Add("Tarih", txbTarih.Text.ToString());
                    Response.Redirect("seferler.aspx?Nereden=" + ddLtNereden.SelectedValue.ToString() + "&Nereye=" + ddLtNereye.SelectedValue.ToString() + "&Tarih=" + txbTarih.Text);
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }


    }

}
