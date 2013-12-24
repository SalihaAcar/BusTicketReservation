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

public partial class admin_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["yonetici"] == null) Response.Redirect("~/admin/Default.aspx");
        if (Request.QueryString["sayfa"] != null)
        {
            //placeHolder.Controls.Clear();
            //placeHolder.Controls.Add(LoadControl(Request.QueryString["sayfa"].ToString() + ".ascx"));
        }
    }
        protected void btnSeferEkle_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"data source=.\SQLEXPRESS; initial catalog=otobus;integrated security=true;");
            DataTable table = new DataTable(); // Bir tane tablo tutar.
            SqlCommand cmd = new SqlCommand("insert into seferler(Nereden, Nereye, Tarih, SeferTip,OtobusTip, Fiyat )values(@kalkis, @varis,@tarih,@sefertip,@otobustip,@fiyat)", con);
            if (con.State == ConnectionState.Closed)
                con.Open();
            //Response.Redirect
        }
    
}