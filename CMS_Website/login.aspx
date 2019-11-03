<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CMS_Website.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container top_break" id="login_container">
       
         <br /> <br /> <br />
      
         <div class="container" id="login_div" style="background-color:#eefdec ; border:1px solid; padding-left:30px; padding-right:30px; border-color:limegreen;  margin: auto;">
             
             <br />
             <br />
              <span>Email</span><br />

              <asp:TextBox ID="TextBox_Useremail" runat="server" CssClass="responsive-textbox form-control" Height="30px"></asp:TextBox>
             
              <span style="font-size:1.8vh"><asp:RequiredFieldValidator ID="RequiredFieldValidator_Useremail" runat="server" ControlToValidate="TextBox_Useremail" ErrorMessage="Please Enter Email" CssClass="text-danger" Display = "Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_Useremail" runat="server" ControlToValidate="TextBox_Useremail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please Enter A Valid Email" CssClass="text-danger" Display = "Dynamic"></asp:RegularExpressionValidator>
              </span><br /> <br />

              <span>Password</span><br />

              <asp:TextBox ID="TextBox_Password" runat="server" CssClass="responsive-textbox form-control" Height="30px" TextMode="Password"></asp:TextBox>

              <span style="font-size:1.8vh">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator_Password" runat="server" ControlToValidate="TextBox_Password" ErrorMessage="Please Enter Password" CssClass="text-danger" Display = "Dynamic"></asp:RequiredFieldValidator>
              </span><br /> <br />
             
              <asp:LinkButton ID="loginButton" CssClass="btn btn-success btn-lg responsive-textbox" runat="server" Text="Login" Font-Size="Medium"  OnClick="btn_login"></asp:LinkButton>
           
             <br /> <br />
             <span>
                 <a href="forget_password.aspx">Forget Password?</a>
             </span><br /><br />

             <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                   <span style="font-size:1.8vh">Incorrect User Email or Password</span> 
             </asp:Panel>

             <br />

         </div>

    </div>
      <br />
</asp:Content>
