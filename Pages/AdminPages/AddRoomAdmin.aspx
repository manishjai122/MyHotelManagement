<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="AddRoomAdmin.aspx.cs" Inherits="FirstGoldmedalProject.Pages.AdminPages.AddRoomAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .RoomContainer{
            width:500px;
            height:100%;
            margin:auto;
            margin-top:50px;
            padding-bottom:50px;
            border:solid 2px black;
        }
        .trial{
            height:500px;
        }
        .MidContainer{
            width:90%;
            height:100%;
            margin:auto;
            margin-top:30px;
        }
      
        .Details{
            width:80%;
            margin:auto;
            text-align:center;
            margin-top:40px;
            margin-bottom:30px;
        }
        
        .SubBtn{
            float:right;
            margin-right:100px;
            padding-bottom:20px;
            
        }
        .borderStyle{
            text-align:center;
            border:none;
            border-bottom:solid 2px black;
        }
        .auto-style1 {
            width: 67%;
        }
        .auto-style2 {
            width: 97%;
        }
        .auto-style3 {
            width: 77%;
            text-align: center;
            margin-top: 10px;
            margin-bottom: 20px;
            margin-left: auto;
            margin-right: auto;
        }
        .defualpage {
            width: 100%;
            height:100%;
            margin: auto;
            text-align: center;
            margin-top: 100px;
            margin-bottom:80px;
        }
        .gride{
            width:100%;
            margin:auto;
            margin-bottom:50px;
        }
        .imageFit{
            width:300px;
            height:200px;
            margin:auto;
        }
        .image{
            width:100%;
            height:150px;
          
        }
        .hidefile{
            margin-top:40px;
            display:none;
           
        }
        /*.imageFit:hover .hidefile{
           display:block;
        }*/
        .floatImage{
            width:250px;
            position:absolute;
            background:white;
            transform:translate(-120px,10px);
            font-size:14px;
        }
        

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <script type="text/javascript" language="javascript">
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

    <h1 style="margin-top:50px">Add Hotel Room Page</h1>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    
                        
            <div class="RoomContainer">
            <div class="MidContainer">
                <div class="Details">
                    <asp:TextBox ID="RoomNo" runat="server" AutoCompleteType="Disabled" MaxLength="10" placeholder="Enter Room Number" CssClass="borderStyle" Height="30px" Width="90%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="RoomNo" Display="Dynamic" ErrorMessage="*" Font-Size="23px" ForeColor="Red" ValidationGroup="subEntry"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="RoomNo" ErrorMessage="*" Font-Size="23px" ForeColor="Red" ValidationGroup="UpEntry"></asp:RequiredFieldValidator>
                </div>
                <div class="Details">
                    <asp:DropDownList ID="RoomType" runat="server" Height="30px" Width="90%" DataSourceID="SqlDataSource1" DataTextField="RoomType" DataValueField="RoomType">
                        
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GoldmedalFirstProjectConnectionString3 %>" SelectCommand="SELECT [RoomType] FROM [ADDRoomType] where IsActive = 1 and DeleteBy is null"></asp:SqlDataSource>
                </div>
                 <asp:Panel ID="firstpanel" runat="server">
                    
                       
                <div class="auto-style3">
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style1">
                                Upload Images
                            </td>
                            <td width="40%">
                                
                                <asp:FileUpload ID="FileUpload1" runat="server"  Width="180px"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="subEntry" Font-Size="23px"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="*jpeg,gif,png" ForeColor="Red" ValidationExpression=".*\.([gG][iI][fF]|[jJ][pP][gG]|[jJ][pP][eE][gG]|[bB][mM][pP])$" ValidationGroup="subEntry"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="Details">
                    <asp:TextBox ID="BookingPrice" AutoCompleteType="Disabled" MaxLength="10" placeholder="Enter Booking price" CssClass="borderStyle" runat="server" Height="30px" Width="90%" onkeypress="return numeric(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="BookingPrice" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="subEntry" Font-Size="23px"></asp:RequiredFieldValidator>
                    
                </div>
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                      <ContentTemplate>
                <div class="Details">
                    
                    <asp:TextBox ID="CancellationPrice" AutoCompleteType="Disabled" MaxLength="10" placeholder="Enter Cancellation Charge" CssClass="borderStyle" runat="server" Height="30px" Width="90%" onkeypress="return numeric(event)" AutoPostBack="True" OnTextChanged="CancellationPrice_TextChanged"></asp:TextBox>
                  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="CancellationPrice" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="subEntry" Font-Size="23px"></asp:RequiredFieldValidator>
                    <asp:Label ID="ComPrice" runat="server" ForeColor="Red"></asp:Label>
                    <%--<asp:CompareValidator ID="CompareValidator1" Operator="LessThanEqual" runat="server" ControlToCompare="BookingPrice" ControlToValidate="CancellationPrice" Display="Dynamic" ErrorMessage="Enter Valid Cancellation Charge" ForeColor="Red" ValidationGroup="ADDRoomVal"></asp:CompareValidator>--%>
                    
                </div>
                            </ContentTemplate>
         </asp:UpdatePanel>

                <div class="SubBtn">
                    <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" style="margin-right:50px;"/>
                    <asp:Button ID="Sub" runat="server" Text="Submit"  Width="100px" OnClick="Sub_Click" ValidationGroup="subEntry"/>
                   
                </div>
                           
                         
                </asp:Panel>
            </div>

                        
        



      <%--             <div class="RoomContainer trial">
            <div class="MidContainer">
                <div class="Details">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="90%" DataSourceID="SqlDataSource3" DataTextField="RoomType" DataValueField="RoomType">
                        
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GoldmedalFirstProjectConnectionString7 %>" SelectCommand="SELECT [RoomType] FROM [ADDRoomType]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GoldmedalFirstProjectConnectionString3 %>" SelectCommand="SELECT [RoomType] FROM [ADDRoomType]"></asp:SqlDataSource>
                </div>--%>

    
       
