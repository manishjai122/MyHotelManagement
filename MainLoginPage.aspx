<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainLoginPage.aspx.cs" Inherits="FirstGoldmedalProject.MainLoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
        .sign-in{
        text-align: right;
        margin-right: 120px;
      }
        .btnforevr{
            width:90%;
            margin:auto;
            text-align:center;
        }
    </style>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous"/>
        <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
       
              <div class="container-fluid p-5 bg-image" style="
    background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg');
    height: 100vh; width: 100vw;">
        <div class="container" style="width: 500px; margin-top: 100px; background-color: white; padding-top: 60px; border-radius: 10px;">
            <div class="container">
                    <div class="text-danger mb-2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Email or UserName" ControlToValidate="UserName" ValidationGroup="LogValidation"></asp:RequiredFieldValidator></div>

                        
                <asp:Label ID="errtext" runat="server" ForeColor="Red"></asp:Label>
                    <!-- Email input -->
                    <div class="form-outline mb-4 mx-5">
                        <asp:TextBox ID="UserName" runat="server" class="form-control" ControlToValidate="TextBox1"></asp:TextBox>
                      <label class="form-label" for="form2Example1">Email address</label>
                    </div>
                    
                    <!-- Password input -->
                    <div class="form-outline mb-4 mx-5">
                        <asp:TextBox ID="Password" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                      <label class="form-label" for="form2Example2">Password</label>
                    </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter password" ControlToValidate="Password" ValidationGroup="LogValidation"></asp:RequiredFieldValidator>
                      <asp:Label ID="errrtext2" runat="server" ForeColor="Red"></asp:Label>
                    <!-- 2 column grid layout for inline styling -->
                    <div class="row mb-4">
                      <div class="col d-flex justify-content-center">
                        <!-- Checkbox -->
                      </div>
                  
                      
                    </div>
                  
                <div class="btnforevr">
                     <!-- Submit button -->
                <asp:Button ID="Button1" class="btn btn-primary btn-block mb-4 btnlook" runat="server" Text="LogIn" OnClick="Button1_Click" ValidationGroup="LogValidation" />
                </div>
                   
                  
                    <!-- Register buttons -->
                    <div class="text-center">
                      <p>Not a member? <a href="<%=Page.ResolveUrl("~/Pages/UserPages/UserRegistrationForm.aspx") %>">Register</a></p>
                    </div>
                 
            </div>
        </div>
    </div>
    </form>
</body>
</html>
