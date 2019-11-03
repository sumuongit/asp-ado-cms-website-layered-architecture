<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="update_photogallery.aspx.cs" Inherits="CMS_Website.Control_Panel.update_photogallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container top_break_control_panel">
        
         <div class="container">

             <div class="row">
                   <div class="col-sm-6">

                       <h4 style="color:green">Photo Gallery Update Form</h4>
                       <br />

                       <div class="form-group">
                            <label for="formGroupExampleInput">Photo Title</label>
                            <asp:TextBox ID="tbxPhotoBrief" runat="server" class="responsive-textbox form-control" placeholder="Photo Title"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_PhotoBrief" ValidationGroup="SaveValidation" runat="server" Display = "Dynamic" ControlToValidate="tbxPhotoBrief"  ErrorMessage="Please Enter Photo Title" CssClass="text-danger"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="SaveValidation" ControlToValidate = "tbxPhotoBrief" ID="RegularExpressionValidator" ValidationExpression = "^[\s\S]{0,36}$" runat="server" ErrorMessage="Maximum 36 characters allowed." CssClass="text-danger"></asp:RegularExpressionValidator>
                       </div>

                       <div class="form-group">
                            <label for="formGroupExampleInput2">Photo Details</label>
                            <asp:TextBox ID="tbxPhotoDetail" runat="server" class="responsive-textbox form-control" TextMode="MultiLine" Rows="3" Columns="40" placeholder="Photo Details"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_PhotoDetail" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxPhotoDetail"  ErrorMessage="Please Enter Photo Details" CssClass="text-danger"></asp:RequiredFieldValidator>
                       </div>

                       <asp:image ID="PhotoGallery" runat="server" Height="400px" Width="100%"></asp:image> <br />

                       <div class="form-group">
                            <br />
                            <asp:FileUpload ID="PhotoUpload" runat="server" accept=".png,.jpg" class="form-control-file"/>
                            
                       </div>

                        <div class="form-group">
                            <asp:Label ID="lableStorySataus" runat="server" Text="Photo Status" Font-Bold="True"></asp:Label>
                            <asp:DropDownList ID="ddlPhotoStatus" runat="server" class="form-control">
                                <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                            </asp:DropDownList>    
                            <br />               
                       </div>

                       <div class="form-group">
                           <asp:LinkButton ID="updateButton" class="btn btn-success" runat="server" Text="Update" ValidationGroup="SaveValidation" Font-Size="Medium" OnClick="btn_update_Click"></asp:LinkButton>
                           <asp:LinkButton ID="btnBack" class="btn btn-default" runat="server" Text="Go Back" Font-Size="Medium" OnClick="btn_back_Click"></asp:LinkButton>
                        
                       </div>
       
                       <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                             Photo Gallery has been updated successfully!
                       </asp:Panel>

                        <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                             Photo Gallery has been faild to update!
                       </asp:Panel>

                   </div>
             </div>

         </div>
         
    </div>

     <script type="text/javascript">

          document.getElementById("dashboard_status").classList.add('active');
          document.getElementById("cp_photo_gallery").classList.add('active_cp');
          
     </script>
</asp:Content>
