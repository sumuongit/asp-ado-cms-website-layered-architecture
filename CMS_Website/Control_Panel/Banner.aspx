<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="Banner.aspx.cs" Inherits="CMS_Website.Control_Panel.Banner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container top_break_control_panel">
        
         <div class="container">

             <div class="row">
                   <div class="col-sm-6">

                       <h4 style="color:green">Banner Entry Form</h4>
                       <br />

                       <div class="form-group">
                            <label for="formGroupExampleInput">Banner Information</label>
                            <asp:TextBox ID="tbxBannerInfo" TextMode="MultiLine" Rows="3" Columns="40" runat="server" class="responsive-textbox form-control" placeholder="Banner Information"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_BannerInfo" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxBannerInfo"  ErrorMessage="Please Enter Banner Information" CssClass="text-danger"></asp:RequiredFieldValidator>
                       </div>

                       <div class="form-group">
                            <asp:FileUpload ID="PhotoUpload" runat="server" accept=".png,.jpg" class="form-control-file"/>
                            <asp:RequiredFieldValidator  CssClass="text-danger"  runat="server" ID="RequiredFieldValidatorFileUp" ValidationGroup="SaveValidation"  ErrorMessage="Please Select Photo" ControlToValidate="PhotoUpload" />
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
                           <asp:LinkButton ID="saveButton" class="btn btn-success" runat="server" Text="Save" ValidationGroup="SaveValidation" Font-Size="Medium" OnClick="btn_save_Click"></asp:LinkButton>
                       </div>
       
                       <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                            Banner has been inserted successfully!
                       </asp:Panel>

                        <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                            Banner has been faild to insert!
                       </asp:Panel>

                   </div>
             </div>

         </div>
        

         <div class="container">
                      
               <br />
               <h4 style="color:green">Banner Table</h4> <br />
                     
               <div class="table-responsive">                                     
                    <asp:GridView ID="GridViewBanner" runat="server" AutoGenerateColumns="False" OnRowCommand="grdViewBanner_RowCommand" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridViewBanner_PageIndexChanging" CssClass="table table-striped gtable" GridLines="Horizontal" OnRowDataBound="GridViewBanner_RowDataBound">
                        <Columns>

                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="BannerId" runat="server" Text='<%#Eval("BannerId") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="Detail">
                                <ItemTemplate>
                                    <asp:Label ID="BannerDetail" runat="server" Text='<%#Eval("BannerInformation") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Photo">
                                <ItemTemplate>
                                    <asp:Image ID="BannerPhoto" runat="server" ImageUrl='<%# "~/Banner_Photos/" + Eval("PhotoPath") %>' Style="height: 100px; width: 100px"></asp:Image>
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

                                    <asp:LinkButton ID="lnkbtnBannerEdit" CommandName="lnkbtnBannerEdit" CommandArgument='<%#Eval("BannerId") %>' runat="server">Edit</asp:LinkButton>
                                
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
          document.getElementById("cp_banner").classList.add('active_cp');
          
     </script>

</asp:Content>
