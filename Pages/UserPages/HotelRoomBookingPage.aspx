<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HotelRoomBookingPage.aspx.cs" Inherits="FirstGoldmedalProject.Pages.UserPages.HotelRoomBookingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <link href="../../Resources/App_Themes/Style.css" rel="stylesheet" />

     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/themes/smoothness/jquery-ui.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>


     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/themes/smoothness/jquery-ui.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>



    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
       a{
           color:black;
       }
        a:hover {
            background-color:hsl(191deg 43% 53% / 90%) !important;
            color:white !important;
        }
        a:active{
            background-color:hsl(191deg 43% 53% / 90%) !important;
            color:white !important;
        }
        .hyper{
            text-decoration:none;
            line-height:40px;
        }
        .Cookiname{
            margin-right:20px;
        }
        
   
        .RequestBox{
            width: 600px;
            height: 450px;
            margin:auto;
            margin-top:100px;
            margin-bottom:50px;
           background-color:#e3f2fd;
            border-radius: 20px;
            border: solid 2px black;
        }
        .midRequestBox{
            width: 98%;
            height: 380px;
            transform: translate(0,10px);
        }
        .inputField{
            display: flex;
            margin-left: 18px;
            height: 40px;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .letterfield{
            width: 25%;
            text-align: center;
            font-size:20px;
        }
        .textboxfield{
            width: 70%;
            text-align: center;
        }
        .dateField{
            display: flex;
        }
        .first{
            width: 45%;
            margin-left: 10px;
        }
        .inputDate{
            width: 96%;
            height: 35px;
            font-size: 20px;
        }
        .btnsow{
            margin-top: 20px;
            float: right;
            margin-right: 100px;

        }
        .borderStyle{
            border:none;
            border-bottom: solid 2px black;
            text-indent : 20px;
            font-size:20px;
        }
        .top{
            margin-left:50px;
            position:absolute;
            top:40%;
            background-color:yellow;
        }
        .imageContainer{
            width:90%;
            height:800px;
            margin:auto;
            position:sticky;
            top:100px;
        }
        .auto-style1 {
            width: 25%;
            text-align: center;
            font-size: 20px;
            height: 22px;
        }
    </style>
    <script>
        var arrayOf = "<%=getValue%>";
        var bolta = arrayOf.split(" ");
        

        $(function () {
            $("#From").datepicker({
                dateFormat: 'dd-mm-yy',
                minDate: 0,
                beforeShowDay: function (date) {
                    var String = jQuery.datepicker.formatDate("m/dd/yy", date);
                    return [bolta.indexOf(String) == -1];
                }
            });

            $("#To").datepicker({
                dateFormat: 'dd-mm-yy',
                minDate: 0,
                beforeShowDay: function (date) {
                    var String = jQuery.datepicker.formatDate("m/dd/yy", date);
                    return [bolta.indexOf(String) == -1];
                }
            });

        });
    </script>
    
            

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd;">
    <div class="container-fluid"> m
    <a class="navbar-brand" href="#">HotelBooking</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="<%=Page.ResolveUrl("~/HotelInterFace.aspx") %>">Home</a>
        </li>
          <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="<%=Page.ResolveUrl("~/Pages/UserPages/UserRoomBookingHistory.aspx") %>">Book History</a>
        </li>
          
      </ul>
      <span class="navbar-text">
          <asp:Label ID="Label1" runat="server" CssClass="Cookiname"></asp:Label><asp:Button ID="Log" runat="server" OnClick="Log_Click" Text="LogOut" />
      </span>
    </div>
  </div>
</nav>
         <div class="RequestBox">
        <div class="midRequestBox">
            <div class="inputField">
                <div class="letterfield">

                    <asp:Label ID="one" runat="server" Text="Room No"></asp:Label>
                </div>
                <div class="textboxfield">
                    <asp:Label ID="RoomId" runat="server" CssClass="borderStyle" Width="90%" Height="30px" BackColor="White" ForeColor="Black"></asp:Label>
                </div>
            </div>
            <div class="inputField">
                <div class="letterfield">
                    <asp:Label ID="two" runat="server" Text="User Name"></asp:Label>
                </div>
                <div class="textboxfield">
                    <asp:Label ID="UserName" runat="server" CssClass="borderStyle" Width="90%" Height="30px" BackColor="White"></asp:Label>
                    
                </div>
            </div>
            <div class="inputField">
                <div class="letterfield">
                    <asp:Label ID="three" runat="server" Text="Room Type"></asp:Label>
                </div>
                <div class="textboxfield">
                    <asp:Label ID="RoomType" CssClass="borderStyle" BackColor="White" Width="90%" Height="30px" runat="server" Text="Label"></asp:Label>
                    
                </div>
            </div>
            <%--<asp:CustomValidator ID="CustomValidator3" CssClass="top" runat="server" Display="Dynamic" ErrorMessage="Room Is Booked Already Select Different Date" ForeColor="Red" OnServerValidate="CustomValidator3_ServerValidate" ControlToValidate="To" ValidationGroup="Bookbtn"></asp:CustomValidator>--%>
            <div class="inputField">
                <div class="letterfield">
                    <asp:Label ID="four" runat="server" Text="Pick date"></asp:Label>
                </div>
                <div class="textboxfield dateField">
                    
                    
                    
                    <div class="first">
                        <asp:TextBox ID="From" autocomplete="off" placeholder="Select Date" runat="server" Width="80%" Height="30px" AutoPostBack="True" OnTextChanged="From_TextChanged"></asp:TextBox>  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Date" ControlToValidate="From" ForeColor="Red" Display="Dynamic" ValidationGroup="Bookbtn"></asp:RequiredFieldValidator><%--<asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Select valid Date" ControlToValidate="From" ForeColor="Red" OnServerValidate="CustomValidator2_ServerValidate" Display="Dynamic" ValidationGroup="Bookbtn"></asp:CustomValidator>--%>
                        <asp:Label ID="fromerror" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                   <p>&nbsp;&nbsp;To &nbsp; : &nbsp;</p> 

                   <div class="first">
                       <asp:TextBox ID="To"  autocomplete="off"  placeholder="Select Date" runat="server" Width="80%" Height="30px" AutoPostBack="True" OnTextChanged="To_TextChanged" ></asp:TextBox> 
                       <asp:Label ID="DateError" runat="server" ForeColor="Red"></asp:Label>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ForeColor="Red" ErrorMessage="Select Date" ControlToValidate="To" Display="Dynamic" ValidationGroup="Bookbtn"></asp:RequiredFieldValidator>
                       
                       

                   </div>
                </div>
            </div>
             <div class="inputField">
                <div class="auto-style1">
                   <asp:Label ID="five" runat="server" Text="Booking Charge"></asp:Label>
                </div>
                <div class="textboxfield">
                    <asp:TextBox ID="BookingPrice" CssClass="borderStyle" runat="server" Width="90%" Height="30px" ReadOnly="True"></asp:TextBox>
                   
                    
                    
                </div>
            </div>

            <div class="inputField">
                <div class="letterfield">
                   <asp:Label ID="ten" runat="server" Text="Suggetion Here"></asp:Label>
                </div>
                <div class="textboxfield">
                    <asp:TextBox ID="UserRemark" CssClass="borderStyle" runat="server" Width="90%" Height="30px"></asp:TextBox>
                </div>
            </div>

            <div class="btnsow">
                <asp:Button ID="Button1" runat="server" Text="Cancel" style="margin-right: 50px;" Width="80px" Height="30px" OnClick="Button1_Click"/>
                <asp:Button ID="Button2" runat="server" Text="Book"  Width="80px" Height="30px" OnClick="Button2_Click" ValidationGroup="Bookbtn"/>
            </div>
        </div>
    </div>


            <footer class="text-center text-white" style="background-color: #caced1; margin-top:200px;">
  <!-- Grid container -->
  <div class="container p-4">
    <!-- Section: Images -->
    <section class="">
      <div class="row">
        <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
          <div
            class="bg-image hover-overlay ripple shadow-1-strong rounded"
            data-ripple-color="light"
          >
            <img
              src="https://mdbcdn.b-cdn.net/img/new/fluid/city/113.webp"
              class="w-100"
            />
            <a href="#!">
              <div
                class="mask"
                style="background-color: rgba(251, 251, 251, 0.2);"
              ></div>
            </a>
          </div>
        </div>
        <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
          <div
            class="bg-image hover-overlay ripple shadow-1-strong rounded"
            data-ripple-color="light"
          >
            <img
              src="https://mdbcdn.b-cdn.net/img/new/fluid/city/111.webp"
              class="w-100"
            />
            <a href="#!">
              <div
                class="mask"
                style="background-color: rgba(251, 251, 251, 0.2);"
              ></div>
            </a>
          </div>
        </div>
        <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
          <div
            class="bg-image hover-overlay ripple shadow-1-strong rounded"
            data-ripple-color="light"
          >
            <img
              src="https://mdbcdn.b-cdn.net/img/new/fluid/city/112.webp"
              class="w-100"
            />
            <a href="#!">
              <div
                class="mask"
                style="background-color: rgba(251, 251, 251, 0.2);"
              ></div>
            </a>
          </div>
        </div>
        <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
          <div
            class="bg-image hover-overlay ripple shadow-1-strong rounded"
            data-ripple-color="light"
          >
            <img
              src="https://mdbcdn.b-cdn.net/img/new/fluid/city/114.webp"
              class="w-100"
            />
            <a href="#!">
              <div
                class="mask"
                style="background-color: rgba(251, 251, 251, 0.2);"
              ></div>
            </a>
          </div>
        </div>
        <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
          <div
            class="bg-image hover-overlay ripple shadow-1-strong rounded"
            data-ripple-color="light"
          >
            <img
              src="https://mdbcdn.b-cdn.net/img/new/fluid/city/115.webp"
              class="w-100"
            />
            <a href="#!">
              <div
                class="mask"
                style="background-color: rgba(251, 251, 251, 0.2);"
              ></div>
            </a>
          </div>
        </div>
        <div class="col-lg-2 col-md-12 mb-4 mb-md-0">
          <div
            class="bg-image hover-overlay ripple shadow-1-strong rounded"
            data-ripple-color="light"
          >
            <img
              src="https://mdbcdn.b-cdn.net/img/new/fluid/city/116.webp"
              class="w-100"
            />
            <a href="#!">
              <div
                class="mask"
                style="background-color: rgba(251, 251, 251, 0.2);"
              ></div>
            </a>
          </div>
        </div>
      </div>
    </section>
    <!-- Section: Images -->
  </div>
  <!-- Grid container -->

  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    © 2020 Copyright:
    <a class="text-white" href="https://mdbootstrap.com/">Rajan pal</a>
  </div>
  <!-- Copyright -->
</footer>
    </form>
</body>
</html>
