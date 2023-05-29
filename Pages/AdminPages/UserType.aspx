<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="UserType.aspx.cs" Inherits="FirstGoldmedalProject.Pages.AdminPages.UserType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .firstFieldTyep{
            width: 100%;
            margin: auto;
            margin-top: 50px;
            margin-bottom: 100px;
            
        }
        .one{
            width: 40%;
            margin:auto;
            border:solid 2px black;
        }
        .two{
          width: 90%;
           margin:auto;
           margin-top:100px;

        }
        .DocField{
            width:50%;
            height:30px;
            margin:auto;
            margin-left:20px;
            border:none;
            border-bottom:solid 2px black;
            text-indent:50px;
            
        }
        .roomtype{
            width: 70%;
            height: 250px;
            margin: auto;
            border: solid 2px black;
            border-radius: 20px;
        }
        .fields{
            width: 90%;
            margin: auto;
            margin-top: 20px;
            margin-bottom: 30px;
        }
        .btnarea{display:flex;
                 width:80%;
                 margin:auto;
        }

        .btnfield{
            width:120px;
            height:40px;
            margin-left:20px;
            margin-right:40px;
            margin-top:30px;
        }
        .gridew{
            width:100%;
            height:350px;
            margin:auto;
            overflow-y:auto;
            margin-left:80px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="firstFieldTyep">
        <h1 class="text-left"><asp:Label ID="Label9" runat="server"  ForeColor="#3366FF" Text="User Type" Width="429px" Height="61px"></asp:Label></h1>
             <div class="one">
                 <div class="fields">
                     

                     <label for="TextBox1">Enter Room Type : </label>
                     <asp:TextBox ID="TextBox1" CssClass="DocField" onkeypress="return AllowAlphabet(event)" AutoCompleteType="Disabled" placeholder="Enter Room Type" runat="server"></asp:TextBox>
                     

                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" ErrorMessage="RoomType Required" ForeColor="Red" ValidationGroup="RoomTypevalidate"></asp:RequiredFieldValidator>
                     <div class="fields">
                         <asp:Panel ID="Panel1" runat="server" Visible="False">
                             <label for="RoomActive">Is Active : </label>
                         &nbsp;&nbsp;&nbsp;
                         <asp:CheckBox ID="IsActive" runat="server" />
                         </asp:Panel>
                     </div>

                      <div class="btnarea" style="margin-top:30px">
                          <asp:Button ID="Can" CssClass="btnfield" runat="server" Text="Cancel" OnClick="Can_Click" />
                          <asp:Button ID="Submit" CssClass="btnfield" runat="server" Text="Submit" ValidationGroup="RoomTypevalidate" OnClick="Submit_Click"/>
                        
                    </div>
                     
                    
                     
                 </div>
             </div>
            <div class="two">
                <div class="gridew">
                    <asp:GridView ID="Usergride" DataKeyNames="TypeId" runat="server" Width="80%" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnRowDeleting="Usergride_RowDeleting" OnSelectedIndexChanged="Usergride_SelectedIndexChanged">
                        <Columns>
                        <asp:CommandField ButtonType="Button" HeaderText="Select" ShowSelectButton="True">
                        <ControlStyle ForeColor="#33CC33" Width="70px" />
                        <ItemStyle Width="80px" />
                        </asp:CommandField>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True">
                        <ControlStyle ForeColor="Red" Width="70px" />
                        <ItemStyle Width="80px" />
                        </asp:CommandField>
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
                    <asp:Label ID="emptyplace2" runat="server" Text="Label" Visible="False"></asp:Label>
                </div>
            </div>
        </div>
</asp:Content>
