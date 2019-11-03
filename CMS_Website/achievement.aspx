<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="achievement.aspx.cs" Inherits="CMS_Website.achievements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/JavaScript_for_notice_board.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container top_break">
        

         <h2>Achievement</h2><br />

                 <asp:Repeater ID="Repeater_Achievement" runat="server" OnItemDataBound="Repeater_Achievement_ItemDataBound">

                      <ItemTemplate>

                              <div><h4 style="color:green"><asp:Label ID="Achievement_Title" Text='<%#Eval("AchievementTitle")%>' runat="server"/></h4></div>
                              

                              <div class="comment"><asp:Label ID="AchievementDetail" Text='<%#Eval("AchievementDetail")%>' runat="server"/>
                                  <asp:Repeater ID="Repeater_Photo" runat="server">
                                      <ItemTemplate>
                                          <div style="text-align:center"> <asp:Image ID="AchievementPhoto" runat="server" ImageUrl='<%# "~/Achievement_Photos/" + Eval("PhotoPath") %>' Style="height: 300px; width: 350px"></asp:Image> </div><br />
                                      </ItemTemplate>
                                  </asp:Repeater>
                              </div>

                              <asp:HiddenField ID="hfAchievementId" runat="server" Value='<%# Eval("AchievementId") %>' />
                   
                              <br />


                          </ItemTemplate>

                 </asp:Repeater>
          

           

     </div>

     <script type="text/javascript">
         document.getElementById("achievements_and_results_dropdown").classList.add('active');
     </script>

</asp:Content>
