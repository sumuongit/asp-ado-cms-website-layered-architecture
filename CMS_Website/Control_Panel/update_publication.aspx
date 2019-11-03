<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="update_publication.aspx.cs" Inherits="CMS_Website.Control_Panel.update_publication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container top_break_control_panel">

          <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <h4 style="color:green">Publication Update Form</h4>
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
                           <asp:LinkButton ID="updateButton" class="btn btn-success" runat="server" Text="Update" ValidationGroup="SaveValidation" Font-Size="Medium" OnClick="btn_update_Click"></asp:LinkButton>
                    
                           <asp:LinkButton ID="btnBack" class="btn btn-default" runat="server" Text="Go Back" Font-Size="Medium" OnClick="btn_back_Click"></asp:LinkButton>
                        

                    </div>
       
                    <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                            Publication has been updated successfully!
                    </asp:Panel>

                    <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                            Publication has been faild to update!
                    </asp:Panel>

                </div>
            </div>
        </div>


    </div>

    <script type="text/javascript">

          document.getElementById("dashboard_status").classList.add('active');
          document.getElementById("cp_publication").classList.add('active_cp');
          
     </script>
</asp:Content>
