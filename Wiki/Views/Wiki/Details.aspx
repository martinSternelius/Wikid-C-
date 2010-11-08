<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Wiki.Models.Article>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>
    <% if (Model.Id == 0)
       { %>
    <p>The article "<%=Model.Title %>" does not exist. Do you want to <a href="/wiki/Create/<%=Model.Title %>">create it?</a></p>
    <%}
       else
       { %>
    <fieldset>
        <legend>Articles</legend>
       
        <div class="display-field"><%= Model.Title%></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.Pub_date)%></div>
        <% foreach (var section in Model.Article_section)
           { %>
            <%= section.Section_heading%>
            <%= section.Section_text%>
        <%}
       } %>

        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit/" + Model.Title.Trim())%> |
        <%: Html.ActionLink("Back to Start", "Index") %>
    </p>

</asp:Content>

