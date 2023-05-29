using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data.SqlClient;

namespace FirstGoldmedalProject.Pages.AdminPages
{
    public partial class RoomBookingHistoryForAdmin : System.Web.UI.Page
    {
        int returnvalue = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(returnvalue != 1)
            {
                getRoomBookingHistory(1, 0);
            }
            
        }
        private void getRoomBookingHistory(int FilterValue, int filterByRoom)
        {
            SqlDataReader dar = RetrivedData.getRomHistorybyAdmin(FilterValue, filterByRoom);
            if (dar.HasRows) 
            {
                RoomHistory.DataSource = dar;
                RoomHistory.DataBind();
            }
            else
            {
                Emptytxt.Text = "There Is Not A Single Record";
                returnvalue = 1;
            }
           
        }

        protected void filterHistory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int FilterValue = Convert.ToInt32(filterHistory.SelectedValue);
            int filterByRoom = 0;
            if (Convert.ToInt32(RoomNoDrop.SelectedValue) > 0)
            {
                filterByRoom = Convert.ToInt32(RoomNoDrop.SelectedValue);
            }
            getRoomBookingHistory(FilterValue,filterByRoom);
            
        }

        protected void RoomNoDrop_SelectedIndexChanged(object sender, EventArgs e)
        {
            int FilterValue = Convert.ToInt32(filterHistory.SelectedValue);
            int filterByRoom = 0;
            if (Convert.ToInt32(RoomNoDrop.SelectedValue) > 0)
            {
                filterByRoom = Convert.ToInt32(RoomNoDrop.SelectedValue);
            }
            getRoomBookingHistory(FilterValue, filterByRoom);

        }
    }
}