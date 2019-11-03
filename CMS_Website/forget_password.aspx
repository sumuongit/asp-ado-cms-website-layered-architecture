<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="forget_password.aspx.cs" Inherits="CMS_Website.forget_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container top_break" id="login_container">
        
         <br /> <br /> <br />
      
         <div class="container" id="login_div" style="background-color:#eefdec ; border:1px solid; padding-left:30px; padding-right:30px; border-color:limegreen;  margin: auto;">
             
             <br />
             <br />
              <span>Email</span><br />

              <asp:TextBox ID="TextBox_forget_Useremail" runat="server" CssClass="responsive-textbox form-control" Height="30px"></asp:TextBox>
             
              <span style="font-size:1.8vh"><asp:RequiredFieldValidator ID="RequiredFieldValidator_Useremail" runat="server" ControlToValidate="TextBox_forget_Useremail" ErrorMessage="Please Enter Your Email" CssClass="text-danger" Display = "Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator_Useremail" runat="server" ControlToValidate="TextBox_forget_Useremail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please Enter A Valid Email" CssClass="text-danger" Display = "Dynamic"></asp:RegularExpressionValidator>
              </span><br /> <br />
             
              <asp:LinkButton ID="sendButton" CssClass="btn btn-success btn-lg responsive-textbox" runat="server" Text="Send" Font-Size="Medium"  OnClick="btn_send"></asp:LinkButton>
           
             <br /> <br />
             <span>
                 <a href="login.aspx">Back to Login</a>
             </span><br /><br />

             <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                   <span style="font-size:1.8vh">This email does not exist!</span> 
             </asp:Panel>

              <asp:Panel ID="UnsuccessPanel" runat="server" CssClass="alert alert-danger responsive-textbox" Visible="False">
                     Email has been faild to sent!
              </asp:Panel>

             <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success responsive-textbox" CssStyle="text-align:center" Visible="false">
                   <span style="font-size:1.8vh">Password has been sent to your email successfully!</span> 
             </asp:Panel>

             <br />

         </div>

    </div>

</asp:Content>
