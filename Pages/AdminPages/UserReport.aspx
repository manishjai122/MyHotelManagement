<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="UserReport.aspx.cs" Inherits="FirstGoldmedalProject.Pages.AdminPages.UserReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
        .DropArea{
            width:300px;
            float:left;
            margin-bottom:40px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1 class="text-left"><asp:Label ID="Label9" runat="server"  ForeColor="#3366FF" Text="User Report" Width="429px" Height="61px"></asp:Label></h1>
    <div class="defualpage">

        <div class="DropArea">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Value="0">All User Report</asp:ListItem>
                <asp:ListItem Value="1">All Admin</asp:ListItem>
                <asp:ListItem Value="2">All User</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:GridView ID="UserDetails" DataKeyNames="UserId" CssClass="gride" runat="server"  BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
           

            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" BorderColor="White" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" VerticalAlign="Top" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="Gray" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />

        </asp:GridView>
         <asp:Label ID="Emptytxt" runat="server" Text="Label" Visible="False"></asp:Label>
    </div>
</asp:Content>
