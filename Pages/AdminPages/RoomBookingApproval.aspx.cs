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
    public partial class RoomBookingApproval : System.Web.UI.Page
    {
        int value = 0;
        string Email;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getBookingapproval();
                getBookingrequestApproval();
                getBookingRejected();
            }
        }
        private void getBookingapproval()
        {
            DataSet Dat = RetrivedData.GetRoomBookinpendingData(1);
            DataTable dt = new DataTable();
            dt = Dat.Tables[0];
            if(dt.Rows.Count > 0)
            {
                BookingApproval.DataSource = dt;
                BookingApproval.DataBind();
            }
            else
            {
                emptytxt.Visible = true;
                emptytxt.Text = "There Is Not A Single Record";
            }
           
        }


        private void getBookingrequestApproval()
        {
            DataSet Dat = RetrivedData.GetRoomBookinpendingData(2);
            DataTable dt = new DataTable();
            dt = Dat.Tables[0];
            if (dt.Rows.Count > 0)
            {
                Rejected.DataSource = dt;
                Rejected.DataBind();
            }
            else
            {
                emptytxt2.Visible = true;
                emptytxt2.Text = "There Is Not A Single Record";
            }

        }


        private void getBookingRejected()
        {
            DataSet Dat = RetrivedData.GetRoomBookinpendingData(3);
            DataTable dt = new DataTable();
            dt = Dat.Tables[0];
            if (dt.Rows.Count > 0)
            {
                Approved.DataSource = dt;
                Approved.DataBind();
            }
            else
            {
                emptytxt1.Visible = true;
                emptytxt1.Text = "There Is Not A Single Record";
            }

        }



        protected void BookingApproval_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Roomid = Convert.ToInt32(BookingApproval.DataKeys[e.RowIndex].Value.ToString());
            string result = "Reject";
            string subject = "For Room booking Query";
            string body = "From HotelBooking \r\n For some varification reson Your Room Booking Request is Cancelled";
            try
            {
                DataSet dat = AdminWork.ApprovedRoomBooking(Roomid, result);
                DataTable dt = new DataTable();
                dt = dat.Tables[0];

                if (dt.Rows.Count > 0)
                {
                    value = Convert.ToInt32(dt.Rows[0]["value"]);
                    Email = dt.Rows[0]["Email"].ToString();
                }

                switch (value)
                {
                    case 1:
                        AdminWork.sendMail(Email, subject, body);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Room Booking Request Rejected successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/RoomBookingApproval.aspx") + "';", true);

                        break;
                    default:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Something Went Wrong Please try Some after time');", true);
                        break;
                }
            }
            catch { throw; }

        }

        protected void BookingApproval_SelectedIndexChanged(object sender, EventArgs e)
        {
            int RoomId = Convert.ToInt32(BookingApproval.SelectedValue);
            string result = "Approved";
            
            string subject = "For booking Query";
            string body = "From HotelBooking \r\n Your Are Varification are Done Successfully \r\n Injoye Your Room \r\n Room Booking Request Successfully Approved";
            try
            {
                DataSet dat = AdminWork.ApprovedRoomBooking(RoomId, result);
                DataTable dt = new DataTable();
                dt = dat.Tables[0];

                if(dt.Rows.Count > 0)
                {
                    value = Convert.ToInt32(dt.Rows[0]["value"]);
                    Email = dt.Rows[0]["Email"].ToString();
                }

                switch (value)
                {
                   
                    case 1:
                        AdminWork.sendMail(Email, subject, body);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Room Booking Request Approved successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/RoomBookingApproval.aspx") + "';", true);
                        break;
                    default:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Something Went Wrong Please try Some after time');", true);
                        break;
                }
            }
            catch { throw ; }
        }

        protected void Approved_SelectedIndexChanged(object sender, EventArgs e)
        {
            int RoomId = Convert.ToInt32(Approved.SelectedValue);
            string result = "Approved";

            string subject = "For Room booking Query";
            string body = "From HotelBooking \r\n Soory For Delay Your Request is return Approved ";
            try
            {
                DataSet dat = AdminWork.ApprovedRoomBooking(RoomId, result);
                DataTable dt = new DataTable();
                dt = dat.Tables[0];

                if (dt.Rows.Count > 0)
                {
                    value = Convert.ToInt32(dt.Rows[0]["value"]);
                    Email = dt.Rows[0]["Email"].ToString();
                }

                switch (value)
                {

                    case 1:
                        AdminWork.sendMail(Email, subject, body);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Room Booking Request Approved successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/RoomBookingApproval.aspx") + "';", true);
                        break;
                    default:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Something Went Wrong Please try Some after time');", true);
                        break;
                }
            }
            catch { throw; }
            
        }

        protected void Rejected_SelectedIndexChanged(object sender, EventArgs e)
        {
            int RoomId = Convert.ToInt32(Rejected.SelectedValue);
            string result = "Reject";
            string subject = "For booking Query";
            string body = "From HotelBooking \r\n Sorry To Inform You For some internal or Varification Resons your Request is Denied";
            try
            {
                DataSet dat = AdminWork.ApprovedRoomBooking(RoomId, result);
                DataTable dt = new DataTable();
                dt = dat.Tables[0];

                if (dt.Rows.Count > 0)
                {
                    value = Convert.ToInt32(dt.Rows[0]["value"]);
                    Email = dt.Rows[0]["Email"].ToString();
                }

                switch (value)
                {
                    case 1:
                        AdminWork.sendMail(Email, subject, body);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Room Booking Request Rejected successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/RoomBookingApproval.aspx") + "';", true);

                        break;
                    default:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Something Went Wrong Please try Some after time');", true);
                        break;
                }
            }
            catch { throw; }
        }
    }
}