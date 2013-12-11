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