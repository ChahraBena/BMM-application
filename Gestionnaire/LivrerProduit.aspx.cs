using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;

public partial class Gestionnaire_LivrerProduit : System.Web.UI.Page
{
    public static List<produit> Liste = new List<produit>();
    public static List<produitLivre> ListeL = new List<produitLivre>();
    protected void Page_Load(object sender, EventArgs e)
    {
        int idbmm=0;
        if (!IsPostBack)
        {
            
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);
            conn.Open();produit p;
            string query = "SELECT Id FROM BMM WHERE Code="+Session["Dropdownlist1"]+ "";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader dr1 = cmd.ExecuteReader();
            while(dr1.Read())
            {
                idbmm = dr1.GetInt32(0);
            }
            dr1.Close();
            string query2 = "SELECT * FROM Descriptionbmm WHERE BMMId="+idbmm+"";
            cmd = new SqlCommand(query2, conn);
            dr1 = cmd.ExecuteReader();
            while (dr1.Read())
            {
                p = new produit(dr1[0].ToString(),dr1[1].ToString(),dr1[2].ToString(),dr1[3].ToString());
                Liste.Add(p);
            }
            dr1.Close();
          
            foreach (var pr in Liste)
            {

                BmmBody.InnerHtml += string.Format("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td></tr>", pr.getModele(), pr.getMarque(), pr.getDesignation(), pr.getReference());

            }
            query = "SELECT * FROM Produit WHERE Disponibilite='True'";
            cmd = new SqlCommand(query, conn);produitLivre pl;
            dr1 = cmd.ExecuteReader();
            while (dr1.Read())
            {
                pl = new produitLivre(dr1[5].ToString(), dr1[4].ToString(), dr1[2].ToString(), dr1[1].ToString(), dr1[6].ToString(),dr1[3].ToString());
                ListeL.Add(pl);
            }
            dr1.Close();
            foreach (var prl in ListeL)
            {

                Tbody1.InnerHtml += string.Format("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td><td>{4}</td><td>{5}</td></tr>", prl.getModele(), prl.getMarque(), prl.getDesignation(), prl.getReference(),prl.getNumInventaire(),prl.getCodeSH());

            }
        }
        Liste.Clear();
        ListeL.Clear();
    }
    public class produit
    {
        string modele { get; set; }
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
    public class produitLivre
    {
        string numInventaire;
        string codeSH;
        string modele { get; set; }
        string marque { get; set; }
        string designation { get; set; }
        string reference { get; set; }
        public produitLivre(string NumInventaire,string CodeSH,string Modele, string Marque, string Designation, string Reference)
        {
            numInventaire = NumInventaire;
            codeSH = CodeSH;
            modele = Modele;
            marque = Marque;
            designation = Designation;
            reference = Reference;
        }
        public string getNumInventaire()
        {
            return this.numInventaire;
        }
        public string getCodeSH()
        {
            return this.codeSH;
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);
        conn.Open();
        string query1 = "UPDATE BMM SET IdGestionnaire=" + Int32.Parse(Session["id"].ToString())+ "WHERE code="+Session["Dropdownlist1"]+"";
        SqlCommand cmd = new SqlCommand(query1, conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect(Request.RawUrl, true);
    }
}