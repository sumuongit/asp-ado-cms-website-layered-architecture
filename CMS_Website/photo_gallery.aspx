<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="photo_gallery.aspx.cs" Inherits="CMS_Website.photo_gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container top_break">
      

       <h2>Photo Gallery</h2><br />
      
           <asp:Repeater ID="RepeaterPhotoGallery" runat="server">
              <ItemTemplate>
                <div class="responsive" style=" margin-bottom: 20px;">
                    <div class="gallery">

                        <asp:HyperLink data-lightbox="roadtrip" ID="HyperLink1" NavigateUrl='<%# "~/Photo_gallery/" + Eval("PhotoPath") %>' data-title='<%#Eval("PhotoDetail") %>' runat="server">
                        <asp:Image ID="Photo" runat="server" ImageUrl='<%# "~/Photo_gallery/" + Eval("PhotoPath") %>' alt='<%#Eval("PhotoDetail") %>' style="height:230px; width:100%;" ></asp:Image>
                        </asp:HyperLink>
                        <div class="desc"><span style="color:green"> <asp:Label ID="PhotoBrief" runat="server" Text='<%#Eval("PhotoBrief") %>'> </asp:Label></span></div>
                        

                    </div>
                </div>
              </ItemTemplate>
             
           </asp:Repeater>
    
         
     </div>


     <script type="text/javascript">
        
         document.getElementById("what_we_do_dropdown").classList.add('active');

     </script>

  
     
</asp:Content>
