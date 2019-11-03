<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="event.aspx.cs" Inherits="CMS_Website.Control_Panel._event" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container top_break_control_panel">
        
         <div class="container">
            <div class="row">
                <div class="col-sm-6">

                    <h4 style="color:green">Event Entry Form</h4>
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

                        <asp:LinkButton ID="saveButton" class="btn btn-success" runat="server" Text="Save" ValidationGroup="SaveValidation" Font-Size="Medium" OnClientClick = "tinyMCE.triggerSave(false,true);" OnClick="btn_save_Click"></asp:LinkButton>
                   </div>
       
                   <asp:Panel ID="SuccessPanel_story" runat="server" CssClass="alert alert-success responsive-textbox" Visible="False">
                         Event has been inserted successfully!
                   </asp:Panel>

                    <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger responsive-textbox" CssStyle="text-align:center" Visible="false">
                         Event has been faild to insert!
                   </asp:Panel>

                </div>

                <div class="col-sm-6">

                    <h4 style="color:green">Event Photo Entry Form</h4>
                    <br />
        
                    <div class="form-group">
                        <label for="formGroupExampleInput">Event Title</label>
                         <asp:DropDownList ID="ddlEventTitle" runat="server" class="form-control" AutoPostBack="true" EnableViewState="true" OnSelectedIndexChanged="ddlEventTitle_SelectedIndexChanged">
                         </asp:DropDownList>    
                         <asp:RequiredFieldValidator  InitialValue="--Select Event Title--" CssClass="text-danger"  runat="server" ID="validationEventTitleSelection" ValidationGroup="validationEventPhoto"  ErrorMessage="Please Select Event Title" ControlToValidate="ddlEventTitle" />
                    </div>

                    <div class="form-group">
                        <label for="formGroupExampleInput">Event Id</label>
                         <asp:TextBox ID="tbxEventId" runat="server" class="responsive-textbox form-control" ReadOnly="true"></asp:TextBox>                         
                    </div>

                   <div class="form-group">
                        <asp:Label ID="LabelPhotoStatus" runat="server" Text="Photo Status" Font-Bold="True"></asp:Label>
                        <asp:DropDownList ID="ddlPhotoStatus" runat="server" class="form-control">
                            <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                        </asp:DropDownList>    
                        <br />               
                    </div>

                   <div class="form-group">
                        <asp:FileUpload ID="FileUploadEvent" runat="server" accept=".png,.jpg" class="form-control-file" AllowMultiple="True" />
                        <asp:RequiredFieldValidator  CssClass="text-danger"  runat="server" ID="RequiredFieldValidatorFileUp" ValidationGroup="validationEventPhoto"  ErrorMessage="Please Select Photo" ControlToValidate="FileUploadEvent" />
                  
                   </div>
                
                   <div class="form-group">

                        <asp:LinkButton ID="btnUpload" ValidationGroup="validationEventPhoto" class="btn btn-success" runat="server" Text="Upload" Font-Size="Medium" OnClick="btn_upload_Click"></asp:LinkButton>
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


         <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <br />
                    <h4 style="color:green">Event Table</h4> <br />
                     
            
                    <div class="table-responsive">
                     <asp:GridView ID="GridViewEvent" runat="server" AutoGenerateColumns="False" OnRowCommand="grdView_RowCommandEvent" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridViewEvent_PageIndexChanging" CssClass="table table-responsive table-striped gtable" GridLines="Horizontal" OnRowDataBound="GridViewEvent_RowDataBound">
                        <Columns>

                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="EventId" runat="server" Text='<%#Eval("EventID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Title">
                                <ItemTemplate>
                                    <asp:Label ID="EventTitle" runat="server" Text='<%#Eval("EventTitle") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Detail">
                                <ItemTemplate>
                                    <asp:Label ID="EventDetail" runat="server" Text='<%#Eval("EventDetail") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Date" ControlStyle-Width="60px">
                                <ItemTemplate>
                                    <asp:Label ID="EventDate" runat="server" Text='<%#Eval("EventDate")%>'></asp:Label>
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
                                    <asp:LinkButton ID="lnkbtnEditEvent" CommandName="lnkbtnEditEvent" CommandArgument='<%#Eval("EventId") %>' runat="server">Edit</asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                        </Columns>
                         <PagerStyle CssClass="pagination-ys" />
                    </asp:GridView>
                       </div> 
                </div>

                <div class="col-sm-6">
                      
                     <br />
                     <h4 style="color:green">Event Photo Table</h4>
                     <br />
                       <div class="table-responsive">                                     
                        <asp:GridView ID="GridViewPhoto" runat="server" AutoGenerateColumns="False" OnRowCommand="grdViewPhoto_RowCommand" AllowPaging="True" PageSize="5" OnPageIndexChanging="GridViewPhoto_PageIndexChanging" CssClass="table table-striped gtable" GridLines="Horizontal" OnRowDataBound="GridViewPhoto_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="PhotoId" runat="server" Text='<%#Eval("PhotoID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Event ID">
                                <ItemTemplate>
                                    <asp:Label ID="StoryId" runat="server" Text='<%#Eval("EventID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Photo">
                                <ItemTemplate>
                                    <asp:Image ID="EventPhoto" runat="server" ImageUrl='<%# "~/Event_Photos/" + Eval("PhotoPath") %>' Style="height: 100px; width: 100px"></asp:Image>
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
        </div>
        

    </div>

     <script type="text/javascript">

                $(document).ready(function () {
                    $("#<%=tbxEventDate.ClientID %>").datepicker({
                            dateFormat: 'dd-mm-yy',                       
                        
                            onSelect: function (datetext) {
                                var d = new Date();
                                var ampm = (d.getHours() < 12) ? "AM" : "PM";
                                datetext = datetext + " " + ((d.getHours() + 24) % 12 || 12) + ":" + d.getMinutes() + ":" + d.getSeconds() + ' ' + ampm;
                            $("#<%=tbxEventDate.ClientID %>").val(datetext);
                        },
                    }).val();
            });
         

          document.getElementById("dashboard_status").classList.add('active');
          document.getElementById("cp_event").classList.add('active_cp');
          
     </script>
</asp:Content>
