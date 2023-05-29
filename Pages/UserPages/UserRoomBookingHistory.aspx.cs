using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using BLL;


namespace FirstGoldmedalProject.Pages.UserPages
{
    public partial class UserRoomBookingHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                RadData();
        }
        private void RadData()
        {
            HttpCookie cookie = Request.Cookies["UserId"];
            int value = Convert.ToInt32(Request.Cookies["UserId"].Value);
            SqlDataReader dar = RetrivedData.getRomHistorybyUser (value);
            if (dar.HasRows)
            {
                GridView1.DataSource = dar;
                GridView1.DataBind();
            }
            else
            {
                Label1.Text = "You Didn't Book Room yet ! ...";
            }
           
        }
        
    }
}