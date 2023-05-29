using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;


namespace FirstGoldmedalProject.Pages.AdminPages
{
    public partial class DashBord : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getDataDashBord();
            }
        }
        private void getDataDashBord()
        {
            DataSet dat = RetrivedData.getAllDataDashBord();
            DataTable dt = new DataTable();

            dt = dat.Tables[0];

            if(dt.Rows.Count > 0)
            {
                TotalRoom.Text = dt.Rows[0]["TotalRoom"].ToString();
                TotalBookerRoom.Text = dt.Rows[0]["TotalBookedRoom"].ToString();
                TotalRemainRoom.Text = dt.Rows[0]["Available"].ToString();
                TotalUser.Text = dt.Rows[0]["Totaluser"].ToString();
                TotalAdmin.Text = dt.Rows[0]["TotalAdmin"].ToString();
            }
        }
    }
}