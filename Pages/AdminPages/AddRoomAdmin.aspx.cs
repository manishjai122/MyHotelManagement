using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Text;
using System.IO;
using System.Data;
using System.Data.SqlClient;


namespace FirstGoldmedalProject.Pages.AdminPages
{
    public partial class AddRoomAdmin : System.Web.UI.Page
    {
        public string cookieValue;
        public string imagesView;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillGrideview();
            }
        }
        private void fillGrideview()
        {
            DataSet dat = RetrivedData.getRoomsForHoteInterFace();
            DataTable dt = new DataTable();

            dt = dat.Tables[0];

            if(dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                Emptytxt.Visible = true;
                Emptytxt.Text = "There Is Not A Single Record";
            }

        }

        protected void Sub_Click(object sender, EventArgs e)
        {
            int num = Convert.ToInt32(BookingPrice.Text);
            int num1 = Convert.ToInt32(CancellationPrice.Text);
            try
            {
                if(num1 <= num)
                {
                    int RoomN = Convert.ToInt32(RoomNo.Text.Trim());
                    string type = RoomType.SelectedValue.ToString();
                    string RoomImage = ImageUpload();
                    Double booking = Convert.ToDouble(BookingPrice.Text);
                    Double Cancel = Convert.ToDouble(CancellationPrice.Text);
                    string createBy = Request.Cookies["UserId"].Value;
                    int value = AdminWork.AddRoom(RoomN, type, RoomImage, booking, Cancel, createBy);
                    if (value == 1)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Room Added Successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/AddRoomAdmin.aspx") + "';", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Room Already Exists!'); ", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Enter correct Cancellation price'); ", true);
                }
            }
            catch
            {
                throw;
            }
            
            
           
        }
        public string ImageUploadupt() 
        {
            string path = Session["image"].ToString();
            if (SecoundImage.HasFiles)
            {
                FileUpload1.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "Resources/AddRoomPhotoes/" + FileUpload1.FileName);
                path = SecoundImage.FileName;
            }
           
            return path;

        }
        private int updateRoom()
        {

            int Roomid = Convert.ToInt32(GridView1.SelectedValue);
            int RoomN = Convert.ToInt32(RoomNo.Text);
            string roomty = RoomType.SelectedValue;
            double Book = Convert.ToDouble(TextBox1.Text);
            double cancel = Convert.ToDouble(TextBox2.Text);
            string img = ImageUploadupt();
            string ModyBy = Request.Cookies["UserId"].Value;
            bool active = false;
            if(CheckBox1.Checked == true)
            {
                active = true;
            }

            int value = AdminWork.UpdateAddRoom(Roomid, RoomN, roomty,Book,cancel,img,ModyBy,active);
            return value;
        }
        public string ImageUpload()
        {
            string path;
            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "Resources/AddRoomPhotoes/" + FileUpload1.FileName);
                
            }
            path = FileUpload1.FileName;
            return path;

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            firstpanel.Visible = false;
            secoundPanel.Visible = true;
            int RoomId = Convert.ToInt32(GridView1.SelectedValue);
            SqlDataReader dar = RetrivedData.getRoomForHotelRoomBookingPage(RoomId);

            while (dar.Read())
            {
                RoomNo.Text = dar["RoomNo"].ToString();
                TextBox1.Text = dar["BookingRate"].ToString();
                TextBox2.Text = dar["CancelationRate"].ToString();
                RoomType.SelectedItem.Text = dar["RoomType"].ToString();
                Session["image"] = dar["RoomImage"].ToString();
                imagesView = Session["image"].ToString();
                int CheckValue = Convert.ToInt32(dar["Active"]);

                if(CheckValue == 1)
                {
                    CheckBox1.Checked = true;
                }
                else
                {
                    CheckBox1.Checked = false;
                }

            }
           

            

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Roomid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            string DeleteBy = Request.Cookies["UserId"].Value;

            int value = AdminWork.softDeleteRooms(Roomid, DeleteBy);
            if(value == 1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Delete successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/AddRoomAdmin.aspx") + "';", true);
            }

        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            
        }

        protected void CancellationPrice_TextChanged(object sender, EventArgs e)
        {
            int num = Convert.ToInt32(BookingPrice.Text);
            int num1 = Convert.ToInt32(CancellationPrice.Text);
            if(num < num1)
            {
                ComPrice.Text = "Cancellation price must be less than booking price";
            }
            else
            {
                ComPrice.Text = "";
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            double num = Convert.ToDouble(TextBox1.Text);
            double num1 = Convert.ToDouble(TextBox2.Text);
            if (num <= num1)
            {
                textError.Text = "Cancellation price must be less than booking price";
            }
            else
            {
                textError.Text = "";
            }
        }

        protected void p2SubClick_Click(object sender, EventArgs e)
        {
            double num = Convert.ToDouble(TextBox1.Text);
            double num1 = Convert.ToDouble(TextBox2.Text);

            if (num1 <= num)
            {
                int lastresult = updateRoom();
                if (lastresult == 1)
                {
                    Sub.Text = "Submit";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Room Updated successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/AddRoomAdmin.aspx") + "';", true);
                }
                else if (lastresult == 2)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Room No Already Exists !');", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('SomeThing went Wrong please try again !');", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Enter correct Cancellation price'); ", true);
            }

        }

       
    }
}