<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="AfterRoomBookingPage.aspx.cs" Inherits="FirstGoldmedalProject.Pages.UserPages.AfterRoomBookingPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
 
  background-image: url("https://images.pexels.com/photos/255379/pexels-photo-255379.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940");
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  padding:20px;
}

.header {
  text-align: center;
  padding: 20px;
  font-size:20px;
}

/* Responsive layout - makes a two column-layout instead of four columns */
@media (max-width: 800px) {
  .column {
    flex: 46%;
    max-width: 46%;
  }
}

.card {
  opacity: 0.8;
}
.card-title {
  font-weight:bold;
  text-align: center;
}
.card-text {
  text-align: justify;
}

.modal-header {
  background-image: linear-gradient(#7FDBFF,white);
}
.modal-footer {
  background-image: linear-gradient(white,#7FDBFF);
}
#left-panel-link {
  position: relative;
  left: 5%;
  background-color: #555;
  color: white;
  font-size: 16px;
  padding: 12px 20px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
}
#right-panel-link {
  position: absolute;
  right: 10%;
  background-color: #555;
  color: white;
  font-size: 16px;
  padding: 12px 20px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
}
.sep {
  height: 25px;
}
.Rate{
    margin-left: 20px;
    font-size: 1.4rem;
}
.bora{
    border:solid 2px black;
}
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="happycard">

    <div class="card-deck" style="width: 500px; margin: auto; margin-top:100px">
        <div class="card">
          
          <div class="card-body">
            <h5 class="card-title">Your Room is Book Successfully</h5>
            <ul class="list-group">
              <li class="list-group-item list-group-item-success"><i class="fa fa-briefcase"style="font-size:20px;"></i>Customer Name <p class="Rate"><%= Uname %></p></li>
              <li class="list-group-item list-group-item-success"><i class="fa fa-user"style="font-size:20px;"></i>   Room Type <p class="Rate"><%= RType %></p></li>
              <li class="list-group-item list-group-item-success"><i class="fa fa-map-marker"style="font-size:20px;"></i>Room No <p class="Rate"><%= Room %></p></li>
              <li class="list-group-item list-group-item-success"><i class="fa fa-clock-o"style="font-size:20px;"></i>Booking Date <p class="Rate"><%=FromDate %> To <%= ToDate %></p></li>
              <li class="list-group-item list-group-item-success"><i class="fa fa-inr"style="font-size:20px;"></i>Booking Charge <p class="Rate"><%= BookingPrice %></p></li>
            </ul>
            
          </div>
          <div class="card-footer">
              <asp:Button ID="back" CssClass="btn bora" runat="server" Text="Back Home" OnClick="back_Click" />
            
            
          </div>
        </div>
        
      </div>
  </div>
     <div class="sep"></div>
    
      <!-- Row 1 -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</asp:Content>
