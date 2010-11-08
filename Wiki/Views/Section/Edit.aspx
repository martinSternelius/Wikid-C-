<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Wiki.Models.Article_section>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Section
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Section</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            <input type="hidden" name="Article_id" value="<%: Model.Article.Id %>"/>    
            <div class="editor-label">
                <%: Html.Label("Section Heading") %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Section_heading) %>
                <%: Html.ValidationMessageFor(model => model.Section_heading) %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Section Text") %>
            </div>
            <div class="editor-field_textarea">
                <%: Html.TextAreaFor(model => model.Section_text) %>
                <%: Html.ValidationMessageFor(model => model.Section_text) %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Parent section") %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Parent_section) %>
                <%: Html.ValidationMessageFor(model => model.Parent_section) %>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Section order") %>
            </div>

            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Section_order) %>
                <%: Html.ValidationMessageFor(model => model.Section_order) %>
            </div>
            
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

