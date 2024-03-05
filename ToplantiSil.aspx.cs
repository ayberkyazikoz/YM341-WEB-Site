using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trios.Base.Layer.ExtensionMethods;

public partial class Pages_ToplantiSil : MyPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Request.QueryString["ID"].ToInt32();
        var icerik = db.Icerikler.Where(x => x.IcerikID == id).FirstOrDefault();
        db.Icerikler.DeleteObject(icerik);
        db.SaveChanges();
        Response.Redirect("OylarCEO.aspx");
    }
}