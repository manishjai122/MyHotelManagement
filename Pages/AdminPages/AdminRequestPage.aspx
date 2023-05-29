<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="AdminRequestPage.aspx.cs" Inherits="FirstGoldmedalProject.Pages.AdminPages.AdminRequestPage" %>
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
            width:100%;
            margin:auto;
            margin-bottom:50px;
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="margin-top:50px">Admin Request Approval Page</h1>
    <div class="wrapper">
  <div class="tabs">
    <div class="tab">
      <input type="radio" name="css-tabs" id="tab-1" checked class="tab-switch">
      <label for="tab-1" class="tab-label">Main Page</label>
      <div class="tab-content">
          <div class="defualpage">
        <asp:GridView ID="AdminRquest" DataKeyNames="UserId" CssClass="gride" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnRowDeleting="AdminRquest_RowDeleting" OnSelectedIndexChanged="AdminRquest_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField SelectText="Yes" ShowCancelButton="False" ShowSelectButton="True" HeaderText="Approve" >
                <ControlStyle BackColor="Lime" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Width="70px" Font-Bold="True" Font-Size="18px" ForeColor="White" />
                <ItemStyle BackColor="White" BorderColor="White" BorderWidth="2px" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                
                </asp:CommandField>

                <asp:CommandField DeleteText="No" ShowCancelButton="False" ShowDeleteButton="True" HeaderText="Approve" > 
                    <ControlStyle BackColor="Red" BorderColor="Black" BorderStyle="Solid" ForeColor="White" Width="70px" Font-Bold="True" Font-Size="18px" BorderWidth="3px" />
                <ItemStyle Width="80px" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:CommandField>
            </Columns>
           
           
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" Font-Size="18px" ForeColor="White" Height="50px" HorizontalAlign="Left" VerticalAlign="Middle" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" HorizontalAlign="Left" VerticalAlign="Middle" Width="100%" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
           
           
        </asp:GridView>
        <asp:Label ID="EmptyPlace" runat="server" Text="Label" Visible="False"></asp:Label>
    </div>
      </div>
    </div>
    <div class="tab">
      <input type="radio" name="css-tabs" id="tab-2" class="tab-switch">
      <label for="tab-2" class="tab-label">All Approved</label>
      <div class="tab-content">
           <div class="defualpage">

               <asp:GridView ID="AllRejected" runat="server" DataKeyNames="UserId" CssClass="gride" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="AllRejected_SelectedIndexChanged">
              <Columns>
                  <asp:CommandField SelectText="Reject" ShowCancelButton="False" ShowSelectButton="True" HeaderText="REJECT" >
                <ControlStyle BackColor="RED" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Width="70px" Font-Bold="True" Font-Size="18px" ForeColor="White" />
                <ItemStyle BackColor="White" BorderColor="White" BorderWidth="2px" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                
                </asp:CommandField>
              </Columns>
                          <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" Font-Size="18px" ForeColor="White" Height="50px" HorizontalAlign="Left" VerticalAlign="Middle" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" HorizontalAlign="Left" VerticalAlign="Middle" Width="100%" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
          </asp:GridView>
          <asp:Label ID="EmptyPlace2" runat="server" Text="Label" Visible="False"></asp:Label>

              
           </div>
      </div>
    </div>
    <div class="tab">
      <input type="radio" name="css-tabs" id="tab-3" class="tab-switch">
      <label for="tab-3" class="tab-label">All Rejected</label>
      <div class="tab-content"><div class="defualpage">
          
           <asp:GridView ID="AllApproved" runat="server" DataKeyNames="UserId" CssClass="gride" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="AllApproved_SelectedIndexChanged">

                   <Columns>
                       <asp:CommandField SelectText="Approve" ShowCancelButton="False" ShowSelectButton="True" HeaderText="APPROVED" >
                <ControlStyle BackColor="Lime" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Width="70px" Font-Bold="True" Font-Size="18px" ForeColor="White" />
                <ItemStyle BackColor="White" BorderColor="White" BorderWidth="2px" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                
                </asp:CommandField>
                   </Columns>
                               <FooterStyle BackColor="#CCCC99" />
                                <HeaderStyle BackColor="#6B696B" Font-Bold="True" Font-Size="18px" ForeColor="White" Height="50px" HorizontalAlign="Left" VerticalAlign="Middle" />
                                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#F7F7DE" HorizontalAlign="Left" VerticalAlign="Middle" Width="100%" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                <SortedAscendingHeaderStyle BackColor="#848384" />
                                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                <SortedDescendingHeaderStyle BackColor="#575357" />
               </asp:GridView>
               <asp:Label ID="EmptyPlace1" runat="server" Text="Label" Visible="False"></asp:Label>
                               </div></div>
    </div>
  </div>
  
</div>

   
    
    
   
</asp:Content>
