<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="publication.aspx.cs" Inherits="CMS_Website.Control_Panel.publication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container top_break_control_panel">
        

         <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <h4 style="color:green">Publication Entry Form</h4>
                    <br />

                    <div class="form-group">
                            <label for="formGroupExampleInput">Publication Title</label>
                            <asp:TextBox ID="tbxPublicationTitle" runat="server" class="responsive-textbox form-control" placeholder="Publication Title"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_PublicationTitle" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxPublicationTitle"  ErrorMessage="Please Enter Publication Title" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                            <label for="formGroupExampleInput2">Publication Link</label>
                            <asp:TextBox ID="tbxPublicationLink" runat="server" class="responsive-textbox form-control" TextMode="MultiLine" Rows="3" Columns="40" placeholder="Publication Link"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_PublicationLink" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxPublicationLink"  ErrorMessage="Please Enter Publication Link" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                            <asp:Label ID="lablePublicationSataus" runat="server" Text="Publication Status" Font-Bold="True"></asp:Label>
                            <asp:DropDownList ID="ddlPublicationStatus" runat="server" class="form-control">
                                <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                            </asp:DropDownList>    
                            <br />               
                    </div>

                    <div class="form-group">
                           <asp:LinkButton ID="saveButton" class="btn btn-success" runat="server" Text="Save" ValidationGroup="SaveValidation" Font-Size="Medium" OnClick="btn_save_Click"></asp:LinkButton>
                    </div>
       
                    <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                            Publication has been inserted successfully!
                    </asp:Panel>

                    <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                             Publication has been faild to insert!
                    </asp:Panel>

                </div>
            </div>
        </div>


         <div class="container">
                      
               <br />
               <h4 style="color:green">Publication Table</h4> <br />
                     
               <div class="table-responsive">                                     
                    <asp:GridView ID="GridViewPublication" runat="server" AutoGenerateColumns="False" OnRowCommand="grdViewPublication_RowCommand" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridViewPublication_PageIndexChanging" CssClass="table table-striped gtable" GridLines="Horizontal" OnRowDataBound="GridViewPublication_RowDataBound">
                        <Columns>

                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="PublicationId" runat="server" Text='<%#Eval("PublicationId") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Title">
                                <ItemTemplate>
                                    <asp:Label ID="PublicationTitle" runat="server" Text='<%#Eval("PublicationTitle") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Link">
                                <ItemTemplate>
                                    <asp:HyperLink ID="PublicationLink" Text='<%#Eval("PublicationTitle") %>' NavigateUrl='<%#Eval("PublicationPath") %>' Target="_blank" runat="server"></asp:HyperLink>
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

                                    <asp:LinkButton ID="lnkbtnPublicationEdit" CommandName="lnkbtnPublicationEdit" CommandArgument='<%#Eval("PublicationId") %>' runat="server">Edit</asp:LinkButton>
                                
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
          document.getElementById("cp_publication").classList.add('active_cp');
          
     </script>
</asp:Content>
