<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Wiki.Models.Article>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	List
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>List</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Id
            </th>
            <th>
                Title
            </th>
            <th>
                Pub_date
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { Title=item.Title }) %> |
                <%: Html.ActionLink("Details", "Details", new { Title=item.Title })%> |
                <%: Html.ActionLink("Delete", "Delete", new { Title=item.Title })%>
            </td>
            <td>
                <%: item.Id %>
            </td>
            <td>
                <%: item.Title %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.Pub_date) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

