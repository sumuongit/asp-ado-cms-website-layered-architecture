<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="CMS_Website.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container top_break">
        

         <h2>Share Your Feedback with Us</h2>
         

          <div class ="row">

              <div class="col-sm-6">
                 
                  <br />
                  <asp:TextBox ID="TextBox_Name" runat="server" Height="40px" CssClass="responsive-textbox form-control" placeholder="Name" ></asp:TextBox>
                  
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator_Name" runat="server" ControlToValidate="TextBox_Name"  ErrorMessage="Please Enter Your Name" CssClass="text-danger"></asp:RequiredFieldValidator>
                   <br /><br />
                  <asp:TextBox ID="TextBox_Email" runat="server" Height="40px" CssClass="responsive-textbox form-control" placeholder="Email" ></asp:TextBox>
                 
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator_Email" runat="server" ControlToValidate="TextBox_Email" ErrorMessage="Please Enter Your Email" CssClass="text-danger" Display = "Dynamic"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator_Email" runat="server" ControlToValidate="TextBox_Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please Enter A Valid Email" CssClass="text-danger" Display = "Dynamic"></asp:RegularExpressionValidator>
                  <br /><br />
                  <asp:TextBox ID="TextBox_Subject" runat="server" Height="40px"  CssClass="responsive-textbox form-control" placeholder="Subject" ></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator_Subject" runat="server" ControlToValidate="TextBox_Subject" ErrorMessage="Please Enter Subject" CssClass="text-danger"></asp:RequiredFieldValidator>
                 
                  <br />
                  <br />
                  <asp:TextBox ID="TextBox_Message" runat="server" Height="170px" TextMode="MultiLine" CssClass="responsive-textbox form-control" placeholder="Write your message..." ></asp:TextBox>
                 
                 
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator_Message" runat="server" ControlToValidate="TextBox_Message" ErrorMessage="Please Write Something for Us" CssClass="text-danger"></asp:RequiredFieldValidator>
                 
                  <br />
                  <br />
                 
                  <asp:LinkButton ID="sendLinkButton" CssClass="btn btn-success btn-lg" runat="server" Text="Send Message" Font-Size="Medium" OnClick="btn_send_Click"></asp:LinkButton>
                  <br /><br />

                  <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                     Your message has been sent successfully!
                  </asp:Panel>

                  <asp:Panel ID="UnsuccessPanel" runat="server" CssClass="alert alert-danger responsive-textbox" Visible="False">
                     Your message has been faild to sent!
                  </asp:Panel>

                

               </div>

             <div class="col-sm-2"></div>

             <div class="col-sm-4">
               
                     <h4 style="color:green">OFFICE</h4>
                     <p>My Project</p>
                     <p>IDB Bhaban</p>
                     <p>Shere-E-Bangla Nagar</p>
                     <p>Agargaon, Dhaka 1207</p>
                     <p>sumu2007@gmail.com </p>
                     <p>Bangladesh</p>                     

             </div>
             <br />
         </div>

         
         <div class="row">
             <br />
             <br />
             <div class="container">
              <iframe src="https://maps.google.com/maps?q=IDB%20Bhaban%20Dhaka&amp;t=&amp;z=13&amp;ie=UTF8&amp;iwloc=&amp;output=embed" width="100%" height="380" frameborder="0" style="border:0" allowfullscreen=""></iframe>
             </div>
              
         </div>
         
     </div>

    <script type="text/javascript">
        document.getElementById("contact_us_lnk").classList.add('active');
     </script>

</asp:Content>
