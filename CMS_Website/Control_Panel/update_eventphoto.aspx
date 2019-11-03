<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="update_eventphoto.aspx.cs" Inherits="CMS_Website.Control_Panel.update_eventphoto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container top_break_control_panel">
          <div class="container">
            <div class="row">
                 <div class="col-sm-6">
                     <h4 style="color:green">Event Photo Update Form</h4><br />
                     <asp:image ID="EventPhoto" runat="server" Height="250px" Width="250px"></asp:image> 

                     <div class="form-group">
                       <br />
                        <asp:Label ID="lablePhotoSataus" runat="server" Text="Photo Status"  Font-Bold="True"></asp:Label>
                      
                        <asp:DropDownList ID="ddlPhotoStatus" Width="250px" runat="server" class="form-control">
                            <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                        </asp:DropDownList>    
                                
                    </div>

                    <div class="form-group">
                        <asp:FileUpload ID="FileUpload" runat="server" accept=".png,.jpg" class="form-control-file" />
                        
                   </div>

                   <div class="form-group">

                        <asp:LinkButton ID="updateButton" class="btn btn-success" runat="server" Text="Update" Font-Size="Medium" OnClick="btn_update_Click"></asp:LinkButton>
                        <asp:LinkButton ID="btnBack" class="btn btn-default" runat="server" Text="Go Back" Font-Size="Medium" OnClick="btn_back_Click"></asp:LinkButton>
                        
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
     </div>

    <script type="text/javascript">

          document.getElementById("dashboard_status").classList.add('active');
          document.getElementById("cp_event").classList.add('active_cp');
          
     </script>

</asp:Content>
