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
            
        

        }
    }
}