using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Wiki.Models;
using System.Web.Routing;

namespace Wiki.Controllers
{
    public class SectionController : Controller
    {
        WikiEntities2 db = new WikiEntities2();
        
        //
        // GET: /Section/

        public ActionResult Index()
        {
            return View();
        }

    
        public ActionResult Edit(int Section)
        {
            Console.WriteLine("ej");
            if (!User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Account", "LogOn");
            }

            
            Article_section sec = new Article_section();
            try
            {
                var section = from art in db.Article_section
                            where art.Id == Section
                            select art;
                sec = section.ToArray()[0];
            }
            catch (IndexOutOfRangeException)
            {
                return RedirectToAction("/Edit/" + Section);
            }
            return View(sec);
        }

        //
        // POST: /Wiki/Sectionedit/

        [HttpPost]
        public ActionResult Edit(FormCollection collection)
        {
            
            if (!User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index");
            }

            try
            {
                Article_section sec = db.CreateObject<Article_section>();


                sec.Article_id = Int32.Parse(collection["Article_id"]); 
                sec.User_name = User.Identity.Name;
                sec.Section_heading = collection["Section_heading"];
                sec.Section_text = collection["Section_text"];
                sec.Pub_date = DateTime.Now;
                sec.delete_flag = 0;
                sec.Parent_section = Int32.Parse(collection["Parent_section"]);
                sec.Section_order = Int32.Parse(collection["Section_order"]);
                
                db.SaveChanges();
                return RedirectToAction("Wiki/Details/" + sec.Article.Title);
                

            }
            catch
            {
                return View();
            }
        }


    }
}