using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    public static List<produit> Liste = new List<produit>();
    protected void Page_Load(object sender, EventArgs e)
    {
            produit p = new produit("mof", "mar", "desc", "ref");
            Liste.Add(p);
       
       

    }
}

public class produit
{
    string modele { get ; set; }
    string marque { get; set; }
    string designation { get; set; }
    string reference { get; set; }
    public produit(string Modele, string Marque, string Designation, string Reference)
    {
        modele = Modele;
        marque = Marque;
        designation = Designation;
        reference = Reference;
    }
    public string getModele()
    {
        return this.modele;
    }
    public string getMarque()
    {
        return this.marque;
    }
    public string getReference()
    {
        return this.reference;
    }
    public string getDesignation()
    {
        return this.designation;
    }
}