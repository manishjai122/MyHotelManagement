using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using System.Data.SqlClient;

namespace FirstGoldmedalProject
{
    public partial class MainLoginPage : System.Web.UI.Page
    {
        int ErrorValue;
        int HostValue;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void LoginProjectFirst()
        {

            string user = UserName.Text.Trim();
            string pass = Password.Text.Trim();
            try
            {
                DataSet dat = LoginLogic.LoginIntoProject(user, pass);
                DataTable dt = new DataTable();
                dt = dat.Tables[0];

                if (dt.Rows.Count > 0)
                {
                    ErrorValue = Convert.ToInt32(dt.Rows[0]["value"]);
                    HostValue = Convert.ToInt32(dt.Rows[0]["host"]);

                }
            }
            catch { throw; }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            LoginProjectFirst();
            errtext.Text = "";
            errrtext2.Text = "";
            switch (ErrorValue)
            {
                case 2:
                    errtext.Text = "";
                    errrtext2.Text = "Password Is Wrong";
                    break;
                case 3:
                    errrtext2.Text = "";
                    errtext.Text = "UserName Or EmailId Not Exists";
                    break;
                default:
                   
                    string cookie1 = "UserName";
                    string Cookie2 = "UserId";
                    SetMaxCookie(cookie1, UserName.Text.Trim());
                    SetMaxCookie(Cookie2, ErrorValue.ToString());
                    if (HostValue == 1)
                    {
                        Response.Redirect("~/Pages/AdminPages/DashBord.aspx");
                    }
                    else if(HostValue == 2)
                    {
                        Response.Redirect("~/HotelInterFace.aspx");
                    }
                    break;
            }
        }

        private void SetMaxCookie(string cookieName, string cookieValue)
        {
            HttpCookie Uname = new HttpCookie(cookieName);
            Uname.Value = cookieValue;
            Uname.Path = Request.ApplicationPath;
            Uname.Expires = DateTime.MaxValue;
            Response.Cookies.Add(Uname);
        }


    }
}