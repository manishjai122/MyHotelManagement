using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using BLL;
using System.Text;
using System.Data;
using VariablesRefrence;


namespace FirstGoldmedalProject.Pages.UserPages
{
    public partial class UserRegistrationForm : System.Web.UI.Page
    {
        RegisterUserVariables va = new RegisterUserVariables();
        LoginLogic Lg = new LoginLogic();


        int Registervalue;
        public int MaxLength1;
        int MinLength;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                Doc_No.MaxLength = MaxLength1;
            }
            

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (Doc_No.Text.Length >= ValidateDocNumber(checkDrfopdown()) && Doc_No.Text.Length <= MaxLength1)
            {
                ImageUpload();
                int value = RegisterDetails();
                switch (value)
                {
                    case 1:
                        Response.Write(value);
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Inserted');", true);
                        break;
                    case 2:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('UserName Is Already Exists');", true);
                        break;
                    case 3:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Contact is Already Exists');", true);
                        break;
                    case 4:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Email is Already Exists');", true);
                        break;
                    case 5:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Document Number is Already Exists');", true);
                        break;

                    default:
                        string cookie1 = "UserName";
                        string Cookie2 = "UserId";
                        SetMaxCookie(cookie1, UserName.Text.Trim());
                        SetMaxCookie(Cookie2, value.ToString());

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('You Are Register Successfully !!... '); document.location.href='" + ResolveUrl("~/HotelInterFace.aspx") + "';", true);


                        break;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Document no!!');", true);
            }
        }

        public int RegisterDetails()
        {

            va.FirstName = firstname.Text.Trim();
            va.LastName = lastname.Text.Trim();
            va.Mobile_No = Contact.Text.Trim();
            va.Email_Id = Email.Text.Trim();
            va.Address = Address.Text.Trim();
            va.UserName = UserName.Text.Trim();
            va.Password = password_again.Text.Trim();
            va.Document_Type = Doc_Type.SelectedItem.Text.Trim();
            va.Document_Number = Doc_No.Text.Trim();
            //va.Document_Image = "Resources/images/UserDocument" + Doc_Img.FileName;
            va.Document_Image = ImageUpload();
            if (Admin_Request.Checked == true)
            {

                va.AdminRequest = true;
            }
            else
                va.AdminRequest = false;
            //va.UserId = Convert.ToInt32(Request.Cookies["UserId"].Value);

            Registervalue = Lg.UserRegister(va);

            return Registervalue;

        }
        public string ImageUpload()
        {
            string path;
            if (Doc_Img.HasFile)
            {
                Doc_Img.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "Images/" + Doc_Img.FileName);

            }
            path = Doc_Img.FileName;
            return path;

            

        }
        //color == rgb(232, 240, 254)



        private void SetMaxCookie(string cookieName, string cookieValue)
        {
            HttpCookie Uname = new HttpCookie(cookieName);
            Uname.Value = cookieValue;
            Uname.Path = Request.ApplicationPath;
            Uname.Expires = DateTime.MaxValue;
            Response.Cookies.Add(Uname);
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {

            int finalresult = ValidateDocNumber(0);
            if (finalresult == 1)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }
        private int ValidateDocNumber(int value)
        {

            DataSet dat = RetrivedData.GetValidateDocumentNum(value);
            DataTable dt = new DataTable();
            dt = dat.Tables[0];

            if (dt.Rows.Count > 0)
            {
                MaxLength1 = Convert.ToInt32(dt.Rows[0]["DocMaxLength"]);
                MinLength = Convert.ToInt32(dt.Rows[0]["DocMinLength"]);
            }
            int min = MinLength;
            return min;

        }

        protected void CustomValidator4_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Doc_Img.PostedFile.ContentLength > 51200)
            {
                args.IsValid = false;

            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void Doc_Type_SelectedIndexChanged(object sender, EventArgs e)
        {
            int value = Convert.ToInt32(Doc_Type.SelectedValue);
            ValidateDocNumber(value);
            Doc_No.MaxLength = MaxLength1;
        }
        private int checkDrfopdown()
        {
            int value;
            if (Doc_Type.SelectedValue != null)
                value = Convert.ToInt32(Doc_Type.SelectedValue);
            else
                value = 1;

            return value;
        }

        protected void Doc_No_TextChanged(object sender, EventArgs e)
        {
            int value = Convert.ToInt32(Doc_Type.SelectedValue);
            ValidateDocNumber(value);
            Doc_No.MaxLength = MaxLength1;
            int DocNoLength = Doc_No.Text.Trim().Length;
            if (DocNoLength < MinLength)
            {
                error.Text = "Invalid Document Number";
            }
            else
            {
                error.Text = "";
            }
        }

        protected void Admin_Request_CheckedChanged(object sender, EventArgs e)
        {
            int DiagResult = int.Parse(inpHide.Value);

            if (DiagResult == 1)

            {

                Admin_Request.Checked = true;

            }

            else if (DiagResult == 0)

            {

                Admin_Request.Checked = false;

            }
        }
    }
}