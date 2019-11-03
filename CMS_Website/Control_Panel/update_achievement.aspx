<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="update_achievement.aspx.cs" Inherits="CMS_Website.Control_Panel.update_achievement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container top_break_control_panel">
           <div class="container">
            <div class="row">
                <div class="col-sm-6">

                    <h4 style="color:green">Achievement Update Form</h4>
                    <br />
        
                    <div class="form-group">
                        <label for="formGroupExampleInput">Achievement Title</label>
                        <asp:TextBox ID="tbxAchievementTitle" runat="server" class="responsive-textbox form-control" placeholder="Achievement Title"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_AchievementTitle" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxAchievementTitle"  ErrorMessage="Please Enter Achievement Title" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="formGroupExampleInput2">Achievement Details</label>
                        <asp:TextBox ID="tbxAchievementDetail" runat="server" class="responsive-textbox form-control" TextMode="MultiLine" placeholder="Achievement Details"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_AchievementDetail" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxAchievementDetail"  ErrorMessage="Please Enter Achievement Details" CssClass="text-danger"></asp:RequiredFieldValidator>

                        <script type="text/javascript" src="https://tinymce.cachefly.net/4.0/tinymce.min.js"></script>
                        <script type="text/javascript">
                          tinymce.init({ selector: 'textarea', height:300});
                        </script>
            
                   </div>
              
                   <div class="form-group">
                        <asp:Label ID="lableAchievementSataus" runat="server" Text="Achievement Status" Font-Bold="True"></asp:Label>
                        <asp:DropDownList ID="ddlAchievementStatus" runat="server" class="form-control">
                            <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                        </asp:DropDownList>    
                        <br />               
                    </div>


                   <div class="form-group">

                        <asp:LinkButton ID="updateButton" class="btn btn-success" runat="server" Text="Update" ValidationGroup="SaveValidation" Font-Size="Medium" OnClientClick = "tinyMCE.triggerSave(false,true);" OnClick="btn_update_Click"></asp:LinkButton>

                        <asp:LinkButton ID="btnBack" class="btn btn-default" runat="server" Text="Go Back" Font-Size="Medium" OnClick="btn_back_Click"></asp:LinkButton>

                   </div>
       
                   <asp:Panel ID="SuccessPanel_story" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                         Achievement has been updated successfully!
                   </asp:Panel>

                    <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                         Achievement has been faild to update!
                   </asp:Panel>

                </div>

            
            </div>
        </div>
     </div>



     <script type="text/javascript">

          document.getElementById("dashboard_status").classList.add('active');
          document.getElementById("cp_achievement").classList.add('active_cp');
          
     </script>
</asp:Content>
