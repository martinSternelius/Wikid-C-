using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Wiki.Models;
using System.Collections;
using System.Web.Routing;
using System.Collections.Generic;
using Wiki.Classes;

namespace Wiki.Controllers
{
    public class WikiController : Controller
    {
        WikiEntities2 db = new WikiEntities2();

        public ActionResult Index()
        {
            return RedirectToAction("Details/Start");
           
        }

        public ActionResult List()
        {

            var articles = from a in db.Articles
                           where a.Pub_date > new DateTime(1984, 6, 1)
                           select a;
            return View(articles.ToList());

        }


        //
        // GET: /Wiki/Details/5

        public ActionResult Details(string Title)
        {
            if (Title == null)
            {
                Title = "Start";
            }

            var db_article = from a in db.Articles
                          where a.Title == Title
                          select a;

            Article article;

            if (db_article.ToList().Count == 0)
            {
                article = new Article
                {
                    Title = Title,
                };
            }
            else
            {
                article = db_article.ToArray()[0];
                
                foreach (Article_section section in article.Article_section)
                {
                    section.Section_text = WikiToHtml.To_html(section.Section_text);
                    section.Section_heading =  WikiToHtml.To_html(section.Section_heading);
                }
            }
            

            return View(article);            
        }

		
		public ActionResult Search()
        {
            if (Request.QueryString["Query"] == null)
            {
                return View(new List<Article>());
            }

            string Query = Request.QueryString["Query"];
            string[] split = Query.Split(new char[] {' '}, StringSplitOptions.RemoveEmptyEntries);
            List<Article> result = new List<Article>();
            List<Article> result_part1 = new List<Article>();
            List<Article> result_part2 = new List<Article>();
            foreach (string s in split)
            {
                IEnumerable<Article> results_title = db.Articles.Where(a => a.Title.Contains(s));
                IEnumerable<Article> results_sections = db.Articles.Where(a => a.Article_section.Any(b => (b.Section_text.Contains(s) || b.Section_heading.Contains(s))));

                foreach(Article art in results_title)
                {
                    if (result_part2.Exists(a => a.Id == art.Id) || result_part1.Exists(a => a.Id == art.Id))
                        continue;

                    result_part1.Add( new Article
                    {
                            Title = art.Title,
                            Id = art.Id,
                            Pub_date = art.Pub_date
                    });
                }

                foreach (Article art in results_sections)
                {
                    if (result_part2.Exists(a => a.Id == art.Id) || result_part1.Exists(a => a.Id == art.Id))
                        continue;

                    result_part2.Add(new Article
                    {
                        Title = art.Title,
                        Id = art.Id,
                        Pub_date = art.Pub_date
                    });
                }           
            }

            result = result_part1;
            result.AddRange(result_part2);
            return View(result);
        }
        //
        // GET: /Wiki/Create/name

        public ActionResult Create(string Title)
        {
            if (!User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index");
            }

            Article a = new Article();
            a.Title = Title;
            Article_section sec = new Article_section();
            //sec.Pub_date = DateTime.Now;
            a.Article_section.Add(sec);
            
            return View(a);
        }
        //
        // POST: /Wiki/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            if (!User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index");
            }

            try
            {
                Article a = db.CreateObject<Article>();
                a.Title = collection["Title"];
                //a.Pub_date = DateTime.Now;
                db.Articles.AddObject(a);
                
                Article_section sec = db.CreateObject<Article_section>();
                
                a.Article_section.Add(sec);
                
                sec.User_name = User.Identity.Name;
                sec.Section_heading = collection["Section_heading"];
                sec.Section_text = collection["Section_text"];
                //sec.Pub_ = DateTime.Now;
                
                db.SaveChanges();
                return RedirectToAction("Details/" + a.Title);
            }

            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Wiki/Edit/Start
 
        public ActionResult Edit(string Title)
        {
            Article art = new Article();
            try
            {
                var article = from a in db.Articles
                              where a.Title == Title
                              select a;
                art = article.ToArray()[0];
            }
            catch (IndexOutOfRangeException)
            {
                return RedirectToAction("/Create/" + Title);
            }
            return View(art);
            
            }


        

        //
        // GET: /Wiki/Delete/5
 
        public ActionResult Delete(int id)
        {
            if (!User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index");
            }

            return View();
        }

        //
        // POST: /Wiki/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            if (!User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index");
            }
            
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
