﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Wiki
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{Title}", // URL with parameters
                new { controller = "Wiki", action = "Index", Title = UrlParameter.Optional } // Parameter defaults
            );

            routes.MapRoute(
                "ArticleSection",
                "Wiki/{Title}/{controller}/{action}/{Section}",
                new { controller = "Section", Title = "Start", action = "Index", Section = UrlParameter.Optional}
            );


        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterRoutes(RouteTable.Routes);
        }
    }
}