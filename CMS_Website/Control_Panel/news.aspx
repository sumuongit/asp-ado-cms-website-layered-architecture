<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="CMS_Website.Control_Panel.news" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container top_break_control_panel">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <h4 style="color:green">News Entry Form</h4>
                    <br />

                    <div class="form-group">
                            <label for="formGroupExampleInput">News Title</label>
                            <asp:TextBox ID="tbxNewsTitle" runat="server" class="responsive-textbox form-control" placeholder="News Title"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_NewsTitle" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxNewsTitle"  ErrorMessage="Please Enter News Title" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                            <label for="formGroupExampleInput2">News Link</label>
                            <asp:TextBox ID="tbxNewsLink" runat="server" class="responsive-textbox form-control" TextMode="MultiLine" Rows="3" Columns="40" placeholder="News Link"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_NewsLink" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxNewsLink"  ErrorMessage="Please Enter News Link" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                            <asp:Label ID="lableNewsSataus" runat="server" Text="News Status" Font-Bold="True"></asp:Label>
                            <asp:DropDownList ID="ddlNewsStatus" runat="server" class="form-control">
                                <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                            </asp:DropDownList>    
                            <br />               
                    </div>

                    <div class="form-group">
                           <asp:LinkButton ID="saveButton" class="btn btn-success" runat="server" Text="Save" ValidationGroup="SaveValidation" Font-Size="Medium" OnClick="btn_save_Click"></asp:LinkButton>
                    </div>
       
                    <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                             News has been inserted successfully!
                    </asp:Panel>

                    <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                             News has been faild to insert!
                    </asp:Panel>

                </div>
            </div>
        </div>

        
        <div class="container">
                      
               <br />
               <h4 style="color:green">News Table</h4> <br />
                     
               <div class="table-responsive">                                     
                    <asp:GridView ID="GridViewNews" runat="server" AutoGenerateColumns="False" OnRowCommand="grdViewNews_RowCommand" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridViewNews_PageIndexChanging" CssClass="table table-striped gtable" GridLines="Horizontal" OnRowDataBound="GridViewNews_RowDataBound">
                        <Columns>

                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="NewsId" runat="server" Text='<%#Eval("NewsId") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Title">
                                <ItemTemplate>
                                    <asp:Label ID="NewsTitle" runat="server" Text='<%#Eval("NewsTitle") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Link">
                                <ItemTemplate>
                                    <asp:HyperLink ID="NewsLink" Text='<%#Eval("NewsTitle") %>' NavigateUrl='<%#Eval("NewsLink") %>' Target="_blank" runat="server"></asp:HyperLink>
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

                                    <asp:LinkButton ID="lnkbtnNewsEdit" CommandName="lnkbtnNewsEdit" CommandArgument='<%#Eval("NewsId") %>' runat="server">Edit</asp:LinkButton>
                                
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
          document.getElementById("cp_news").classList.add('active_cp');
          
     </script>
</asp:Content>
