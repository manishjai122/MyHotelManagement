<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="HotelInterFace.aspx.cs" Inherits="FirstGoldmedalProject.Pages.UserPages.HotelInterFace" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .MainContainer{
            width:90%;
            margin:auto;
            display:grid;
            grid-template-columns: repeat(3, 1fr);
            margin-top:100px;
        }
        .one{
            width: 350px;
            height: 450px;
            border-radius: 20px;
            border: solid 2px black;
            
            background-color:rgb(232, 240, 254);
            margin-top: 20px;
            margin-right: 60px;
            margin-bottom: 50px;
            transition: transform 1s ease-in-out;
            
        }
        .upper{
            width: 95%;
            margin: auto;
            height: 300px;
            transform: translate(0px , 10px);
            border-radius:20px ;
        }
        .down{
            width: 95%;
            margin: auto;
            height: 80px;
            transform: translate(0px , 45px);
        }
        .button{
            width: 80%;
            height: 50px;
            margin: auto;
            padding-top:40px;
        }
        .one:hover{
            transform:scale(1.1)
        }
        .RoomType{
            margin-top:10px;
            width:100%;
            height:40px;
            font-size:25px;
            color:white;
            text-shadow:2px 2px 5px black;
        }
        .roomNo{
            position:absolute;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
 <div class="MainContainer">
    <asp:ListView ID="HotelRoom" runat="server" OnItemCommand="HotelRoom_ItemCommand">
        <ItemTemplate>

            <div class="one">
                <asp:HiddenField ID="HiddenField1" runat="server" value='<%# Eval("RoomNo") %>'/>
            <div class="upper">
                <label>Room No:</label> <asp:Label ID="Label3" CssClass="roomNo" runat="server" Text='<%# Eval("RoomNo") %>'></asp:Label>
                <image src="Resources/AddRoomPhotoes/<%# Eval("RoomImage") %>" Width="100%" Height="290px"></image>
               <%-- <asp:Image ID="Image1" runat="server"   Width="100%" Height="290px" />--%>
                <div class="RoomType">
                    <asp:Label ID="Label1" runat="server" Text="Room Type : "></asp:Label><asp:Label ID="Label2" runat="server" Text='<%#Eval("RoomType") %>'></asp:Label>
                </div>
                
            </div>
            <div class="down">
            <div class="button">
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-outline-info" Text="BookNow" Width="100%" Height="50px"/>
            </div>
        </div>
    </div>
        </ItemTemplate>

    </asp:ListView>
</div>
    
</asp:Content>
