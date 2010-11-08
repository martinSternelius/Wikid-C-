<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Wiki.Models.Article>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Search.aspx
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form action="Search" method="get">
    <input type="text" width="200" name="Query" />
    <button type="submit" >Search</button>
    </form>
    <h2>Search Results</h2>
    <ol>
    <% foreach (var article in Model) { %>
          <li><a href="/wiki/Details/<%=article.Title %>"><%=article.Title %></a></li>  
    <% } %>
    </ol>
</asp:Content>
