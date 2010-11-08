using System;
using System.Text.RegularExpressions;
namespace Wiki
{
    namespace Classes
    {

        public class WikiToHtml
        {

            public static Regex re_img = new Regex(@"(\[img\ )(http://)(.*?)(\])");
            // public Regex re_extlinks = new Regex(@"(\ )+(http|https|ftp|mail|gopher)(://.*?)(\ )+");
            public static Regex re_bold = new Regex(@"(''')(.*?)(''')");
            public static Regex re_italic = new Regex(@"('')(.*?)('')");
            public static Regex re_h6 = new Regex(@"(\======)(.*?)(======)");
            public static Regex re_h5 = new Regex(@"(\=====)(.*?)(=====)");
            public static Regex re_h4 = new Regex(@"(\====)(.*?)(====)");
            public static Regex re_h3 = new Regex(@"(\===)(.*?)(===)");
            public static Regex re_h2 = new Regex(@"(\==)(.*?)(==)");
            public static Regex re_h1 = new Regex(@"(\=)(.*?)(=)");
            public static Regex re_ul = new Regex(@"(\*(.*?))(\s{3})", RegexOptions.Singleline);
            public static Regex re_ol = new Regex(@"(\#(.*?))(\s{3})", RegexOptions.Singleline);
            public static Regex re_li = new Regex(@"(\*|#)(.*?(\n|</ol>|</ul>))");
            public static Regex re_hr = new Regex(@"----");
            public static Regex re_href = new Regex(@"(\[\[)(.*?)(\]\])");
            public static Regex re_ehref = new Regex(@"(\[)(.*?)(\s)(.*?)(\])");
            public static Regex re_newline = new Regex(@"\n");

            public static string To_html(string result)
            {
                // Handle linked media
                result = re_img.Replace(result, "<img src='${2}${3}' />");

                // Handle bold (emphasis)
                result = re_bold.Replace(result, "<strong>${2}</strong>");

                // Handle italics (emphasis)
                result = re_italic.Replace(result, "<em>${2}</em>");

                // Handle h6,..,h1
                result = re_h6.Replace(result, "<h6>${2}</h6>");
                result = re_h5.Replace(result, "<h5>${2}</h5>");
                result = re_h4.Replace(result, "<h4>${2}</h4>");
                result = re_h3.Replace(result, "<h3>${2}</h3>");
                result = re_h2.Replace(result, "<h2>${2}</h2>");
                result = re_h1.Replace(result, "<h1>${2}</h1>");

                // Handle ul, ol & li
                result = re_ul.Replace(result, "<ul>${1}</ul>");
                result = re_ol.Replace(result, "<ol>${1}</ol>");
                result = re_li.Replace(result, "<li>${2}</li>");

                // Handle hr
                result = re_hr.Replace(result, "<hr />");

                // Handle external-links
                // result = re_extlinks.Replace(result, " <span class='link_bracket'>&lt;</span><a href='${2}${3}'>${2}${3}</a><span class='link_bracket'>&gt;</span> ");

                // Handle links, internal & external
                result = re_href.Replace(result, "<a href='/wiki/article/${2}/'>${2}</a>");
                result = re_ehref.Replace(result, "<a href='http://${2}'>${4}</a>");

                // Change line breaks: Replace '\n' with <br />'s
                result = re_newline.Replace(result, "<br />");

                return result;
            }
        }
    }
}