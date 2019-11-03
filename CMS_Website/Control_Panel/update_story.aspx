<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="update_story.aspx.cs" Inherits="CMS_Website.Control_Panel.update_story" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container top_break_control_panel">
        
        <div class="container">
            <div class="row">
                <div class="col-sm-6">

                    <h4 style="color:green">Story Update Form</h4>
                    <br />
        
                    <div class="form-group">
                        <label for="formGroupExampleInput">Story Title</label>
                        <asp:TextBox ID="tbxStoryTitle" runat="server" class="responsive-textbox form-control" placeholder="Story Title"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="SaveValidation" ID="RequiredFieldValidator_StoryTitle" runat="server" ControlToValidate="tbxStoryTitle"  ErrorMessage="Please Enter Story Title" CssClass="text-danger"></asp:RequiredFieldValidator>
                   
                    </div>

                    <div class="form-group">
                        <label for="formGroupExampleInput2">Story Details</label>
                        <asp:TextBox ID="tbxStoryDetail" runat="server" class="responsive-textbox form-control" TextMode="MultiLine" placeholder="Story Details"></asp:TextBox>
                        <asp:RequiredFieldValidator Display = "Dynamic" ID="RequiredFieldValidator_StoryDetail" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxStoryDetail"  ErrorMessage="Please Enter Story Details" CssClass="text-danger"></asp:RequiredFieldValidator>
                  

                        <script type="text/javascript" src="https://tinymce.cachefly.net/4.0/tinymce.min.js"></script>
                        <script type="text/javascript">
                          tinymce.init({ selector: 'textarea', height:300});
                        </script>
            
                   </div>

                   <div class="form-group">
                        <br />

                        <asp:Label ID="lableStorySataus" runat="server" Text="Story Status" Font-Bold="True"></asp:Label>
                      
                        <asp:DropDownList ID="ddlStoryStatus" runat="server" class="form-control">
                            <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                        </asp:DropDownList>    
                        <br />            
                    </div>

           
                   <div class="form-group">
                       
                        <asp:LinkButton ID="saveButton" class="btn btn-success" runat="server" Text="Update" ValidationGroup="SaveValidation" Font-Size="Medium" OnClick="btn_update_Click"></asp:LinkButton>
                       
                        <asp:LinkButton ID="btnBack" class="btn btn-default" runat="server" Text="Go Back" Font-Size="Medium" OnClick="btn_back_Click"></asp:LinkButton>
                        
                   </div>
       
                   <asp:Panel ID="SuccessPanel_story" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                         Story has been updated successfully!
                   </asp:Panel>

                    <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                         Story has been faild to update!
                   </asp:Panel>

                </div>

                <div class="col-sm-6">
                </div>
            </div>
        </div>
         
    </div>

     <script type="text/javascript">

          document.getElementById("dashboard_status").classList.add('active');
          document.getElementById("cp_story").classList.add('active_cp');
          document.getElementById("cp_story_user").classList.add('active_cp');
          
     </script>
</asp:Content>
