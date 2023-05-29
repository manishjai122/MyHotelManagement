using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VariablesRefrence;

namespace FirstGoldmedalProject.Pages.UserPages
{
    public partial class AfterRoomBookingPage : System.Web.UI.Page
    {
        BookRequestVariable br = new BookRequestVariable();
        public string Uname;
        public string RType;
        public string Room;
        public string FromDate;
        public string ToDate;
        public string BookingPrice;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                setCookievalues();
            }
        }
        private void setCookievalues()
        {
            HttpCookie cookie = Request.Cookies["MultipleCookie"];

            Uname = cookie.Values["Uname"];
            RType = cookie.Values["Rtype"];
            Room = cookie.Values["RNo"];
            FromDate = cookie.Values["FromDate"];
            ToDate = cookie.Values["ToDate"];
            BookingPrice = cookie.Values["BookingP"];

        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HotelInterFace.aspx");
        }
    }
}