<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistrationForm.aspx.cs" Inherits="FirstGoldmedalProject.Pages.UserPages.UserRegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/themes/smoothness/jquery-ui.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
   
     <style type="text/css">
        body{
            background-image:url('https://mdbootstrap.com/img/new/textures/full/171.jpg');
        }
        .auto-style4 {
            width: 410px;
        }
        </style>
    <script>
       
        function AllowAlphabet(e) {
            isIE = document.all ? 1 : 0
            keyEntry = !isIE ? e.which : event.keyCode;
            if (((keyEntry >= '65') && (keyEntry <= '90')) || ((keyEntry >= '97') && (keyEntry <= '122')) || (keyEntry == '46') || (keyEntry == '32') || keyEntry == '45')
                return true;
            
        }

        function helloWorld() {
            var x = confirm("Are You want to become admin if yes than click on ok  otherwise click cancel");
            var control = '<%=inpHide.ClientID%>';

            if (x == true) {

                document.getElementById(control).value = "1";

            }

            else {

                document.getElementById(control).value = "0";

            }
        }


    </script>
    

    <link href="../../Resources/App_Themes/Style.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
       <div class="Container"style="background-color:white;">
            <div class="mid_container">
                <div class="field">
                    <asp:TextBox ID="firstname" MaxLength="15" placeholder="Enter Firstname" CssClass="namefield border_style" runat="server" Height="30px" onkeypress="return AllowAlphabet(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="firstname" ForeColor="Red" Display="Dynamic" Font-Size="20px"></asp:RequiredFieldValidator>
                    <asp:TextBox CssClass="sirnamefield border_style"  MaxLength="15" placeholder="Enter Sirname" ID="lastname" Height="30px" runat="server" onkeypress="return AllowAlphabet(event)"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" BackColor="White" ControlToValidate="lastname" Display="Dynamic" ErrorMessage="*" ForeColor="Red" Font-Size="20px"></asp:RequiredFieldValidator>
                    
                </div>
                <div class="field">
                    <asp:TextBox ID="Contact"  MaxLength="10" placeholder="Enter Contact" CssClass="co_field border_style" runat="server" Width="450px" Height="30px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Contact" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="Submitbtngroup" Font-Size="20px"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Contact" Display="Dynamic" ErrorMessage="Enter Valid Number" ForeColor="Red" ValidationExpression="^[0-9]{10}$" ValidationGroup="Submitbtngroup"></asp:RegularExpressionValidator>
                </div>
                <div class="field">
                    <asp:TextBox ID="Email"  MaxLength="50" placeholder="Enter Email" CssClass="co_field border_style" runat="server" Width="450px" Height="30px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Email" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="Submitbtngroup" Font-Size="20px"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Email" Display="Dynamic" ErrorMessage="Enter Valid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Submitbtngroup"></asp:RegularExpressionValidator>
                </div>
                <div class="field">
                    <asp:TextBox ID="Address" placeholder="Enter Address" MaxLength="300" CssClass="co_field border_style" runat="server" Width="450px" Height="60px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Address" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="Submitbtngroup" Font-Size="20px"></asp:RequiredFieldValidator>
                    
                </div>
                <div class="field">
                    <asp:TextBox ID="UserName"  MaxLength="20" placeholder="Enter UserName" CssClass="co_field border_style" runat="server" Width="450px" Height="30px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="UserName" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="Submitbtngroup" Font-Size="20px"></asp:RequiredFieldValidator>
                    
                </div>
                
                <div class="field">
                    <asp:TextBox ID="poassword"  MaxLength="20" placeholder="Enter Password" CssClass="co_field border_style" runat="server" Width="450px" Height="30px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="poassword" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="Submitbtngroup" Font-Size="20px"></asp:RequiredFieldValidator>
                   
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="poassword" ErrorMessage="Maximum 8 characters allowed." ForeColor="Red" ValidationExpression="[a-zA-Z0-9]{8,}$"></asp:RegularExpressionValidator>
                   
                </div>
                <div class="field">
                    <asp:TextBox ID="password_again"  MaxLength="20" placeholder="Enter Password again" CssClass="co_field border_style" runat="server" Width="450px" Height="30px" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="poassword" ControlToValidate="password_again" ErrorMessage="Password not matched" ForeColor="Red" ValidationGroup="Submitbtngroup"></asp:CompareValidator>
                </div>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
                <div class="field">
                    Select Document Type&nbsp;&nbsp;&nbsp;&nbsp;  <asp:DropDownList ID="Doc_Type" runat="server" BackColor="#FF9900" ForeColor="White" Height="23px" Width="145px"   DataSourceID="SqlDataSource1" DataTextField="DocName" DataValueField="DocId" AutoPostBack="True" OnSelectedIndexChanged="Doc_Type_SelectedIndexChanged">
                        
                        
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GoldmedalFirstProjectConnectionString4 %>" SelectCommand="SELECT [DocId], [DocName] FROM [AddDocumentType] where DeleteBy is null and IsActive = 1"></asp:SqlDataSource>
                   </div>
                
                <div class="field">
                    <asp:TextBox ID="Doc_No"  placeholder="Enter DocNumber" CssClass="co_field border_style"  runat="server" Width="450px" Height="30px" AutoPostBack="True" OnTextChanged="Doc_No_TextChanged" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Doc_No" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="Submitbtngroup" Font-Size="20px"></asp:RequiredFieldValidator>
                    <asp:Label ID="error" runat="server" ForeColor="Red"></asp:Label>
                    
                    
                    
                </div>
                    </ContentTemplate></asp:UpdatePanel>
                <div >
                   <table class="auto-style4">
                       <tr>
                           <td class="auto-style2"><p style="margin-left:35px;">UpLoad Document :</p></td>
                           <td>
                               <asp:FileUpload ID="Doc_Img" runat="server" CssClass="auto-style3" Width="205px" />
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="Doc_Img" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="Submitbtngroup" Font-Size="20px"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="Doc_Img" Display="Dynamic" ErrorMessage="*jpeg,gif,png" ForeColor="Red" ValidationExpression=".*\.([gG][iI][fF]|[jJ][pP][gG]|[jJ][pP][eE][gG]|[bB][mM][pP])$" ValidationGroup="Submitbtngroup"></asp:RegularExpressionValidator>
                               <asp:CustomValidator ID="CustomValidator4" runat="server" ControlToValidate="Doc_Img" ErrorMessage="Photo Size must be Less than 200KB" ForeColor="Red" OnServerValidate="CustomValidator4_ServerValidate"></asp:CustomValidator>
                               </td>
                       </tr>
                   </table>
                </div>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server"><ContentTemplate>
                <div class="field" style="display:flex;">
                      <asp:HiddenField ID="inpHide" runat="server" />
                    <asp:Label ID="AdminR" runat="server" Text="Request For Admin" Font-Size="18px"></asp:Label>&nbsp;:&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="Admin_Request" runat="server" AutoPostBack="True" onclick="helloWorld()" OnCheckedChanged="Admin_Request_CheckedChanged" />
                    
                </div>

                
                <div class="btn_sub">
                    <asp:Button ID="submit" runat="server" Text="submit" Width="95px" OnClick="submit_Click" ValidationGroup="Submitbtngroup" />
                </div>
                    </ContentTemplate></asp:UpdatePanel>
                <p>Alredy have Account <a  href="<%=Page.ResolveUrl("~/MainLoginPage.aspx") %>">LogIn</a></p>
            </div>
        </div>
   
    </form>
</body>
</html>
