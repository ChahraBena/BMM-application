using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Globalization;

public partial class HistoriqueValide : System.Web.UI.Page
{
    public List<BMM> listeValide = new List<BMM>();
    public static List<produit> ListeProduit = new List<produit>();

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Session["userName"].ToString();
        int idUser = Int32.Parse(Session["id"].ToString());

        if (!Page.IsPostBack)
        {
            DropDownList1.Items.Add(new ListItem("Selectionner un code", "id0"));
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);
            listeValide = new List<BMM>();ListItem item;
            conn.Open(); int valid1 = 0, valid2 = 0;
            string query1 = "SELECT  Code,Valid1,Valid2,IdGestionnaire,DateCreation FROM BMM WHERE UtilisateurId=" + idUser + "";
            SqlCommand cmd = new SqlCommand(query1, conn); BMM b;
            SqlDataReader dr1 = cmd.ExecuteReader(); string s = ""; int code; string validation1 = "validé", validation2 = "validé", livr = "livré";
            while (dr1.Read())
            {
                code = dr1.GetInt32(0);
                validation1 = "validé"; validation2 = "validé"; livr = "livré";
                code = dr1.GetInt32(0);
                if (dr1[1] != null)
                {

                    if (dr1[1].ToString() != "False")
                    {
                        if (dr1[2].ToString() != "False")
                        {
                            if (dr1[2].ToString() != s)
                            {
                                b = new BMM(code, validation1, validation2, livr, dr1["DateCreation"].ToString());
                                listeValide.Add(b);
                                code = dr1.GetInt32(0);
                                item = new ListItem();
                                item.Text = code.ToString();
                                item.Value = code.ToString();
                                DropDownList1.Items.Add(item);
                            }
                        }
                    }
                }
            }
        }
    }
    protected void myButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl, true);
        produit p;
        if(DropDownList1.SelectedValue.ToString()!= "Selectionner un code")
        {
            string query = "SELECT* FROM Descriptionbmm WHERE Code=" + DropDownList1 + "";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader dr1 = cmd.ExecuteReader();
            while (dr1.Read())
            {
                p = new produit(dr1[0].ToString(), dr1[1].ToString(), dr1[2].ToString(), dr1[3].ToString());
                ListeProduit.Add(p);
            }
            foreach (var pr in ListeProduit)
            {
                BmmBody.InnerHtml += string.Format("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td></tr>", pr.getModele(), pr.getMarque(), pr.getDesignation(), pr.getReference());
            }
        }
      
    }
    public class BMM
    {
        int code { get; set; }
        string validation1 { get; set; }
        string validation2 { get; set; }
        string livraison { get; set; }
        string DateCreation;
        public BMM(int code, string validation1, string validation2, string livraison, string DateCreation)
        {
            this.code = code;
            this.validation1 = validation1;
            this.validation2 = validation2;
            this.livraison = livraison;
            this.DateCreation = DateCreation;
        }
        public int getCode()
        {
            return code;
        }
        public string getValidation1()
        {
            return validation1;
        }
        public string getValidation2()
        {
            return validation2;
        }
        public string getLivraison()
        {
            return livraison;
        }
        public string getDateCreation()
        {
            return DateCreation;
        }

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
}