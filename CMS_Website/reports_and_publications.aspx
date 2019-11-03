<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="reports_and_publications.aspx.cs" Inherits="CMS_Website.reports_and_publications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container top_break">
        

         <h2>Reports & Publications</h2><br />

        <div class="row">
            <div class="col-sm-6">
                <h3 style="color:green">Reports</h3><br />

                 
                 <asp:Repeater ID="RepeaterReport" runat="server">
                      <ItemTemplate>
                          
                             &#9679; <asp:HyperLink ID="Report" Text='<%#Eval("ReportTitle") %>' NavigateUrl='<%# "~/Report_Files/"+ Eval("ReportPath") %>' Target="_blank" runat="server"></asp:HyperLink><br /><br />
                          
                      </ItemTemplate>
                 </asp:Repeater>
                 
            </div>

            <div class="col-sm-6">
                <h3 style="color:green"> Publications </h3><br />

                
                 <asp:Repeater ID="RepeaterPublication" runat="server">
                      <ItemTemplate>
                          
                              &#9679; <asp:HyperLink ID="Report" Text='<%#Eval("PublicationTitle") %>' NavigateUrl='<%# Eval("PublicationPath") %>' Target="_blank" runat="server"></asp:HyperLink><br /><br />
                          
                      </ItemTemplate>
                 </asp:Repeater>
                 

                    
            </div>

        </div>

         
     </div>

     <script type="text/javascript">
         document.getElementById("achievements_and_results_dropdown").classList.add('active');
     </script>

</asp:Content>
