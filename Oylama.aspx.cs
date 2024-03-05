using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trios.Base.Layer.ExtensionMethods;

public partial class Oylama : MyPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {

            SayfayiHazirla();
        }

    }

    private void SayfayiHazirla()
    {
       
        
            
               
            var icerik = IcerikleriGetir(Enums.BolumEnum.Toplantilar.ToInt32(), LangID);
        var sorgu = (from i in db.Icerikler
                     where
                     i.UstIcerikID == 12 && i.Durum==2
                     select new
                     {
                        i.ToplantiAdi,
                         i.ToplantiKonusu,
                         i.IcerikID,
                         i.OlusturulmaTarihi,
                     }).ToList();

        var toplantiadi = (from x in db.Icerikler
                           where x.UstIcerikID == 12
                           select new
                           {
                               x.ToplantiAdi
                           }).ToList();
        if (toplantiadi != null)
        {
            lvwToplantilar.DataSource = toplantiadi;
            lvwToplantilar.DataBind();
        }
        
        if (sorgu != null)
        {
            chk.DataSource = sorgu;
                chk.DataTextField = "OlusturulmaTarihi";
                chk.DataValueField = "IcerikID";
                chk.DataBind();
        }
            foreach (ListItem item2 in chk.Items)
            {

                var kullaniciid = Session["KullaniciID"].ToInt32();
                int itemID = item2.Value.ToInt32();
                var ekstrasorgu = db.Icerikler.Where(x => x.UstIcerikID == itemID && x.KullaniciID == kullaniciid).FirstOrDefault();
                if (ekstrasorgu != null)
                {
                    item2.Selected = true;
                }


            
        }

    }




    protected void btnOylariGoruntule_Click(object sender, EventArgs e)
    {
        Response.Redirect("OylarCalisan.Aspx");
    }

    protected void btnOylariGonder_Click(object sender, EventArgs e)
    {
        foreach (ListItem item2 in chk.Items)
        {
            int itemID = item2.Value.ToInt32();
            var ekstra = db.Icerikler.Where(x => x.UstIcerikID == itemID).FirstOrDefault();
            if (ekstra == null)
            {

            if (item2.Selected)
            {
                var kullaniciid = Session["KullaniciID"];
                Icerik icerik = new Icerik();
            icerik.UstIcerikID = itemID;
            icerik.KullaniciID = kullaniciid.ToInt32();
            icerik.Tipi = 1;
            icerik.ToplantiAdi = "";
            icerik.OlusturulmaTarihi = DateTime.Now;
            icerik.Durum = 1;
            icerik.ToplantiKonusu = "";
            icerik.AciliyetDurumu = "";
            icerik.ToplantiID = 0;
        Page.AJAXAlert("Toplantıya oy verilmiştir.");
        db.Icerikler.AddObject(icerik);
        db.SaveChanges();
                }

            }
            else
            {
                if (item2.Selected)
                {
                    ekstra.UstIcerikID = item2.Value.ToInt32();
                }
                else
                {
                db.Icerikler.DeleteObject(ekstra);
                db.SaveChanges();
                Page.AJAXAlert("Toplantıdan Oy Kaldırılmıştır.");
                }

            }


        }

    }

    protected void chk_CheckedChanged(object sender, EventArgs e)
    {

    }

 

    protected void lnkCikisYap_Click(object sender, EventArgs e)
    {
        Response.Redirect("Logout.aspx");
    }
}