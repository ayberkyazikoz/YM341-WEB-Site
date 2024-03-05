using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trios.Base.Layer.ExtensionMethods;
using Trios.Base.Layer.Tools;
using Data;

public partial class Admin_Login : System.Web.UI.Page
{
    DefaultEntities db = new DefaultEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        
            if (!IsPostBack)
            {
                SayfayiHazirla();
            }
        
    }

    private void SayfayiHazirla()
    {
       
    }

   
   

    protected void btnGiris_Click(object sender, EventArgs e)
    {
        if (FormKontrol())
        {
            string email = txtEPostaAdresi.Text.Trim().ToLower();
            string parola = txtSifre.Text.Trim().ToLower();
            Kullanici kullanici = db.Kullanicilar.Where(x => x.Email.ToLower() == email && x.Parola.ToLower() == parola &&x.KullaniciTipi==1 ).FirstOrDefault();
            if (kullanici != null)
            {
                Session.Add("Administrator", kullanici);
                Session.Add("KullaniciID", kullanici.KullaniciID);
                Session.Timeout = 120;

                Response.Redirect("Oylama.aspx");
            }
            else
            {
                Page.AJAXAlert("Şifre ve/veya e-posta adresi hatalı.");
            }
        }
    }

    private bool FormKontrol()
    {
        if (string.IsNullOrEmpty(txtEPostaAdresi.Text))
        {
            Page.AJAXAlert("E-Posta adresi girilmemiş yada hatalı.");
            return false;
        }
        else if (string.IsNullOrEmpty(txtSifre.Text))
        {
            Page.AJAXAlert("Şifre boş bırakılmamalıdır.");
            return false;
        }
       
        return true;
    }


    protected void btnCalisanGiris_Click(object sender, EventArgs e)
    {
        plhKontrol.Visible = true;
        btnCalisanGiris.Visible = false;
        btnCeoGiris.Visible = false;
        btnGiris.Visible = true;
        btnGiris2.Visible = false;
        
    }

    protected void btnCeoGiris_Click(object sender, EventArgs e)
    {
        plhKontrol.Visible = true;
        btnCalisanGiris.Visible = false;
        btnCeoGiris.Visible = false;
        btnGiris.Visible = false;
        btnGiris2.Visible = true;
    }

    protected void btnGiris2_Click(object sender, EventArgs e)
    {
        if (FormKontrol())
        {
            string email = txtEPostaAdresi.Text.Trim().ToLower();
            string parola = txtSifre.Text.Trim().ToLower();
            Kullanici kullanici = db.Kullanicilar.Where(x => x.Email.ToLower() == email && x.Parola.ToLower() == parola && x.KullaniciTipi==0).FirstOrDefault();
            if (kullanici != null)
            {
                Session.Add("Administrator", kullanici);
                Session.Timeout = 120;

                Response.Redirect("Default.aspx");
            }
            else
            {
                Page.AJAXAlert("Şifre ve/veya e-posta adresi hatalı.");
            }
        }
    }
}