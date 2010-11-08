<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Wiki.Controllers.HelloWorldController+WelcomeViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Welcome
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Welcome</h2>
    <% for(int i=0;i<Model.NumTimes;i++) { %>
       <h3><%: Model.Message %></h3>
<% } %>

</asp:Content>
