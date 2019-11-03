<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="update_report.aspx.cs" Inherits="CMS_Website.Control_Panel.update_report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container top_break_control_panel">

         <div class="container">
            <div class="row">
                 <div class="col-sm-6">
                    <h4 style="color:green">Report Update Form</h4>
                    <br />

                    <div class="form-group">
                            <label for="formGroupExampleInput">Report Title</label>
                            <asp:TextBox ID="tbxReportTitle" runat="server" class="responsive-textbox form-control" placeholder="Report Title"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_ReportTitle" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxReportTitle"  ErrorMessage="Please Enter Report Title" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                     <div class="form-group">
                            <asp:FileUpload ID="ReportUpload" runat="server" accept=".pdf,.xlsx,.docx" class="form-control-file"/>
                            
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
                           <asp:LinkButton ID="updateButton" class="btn btn-success" runat="server" Text="Update" ValidationGroup="SaveValidation" Font-Size="Medium" OnClick="btn_update_Click"></asp:LinkButton>

                          <asp:LinkButton ID="btnBack" class="btn btn-default" runat="server" Text="Go Back" Font-Size="Medium" OnClick="btn_back_Click"></asp:LinkButton>
                        
                    </div>
       
                    <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                            Report has been updated successfully!
                    </asp:Panel>

                    <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                            Report has been faild to update!
                    </asp:Panel>

                </div>
            </div>
        </div>

    </div>

     <script type="text/javascript">

          document.getElementById("dashboard_status").classList.add('active');
          document.getElementById("cp_report").classList.add('active_cp');
          
     </script>


</asp:Content>
