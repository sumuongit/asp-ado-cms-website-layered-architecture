<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="update_banner.aspx.cs" Inherits="CMS_Website.Control_Panel.update_banner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container top_break_control_panel">
        
         <div class="container">

             <div class="row">
                   <div class="col-sm-6">

                       <h4 style="color:green">Banner Update Form</h4>
                       <br />

                       <div class="form-group">
                            <label for="formGroupExampleInput">Banner Information</label>
                            <asp:TextBox ID="tbxBannerInfo" TextMode="MultiLine" Rows="3" Columns="40" runat="server" class="responsive-textbox form-control" placeholder="Banner Information"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_BannerInfo" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxBannerInfo"  ErrorMessage="Please Enter Banner Information" CssClass="text-danger"></asp:RequiredFieldValidator>
                       </div>

                       <asp:image ID="BannerPhoto" runat="server" Height="400px" Width="100%"></asp:image> <br />

                       <div class="form-group">
                            <br />
                            <asp:FileUpload ID="PhotoUpload" runat="server" accept=".png,.jpg" class="form-control-file"/>
                          
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lableBannerSataus" runat="server" Text="Banner Status" Font-Bold="True"></asp:Label>
                            <asp:DropDownList ID="ddlBannerStatus" runat="server" class="form-control">
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
                            Banner has been updated successfully!
                       </asp:Panel>

                        <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                            Banner has been faild to update!
                       </asp:Panel>

                   </div>
             </div>

         </div>
    </div>

     <script type="text/javascript">

          document.getElementById("dashboard_status").classList.add('active');
          document.getElementById("cp_banner").classList.add('active_cp');
          
     </script>

</asp:Content>
