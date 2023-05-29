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
    public partial class AddItemPages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getLoadData();
               
            }
        }

        private void getLoadData()
        {
            DataSet dat = RetrivedData.getDocTypeData(0);
            DataTable dt = new DataTable();
            dt = dat.Tables[0];
            if(dt.Rows.Count > 0)
            {
                showDoc.DataSource = dt;
                showDoc.DataBind();
            }
            else
            {
                Epmtyplace.Visible = true;
                Epmtyplace.Text = "There Is Not A Single Record";
            }
        }

        

        protected void ADD_Click(object sender, EventArgs e)
        {
            if(ADD.Text == "ADD")
            {
                if (Page.IsValid)
                {
                    int value = InsertDocumentype();
                    switch (value)
                    {
                        case 1:
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Added Succesfullt ... '); document.location.href='" + ResolveUrl("~/Pages/AdminPages/AddItemPages.aspx") + "';", true);
                            break;
                        default:
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Document Type is Already Exists');", true);
                            break;
                    }
                }
            }
            else
            {
                if (Page.IsValid)
                {
                    int value = UpdateDocumentType();
                    switch (value)
                    {
                        case 1:
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Updated Succesfullt ... '); document.location.href='" + ResolveUrl("~/Pages/AdminPages/AddItemPages.aspx") + "';", true);
                            break;
                        case 2:
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Document Type Already Exists '); ", true);
                            break;
                        default:
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Some Thing Went Wrong please try again ... '); ", true);
                            break;
                    }

                }
            }
        }
        private int InsertDocumentype()
        {
            try
            {
                int UserId = int.Parse(Request.Cookies["UserId"].Value);
                string DocName = DocType.Text.Trim();
                int Maxl = int.Parse(MaxLength.Text.Trim());
                int Minl = int.Parse(MinLength.Text.Trim());
                int value = AdminWork.AddDocumentType(DocName,Maxl,Minl,UserId);
                return value;
            }
            catch { throw; }
            
        }

        private int UpdateDocumentType()
        {
            try
            {
                int id = Convert.ToInt32(showDoc.SelectedValue);
                int UserId = Convert.ToInt32(Request.Cookies["UserId"].Value);
                string DocName = DocType.Text.Trim();
                int Maxl = int.Parse(MaxLength.Text.Trim());
                int Minl = int.Parse(MinLength.Text.Trim());
                bool active = false;
                if(IsActive.Checked == true)
                {
                    active = true;
                }
                int value = AdminWork.updateDocType(1,id , DocName, Maxl, Minl, UserId, active);
                return value;
            }
            catch
            {
                throw;
            }
        }

        protected void showDoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            int DocId = Convert.ToInt32(showDoc.SelectedValue);
            DataSet dat = RetrivedData.getDocTypeData(DocId);
            DataTable dt = new DataTable();

            dt = dat.Tables[0];
            if(dt.Rows.Count > 0)
            {
                DocType.Text = dt.Rows[0]["DocName"].ToString();
                MaxLength.Text = dt.Rows[0]["DocMaxLength"].ToString();
                MinLength.Text = dt.Rows[0]["DocMinLength"].ToString();
                int CheckValue = Convert.ToInt32(dt.Rows[0]["Active"]);
                if(CheckValue == 1)
                {
                    IsActive.Checked = true;
                }
                else
                {
                    IsActive.Checked = false;
                }

            }
            Panel1.Visible = true;
            ADD.Text = "Update";
        }

        protected void showDoc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Roomid = Convert.ToInt32(showDoc.DataKeys[e.RowIndex].Value.ToString());

            int resultset = 0;
            int modby = Convert.ToInt32(Request.Cookies["UserId"].Value);

            int value = AdminWork.updateDocType(resultset, Roomid, "0", 0, 0, modby,true);
            switch (value)
            {
                case 1:
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Delete successfully !'); document.location.href='" + ResolveUrl("~/Pages/AdminPages/AddItemPages.aspx") + "';", true);
                    break;
                    
                
                default:
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "usernotfound", "alert('Something went Wrong please try again!');", true);
                    break;
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }


        //for ADD RoomType
        



    }
}