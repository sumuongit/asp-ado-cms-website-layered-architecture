<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="latest_news_events.aspx.cs" Inherits="CMS_Website.latest_news_events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="Scripts/JavaScript_event_home.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container top_break">
        

         <h2>Latest News & Events</h2><br />
          <div class="row">
                   <div class="container">

                     <div class="row">
                       
                       <!-- Start News Links -->
                       <div class="col-sm-6">
                        
                           <h3 style="text-align:left;">News Links</h3>
                           <br />
                      
                              <div class="container">
                                  <!-- News Links -->
                        
                                  <asp:Repeater ID="RepeaterNews" runat="server">
                                      <ItemTemplate>
                                          <div class="row">
                                              <asp:HyperLink ID="NewsLink" Text='<%#Eval("NewsTitle") %>' NavigateUrl='<%#Eval("NewsLink") %>' Target="_blank" runat="server"></asp:HyperLink>
                                          </div>
                                      </ItemTemplate>
                                  </asp:Repeater>

                              </div>

                       </div>
                       <!-- End News Links -->


                       <!-- Start Events -->
                       <div class="col-sm-6">
                         
                          <%-- <div class="container" style="width:90%">--%>

                                <h3 style="text-align:left;">Events</h3>
                                <br />

                                 <asp:Repeater ID="Repeater_Event" runat="server" OnItemDataBound="Repeater_Event_ItemDataBound">

                                      <ItemTemplate>

                                          <div><h5 style="color:green"><asp:Label ID="Event_Title" Text='<%#Eval("EventTitle")%>' runat="server"/></h5></div>
                                          <div><span style="font-size:2vh"><i>Date: <asp:Label ID="Date" Text='<%#Eval("EventDate")%>' runat="server"/> </i></span></div><br />
                                          <div class="comment"><asp:Label ID="EventDetail" Text='<%#Eval("EventDetail")%>' runat="server"/>
                              
                                              <asp:Repeater ID="Repeater_Photo" runat="server">
                                                  <ItemTemplate>
                                                   <div style="text-align:center"> <asp:Image ID="EventPhoto" runat="server" ImageUrl='<%# "~/Event_Photos/" + Eval("PhotoPath") %>' Style="height: 300px; width: 350px"></asp:Image> </div><br />
                                                  </ItemTemplate>
                                              </asp:Repeater>
                                          </div>

                                          <asp:HiddenField ID="hfEventId" runat="server" Value='<%# Eval("EventId") %>' />
                   
                                          <br />


                                      </ItemTemplate>

                                </asp:Repeater>

                           <%--  </div>--%>

                       </div>
                       <!-- End Events -->
                     
                       </div>
                   </div>
                      <br />
                      <br />

                </div>
         
       
         
     </div>

     <script type="text/javascript">
         document.getElementById("achievements_and_results_dropdown").classList.add('active');
     </script>

</asp:Content>
