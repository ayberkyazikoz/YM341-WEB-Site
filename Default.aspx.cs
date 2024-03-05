using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trios.Base.Layer.ExtensionMethods;

public partial class _Default : MyPage
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
       
            
                ddlDurum.Items.Insert(0, "Hiçbiri");
        ddlDurum.Items.Insert(1, "Düşük");
        ddlDurum.Items.Insert(2, "Orta");
        ddlDurum.Items.Insert(3, "Yüksek");
      

        var sorgu = (from i in db.Icerikler
                          where
                          i.UstIcerikID == 12
                          select new 
                          {
                              i.ToplantiAdi,i.ToplantiKonusu,i.IcerikID
                          }).ToList();
        /*ar sorgu = IcerikleriGetir(Enums.BolumEnum.Toplantilar.ToInt32(), LangID);*/
        
        ddlToplantilar.DataSource = sorgu;
        ddlToplantilar.DataTextField = "ToplantiAdi";
        ddlToplantilar.DataValueField = "IcerikID";
        ddlToplantilar.DataBind();
        ddlToplantilar.Items.Insert(0, "Hiçbiri");
        

    }

    protected void btnGonder_Click(object sender, EventArgs e)
    {
        Icerik icerik = new Icerik();
        icerik.KullaniciID = 1;
        icerik.Tipi = 1;
        icerik.OlusturulmaTarihi = Convert.ToDateTime(txtTarih.Text);
        icerik.UstIcerikID = Enums.BolumEnum.Toplantilar.ToInt32();
        icerik.Durum = 2;
        icerik.ToplantiAdi = txtToplantiAdi.Text.ToString();
        icerik.ToplantiKonusu = txtToplanti.Text.ToString();
        icerik.AciliyetDurumu =ddlDurum.SelectedIndex==0?"0":ddlDurum.SelectedItem.Text.ToString();
        icerik.ToplantiID =ddlToplantilar.SelectedIndex==0 ? 0: ddlToplantilar.SelectedValue.ToInt32();
        //icerikdetay.Baslik 
        //icerikdetay.ToplantiMesaj = txtTarih.Text.ToString();
        Page.AJAXAlert("Toplantı Tarihi Eklenmiştir.");
        db.Icerikler.AddObject(icerik);
        db.SaveChanges();
    }

    protected void drpToplantilar_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnAnketSonuclariGoster_Click(object sender, EventArgs e)
    {
        Response.Redirect("OylarCEO.aspx");
    }
}