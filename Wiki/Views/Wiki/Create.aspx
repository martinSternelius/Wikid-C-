<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Wiki.Models.Article>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
                <fieldset>  
                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Title) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextBoxFor(model => model.Title) %>
                        <%: Html.ValidationMessageFor(model => model.Title) %>
                    </div>
                </fieldset>
                <fieldset>
                    <div class="editor-label">
                        <%: Html.Label("Section Heading")%>
                    </div>
                    <div class="editor-field_textarea">
                        <%: Html.TextBoxFor(model => model.Article_section.First().Section_heading)%>
                        <%: Html.ValidationMessageFor(model => model.Article_section.First().Section_heading)%>
                    </div>

                    <div class="editor-label">
                        <%: Html.Label("Section Text") %>
                    </div>
                    <div class="editor-field">
                        <%: Html.TextAreaFor(model => model.Article_section.First().Section_text)%>
                        <%: Html.ValidationMessageFor(model => model.Article_section.First().Section_text)%>
                    </div>
                </fieldset>
                            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

