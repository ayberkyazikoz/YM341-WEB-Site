using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data;

public partial class Pages_OylarCalisan : MyPage
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
      
       

        var icerik = (from x in db.Icerikler
                      where x.UstIcerikID == 12 && x.Durum == 1
                      select new
                      {
                          x.IcerikID,x.ToplantiAdi,x.OlusturulmaTarihi
                      }).ToList();
        if (icerik != null)
        {
            lvwToplantilar.DataSource = icerik;
            lvwToplantilar.DataBind();
        }
        

    }

    protected void lnkCikisYap_Click(object sender, EventArgs e)
    {
        Response.Redirect("Logout.aspx");
    }
}