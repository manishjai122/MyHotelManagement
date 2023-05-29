<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="UserDataUpdatePanel.aspx.cs" Inherits="FirstGoldmedalProject.Pages.AdminPages.UpdateSite.UserDataUpdatePanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .firstPanel{
            width:100%;
            display:flex;
             border: solid 2px black;
            border-radius: 20px;
            margin-top:100px;
        }
        .panel{
            width:80%;
            height: 500px;
            margin: auto;
           
            
            
        }
        .panelMid{
            width: 110%;
            margin: auto;
            transform: translate(0,20px);
        }
         .firstcolumn{
            display: flex;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .field{
            width: 35%;
            margin-left: 30px;
            
        }
        .btnfieldupdate{
            width: 60%;
            float: right;
            display: flex;
        }
        .btnfield {
            width: 30%;
            margin-top:40px;
            margin-left: 10px;
            margin-right: 20px;
        }
        .Era {
            width: 95%;
            margin: auto;
            border: none;
            border-bottom: 2px solid black;
            font-size:20px;
            text-align:center;
        }
        .btnEra{
             width: 95%;
            margin: auto;
            font-size:20px;
            text-align:center;
        }

        
        .auto-style5 {
            width: 95%;
            font-size: 20px;
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            margin-top: auto;
        }
        .imagefloat{
            width:250px;
            height:300px;
            margin-top:50px;
            margin-right:10px;
            z-index:2;
            background-color:white;
        }
        .namefieldcolumn{
            width:18%;

            
        }
        .image{
            width:100%;
            height:200px;
          
        }
        .hidefile{
            margin-top:40px;
            display:none;
            margin-left:20px;
           
        }
        .floatImage{
            width:200px;
            position:absolute;
            background:white;
            transform:translate(10px,0px);
            text-align:center;
            font-size:14px;
        }

        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function numeric(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && ((charCode >= 48 && charCode <= 57) || charCode == 46))
                return true;
            else {

                return false;
            }
        }

        function AllowAlphabet(e) {
            isIE = document.all ? 1 : 0
            keyEntry = !isIE ? e.which : event.keyCode;
            if (((keyEntry >= '65') && (keyEntry <= '90')) || ((keyEntry >= '97') && (keyEntry <= '122')) || (keyEntry == '46') || (keyEntry == '32') || keyEntry == '45')
                return true;
            else {

                return false;
            }
        }
        function bigImg() {

            var hike = document.querySelector(".hidefile")
            hike.style.display = "block";

        }

        

    </script>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="firstPanel">

      <div class="panel">
        <div class="panelMid">
            <div class="firstcolumn hiperfield">
                <div class="field  namefieldcolumn">
                   <asp:TextBox ID="firstName" Placeholder="Enter FirstName"  MaxLength="10"  CssClass="Era" runat="server" onkeypress="return AllowAlphabet(event)"></asp:TextBox>
                    <br />Enter First Name
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="firstName" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpdatePanel"></asp:RequiredFieldValidator>
                </div>
                 <div class="field namefieldcolumn">
                     <asp:TextBox ID="LastName" Placeholder="Enter Sir Name"  MaxLength="10"  CssClass="Era" runat="server" onkeypress="return AllowAlphabet(event)"></asp:TextBox>
                     <br />Enter Family Name
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LastName" ErrorMessage="*" ValidationGroup="UpdatePanel" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="field">
                    <asp:TextBox ID="MobileNo" Placeholder="Enter Mobile Number" onkeypress="return numeric(event)" MaxLength="10" CssClass="Era" runat="server"></asp:TextBox>
                    <br /> Enter MobileNumber
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ValidationGroup="UpdatePanel" ControlToValidate="MobileNo" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;              
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ErrorMessage="Invalid Mobile number" ForeColor="Red" ValidationExpression="^[0-9]{10}$" ControlToValidate="MobileNo"></asp:RegularExpressionValidator>
                </div>
                
            </div>
             <div class="firstcolumn">
                <div class="field" >
                   <asp:TextBox ID="Email" Placeholder="Enter Email Id"  MaxLength="30"  CssClass="Era" runat="server"></asp:TextBox>
                    <br /> Enter Email Id
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ValidationGroup="UpdatePanel" ControlToValidate="Email" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="InValid Email Id"  ValidationGroup="UpdatePanel" ControlToValidate="Email" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <div class="field" style="width:80%">
                    <asp:TextBox ID="Addr" Placeholder="Enter your Address" CssClass="Era" runat="server"></asp:TextBox>
                    <br />Enter Address
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ValidationGroup="UpdatePanel" ControlToValidate="Addr" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
           <div class="firstcolumn">
                <div class="field" style="width:25%; margin-left:0px;" >
                   <asp:TextBox ID="UserName" Placeholder="Enter UserName"  MaxLength="30"  CssClass="Era" runat="server"></asp:TextBox>
                    <br />Enter UserName
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ValidationGroup="UpdatePanel" ControlToValidate="UserName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                 <div class="field" style="width:20%; margin-left:5px;">
                    <asp:DropDownList ID="DropDownList1" CssClass="auto-style5" runat="server" DataSourceID="SqlDataSource2" DataTextField="DocName" DataValueField="DocId" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"  ></asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GoldmedalFirstProjectConnectionString2 %>" SelectCommand="SELECT [DocId], [DocName] FROM [AddDocumentType] where DeleteBy is null and IsActive = 1"></asp:SqlDataSource>
                     <br /><font size="2px">Select Document Type</font>
                  
                </div>
                <div class="field"  style="width:30%; margin-left:5px;">
                    <asp:TextBox ID="DocumentNo"  Placeholder="Enter Document Number" CssClass="Era" runat="server" AutoPostBack="True" OnTextChanged="DocumentNo_TextChanged1"></asp:TextBox>
                    <br />Enter Document No<br /><asp:Label ID="error" runat="server" Font-Size="15px" ForeColor="Red"></asp:Label>
                       <asp:RequiredFieldValidator ControlToValidate="DocumentNo" ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ValidationGroup="UpdatePanel" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="field" style="width:15%; margin-left:5px; font-size:20px;">
                    <span> IsActive :<asp:CheckBox ID="checkActive" runat="server" Font-Size="20px" /></span>
                </div>

               
            </div>
                    </ContentTemplate>
            </asp:UpdatePanel>

            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
            <div class="btnfieldupdate">
                <div class="btnfield">
                        <asp:Button ID="Cancel" CssClass="btnEra" runat="server" Text="Cancel" ValidationGroup="UpdatePanel" OnClick="Cancel_Click"  /></div>
                <div class="btnfield">
                            <asp:Button ID="Update" CssClass="btnEra" runat="server" Text="Update" ValidationGroup="UpdatePanel" OnClick="Update_Click" /></div>
            </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                   
        </div>

          

    </div>
         <div class="imagefloat">

             <div class="imageFit"  onmouseover="bigImg()">
                                   <div class="image">
                                       <image  Width="100%" Height="200px" src="https://localhost:44358/Resources/AddRoomPhotoes/<%=imagesView %>"></image>
                                   </div>
                                   <asp:Label ID="Label1" CssClass="floatImage" runat="server" Text="Update Image"></asp:Label>
                                   <div class="hidefile">
                                       <asp:FileUpload ID="SecoundImage" runat="server" />
                                   </div>
                               </div>

    </div>
        </div>
   

</asp:Content>
