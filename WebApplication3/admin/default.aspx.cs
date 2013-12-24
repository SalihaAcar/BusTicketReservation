using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Drawing.Imaging;

namespace otobus_otomasyon.admin
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"data source=.\SQLEXPRESS; initial catalog=otobus;integrated security=true;");
            String sql_cumlesi = "SELECT * FROM yonetici WHERE Ad='" + txtAd.Text + "' and sifre='" + txtSifre.Text + "'";
            SqlCommand cmd = new SqlCommand(sql_cumlesi, con);
            SqlDataAdapter d = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            d.Fill(table);
           if (con.State == ConnectionState.Closed)
                con.Open();
           if (table.Rows.Count > 0)
           {
               Session["yonetici"] = table.Rows[0]["Ad"].ToString();
               Response.Redirect("admin.aspx");
           }
           else 
           {
               lblUyari.Text = "Kayıtlarımızda Böyle Bir Yönetici Yok!!";
           }
           cmd.Dispose();
        }

    }
}