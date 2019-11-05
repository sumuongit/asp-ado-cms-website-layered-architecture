<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="CMS_Website.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
    <script src="Scripts/JavaScript_event_home.js"></script>
    <style>
        * {box-sizing: border-box;}

        .img-zoom-container {
          position: relative;
        }

        .img-zoom-lens {
          position: absolute;
          border: 1px solid #d4d4d4;
          /*set the size of the lens:*/
          width: 40px;
          height: 40px;
        }

        .img-zoom-result {
            border: 1px solid #d4d4d4;
            /*set the size of the result div:*/
            width: 400px;
            height: 500px;
        }
    </style>
  </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">       
           
            <!-- Star Container  -->
            <div class="container">

               <!-- Start Photo Slider -->             
               <div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-top: 110px; z-index:0">

                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                             
                              <asp:Repeater ID="RepeaterBannerindicators" runat="server">
                                  <ItemTemplate>
                                      <li data-target="#myCarousel" data-slide-to='<%# Container.ItemIndex%>' class='<%# Container.ItemIndex == 0 ? "active" : "" %>'  ></li>
                                  </ItemTemplate>

                              </asp:Repeater>
                              
                            </ol>

                            <!-- Wrapper for slides -->

                            <div class="carousel-inner">

                                <asp:Repeater ID="RepeaterBanner" runat="server">
                                     <ItemTemplate>
                                        <div class='<%# Container.ItemIndex == 0 ? "item active" : "item" %>'>
                                            <asp:Image ID="BannerPhoto" runat="server" ImageUrl='<%# "~/Banner_Photos/" + Eval("PhotoPath") %>' Style="width: 100%"></asp:Image>
                                            <div class="carousel-caption">
                                            
                                              <p><asp:Label ID="BannerDetail" runat="server" Text='<%#Eval("BannerInformation") %>'></asp:Label></p>
                                       
                                             </div>
                                        </div>
                                     </ItemTemplate>
                                </asp:Repeater>                  
                            
                             </div>
                      

                            <!-- Left and right controls -->
                            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                              <span class="glyphicon glyphicon-chevron-left"></span>
                              <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                              <span class="glyphicon glyphicon-chevron-right"></span>
                              <span class="sr-only">Next</span>
                            </a>
                           
                            

                     </div>         
               
                 <!-- End Photo Slider -->

               
                <div class="row">
                        <div class="container">                       
                       
                   
                </div>
                
                <div class="row">
                   <div class="container">
                       <br /><br />
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
                                              <asp:HyperLink ID="NewsLink" Text='<%#Eval("NewsTitle") %>' NavigateUrl='<%#Eval("NewsLink") %>' Target="_blank" runat="server"></asp:HyperLink><br /><br />
                                          </div>
                                      </ItemTemplate>
                                  </asp:Repeater>

                              </div>

                       </div>
                       <!-- End News Links -->


                       <!-- Start Events -->
                       <div class="col-sm-6">
                        

                                <h3 style="text-align:left;">Events</h3>
                                <br />

                                 <asp:Repeater ID="Repeater_Event" runat="server" OnItemDataBound="Repeater_Event_ItemDataBound">

                                      <ItemTemplate>
                                          <div><span style="font-size:2vh"><i>Date: <asp:Label ID="Date" Text='<%#Eval("EventDate")%>' runat="server"/> </i></span></div>
                                          <div><h5 style="color:green"><asp:Label ID="Event_Title" Text='<%#Eval("EventTitle")%>' runat="server"/></h5></div>
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

                       </div>
                       <!-- End Events -->
                     
                       </div>
                   </div>
                      <br />
                      <br />

                </div>
                
                <div class="row">
                    <div class="container">
                         <div class="row table-bordered ">
                            
                        </div>
                    </div>
                </div>

            </div>
            <!-- End container  -->  
       </div>
       
     <script type="text/javascript">
        document.getElementById("home_lnk").classList.add('active');
     </script>
             
</asp:Content>
