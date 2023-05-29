using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FirstGoldmedalProject.Pages.MasterPages
{
    public partial class AdminMasterpage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            HttpCookie cookie = Request.Cookies["UserName"];
            if (cookie != null)
            {
                UserName.Text = cookie.Value;
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
    }
}