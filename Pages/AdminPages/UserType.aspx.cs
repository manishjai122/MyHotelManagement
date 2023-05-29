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
    public partial class UserType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserType();
            }
        }
        private void LoadUserType()
        {
            DataSet dat = AdminWork.PerformUserType(0, "0", true, "0", 0);
            DataTable dt = new DataTable();
            dt = dat.Tables[0];
            if(dt.Rows.Count > 0)
            {
                Usergride.DataSource = dt;
                Usergride.DataBind();
            }
            else
            {
                emptyplace2.Visible = true;
                emptyplace2.Text = "There Is Not A Single Record";
            }
        }

        protected void Can_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (Submit.Text == "Submit")
            {
                string textvalue = TextBox1.Text;
                string createBy = Request.Cookies["UserId"].Value;

                DataSet dat = AdminWork.PerformUserType(0, textvalue, true, createBy, 1);
                DataTable dt = new DataTable();
                dt = dat.Tables[0];

                int value = Convert.ToInt32(dt.Rows[0]["value"]);
                switch (value)
                {
                    case 1:
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('UserType Add successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/UserType.aspx") + "';", true);
                        break;
                    case 2:
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('UserType Already Exists!');", true);
                        break;
                    default:
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Something went Wrong Please Try again!');", true);
                        break;
                }
            }
            else
            {
                int id = Convert.ToInt32(Usergride.SelectedValue);
                string textvalue = TextBox1.Text;
                string createBy = Request.Cookies["UserId"].Value;

                DataSet dat = AdminWork.PerformUserType(id, textvalue, true, createBy, 2);
                DataTable dt = new DataTable();
                dt = dat.Tables[0];

                int value = Convert.ToInt32(dt.Rows[0]["value"]);
                switch (value)
                {
                    case 1:
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('UserType Update successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/UserType.aspx") + "';", true);
                        break;
                    case 2:
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('UserType Already Exists!');", true);
                        break;
                    default:
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Something went Wrong Please Try again!');", true);
                        break;
                }
            }
        }

        protected void Usergride_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Usergride.SelectedValue);
            DataSet dat = AdminWork.PerformUserType(id, "0", true, "0", 0);
            DataTable dt = new DataTable();
            dt = dat.Tables[0];
            if(dt.Rows.Count > 0)
            {
                TextBox1.Text = dt.Rows[0]["UserType"].ToString();
                int CheckValue = Convert.ToInt32(dt.Rows[0]["Active"]);
                if (CheckValue == 1)
                {
                    IsActive.Checked = true;
                }
                else
                {
                    IsActive.Checked = false;
                }
            }
            Panel1.Visible = true;
            Submit.Text = "Update";


        }

        protected void Usergride_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Id = Convert.ToInt32(Usergride.DataKeys[e.RowIndex].Value.ToString());
            string DeleteBy = Request.Cookies["UserId"].Value;
            DataSet dat =  AdminWork.PerformUserType(Id, "0", true, DeleteBy, 3);
            DataTable dt = new DataTable();
            dt = dat.Tables[0];

            int value = Convert.ToInt32(dt.Rows[0]["value"]);
            switch (value)
            {
                case 1:
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('UserType Deleted successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/UserType.aspx") + "';", true);
                    break;
                default:
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Something Went Wrong please try again !'); ", true);
                    break;
            }
        }
    }
}