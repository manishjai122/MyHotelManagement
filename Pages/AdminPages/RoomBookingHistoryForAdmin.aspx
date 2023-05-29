<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="RoomBookingHistoryForAdmin.aspx.cs" Inherits="FirstGoldmedalProject.Pages.AdminPages.RoomBookingHistoryForAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .defualpage {
            width: 100%;
            margin: auto;
            text-align: center;
            margin-top: 80px;
        }
        .DropArea{
            width:800px;
            float:left;
            display:flex;
            margin-bottom:40px;
        }
        .byRoomm{
            margin-left:20px;
            margin-right:30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="margin-top:50px">Room Booking History </h1>
    <div class="defualpage">
       
        <div class="DropArea">
            <asp:DropDownList ID="filterHistory" runat="server" AutoPostBack="True" Width="200px" OnSelectedIndexChanged="filterHistory_SelectedIndexChanged">
            <asp:ListItem Value="1">All Booking</asp:ListItem>
            <asp:ListItem Value="3">Approved</asp:ListItem>
            <asp:ListItem Value="4">Rejected</asp:ListItem>
            <asp:ListItem Value="2">Pending</asp:ListItem>
        </asp:DropDownList>
            <asp:DropDownList ID="RoomNoDrop" runat="server"  Width="120px" DataSourceID="SqlDataSource3" DataTextField="RoomNo" DataValueField="RoomId" AutoPostBack="True" OnSelectedIndexChanged="RoomNoDrop_SelectedIndexChanged" ></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GoldmedalFirstProjectConnectionString9 %>" SelectCommand="
select  'BY RoomNo' as RoomNo, -1 as RoomId
union All
select Convert(varchar(5),RoomNo) as RoomNo,RoomNo as RoomId from AddRoom where DeleteBy is null and IsActive = 1"></asp:SqlDataSource>
           
        </div>
           
        <asp:GridView ID="RoomHistory" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="100%">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>

        <asp:Label ID="Emptytxt" runat="server" Visible="False"></asp:Label>
    </div>
</asp:Content>
