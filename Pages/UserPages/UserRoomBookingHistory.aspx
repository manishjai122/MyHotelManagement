<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="UserRoomBookingHistory.aspx.cs" Inherits="FirstGoldmedalProject.Pages.UserPages.UserRoomBookingHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
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
    <div class="defualpage">
     
                <asp:GridView ID="GridView1" runat="server"  CssClass="gride">
                <FooterStyle BackColor="#FF6600" BorderColor="#660033" BorderStyle="Dotted" HorizontalAlign="Center" VerticalAlign="Middle" />
                <HeaderStyle BackColor="#99CCFF" BorderColor="#003399" BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Middle" />
                <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:GridView>
        <asp:Label ID="Label1" runat="server"></asp:Label>
      </div>

</asp:Content>
