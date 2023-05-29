<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPages/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="AddItemPages.aspx.cs" Inherits="FirstGoldmedalProject.Pages.AdminPages.AddItemPages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style>
        .firstFieldTyep{
            width: 100%;
            margin: auto;
            margin-top: 50px;
            margin-bottom: 100px;
            

        }
        .one{
            width:60%;
            margin:auto;
        }
        .two{
            width: 90%;
            margin:auto;
            margin-top:100px;

        }
        .document{
            width: 80%;
            margin: auto;
            height: 400px;
            border: solid 2px black;
            border-radius: 20px;
        }
        .midDoc{
            width: 90%;
            margin: auto;
            height: 280px;
            transform: translate(0,10px);
        }
        .roomtype{
            width: 70%;
            height: 250px;
            margin: auto;
            border: solid 2px black;
            border-radius: 20px;
        }
        .fields{
            width: 90%;
            margin: auto;
            margin-top: 10px;
            margin-bottom: 30px;
        }
        .DocField{
            width:90%;
            height:30px;
            margin:auto;
            border:none;
            border-bottom:solid 2px black;
            text-indent:50px;
        }
        .btnarea{display:flex;}

        .btnfield{
            width:120px;
            height:40px;
            margin-left:20px;
            margin-right:40px;
        }
        .gridew{
            width:100%;
            height:350px;
            margin:auto;
            overflow-y:auto;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
        <script type="text/javascript" language="javascript">
            function numeric(evt)
            {
               var charCode = (evt.which) ? evt.which : event.keyCode
               if(charCode > 31 && ((charCode >= 48 && charCode <= 57) || charCode == 46))
                        return true;
                        else
                        {
                           
                        return false;
               }
            }


            function AllowAlphabet(e) {
                isIE = document.all ? 1 : 0
                keyEntry = !isIE ? e.which : event.keyCode;
                if (((keyEntry >= '65') && (keyEntry <= '90')) || ((keyEntry >= '97') && (keyEntry <= '122')) || (keyEntry == '46') || (keyEntry == '32') || keyEntry == '45')
                    return true;
                else {
                    
                    return false;
                }
            }
            
        </script>
   

       <div class="firstFieldTyep">
             <h1 class="text-left"><asp:Label ID="Label9" runat="server"  ForeColor="#3366FF" Text="Document Type" Width="429px" Height="61px"></asp:Label></h1>
        <div class="one">

            <div class="document">
                <div class="midDoc">
                    <div class="fields">
                        <asp:TextBox ID="DocType" AutoCompleteType="Disabled" onkeypress="return AllowAlphabet(event)"  MaxLength="30" runat="server" placeholder="Enter Document Name" CssClass="DocField"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Document Type"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DocType" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="DocTypeVAlidator" Font-Size="Large"></asp:RequiredFieldValidator>
                    </div>
                    <div class="fields">
                        <asp:TextBox ID="MaxLength" AutoCompleteType="Disabled" onkeypress="return numeric(event)" runat="server" MaxLength="3" Placeholder="Enter Maximum Length" CssClass="DocField"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="MaxLength"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  runat="server" ControlToValidate="MaxLength" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="DocTypeVAlidator" Font-Size="Large"></asp:RequiredFieldValidator>
                    </div>
                    <div class="fields">
                        <asp:TextBox ID="MinLength" onkeypress="return numeric(event)" runat="server" Placeholder="Enter Minimum Length" MaxLength="3" CssClass="DocField" AutoCompleteType="Disabled"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="MinLength"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="MinLength" runat="server" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="DocTypeVAlidator" Font-Size="Large"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="MaxLength" ControlToValidate="MinLength"  ErrorMessage="Enter Valid Minimum Length" Operator="LessThanEqual" ValidationGroup="DocTypeVAlidator"  ForeColor="Red"></asp:CompareValidator>
                    </div>
                      <div class="fields">
                         <asp:Panel ID="Panel1" runat="server" Visible="False">
                             <label for="RoomActive">Is Active : </label>
                         &nbsp;&nbsp;&nbsp;
                         <asp:CheckBox ID="IsActive" runat="server" />
                         </asp:Panel>
                     </div>
                    <div class="btnarea">
                        <asp:Button ID="Cancel" CssClass="btnfield" runat="server" Text="Cancel" OnClick="Cancel_Click" /><asp:Button ID="ADD" CssClass="btnfield" runat="server" Text="ADD" OnClick="ADD_Click" ValidationGroup="DocTypeVAlidator" />
                    </div>
                </div>
            </div>
        </div>
        <div class="two">
            <div class="gridew">
                <asp:GridView ID="showDoc" DataKeyNames="DocId" runat="server" OnRowDeleting="showDoc_RowDeleting" width="100%" OnSelectedIndexChanged="showDoc_SelectedIndexChanged" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <Columns>
                    <asp:CommandField HeaderText="Select" ShowCancelButton="False" ShowSelectButton="True" ButtonType="Button" >
                    <ControlStyle ForeColor="#33CC33" Width="70px" />
                    <ItemStyle Width="80px" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ButtonType="Button" >
                    <ControlStyle ForeColor="Red" Width="70px" />
                    <ItemStyle Width="80px" />
                    </asp:CommandField>
                </Columns>
                    <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100%" />
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
                <asp:Label ID="Epmtyplace" runat="server" Text="Label" Visible="False"></asp:Label>
            </div>
    </div>
    </div>
        
</asp:Content>


