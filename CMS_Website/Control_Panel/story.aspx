<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="story.aspx.cs" Inherits="CMS_Website.Control_Panel.story" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <div class="container top_break_control_panel">
        
        <div class="container">
            <div class="row">
                <div class="col-sm-6">

                    <h4 style="color:green">Story Entry Form</h4>
                    <br />
        
                    <div class="form-group">
                        <label for="formGroupExampleInput">Story Title</label>
                        <asp:TextBox ID="tbxStoryTitle" runat="server" class="responsive-textbox form-control" placeholder="Story Title"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_StoryTitle" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxStoryTitle"  ErrorMessage="Please Enter Story Title" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="formGroupExampleInput2">Story Details</label>
                        <asp:TextBox ID="tbxStoryDetail" runat="server" class="responsive-textbox form-control" TextMode="MultiLine" placeholder="Story Details"></asp:TextBox>
                        <asp:RequiredFieldValidator Display = "Dynamic" ID="RequiredFieldValidator_StoryDetail" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxStoryDetail"  ErrorMessage="Please Enter Story Details" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator CssClass="text-danger" Display = "Dynamic" ValidationGroup="SaveValidation" ControlToValidate = "tbxStoryDetail" ID="RegularExpressionValidator_min" ValidationExpression = "^[\s\S]{500,}$" runat="server" ErrorMessage="Minimum 500 characters required."></asp:RegularExpressionValidator>

                        <script type="text/javascript" src="https://tinymce.cachefly.net/4.0/tinymce.min.js"></script>
                        <script type="text/javascript">
                          tinymce.init({ selector: 'textarea', height:300});
                        </script>
            
                   </div>
              
                   <div class="form-group">
                        <asp:Label ID="lableStorySataus" runat="server" Text="Story Status" Font-Bold="True"></asp:Label>
                        <asp:DropDownList ID="ddlStoryStatus" runat="server" class="form-control">
                            <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                        </asp:DropDownList>    
                        <br />               
                    </div>


                   <div class="form-group">

                        <asp:LinkButton ID="saveButton" class="btn btn-success" runat="server" Text="Save" ValidationGroup="SaveValidation" Font-Size="Medium" OnClientClick = "tinyMCE.triggerSave(false,true);" OnClick="btn_save_Click"></asp:LinkButton>
                   </div>
       
                   <asp:Panel ID="SuccessPanel_story" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                         Story has been inserted successfully!
                   </asp:Panel>

                    <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                         Story has been faild to insert!
                   </asp:Panel>

                </div>

                <div class="col-sm-6">

                    <h4 style="color:green">Story Photo Entry Form</h4>
                    <br />
        
                    <div class="form-group">
                        <label for="formGroupExampleInput">Story Title</label>
                         <asp:DropDownList ID="ddlStoryTitle" runat="server" class="form-control" AutoPostBack="true" EnableViewState="true" OnSelectedIndexChanged="ddlStoryTitle_SelectedIndexChanged">
                         </asp:DropDownList>    
                         <asp:RequiredFieldValidator  InitialValue="--Select Story Title--" CssClass="text-danger"  runat="server" ID="validationStoryTitleSelection" ValidationGroup="validationStoryPhoto"  ErrorMessage="Please Select Story Title" ControlToValidate="ddlStoryTitle" />
                    </div>

                    <div class="form-group">
                        <label for="formGroupExampleInput">Story Id</label>
                         <asp:TextBox ID="tbxStoryId" runat="server" class="responsive-textbox form-control" ReadOnly="true"></asp:TextBox>                         
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
                        <asp:FileUpload ID="FileUploadStory" runat="server" accept=".png,.jpg" class="form-control-file" AllowMultiple="True" />
                        <asp:RequiredFieldValidator  CssClass="text-danger"  runat="server" ID="RequiredFieldValidatorFileUp" ValidationGroup="validationStoryPhoto"  ErrorMessage="Please Select Photo" ControlToValidate="FileUploadStory" />
                  
                   </div>

                   <div class="form-group">

                        <asp:LinkButton ID="btnUpload" ValidationGroup="validationStoryPhoto" class="btn btn-success" runat="server" Text="Upload" Font-Size="Medium" OnClick="btn_upload_Click"></asp:LinkButton>
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
                     <h4 style="color:green">Story Table</h4>
                     <br />
            
                    <div class="table-responsive">
                     <asp:GridView ID="GridViewStory" runat="server" AutoGenerateColumns="False" OnRowCommand="grdView_RowCommandStory" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridViewStory_PageIndexChanging" CssClass="table table-striped gtable" GridLines="Horizontal" OnRowDataBound="GridViewStory_RowDataBound">
                        <Columns>

                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="StoryId" runat="server" Text='<%#Eval("StoryID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Title">
                                <ItemTemplate>
                                    <asp:Label ID="StoryTitle" runat="server" Text='<%#Eval("StoryTitle") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Detail">
                                <ItemTemplate>
                                    <asp:Label ID="StoryDetail" runat="server" Text='<%#Eval("StoryDetail") %>'></asp:Label>
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
                                    <asp:LinkButton ID="lnkbtnEditStory" CommandName="lnkbtnEditStory" CommandArgument='<%#Eval("StoryId") %>' runat="server">Edit</asp:LinkButton>
                                   
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
                     <h4 style="color:green">Story Photo Table</h4>
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

                            <asp:TemplateField HeaderText="Story ID">
                                <ItemTemplate>
                                    <asp:Label ID="StoryId" runat="server" Text='<%#Eval("StoryID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Photo">
                                <ItemTemplate>
                                    <asp:Image ID="StoryPhoto" runat="server" ImageUrl='<%# "~/Story_Photos/" + Eval("PhotoPath") %>' Style="height: 100px; width: 100px"></asp:Image>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="Story Status" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Status_Story" runat="server" Text='<%# ((bool)Eval("StoryStatus") == false) ? "INACTIVE" : "ACTIVE" %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Font-Bold="True" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="Status_Photo" runat="server" Text='<%# ((bool)Eval("PhotoStatus") == false) ? "INACTIVE" : "ACTIVE" %>'></asp:Label>
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
          document.getElementById("cp_story").classList.add('active_cp');
          document.getElementById("cp_story_user").classList.add('active_cp');
          
     </script>


    
</asp:Content>
