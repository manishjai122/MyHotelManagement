using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BLL;


namespace FirstGoldmedalProject.Pages.AdminPages
{
    public partial class AdminDefaultPage : System.Web.UI.Page
    {
        int FillValue = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getAllUserDetails();
            }
        }
        private void getAllUserDetails()
        {
            DataSet Dat = RetrivedData.getAllUserDetails(FillValue );
            DataTable dt = new DataTable();
            dt = Dat.Tables[0];
            if(dt.Rows.Count > 0)
            {
                UserDetails.DataSource = dt;
                UserDetails.DataBind();
            }
            else
            {
                Emptytxt.Visible = true;
                Emptytxt.Text = "There Is Not A Single Record";
            }
          
        }

        protected void UserDetails_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(UserDetails.SelectedValue);
            Response.Redirect("~/Pages/AdminPages/UpdateSite/UserDataUpdatePanel.aspx?userid="+id);
        }

        protected void UserDetails_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
                int id = Convert.ToInt32(UserDetails.DataKeys[e.RowIndex].Value.ToString());
                try
                {
                    int value = AdminWork.DeleteUser(id);
                    switch (value)
                    {
                        case 1:
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Deleted Succefully');document.location.href='" + ResolveUrl("~/Pages/AdminPages/AdminDefaultPage.aspx") + "';", true);
                            break;
                        case 2:
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Something went Wrong');", true);
                            break;
                        default:
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Something went Wrong');", true);
                            break;

                    }
                }
                catch { throw; }
            
        }

        
    }
}