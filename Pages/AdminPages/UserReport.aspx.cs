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
    public partial class UserReport : System.Web.UI.Page
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
            DataSet Dat = RetrivedData.getAllUserDetails(FillValue);
            DataTable dt = new DataTable();
            dt = Dat.Tables[0];
            if (dt.Rows.Count > 0)
            {
                UserDetails.DataSource = dt;
                UserDetails.DataBind();
            }
            

        }

        

        

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue != null)
            {
                FillValue = Convert.ToInt32(DropDownList1.SelectedValue);
                getAllUserDetails();
            }
        }
    }
}