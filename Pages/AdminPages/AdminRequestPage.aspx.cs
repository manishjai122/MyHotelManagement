using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using System.Data.SqlClient;


namespace FirstGoldmedalProject.Pages.AdminPages
{
    public partial class AdminRequestPage : System.Web.UI.Page
    {
        string Email;
        int value;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getAllUserRequestDetails();
                getAllRejectedRequestDetails();
                getAllApprovedRequestDetails();
            }
        }
        private void getAllUserRequestDetails()
        {
            DataSet Dat = RetrivedData.GetAllUserRequestDetails(1);
            DataTable dt = new DataTable();
            dt = Dat.Tables[0];
            if(dt.Rows.Count > 0)
            {
                AdminRquest.DataSource = dt;
                AdminRquest.DataBind();
            }
            else
            {
                EmptyPlace.Visible = true;
                EmptyPlace.Text = "There Is Not A Single Record";
            }
           
        }

        private void getAllRejectedRequestDetails()
        {
            DataSet Dat = RetrivedData.GetAllUserRequestDetails(2);
            DataTable dt = new DataTable();
            dt = Dat.Tables[0];
            if (dt.Rows.Count > 0)
            {
                AllApproved.DataSource = dt;
                AllApproved.DataBind();
            }
            else
            {
                EmptyPlace1.Visible = true;
                EmptyPlace1.Text = "There Is Not A Single Record";
            }
        }
        private void getAllApprovedRequestDetails()
        {
            DataSet Dat = RetrivedData.GetAllUserRequestDetails(3);
            DataTable dt = new DataTable();
            dt = Dat.Tables[0];
            if (dt.Rows.Count > 0)
            {
                AllRejected.DataSource = dt;
                AllRejected.DataBind();
            }
            else
            {
                EmptyPlace2.Visible = true;
                EmptyPlace2.Text = "There Is Not A Single Record";
            }
        }

        protected void AdminRquest_SelectedIndexChanged(object sender, EventArgs e)
        {
            int RoomId = Convert.ToInt32(AdminRquest.SelectedValue);
            string AppBy = Request.Cookies["UserId"].Value;
            string result = "Approved";

           
            try
            {
                DataSet dar = AdminWork.ApprovedUserAdminRequest(RoomId, result, AppBy);
                DataTable dt = new DataTable();
                dt = dar.Tables[0];

                if (dt.Rows.Count > 0)
                {
                    value = Convert.ToInt32(dt.Rows[0]["result"]);
                    Email = dt.Rows[0]["EmailId"].ToString();
                }

                string subject = "For Admin Request Query";
                string body = "From HotelBooking \r\n Our Team check your all Details and conform your Request \r\n You are now admin \r\n Confirm Your Details:Login UserName : '" + Email + "'";

                switch (value)
                {
                    case 1:
                        AdminWork.sendMail(Email, subject, body);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Admin Request Approved successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/AdminRequestPage.aspx") + "';", true);
                        break;
                    default:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Something Went Wrong Please try Some after time');", true);
                        break;
                }
            }
            catch(Exception)
            {
                throw;
            }
        }

        protected void AdminRquest_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Roomid = Convert.ToInt32(AdminRquest.DataKeys[e.RowIndex].Value.ToString());
            string AppBy = Request.Cookies["UserId"].Value;
            string result = "Rejected";

           
            try
            {
                DataSet dar = AdminWork.ApprovedUserAdminRequest(Roomid, result, AppBy);
                DataTable dt = new DataTable();
                dt = dar.Tables[0];

                if (dt.Rows.Count > 0)
                {
                    value = Convert.ToInt32(dt.Rows[0]["result"]);
                    Email = dt.Rows[0]["EmailId"].ToString();
                }
                string subject = "For Admin Request Query";
                string body = "From HotelBooking \r\n Our Team check your all Details and Reject your Request \r\n Your Admin Request is denied Please try another time\r\nConfirm Your Details:" +
                    "Login UserName : '" + Email + "'";
                switch (value)
                {
                    case 1:
                        AdminWork.sendMail(Email, subject, body);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Admin Request Rejected successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/AdminRequestPage.aspx") + "';", true);
                        break;
                    default:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Something Went Wrong Please try Some after time');", true);
                        break;
                }
            }
            catch
            {
                throw;
            }
        }

        protected void AllRejected_SelectedIndexChanged(object sender, EventArgs e)
        {
            int RoomId = Convert.ToInt32(AllRejected.SelectedValue);
            string AppBy = Request.Cookies["UserId"].Value;
            string result = "Rejected";

            
            try
            {
                DataSet dar = AdminWork.ApprovedUserAdminRequest(RoomId, result, AppBy);
                DataTable dt = new DataTable();
                dt = dar.Tables[0];

                if (dt.Rows.Count > 0)
                {
                    value = Convert.ToInt32(dt.Rows[0]["result"]);
                    Email = dt.Rows[0]["EmailId"].ToString();
                }

                string subject = "For Admin Request Query";
                string body = "From HotelBooking\r\n for Some Internal Resion Our Team Demote you From Your Admin Position \r\n Confirm Your Details:" +
                    "Login UserName : '" + Email + "'";

                switch (value)
                {
                    case 1:
                        AdminWork.sendMail(Email, subject, body);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Admin Request Reject successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/AdminRequestPage.aspx") + "';", true);
                        break;
                    default:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Something Went Wrong Please try Some after time');", true);
                        break;
                }
            }
            catch (Exception)
            {
                throw;
            }


        }

        protected void AllApproved_SelectedIndexChanged(object sender, EventArgs e)
        {
            int RoomId = Convert.ToInt32(AllApproved.SelectedValue);
            string AppBy = Request.Cookies["UserId"].Value;
            string result = "Approved";

           
            try
            {
                DataSet dar = AdminWork.ApprovedUserAdminRequest(RoomId, result, AppBy);
                DataTable dt = new DataTable();
                dt = dar.Tables[0];

                if (dt.Rows.Count > 0)
                {
                    value = Convert.ToInt32(dt.Rows[0]["result"]);
                    Email = dt.Rows[0]["EmailId"].ToString();
                }
                string subject = "For Admin Request Query";
                string body = "From HotelBooking \r\n Our Team Decide To Return give Your Admin position \r\n You are promoted as Admin \r\n Confirm Your Details: \r\n Login UserName : '" + Email + "'";


                switch (value)
                {
                    case 1:
                        AdminWork.sendMail(Email, subject, body);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Admin Request Approved successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/AdminRequestPage.aspx") + "';", true);
                        break;
                    default:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Something Went Wrong Please try Some after time');", true);
                        break;
                }
            }
            catch
            {
                throw;
            }
        }
    }
}