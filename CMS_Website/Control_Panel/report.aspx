<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="CMS_Website.Control_Panel.report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container top_break_control_panel">
        
         <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <h4 style="color:green">Report Entry Form</h4>
                    <br />

                    <div class="form-group">
                            <label for="formGroupExampleInput">Report Title</label>
                            <asp:TextBox ID="tbxReportTitle" runat="server" class="responsive-textbox form-control" placeholder="Report Title"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_ReportTitle" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxReportTitle"  ErrorMessage="Please Enter Report Title" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
               
                    <div class="form-group">
                            <asp:FileUpload ID="ReportUpload" runat="server" accept=".pdf,.xlsx,.docx" class="form-control-file"/>
                            <asp:RequiredFieldValidator  CssClass="text-danger"  runat="server" ID="RequiredFieldValidatorFileUp" ValidationGroup="SaveValidation"  ErrorMessage="Please Select Report File" ControlToValidate="ReportUpload" />
                    </div>

                    <div class="form-group">
                            <asp:Label ID="lableReportSataus" runat="server" Text="Report Status" Font-Bold="True"></asp:Label>
                            <asp:DropDownList ID="ddlReportStatus" runat="server" class="form-control">
                                <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                            </asp:DropDownList>    
                            <br />               
                    </div>

                    <div class="form-group">
                           <asp:LinkButton ID="saveButton" class="btn btn-success" runat="server" Text="Save" ValidationGroup="SaveValidation" Font-Size="Medium" OnClick="btn_save_Click"></asp:LinkButton>
                    </div>
       
                    <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                            Report has been inserted successfully!
                    </asp:Panel>

                    <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                             Report has been faild to insert!
                    </asp:Panel>

                </div>
            </div>
        </div>
         
          <div class="container">
                      
               <br />
               <h4 style="color:green">Report Table</h4> <br />
                     
               <div class="table-responsive">                                     
                    <asp:GridView ID="GridViewReport" runat="server" AutoGenerateColumns="False" OnRowCommand="grdViewReport_RowCommand" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridViewReport_PageIndexChanging" CssClass="table table-striped gtable" GridLines="Horizontal" OnRowDataBound="GridViewReport_RowDataBound">
                        <Columns>

                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="ReportId" runat="server" Text='<%#Eval("ReportId") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Title">
                                <ItemTemplate>
                                    <asp:Label ID="ReportTitle" runat="server" Text='<%#Eval("ReportTitle") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="File">
                                <ItemTemplate>
                                    <asp:HyperLink ID="ReportFile" Text='<%#Eval("ReportTitle") %>'  NavigateUrl='<%# "~/Report_Files/"+ Eval("ReportPath") %>' Target="_blank" runat="server"></asp:HyperLink>
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

                                    <asp:LinkButton ID="lnkbtnReportEdit" CommandName="lnkbtnReportEdit" CommandArgument='<%#Eval("ReportId") %>' runat="server">Edit</asp:LinkButton>
                                
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
          document.getElementById("cp_report").classList.add('active_cp');
          
     </script>

</asp:Content>
