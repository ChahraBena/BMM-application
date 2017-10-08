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

public partial class Gestionnaire_Livraison : System.Web.UI.Page
{
    public List<BMM> listeValide = new List<BMM>();
    int code = 0;int Id; 
    public static List<produit> ListeProduit = new List<produit>();


    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Session["userName"].ToString();
        int idUser = Int32.Parse(Session["id"].ToString());
        Id = idUser;
        if (!Page.IsPostBack)
        {
            BMM b; ListItem item = new ListItem();
            DropDownList1.Items.Add(new ListItem("select your choice", "id0"));
            listeValide = new List<BMM>(); int code=0;
           // SqlCommand cmd2;
           // string query2 = "UPDATE BMM SET IdGestionnaire=" + idUser + " WHERE Code=" + code + "";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);
            conn.Open();
           string query1 = "SELECT * FROM BMM WHERE Valid2='True' AND Valid1='True'";
            SqlCommand cmd = new SqlCommand(query1, conn);
            SqlDataReader dr1 = cmd.ExecuteReader();
            while (dr1.Read())
            {
                if(dr1[3].ToString()=="")
                {
                    code = dr1.GetInt32(7);
                    item = new ListItem();
                    item.Text = code.ToString();
                    item.Value = code.ToString();
                    b = new BMM(code, "Validé", "validé", "non livré", dr1[4].ToString());
                    listeValide.Add(b);
                    DropDownList1.Items.Add(item);
               
                }
                

            }
            dr1.Close();
            conn.Close();
            if(DropDownList1.Text!= "select your choice")
            {
                LivrerButton.Enabled = true;
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



    protected void LivrerButton_Click(object sender, EventArgs e)
    {
        
    }

    protected void LivrerButton_Click1(object sender, EventArgs e)
    {
        
            HttpCookie cookie = new HttpCookie("PreviousPage");
            cookie.Value = DropDownList1.Text;
            Response.Cookies.Add(cookie);
            Response.Redirect("LivrerProduit.aspx");
        

        //Response.Redirect("LivrerProduit.aspx?Id=" + DropDownList1.Text);
    }
}
