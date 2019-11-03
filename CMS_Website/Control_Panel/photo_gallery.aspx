<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="photo_gallery.aspx.cs" Inherits="CMS_Website.Control_Panel.photo_gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container top_break_control_panel">
        
         <div class="container">

             <div class="row">
                   <div class="col-sm-6">

                       <h4 style="color:green">Photo Gallery Entry Form</h4>
                       <br />

                       <div class="form-group">
                            <label for="formGroupExampleInput">Photo Title</label>
                            <asp:TextBox ID="tbxPhotoBrief" runat="server" class="responsive-textbox form-control" placeholder="Photo Title"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_PhotoBrief" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxPhotoBrief"  ErrorMessage="Please Enter Photo Title" Display = "Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator Display = "Dynamic" ValidationGroup="SaveValidation" ControlToValidate = "tbxPhotoBrief" ID="RegularExpressionValidator" ValidationExpression = "^[\s\S]{0,36}$" runat="server" ErrorMessage="Maximum 36 characters allowed." CssClass="text-danger"></asp:RegularExpressionValidator>
                       </div>

                       <div class="form-group">
                            <label for="formGroupExampleInput2">Photo Details</label>
                            <asp:TextBox ID="tbxPhotoDetail" runat="server" class="responsive-textbox form-control" TextMode="MultiLine" Rows="3" Columns="40" placeholder="Photo Details"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_PhotoDetail" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxPhotoDetail"  ErrorMessage="Please Enter Photo Details" CssClass="text-danger"></asp:RequiredFieldValidator>
                       </div>

                       <div class="form-group">
                            <asp:FileUpload ID="PhotoUpload" runat="server" accept=".png,.jpg" class="form-control-file"/>
                            <asp:RequiredFieldValidator  CssClass="text-danger"  runat="server" ID="RequiredFieldValidatorFileUp" ValidationGroup="SaveValidation"  ErrorMessage="Please Select Photo" ControlToValidate="PhotoUpload" />
                       </div>

                        <div class="form-group">
                            <asp:Label ID="lablePhotoSataus" runat="server" Text="Photo Status" Font-Bold="True"></asp:Label>
                            <asp:DropDownList ID="ddlPhotoStatus" runat="server" class="form-control">
                                <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                            </asp:DropDownList>    
                            <br />               
                       </div>

                       <div class="form-group">
                           <asp:LinkButton ID="saveButton" class="btn btn-success" runat="server" Text="Save" ValidationGroup="SaveValidation" Font-Size="Medium" OnClick="btn_save_Click"></asp:LinkButton>
                       </div>
       
                       <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                             Photo has been inserted successfully!
                       </asp:Panel>

                        <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                             Photo has been faild to insert!
                       </asp:Panel>

                   </div>
             </div>

         </div>
        

         <div class="container">
                      
               <br />
               <h4 style="color:green">Photo Gallery Table</h4> <br />
                     
               <div class="table-responsive">                                     
                    <asp:GridView ID="GridViewPhoto" runat="server" AutoGenerateColumns="False" OnRowCommand="grdViewPhoto_RowCommand" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridViewPhoto_PageIndexChanging" CssClass="table table-striped gtable" GridLines="Horizontal" OnRowDataBound="GridViewPhoto_RowDataBound">
                        <Columns>

                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="PhotoId" runat="server" Text='<%#Eval("PhotoId") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Title" ControlStyle-Width="250px">
                                <ItemTemplate>
                                    <asp:Label ID="PhotoTitle" runat="server" Text='<%#Eval("PhotoBrief") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Detail">
                                <ItemTemplate>
                                    <asp:Label ID="PhotoDetail" runat="server" Text='<%#Eval("PhotoDetail") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Photo">
                                <ItemTemplate>
                                    <asp:Image ID="GalleryPhoto" runat="server" ImageUrl='<%# "~/Photo_gallery/" + Eval("PhotoPath") %>' Style="height: 100px; width: 100px"></asp:Image>
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

     <script type="text/javascript">

          document.getElementById("dashboard_status").classList.add('active');
          document.getElementById("cp_photo_gallery").classList.add('active_cp');
          
     </script>
</asp:Content>
