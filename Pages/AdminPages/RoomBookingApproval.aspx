<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="RoomBookingApproval.aspx.cs" Inherits="FirstGoldmedalProject.Pages.AdminPages.RoomBookingApproval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .wrapper {
            
            width: 100%;
            margin: 0 auto;
        }

        .tabs {
            position: relative;
            margin: 3rem 0;
            background: #1abc9c;
            height: 14.75rem;
        }

            .tabs::before,
            .tabs::after {
                content: "";
                display: table;
            }

            .tabs::after {
                clear: both;
            }

        .tab {
            float: left;
        }

        .tab-switch {
            display: none;
        }

        .tab-label {
            position: relative;
            display: block;
            line-height: 2.75em;
            height: 3em;
            padding: 0 1.618em;
            background: #1abc9c;
            border-right: 0.125rem solid #16a085;
            color: #fff;
            cursor: pointer;
            top: 0;
            transition: all 0.25s;
        }

            .tab-label:hover {
                top: -0.25rem;
                transition: top 0.25s;
            }

        .tab-content {
            width:100%;
            height:100%;
            
            position: absolute;
            z-index: 1;
            top: 2.75em;
            left: 0;
            padding: 1.618rem;
            background: #fff;
            color: #2c3e50;
            
            opacity: 0;
            transition: all 0.35s;
        }

        .tab-switch:checked + .tab-label {
            background: #2c3e50;
            color: #ecf0f1;
            border-bottom: 0;
            border-right: 0.125rem solid #fff;
            transition: all 0.35s;
            z-index: 1;
            top: -0.0625rem;
        }

        .tab-switch:checked + label + .tab-content {
            z-index: 2;
            opacity: 1;
            transition: all 0.35s;
        }
        
        .defualpage {
            width: 100%;
            margin: auto;
            text-align: center;
            margin-top: 100px;
        }
        .gride{
            width:90%;
            margin:auto;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="margin-top:50px">Hotel RoomBooking Approval Page</h1>



    <div class="wrapper">
  <div class="tabs">
    <div class="tab">
      <input type="radio" name="css-tabs" id="tab-1" checked class="tab-switch">
      <label for="tab-1" class="tab-label">Main Page</label>
      <div class="tab-content">
          <div class="defualpage"><asp:GridView CssClass="gride" DataKeyNames="BookId" ID="BookingApproval" runat="server"  OnSelectedIndexChanged="BookingApproval_SelectedIndexChanged" OnRowDeleting="BookingApproval_RowDeleting" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ButtonType="Button" HeaderText="Approve" SelectText="YES" ShowCancelButton="False" ShowSelectButton="True" >
            <ControlStyle BackColor="#33CC33" BorderColor="Black" BorderStyle="Solid" Width="70px" />
            <ItemStyle Width="70px" />
            </asp:CommandField>
            <asp:CommandField ButtonType="Button" DeleteText="No" HeaderText="Approve" ShowCancelButton="False" ShowDeleteButton="True" >
            <ControlStyle BackColor="Red" BorderColor="Black" BorderStyle="Solid" Width="70px" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:Label ID="emptytxt" runat="server" Text="Label" Visible="False"></asp:Label>
    </div>
    
      </div>
    </div>
    <div class="tab">
      <input type="radio" name="css-tabs" id="tab-2" class="tab-switch">
      <label for="tab-2" class="tab-label">All Approved</label>
      <div class="tab-content">
           <div class="defualpage">

               
          <asp:GridView ID="Rejected" runat="server" CssClass="gride" DataKeyNames="BookId" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="Rejected_SelectedIndexChanged">

              <Columns>
                  <asp:CommandField ButtonType="Button" HeaderText="REJECT" SelectText="Reject" ShowCancelButton="False" ShowSelectButton="True" >
            <ControlStyle BackColor="#33CC33" BorderColor="Black" BorderStyle="Solid" Width="70px" />
            <ItemStyle Width="70px" />
            </asp:CommandField>
              </Columns>

              <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
        
          </asp:GridView>
          <asp:Label ID="emptytxt2" runat="server" Text="Label" Visible="False"></asp:Label>

               
           </div>
      </div>
    </div>
    <div class="tab">
      <input type="radio" name="css-tabs" id="tab-3" class="tab-switch">
      <label for="tab-3" class="tab-label">All Rejected</label>
      <div class="tab-content"><div class="defualpage">

          <asp:GridView ID="Approved" runat="server" CssClass="gride" DataKeyNames="BookId" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="Approved_SelectedIndexChanged">

                   <Columns>
                       <asp:CommandField ButtonType="Button" HeaderText="Apprved" SelectText="Approve" ShowCancelButton="False" ShowSelectButton="True" >
            <ControlStyle BackColor="#33CC33" BorderColor="Black" BorderStyle="Solid" Width="70px" />
            <ItemStyle Width="70px" />
            </asp:CommandField>
                   </Columns>



                   <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
        
               </asp:GridView>
               <asp:Label ID="emptytxt1" runat="server" Text="Label" Visible="False"></asp:Label>

                               </div></div>
    </div>
  </div>
  
</div>




    
</asp:Content>
