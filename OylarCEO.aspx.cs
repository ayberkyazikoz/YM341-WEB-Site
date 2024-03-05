using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data;
using Trios.Base.Layer.ExtensionMethods;

public partial class OylarCEO : MyPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SayfayiHazirla();
        }
    }

    private void SayfayiHazirla()
    {
    

        var sorgu = (from i in db.Icerikler
                     where
                     i.UstIcerikID == 12
                     select new IcerikModel
                     {
                        ToplantiAdi= i.ToplantiAdi,
                        ToplantiKonusu= i.ToplantiKonusu,
                       IcerikID=  i.IcerikID,
                        OlusturulmaTarihi= i.OlusturulmaTarihi,
                        Durum=i.Durum,
                        //OyVeren=db.Icerikler.Where(x=>x.UstIcerikID==i.IcerikID).Count(),
                     }).ToList();
        if (sorgu != null)
        {
            lvwToplanti.DataSource = sorgu.Where(x=>x.Durum==1);
            lvwToplanti.DataBind();
            lvwToplantiOylama.DataSource = sorgu.Where(x=>x.Durum==2);
            lvwToplantiOylama.DataBind();
        }
        foreach (ListViewDataItem item in lvwToplantiOylama.Items)
        {
            int itemID = (item.FindControl("hfdTestID") as HiddenField).Value.ToInt32();
            var ltlOyVeren = item.FindControl("ltlOyVeren") as Literal;
            var oyverensorgu = (from i in db.Icerikler

                            select new IcerikModel
                            {
                                OyVeren = db.Icerikler.Where(x => x.UstIcerikID == itemID).Count(),
                            }).FirstOrDefault();

        ltlOyVeren.Text = oyverensorgu.OyVeren.ToString() == null ? "0" : oyverensorgu.OyVeren.ToString();

        }

    }



    protected void btnKesinlestir_Click(object sender, EventArgs e)
    {
        foreach (ListViewDataItem item in lvwToplantiOylama.Items)
        {
            int itemID = (item.FindControl("hfdTestID") as HiddenField).Value.ToInt32();
            var ltlOyVeren = item.FindControl("ltlOyVeren") as Literal;
            var chk = item.FindControl("chk") as CheckBox;
        var sorgu = db.Icerikler.Where(x => x.IcerikID == itemID).FirstOrDefault();

            if (chk.Checked)
            {

            if (sorgu != null)
            {
                sorgu.Durum = 1;
                db.SaveChanges();
                Page.AJAXAlert("Toplantı Kesinleştirilmiştir.");
            }
            }

        }
        SayfayiHazirla();
        }

    protected void btnToplantilariGoruntule_Click(object sender, EventArgs e)
    {
        Response.Redirect("OylarCalisan.aspx");
    }

    protected void lnkSil_Click(object sender, EventArgs e)
    {

    }
}