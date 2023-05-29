using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BLL;
using System.Text;


namespace FirstGoldmedalProject.Pages.UserPages
{
    public partial class HotelInterFace : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getHotelData();
            }
           
        }
        public void getHotelData()
        {
            try
            {
                DataSet dar = RetrivedData.getRoomsForHoteInterFace();
                DataTable dt = new DataTable();
                dt = dar.Tables[0];
                HotelRoom.DataSource = dt;
                HotelRoom.DataBind();
            }
            catch (Exception e)
            {
                throw e;
            }
            
        }
        

        protected void HotelRoom_ItemCommand(object sender, ListViewCommandEventArgs e)
        {


            HttpCookie cookie = Request.Cookies["UserName"];
            if (cookie != null)
            {
                HiddenField hide;
                hide = (HiddenField)e.Item.FindControl("HiddenField1");

                Response.Redirect("~/Pages/UserPages/HotelRoomBookingPage.aspx?value=" + hide.Value);
                
            }
            else
            {
                Response.Redirect("~/MainLoginPage.aspx");
            }
            
        }
    }
}