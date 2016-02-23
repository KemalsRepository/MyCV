using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace kemalTekin.Controllers
{
    public class adminController : Controller
    {
        //
        // GET: /admin/
        string kAdi { get; set; }
        string pw { get; set; }
        public ActionResult Index()
        {

            return View();
        }
        public ActionResult giris()
        {
            return View();
        }
        public ActionResult AdminPanel()
        {
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult giris(FormCollection frm)
        {
            
            string kullaniciAdi = frm.Get("txtKullaniciAdi").Trim();
            string sifre = frm.Get("txtSifre").Trim();
            if (kullaniciAdi == "" || kullaniciAdi == "Kullanıcı Adı" || sifre == "" || sifre == "Şifre")
            {
                ViewBag.Bos = true;

            }
            else
            {
                kemalTekinEntities vt = new kemalTekinEntities();
                var kayit = from k in vt.giris
                            where k.kullaniciAdi == kullaniciAdi && k.sifre == sifre
                            select new { k.ID };
                if (kayit.ToList().Count > 0)
                {
                    Session.Add("giris", true);
                    foreach (var item in kayit)
                    {
                        Session.Add("id", item.ID);

                    }
                    ViewBag.denem = "deneme";
                    // return RedirectToAction("index");

                }
                else
                {
                    ViewBag.onay = false;
                }
            }
           return View();
        }
  
    
    
    }

}
