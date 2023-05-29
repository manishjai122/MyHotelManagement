using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using BLL;
using VariablesRefrence;



namespace FirstGoldmedalProject.Pages.UserPages
{
    public partial class HotelRoomBookingPage : System.Web.UI.Page
    {
        BookRequestVariable Br = new BookRequestVariable();
        string bookincharge;
       

        public string getValue;


        protected void Page_Load(object sender, EventArgs e)
        {
            getData();
            getValue = Listtostring(Convert.ToInt32(Request.QueryString["value"]));
            if (!IsPostBack)
            {
                HttpCookie cookie = Request.Cookies["UserName"];
                if (cookie != null)
                    UserName.Text = cookie.Value;



                if (Request.Cookies["UserName"] != null)
                    UserName.Text = Request.Cookies["UserName"].Value;

                
                
            }
        }


        private string Listtostring(int roomId)
        {
            string value = string.Join(" ", UserWork.CheckDateAlreadyExists(0, roomId));
            return value;
        }
        public void getData()
        {
            int SessioData = 1;
            try
            {
                if (Request.QueryString["value"] != null)
                    SessioData = Convert.ToInt32(Request.QueryString["value"]);

                SqlDataReader dar = RetrivedData.getRoomForHotelRoomBookingPage(SessioData);
                while (dar.Read())
                {

                    RoomId.Text = dar["RoomNo"].ToString();
                    RoomType.Text = dar["RoomType"].ToString();
                    bookincharge = dar["BookingRate"].ToString();
                    
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }



        public int BookRoom()
        {
            try
            {
               int value = 0;
               if (From.Text != "" && To.Text != "")
               {
                    HttpCookie cookie = Request.Cookies["UserId"];
                    HttpCookie cookie1 = Request.Cookies["UserName"];
                    Br.RoomId = Convert.ToInt32(RoomId.Text.Trim());
                    Br.UserId = Convert.ToInt32(cookie.Value.Trim());

                    if(UserWork.ChangeDate(From.Text) != "")
                    {
                        Br.FromDate = Convert.ToDateTime(UserWork.ChangeDate(From.Text));
                    }
                    if(UserWork.ChangeDate(To.Text) != "")
                    {
                        Br.ToDate = Convert.ToDateTime(UserWork.ChangeDate(To.Text));
                    }
                    
                   

                    // Set cookies for AfterHotelRoombooking Page
                    setCookie();


                    if (UserRemark.Text != null)
                        Br.UserRemark = UserRemark.Text.Trim();
                    else
                        Br.UserRemark = "No";
                    Br.createBy = cookie.Value.Trim();
                    Br.Bookprice = BookingPrice.Text.Trim();

                    value = UserWork.BookRoomRequest(Br);
                    
               }

                return value;
            }
            catch
            {
                throw;
            }
        }

        private void setCookie()
        {
            HttpCookie cookie = new HttpCookie("SetList");

            cookie = new HttpCookie("MultipleCookie");
            cookie.Path = Request.ApplicationPath;
            cookie.Expires = DateTime.MaxValue;
            cookie.Values["Uname"] = UserName.Text.Trim();
            cookie.Values["Rtype"] = RoomType.Text.Trim();
            cookie.Values["RNo"] = RoomId.Text.Trim();
            cookie.Values["FromDate"] = From.Text.Trim();
            cookie.Values["ToDate"] = To.Text.Trim();
            cookie.Values["BookingP"] = BookingPrice.Text.Trim();
            Response.Cookies.Add(cookie);

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if(DateError.Text.Length <= 0)
            {
                int value = BookRoom();
                switch (value)
                {
                    case 1:
                        Response.Redirect("~/Pages/UserPages/AfterRoomBookingPage.aspx");
                        break;
                    case -1:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Booked but Method is Wrong');", true);
                        break;
                    case 0:
                        break;

                    default:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Something Went Wrong');", true);
                        break;
                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('First Select Proper Date');", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HotelInterFace.aspx");
        }
        


    
        double calDatevalue;
        protected void To_TextChanged(object sender, EventArgs e)
        {
            if (From.Text != "")
            {
                string first = UserWork.ChangeDate(From.Text);
                if (UserWork.ChangeDate(From.Text) != "")
                {
                    if (To.Text != null)
                    {
                        string last = UserWork.ChangeDate(To.Text);
                        if (UserWork.ChangeDate(To.Text) != "")
                        {

                            if (From.Text != "" && To.Text != "")
                            {
                                calDatevalue = UserWork.CalculateDate(first, last);

                                switch (calDatevalue)
                                {
                                    case 1:
                                        DateError.Text = "";
                                        BookingPrice.Text = bookincharge;
                                        break;
                                    case -1:
                                        BookingPrice.Text = null;
                                        DateError.Text = "Select Proper Date";
                                        break;
                                    case 0:
                                        
                                        break;

                                    default:
                                        DateError.Text = "";
                                        BookingPrice.Text = (Convert.ToDouble(calDatevalue * Convert.ToDouble(bookincharge))).ToString();
                                        break;
                                }
                            }
                            else
                            {
                                BookingPrice.Text = "";
                            }
                        }
                        else
                        {
                            BookingPrice.Text = "";
                        }
                    }

                    else
                    {
                        BookingPrice.Text = "";
                    }
                }

            }
        }

        protected void Log_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["UserName"];
            cookie.Path = Request.ApplicationPath;
            cookie.Expires = DateTime.Today.AddDays(-1);
            Response.Cookies.Add(cookie);


            Response.Redirect("~/MainLoginPage.aspx");
        }

        protected void From_TextChanged(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(From.Text))
            {
                DateTime firstDate = Convert.ToDateTime(UserWork.ChangeDate(From.Text));
                DateTime todayDate = DateTime.Now;
                if (firstDate < todayDate)
                {
                    fromerror.Text = "Enter Valid Date";
                }
                else
                {
                    fromerror.Text = "";
                }
            }

        }
    }
}