<%--             <div class="RoomContainer trial">
            <div class="MidContainer">
                <div class="Details">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="90%" DataSourceID="SqlDataSource3" DataTextField="RoomType" DataValueField="RoomType">
                        
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GoldmedalFirstProjectConnectionString7 %>" SelectCommand="SELECT [RoomType] FROM [ADDRoomType]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GoldmedalFirstProjectConnectionString3 %>" SelectCommand="SELECT [RoomType] FROM [ADDRoomType]"></asp:SqlDataSource>
                </div>--%>
    
                 <asp:Panel ID="secoundPanel" runat="server" Visible="False">
                <div class="auto-style3">
                    <table class="auto-style2">
                        <tr>
                           <td>
                                
                               <div class="imageFit"  onmouseover="bigImg()">
                                   <div class="image">
                                       <image src="https://localhost:44358/Resources/AddRoomPhotoes/<%=imagesView %>" Width="100%" Height="180px"></image>
                                   </div>
                                   <asp:Label ID="Label1" CssClass="floatImage" runat="server" Text="Update Image"></asp:Label>

                                   <div class="hidefile">
                                       <asp:FileUpload ID="SecoundImage" runat="server" />
                                   </div>
                               </div>
                                        
                           </td>
                        </tr>
                    </table>
                </div>
                <div class="Details" style="margin-top:0px;">
                    <asp:TextBox ID="TextBox1" AutoCompleteType="Disabled" MaxLength="10" placeholder="Enter Booking price" CssClass="borderStyle" runat="server" Height="30px" Width="90%" onkeypress="return numeric(event)"></asp:TextBox>
                    <br />Enter MaxLength
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpEntry" Font-Size="23px"></asp:RequiredFieldValidator>
                    
                </div>
                    
                     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                         <ContentTemplate>
                <div class="Details">
                    <asp:TextBox ID="TextBox2" AutoCompleteType="Disabled" MaxLength="10" placeholder="Enter Cancellation Charge" CssClass="borderStyle" runat="server" Height="30px" Width="90%" onkeypress="return numeric(event)" AutoPostBack="True" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                    <br />Enter MinLength<asp:Label ID="textError" runat="server" ForeColor="Red"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="UpEntry" Font-Size="23px"></asp:RequiredFieldValidator>
                    
                </div></ContentTemplate>
                         
                         </asp:UpdatePanel>
                         
                            
                     <div class="Details">
                         <label>IsActive : </label>
                         <asp:CheckBox ID="CheckBox1" runat="server" />
                     </div> 

                                        
                <div class="SubBtn">
                    <asp:Button ID="p2Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" style="margin-right:50px;"/>
                    <asp:Button ID="p2SubClick" runat="server" Text="Update"  Width="100px"  ValidationGroup="UpEntry" OnClick="p2SubClick_Click" />
                   
                </div>
                                       
                  </asp:Panel>
           </div>
     

      
        
    <div class="defualpage ">
        <asp:GridView ID="GridView1" CssClas="gride" DataKeyNames="Roomid" runat="server" Width="90%" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:CommandField ButtonType="Button" HeaderText="Select" ShowSelectButton="True" />
                <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:Label ID="Emptytxt" runat="server" Visible="False"></asp:Label>
    </div>
</asp:Content>
