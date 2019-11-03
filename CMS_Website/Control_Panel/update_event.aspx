<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="update_event.aspx.cs" Inherits="CMS_Website.Control_Panel.update_event" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container top_break_control_panel">
           <div class="container">
            <div class="row">
                <div class="col-sm-6">

                    <h4 style="color:green">Event Update Form</h4>
                    <br />
        
                    <div class="form-group">
                        <label for="formGroupExampleInput">Event Title</label>
                        <asp:TextBox ID="tbxEventTitle" runat="server" class="responsive-textbox form-control" placeholder="Event Title"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_EventTitle" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxEventTitle"  ErrorMessage="Please Enter Event Title" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="formGroupExampleInput2">Event Details</label>
                        <asp:TextBox ID="tbxEventDetail" runat="server" class="responsive-textbox form-control" TextMode="MultiLine" placeholder="Event Details"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_EventDetail" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxEventDetail"  ErrorMessage="Please Enter Event Details" CssClass="text-danger"></asp:RequiredFieldValidator>

                        <script type="text/javascript" src="https://tinymce.cachefly.net/4.0/tinymce.min.js"></script>
                        <script type="text/javascript">
                          tinymce.init({ selector: 'textarea', height:300});
                        </script>
            
                   </div>

                    <div class="form-group">
                        <asp:Label ID="LabelEventDate" runat="server" Text="Event Date" Font-Bold="True"></asp:Label>
                        <asp:TextBox ID="tbxEventDate" runat="server" class="responsive-textbox form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_EventDate" ValidationGroup="SaveValidation" runat="server" ControlToValidate="tbxEventDate"  ErrorMessage="Please Enter Event Date" CssClass="text-danger"></asp:RequiredFieldValidator>         
                    </div>
              
                   <div class="form-group">
                        <asp:Label ID="lableEventSataus" runat="server" Text="Event Status" Font-Bold="True"></asp:Label>
                        <asp:DropDownList ID="ddlEventStatus" runat="server" class="form-control">
                            <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                        </asp:DropDownList>    
                        <br />               
                    </div>


                   <div class="form-group">

                        <asp:LinkButton ID="updateButton" class="btn btn-success" runat="server" Text="Update" ValidationGroup="SaveValidation" Font-Size="Medium" OnClientClick = "tinyMCE.triggerSave(false,true);" OnClick="btn_update_Click"></asp:LinkButton>

                        <asp:LinkButton ID="btnBack" class="btn btn-default" runat="server" Text="Go Back" Font-Size="Medium" OnClick="btn_back_Click"></asp:LinkButton>

                   </div>
       
                   <asp:Panel ID="SuccessPanel_story" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                         Event has been updated successfully!
                   </asp:Panel>

                    <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                         Event has been faild to update!
                   </asp:Panel>

                </div>

            
            </div>
        </div>
     </div>

     <script type="text/javascript">

        $(document).ready(function () {
                    $("#<%=tbxEventDate.ClientID %>").datepicker({
                        dateFormat: 'dd-mm-yy',
                        onSelect: function (datetext) {
                            var d = new Date(); // for now
                            datetext = datetext + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
                            $("#<%=tbxEventDate.ClientID %>").val(datetext);
                        },
                    }).val();
            });

          document.getElementById("dashboard_status").classList.add('active');
          document.getElementById("cp_event").classList.add('active_cp');
          
     </script>

</asp:Content>
