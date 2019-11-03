<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="story_board.aspx.cs" Inherits="CMS_Website.story_board" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container top_break">      

         <h2>Success Stories</h2><br />
         
         <asp:Repeater ID="Repeater_Story" runat="server" OnItemDataBound="Repeater_Story_ItemDataBound">

              <ItemTemplate>

                  <div><h4 style="color:green"><asp:Label ID="StoryTitle" Text='<%#Eval("StoryTitle")%>' runat="server"/></h4></div>
                  <div><span style="font-size:2vh"> Published on: <asp:Label ID="Label1" Text='<%#Eval("UpdateDate")%>' runat="server"/> </i></span></div><br />
                  <div><asp:Label ID="StoryDetail" Text='<%#Eval("StoryDetail")%>' runat="server"/></div>
                  <div>
                      <asp:Repeater ID="Repeater_Photo" runat="server">
                          <ItemTemplate>
                           <div style="text-align:center"> <asp:Image ID="StoryPhoto" runat="server" ImageUrl='<%# "~/Story_Photos/" + Eval("PhotoPath") %>' Style="height: 300px; width: 350px"></asp:Image> </div><br />
                          </ItemTemplate>
                      </asp:Repeater>
                  </div>

                  <asp:HiddenField ID="hfStoryId" runat="server" Value='<%# Eval("StoryId") %>' />
                   
                  <br />


              </ItemTemplate>

         </asp:Repeater>
         
     </div>
    

     <script type="text/javascript">
         document.getElementById("what_we_do_dropdown").classList.add('active');
     </script>

</asp:Content>
