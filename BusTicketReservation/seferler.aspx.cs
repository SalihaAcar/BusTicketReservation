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
    public partial class seferler : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"data source=.\SQLEXPRESS; initial catalog=otobus;integrated security=true;");
        DataSet ds = new DataSet(); // Birden fazla tablo tutar.
        DataTable table = new DataTable(); // Bir tane tablo tutar.

       protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT SeferNo, Kalkis ,Varis,convert(varchar,convert(datetime,Tarih,103)) [Saat],Fiyat,SeferTip,OtobusTip FROM seferliste  WHERE Nereden=@Kalkis AND Nereye=@Varis AND   CAST(FLOOR(CAST(Tarih AS FLOAT)) AS DATETIME)=@Tarih ORDER BY Tarih ASC", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd); // Uygulama ile Veritabanı arasında ki köprü. Bağlantıyı otomatik açıp kapar.
                // QueryString sayfalar arası veri taşınmasını sağlar. Diğer sayfadan veriyi istedik.
                lblTarih.Text = Request.QueryString["Tarih"] + " TARİHİNDEKİ SEFERLERİMİZ ";
                string[] trh = Request.QueryString["Tarih"].Split(' ');
                string[] tarih = trh[0].Split('.');
                cmd.Parameters.AddWithValue("@Kalkis", Request.QueryString["Nereden"]);
                cmd.Parameters.AddWithValue("@Varis", Request.QueryString["Nereye"]);
                cmd.Parameters.AddWithValue("@Tarih", tarih[1] + "-" + tarih[0] + "-" + tarih[2]);
                //ds.Tables.Add(table); //DataSet içerisine Tablo ekliyorum
                da.Fill(table); // Adaptör'ün çalıştırdığı sql sorgusunun getirdiği sonuçlar table'a doldurulur.
                GridView1.DataSource = sadeceSaat(table); // Alınan bilgileri gridview'ın içine attık,
                GridView1.DataBind(); //  DataBind ile gridview'a bağladık, verileri topladık ve ekrana yazdırdık.

            }
            catch (Exception ex)
            {
                string temp = ex.Message;
                Response.Redirect("<script lang='Javascript'>alert('Hata !')</script>");
            }
        }

       protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
       {
           Session.Add("sefertip", GridView1.SelectedRow.Cells[4].Text);
           Session.Add("otobustip", GridView1.SelectedRow.Cells[5].Text);
           Session.Add("fiyat", GridView1.SelectedRow.Cells[3].Text);
           Session.Add("SeferNo", GridView1.SelectedRow.Cells[0].Text);
           Response.Redirect("koltuksecim.aspx?SeferNo=" + GridView1.SelectedRow.Cells[0].Text);
       }
        public DataTable sadeceSaat(DataTable tbdateTime)
        {
            for (int i = 0; i < tbdateTime.Rows.Count; i++)
            {
                string temp = tbdateTime.Rows[i][3].ToString();
                tbdateTime.Rows[i][3] = tbdateTime.Rows[i][3].ToString().Substring(11, 8);
                temp = tbdateTime.Rows[i][3].ToString();
            }
            return tbdateTime;
        }
        
    }
}