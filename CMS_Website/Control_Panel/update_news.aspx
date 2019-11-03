<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="update_news.aspx.cs" Inherits="CMS_Website.Control_Panel.update_news" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container top_break_control_panel">

         <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <h4 style="color:green">News Update Form</h4>
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
                           
                        <asp:LinkButton ID="updateButton" class="btn btn-success" runat="server" Text="Update" ValidationGroup="SaveValidation" Font-Size="Medium" OnClick="btn_update_Click"></asp:LinkButton>
                           
                        <asp:LinkButton ID="btnBack" class="btn btn-default" runat="server" Text="Go Back" Font-Size="Medium" OnClick="btn_back_Click"></asp:LinkButton>
                        
                    </div>
       
                    <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                             News has been updated successfully!
                    </asp:Panel>

                    <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                             News has been faild to update!
                    </asp:Panel>

                </div>
            </div>
        </div>

    </div>


    <script type="text/javascript">

          document.getElementById("dashboard_status").classList.add('active');
          document.getElementById("cp_news").classList.add('active_cp');
          
     </script>
   
</asp:Content>
