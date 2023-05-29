<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="DashBord.aspx.cs" Inherits="FirstGoldmedalProject.Pages.AdminPages.DashBord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .dashbord{
            width: 100%;
            height: 100%;
            margin: auto;
            display: flex;
            margin-bottom:200px;
           
        }
        .fixCard{
            width: 200px;
            height: 150px;
            border: solid 2px black;
            border-radius: 20px;
            margin-top:50px;
            margin-bottom:50px;
            margin-left:50px;
            margin-right: 50px;
            animation-name: flipcard ;
            animation-duration: 4s;
            animation-timing-function: ease-out;
        }
        @keyframes flipcard{
            0%{
                transform: rotateZ(0deg);
            }
            35%{
                transform: rotateZ(45deg);
            }
            70%{
                transform: rotateX(90deg);
            }
            100%{
                transform: rotateZ(20deg);
            }
        }
        .name{
            width: 100%;
            height: 70px;
            text-align:center;
            border-radius: 20px 20px 0 0;
            color:white;
            text-shadow:2px 2px 5px black;
            background: rgb(255,157,0);
            background: linear-gradient(45deg, rgba(255,157,0,0.7263947815454307) 0%, rgba(255,0,109,0.6227533249627977) 56%, rgba(0,113,255,0.6227533249627977) 77%);
        }
        .fixCard2{
            transform: translate(0,50px);
        }
        .fixCard3{
            transform: translate(0,100px);
        }
        .fixCard4{
            transform: translate(0,150px);
        }
        .fixCard5{
            transform: translate(0,200px);
        }
        .post{
            width:60%;
            height: 50px;
            margin: auto;
            text-align:center;
            font-size:25px;
            transform: translate(0,15px);
           
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="margin-top:50px">DashBord Page</h1>
    <div class="dashbord">
        <div class="fixCard">
            <div class="name">
                <h4>&nbsp;Total Rooms</h4>
            </div>
            <div class="value">
                <div class="post">
                    <asp:Label ID="TotalRoom" CssClass="LabelArea" runat="server" Text="Label"></asp:Label></div>
            </div>
        </div>
        <div class="fixCard fixCard2">
            <div class="name">
                <h5>&nbsp;Total Booked Rooms</h5>
            </div>
            <div class="value">
                <div class="post">
                    <asp:Label ID="TotalBookerRoom"  CssClass="LabelArea" runat="server" Text="Label"></asp:Label></div>
            </div>
        </div>
        <div class="fixCard fixCard3">
            <div class="name">
                <h5>Total Remaining Room</h5>
            </div>
            <div class="value">
                <div class="post">
                    <asp:Label ID="TotalRemainRoom"  CssClass="LabelArea" runat="server" Text="Label"></asp:Label></div>
            </div>
        </div>
        <div class="fixCard fixCard4">
            <div class="name">
                <h4> &nbsp;Total Users</h4>
            </div>
            <div class="value">
                <div class="post">
                    <asp:Label ID="TotalUser"  CssClass="LabelArea" runat="server" Text="Label"></asp:Label></div>
            </div>
        </div>
        <div class="fixCard fixCard5">
            <div class="name">
                <h4>Total Admin</h4>
            </div>
            <div class="value">
                <div class="post">
                    <asp:Label ID="TotalAdmin"  CssClass="LabelArea" runat="server" Text="Label"></asp:Label></div>
            </div>
        </div>
    </div>
</asp:Content>
