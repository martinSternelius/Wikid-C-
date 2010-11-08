<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Wiki.Models.Article>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>
    <h3><%: Model.Title %></h3>
    <table>
        <tr>
            <th></th>
            <th>
                Heading
            </th>
            <th>
            Section Text
            </th>
            <th>
                Pub_date
            </th>
        </tr>
        
    <% foreach (var item in Model.Article_section) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", Model.Title.Trim() + "/Section/Edit/" + item.Id ) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.Id })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.Id })%>
            </td>
            <td>
            <%: item.Section_heading %>
            </td>
            <td>
            <%: item.Section_text %>
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

