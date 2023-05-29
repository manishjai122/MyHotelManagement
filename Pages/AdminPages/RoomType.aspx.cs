using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;


namespace FirstGoldmedalProject.Pages.AdminPages
{
    public partial class RoomType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getLoadDataAddRoom();
            }
        }
        private void getLoadDataAddRoom()
        {
            DataSet dat = RetrivedData.GetRoomTypeData(0);
            DataTable dt = new DataTable();

            dt = dat.Tables[0];

            if (dt.Rows.Count > 0)
            {
                ForRoomType.DataSource = dt;
                ForRoomType.DataBind();
            }
            else
            {
                emptyplace2.Visible = true;
                emptyplace2.Text = "There Is Not A Single Record";
            }
        }
        protected void Submit_Click(object sender, EventArgs e)
         {
            if (Submit.Text == "Submit")
            {
                int value = ADDRoomType();
                switch (value)
                {
                    case 1:
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('RoomType Add successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/AddItemPages.aspx") + "';", true);
                        break;
                    case 2:
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Room Type Already Exists!');", true);
                        break;
                    default:
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Something Went Wrong please try again !'); ", true);
                        break;
                }
            }
            else
            {
                int value = UpdateRoomType();
                switch (value)
                {
                    case 1:
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('RoomType Updated successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/AddItemPages.aspx") + "';", true);
                        break;
                    case 2:
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('RoomType Already Exists !'); ", true);
                        break;
                    default:
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Something Went Wrong please try again !'); ", true);
                        break;
                }
            }
        }


        private int ADDRoomType()
        {
            string RoomT = TextBox1.Text.Trim();
            string CreBy = Request.Cookies["UserId"].Value;

            int value = AdminWork.UpdateRoomTypeDetails(0, 0, RoomT, CreBy,true);
            return value;
        }

        private int UpdateRoomType()
        {
            int id = Convert.ToInt32(ForRoomType.SelectedValue);
            int resultSet = 1;
            string RoomT = TextBox1.Text.Trim();
            string CreBy = Request.Cookies["UserId"].Value;
            bool Checkvalue;
            if(IsActive.Checked == true)
            {
                Checkvalue = true;
            }
            else
            {
                Checkvalue = false;
            }
            int value = AdminWork.UpdateRoomTypeDetails(id, resultSet, RoomT, CreBy, Checkvalue);
            return value;

        }

        protected void ForRoomType_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ForRoomType.SelectedValue);

            DataSet dat = RetrivedData.GetRoomTypeData(id);
            DataTable dt = new DataTable();

            dt = dat.Tables[0];
            if (dt.Rows.Count > 0)
            {
                TextBox1.Text = dt.Rows[0]["RoomType"].ToString();
                int CheckValue = Convert.ToInt32(dt.Rows[0]["IsActive"]);
                if(CheckValue == 1)
                {
                    IsActive.Checked = true;
                }
                else
                {
                    IsActive.Checked = false;
                }
                
            }
            Submit.Text = "Update";
            Panel1.Visible = true;


        }

        protected void ForRoomType_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Id = Convert.ToInt32(ForRoomType.DataKeys[e.RowIndex].Value.ToString());

            int resultSet = 2;
            string RoomT = "0";
            string CreBy = Request.Cookies["UserId"].Value;

            int value = AdminWork.UpdateRoomTypeDetails(Id, resultSet, RoomT, CreBy,true);

            switch (value)
            {
                case 1:
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('RoomType Deleted successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/AddItemPages.aspx") + "';", true);
                    break;
                default:
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Something Went Wrong please try again !'); ", true);
                    break;
            }
        }

        protected void Can_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}