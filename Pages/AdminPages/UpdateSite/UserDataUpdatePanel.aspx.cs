using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using VariablesRefrence;

namespace FirstGoldmedalProject.Pages.AdminPages.UpdateSite
{
    public partial class UserDataUpdatePanel : System.Web.UI.Page
    {
       
        FroUserUpdation fr = new FroUserUpdation();
        public int MaxLength1;
        public int MinLength;
        public string imagesView;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                
                DocumentNo.MaxLength = MaxLength1;
                FillDataForUpdation();
                DocumentNo.MaxLength = MaxLength1;
            }
        }
        private void FillDataForUpdation()
        {
            int uId = Convert.ToInt32(Request.QueryString["userid"]);

            DataSet dat = RetrivedData.getUSerSingleDataForUpdation(uId);
            DataTable dt = new DataTable();

            dt = dat.Tables[0];
            if (dt.Rows.Count > 0)
            {
                firstName.Text = dt.Rows[0]["FirstName"].ToString();
                LastName.Text = dt.Rows[0]["LastName"].ToString();
                MobileNo.Text = dt.Rows[0]["Mobile_No"].ToString();
                Email.Text = dt.Rows[0]["Email_ID"].ToString();
                Addr.Text = dt.Rows[0]["Address"].ToString();
                Session["image"] = dt.Rows[0]["RoomImage"].ToString();
                imagesView = Session["image"].ToString();
                string jk = dt.Rows[0]["Document_Type"].ToString();
                DropDownList1.Items.Add(jk);
                DropDownList1.SelectedItem.Text = jk;
                UserName.Text = dt.Rows[0]["UserName"].ToString();
                DocumentNo.Text = dt.Rows[0]["Document_No"].ToString();
                int checkValue = Convert.ToInt32(dt.Rows[0]["Active"]);
                
                if(checkValue == 1)
                {
                    checkActive.Checked = true;
                }
                else
                {
                    checkActive.Checked = false;
                }
            }
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/AdminPages/AdminDefaultPage.aspx");
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            

            if(DocumentNo.Text.Length >= ValidateDocNumber(checkDrfopdown()) && DocumentNo.Text.Length <= MaxLength1)
            {
                int value = Updateuserset();
                switch (value)
                {

                    case 1:
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Updated", "alert('Update SuccessFully'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/AdminDefaultPage.aspx") + "';", true);

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
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Something Went Wrong Please try Again');", true);
                        break;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Document no!!');", true);
            }
        }

        public string ImageUpload()
        {
            string path = Session["image"].ToString();
            if (SecoundImage.HasFile)
            {
                SecoundImage.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "Images/" + SecoundImage.FileName);
                path = SecoundImage.FileName;
            }
           
            return path;



        }
        private int Updateuserset()
        {
            int uId = Convert.ToInt32(Request.QueryString["userid"]);
            fr.userId = uId;
            fr.firstname = firstName.Text.Trim();
            fr.Lastname = LastName.Text.Trim();
            fr.MobileNo = MobileNo.Text.Trim();
            fr.EmailId = Email.Text.Trim();
            fr.Address = Addr.Text.Trim();
            fr.userName = UserName.Text.Trim();
            fr.DocumentType = DropDownList1.SelectedItem.ToString();
            fr.DocumentNo = DocumentNo.Text.Trim();
            fr.Document_Image = ImageUpload();
            if (checkActive.Checked == true)
            {
                fr.IsActive = true;
            }
            else
            {
                fr.IsActive = false;
            }
            fr.updateby = Request.Cookies["UserId"].Value;

            int value = AdminWork.updateuserDetails(fr);
            return value;
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
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int value = Convert.ToInt32(DropDownList1.SelectedValue);
            ValidateDocNumber(value);
            DocumentNo.MaxLength = MaxLength1;
        }
        private int checkDrfopdown()
        {
            int value;
            if (DropDownList1.SelectedValue != null)
                value = Convert.ToInt32(DropDownList1.SelectedValue);
            else
                value = 1;

            return value;
        }

        

        protected void DocumentNo_TextChanged1(object sender, EventArgs e)
        {
            int value = Convert.ToInt32(DropDownList1.SelectedValue);
            ValidateDocNumber(value);
            DocumentNo.MaxLength = MaxLength1;
            int DocNoLength = DocumentNo.Text.Trim().Length;
            if (DocNoLength < MinLength)
            {
                error.Text = "Invalid Document Number";
            }
            else
            {
                error.Text = "";
            }
        }
    }
}