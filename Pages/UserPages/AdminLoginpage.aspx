<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminLoginpage.aspx.cs" Inherits="FirstGoldmedalProject.Pages.UserPages.AdminLoginpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="para">
                <div class="inner_box">
                    <asp:Label ID="Errtext" runat="server" ForeColor="Red"></asp:Label>
                    <div class="first_text"><asp:TextBox CssClass="text_box" ID="Email" runat="server" Width="286px" Height="30px" placeholder="Enter UserName or Email Id"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Email" ErrorMessage="Enter Email Address" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" Display="Dynamic" ErrorMessage="Enter Valid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <div class="first_text"><asp:TextBox CssClass="text_box"  ID="password" runat="server" Width="286px" Height="30px" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="Enter Password" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    
                    <div class="sub_btn">
                        <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />
                    </div>
                   
                </div>
            </div>
</asp:Content>
