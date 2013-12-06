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
                txbTarih.Text = DateTime.Today.ToShortDateString();
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
    }
}