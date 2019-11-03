<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="achievement.aspx.cs" Inherits="CMS_Website.Control_Panel.achievement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container top_break_control_panel">
        
         <div class="container">
            <div class="row">
                <div class="col-sm-6">

                    <h4 style="color:green">Achievement Entry Form</h4>
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

                        <asp:LinkButton ID="saveButton" class="btn btn-success" runat="server" Text="Save" ValidationGroup="SaveValidation" Font-Size="Medium" OnClientClick = "tinyMCE.triggerSave(false,true);" OnClick="btn_save_Click"></asp:LinkButton>
                   </div>
       
                   <asp:Panel ID="SuccessPanel_story" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                         Achievement has been inserted successfully!
                   </asp:Panel>

                    <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                         Achievement has been faild to insert!
                   </asp:Panel>

                </div>

               <div class="col-sm-6">

                    <h4 style="color:green">Achievement Photo Entry Form</h4>
                    <br />
        
                    <div class="form-group">
                        <label for="formGroupExampleInput">Achievement Title</label>
                         <asp:DropDownList ID="ddlAchievementTitle" runat="server" class="form-control" AutoPostBack="true" EnableViewState="true" OnSelectedIndexChanged="ddlAchievementTitle_SelectedIndexChanged">
                         </asp:DropDownList>    
                         <asp:RequiredFieldValidator  InitialValue="--Select Achievement Title--" CssClass="text-danger"  runat="server" ID="validationAchievementTitleSelection" ValidationGroup="validationAchievementPhoto"  ErrorMessage="Please Select Achievement Title" ControlToValidate="ddlAchievementTitle" />
                    </div>

                    <div class="form-group">
                        <label for="formGroupExampleInput">Achievement Id</label>
                         <asp:TextBox ID="tbxAchievementId" runat="server" class="responsive-textbox form-control" ReadOnly="true"></asp:TextBox>                         
                    </div>

                   <div class="form-group">
                        <asp:Label ID="LabelPhotoStatus" runat="server" Text="Photo Status" Font-Bold="True"></asp:Label>
                        <asp:DropDownList ID="ddlPhotoStatus" runat="server" class="form-control">
                            <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                        </asp:DropDownList>    
                        <br />               
                    </div>

                   <div class="form-group">
                        <asp:FileUpload ID="FileUploadAchievement" runat="server" accept=".png,.jpg" class="form-control-file" AllowMultiple="True" />
                        <asp:RequiredFieldValidator  CssClass="text-danger"  runat="server" ID="RequiredFieldValidatorFileUp" ValidationGroup="validationAchievementPhoto"  ErrorMessage="Please Select Photo" ControlToValidate="FileUploadAchievement" />
                  
                   </div>

                   <div class="form-group">

                        <asp:LinkButton ID="btnUpload" ValidationGroup="validationAchievementPhoto" class="btn btn-success" runat="server" Text="Upload" Font-Size="Medium" OnClick="btn_upload_Click"></asp:LinkButton>
                   </div>
       
                   <asp:Panel ID="PanelSuccess" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                         Photo has been uploaded successfully!
                   </asp:Panel>

                    <asp:Panel ID="PanelFaild" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                          Photo has been faild to upload!
                   </asp:Panel>

                </div>
                </div>
        </div>

           <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <br />
                    <h4 style="color:green">Achievement Table</h4> <br />
                     
            
                    <div class="table-responsive">
                     <asp:GridView ID="GridViewAchievement" runat="server" AutoGenerateColumns="False" OnRowCommand="grdView_RowCommandAchievement" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridViewAchievement_PageIndexChanging" CssClass="table table-striped gtable" GridLines="Horizontal" OnRowDataBound="GridViewAchievement_RowDataBound">
                        <Columns>

                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="AchievementId" runat="server" Text='<%#Eval("AchievementID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Title">
                                <ItemTemplate>
                                    <asp:Label ID="AchievementTitle" runat="server" Text='<%#Eval("AchievementTitle") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Detail">
                                <ItemTemplate>
                                    <asp:Label ID="AchievementDetail" runat="server" Text='<%#Eval("AchievementDetail") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                    
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="Status" runat="server" Text='<%# ((bool)Eval("Status") == false) ? "INACTIVE" : "ACTIVE" %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Font-Bold="True" />
                            </asp:TemplateField>
                   
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbtnEditAchievement" CommandName="lnkbtnEditAchievement" CommandArgument='<%#Eval("AchievementId") %>' runat="server">Edit</asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                        </Columns>
                         <PagerStyle CssClass="pagination-ys" />
                    </asp:GridView>
                       </div> 
                </div>

                <div class="col-sm-6">
                      
                     <br />
                     <h4 style="color:green">Achievement Photo Table</h4>
                     <br />
                       <div class="table-responsive">                                     
                        <asp:GridView ID="GridViewPhoto" runat="server" AutoGenerateColumns="False" OnRowCommand="grdViewPhoto_RowCommand" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridViewPhoto_PageIndexChanging" CssClass="table table-striped gtable" GridLines="Horizontal" OnRowDataBound="GridViewPhoto_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="PhotoId" runat="server" Text='<%#Eval("PhotoID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Achievement ID">
                                <ItemTemplate>
                                    <asp:Label ID="AchievementId" runat="server" Text='<%#Eval("AchievementID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Photo">
                                <ItemTemplate>
                                    <asp:Image ID="AchievementPhoto" runat="server" ImageUrl='<%# "~/Achievement_Photos/" + Eval("PhotoPath") %>' Style="height: 100px; width: 100px"></asp:Image>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                          
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="Status" runat="server" Text='<%# ((bool)Eval("Status") == false) ? "INACTIVE" : "ACTIVE" %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Font-Bold="True" />
                            </asp:TemplateField>
                   
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbtnPhotoEdit" CommandName="lnkbtnPhotoEdit" CommandArgument='<%#Eval("PhotoId") %>' runat="server">Edit</asp:LinkButton>
                                
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                         <PagerStyle CssClass="pagination-ys" />
                    </asp:GridView>                            
                </div>
                    </div>
            </div>
        </div>

    </div>

     <script type="text/javascript">

          document.getElementById("dashboard_status").classList.add('active');
          document.getElementById("cp_achievement").classList.add('active_cp');
          
     </script>
</asp:Content>
