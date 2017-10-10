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
public partial class Validateur_HistoriqueValidation : System.Web.UI.Page
{
    public List<BMM> listeValide = new List<BMM>();
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Session["userName"].ToString();
        DateTime date = DateTime.Now;
        int idUser = Int32.Parse(Session["id"].ToString());
        if (!Page.IsPostBack)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);
            listeValide = new List<BMM>();int user;
            conn.Open(); int valid1 = 0;string Nom="", prenom="", tel="";string modele="";int verif = 0;
            string query1 = "SELECT  * FROM BMM WHERE IdValidateur1="+idUser+" AND Valid1=1";string cordonne = "";
            SqlCommand cmd = new SqlCommand(query1, conn); BMM b;string query = "";
            SqlDataReader dr1 = cmd.ExecuteReader(); string s = ""; int code; string validation1 = "non validé", validation2 = "non validé", livr = "non livré";
          
            while (dr1.Read())
            {
                verif = 0;
                user = dr1.GetInt32(8);
                query = "SELECT NOM , PRENOM , TEL FROM Utilisateur WHERE Id=" + user + "";
                SqlCommand cmd2 = new SqlCommand(query,conn);
                SqlDataReader dr2 = cmd2.ExecuteReader();
                while (dr2.Read())
                {
                    Nom = dr2[0].ToString();
                    prenom = dr2[1].ToString();
                    tel = dr2[2].ToString();
                }
                cordonne = Nom+ " " + " | Tel: " + tel + "";
                dr2.Close();
                query = "SELECT modele FROM Descriptionbmm WHERE BMMId =" + dr1.GetInt32(0) + " ";
                cmd2 = new SqlCommand(query, conn);
                dr2 = cmd2.ExecuteReader();
                while(dr2.Read())
                {
                    if(verif==0)
                    {
                        modele += dr2[0].ToString();
                     }
                    else
                    {
                        modele += " , " +dr2[0].ToString();
                    }
                }
                dr2.Close();
                code = dr1.GetInt32(7);
                
                if(dr1[3].ToString()!="")
                {
                    livr = "Livré";
                }
                if (dr1[10].ToString()=="True") {
                    validation2 = "validé";
                }
                b = new BMM(code,cordonne, modele, validation2 , livr,date.ToString());
                        listeValide.Add(b);
                }

            }
    }
    public class BMM
    {
        int code { get; set; }
        string cordonne;
        string modele { get; set; }
        string validation2 { get; set; }
        string livraison { get; set; }
        string DateValidation;
        public BMM(int code,string cordonne, string modele, string validation2, string livraison, string DateValidation)
        {
            this.code = code;
            this.cordonne = cordonne;
            this.modele = modele;
            this.validation2 = validation2;
            this.livraison = livraison;
            this.DateValidation = DateValidation;
        }
        public int getCode()
        {
            return code;
        }
        public string getCordonne()
        {
            return cordonne;
        }
        public string getModele()
        {
            return modele;
        }
        public string getValidation2()
        {
            return validation2;
        }
        public string getLivraison()
        {
            return livraison;
        }
        public string getDateValidation()
        {
            return DateValidation;
        }

    }
}