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

public partial class CréerBmm : System.Web.UI.Page
{
    public static List<produit> Liste = new List<produit>();
    public static List<produit> Liste2 = new List<produit>();
    public static int i = 1;
    public static int   idbmm;
    DataTable dt;
    int idUser = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

        idUser = Int32.Parse(Session["id"].ToString());
        //((TextBox)lastpage.FindControl("TextBoxUser")).Text;
        LabelUser.Text = Session["UserName"].ToString();
        if (!IsPostBack)
        {
            
        }
    }
    private static readonly Random getrandom = new Random();
    private static readonly object syncLock = new object();
    public static int GetRandomNumber(int min, int max)
    {
        lock (syncLock)
        { // synchronize
            return getrandom.Next(min, max);
        }
    }
    public int genererCodeBMM()
    {
        int code = GetRandomNumber(100, 1000000000);
        SqlCommand cmd;
        SqlDataReader dr1;
        int verif = 0;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);
        conn.Open();
        try
        {
            while (verif == 0)
            {

                cmd = new SqlCommand("SELECT Id FROM BMM WHERE Code=" + code + "", conn);
                dr1 = cmd.ExecuteReader();
                if(dr1.Read())
                {
                    code = GetRandomNumber(100, 1000000000);
                }
                else
                {
                    verif = 1;
                }
            }
            return code;
        }
       
         catch(Exception ex)
         {
             return code;
         }

    }
    public int createBMM()
    {
        int Idbmm = 0;
       
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);
            conn.Open();
            string query1 = "";
            SqlCommand cmd;
            SqlDataReader dr1;
            int code = genererCodeBMM();
            DateTime date = DateTime.Now;
            query1 = "INSERT INTO BMM (Code, DateCreation, UtilisateurId) VALUES ("+code+" , '"+date+"' , "+idUser+")";
            cmd = new SqlCommand(query1, conn);
            cmd.ExecuteNonQuery(); 
        
            SqlCommand cmd2 = new SqlCommand("SELECT Id FROM BMM WHERE Code=" + code + "",conn);
            dr1 = cmd2.ExecuteReader();
            if (dr1.Read())
            {
                    Idbmm = dr1.GetInt32(0);
                dr1.Close();
                idbmm = Idbmm;
            
            foreach (produit p in Liste)
                {  
                    cmd2 = new SqlCommand("INSERT INTO Descriptionbmm(modele,marque,designation,reference,BMMId) VALUES('" + p.getModele() + "' , '" + p.getMarque() + "' , '" + p.getDesignation() + "' , '" + p.getReference() + "' , " + idbmm + ")", conn);
                    cmd2.ExecuteNonQuery();
                }
            }
            conn.Close();
            return Idbmm;
       }
      catch (Exception ex)
        {
            Label2.Text = "" + ex;
            return Idbmm;
        }
    }
    
    public void add_row_Click(object sender, EventArgs e)
    {
        
        i++;
        produit p = new produit(modele0.Text, marque0.Text, description0.Text, reference0.Text);
        Liste.Add(p);
        Liste2.Add(p);
        modele0.Text = "";
        description0.Text = "";
        marque0.Text = "";
        reference0.Text = "";
        Label2.Text = ""+i+"";
        delete_row.Enabled = true;
    }

    public void delete_row_Click(object sender, EventArgs e)
    {
         idbmm = 0;
        i = 1;
      //  Response.Redirect(HttpContext.Current.Request.Path);
        idbmm =createBMM();
        foreach (var p in Liste)
        {
            
            BmmBody.InnerHtml += string.Format("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3}</td></tr>", p.getModele(), p.getMarque(), p.getDesignation(), p.getReference());
          
        }
        tab.Visible = false;
           delete_row.Visible = false;
            add_row.Visible = false;
           

        Matable.Visible = true;
       Button1.Visible = true;
      Button2.Visible= true;

        Liste.Clear();
        Liste2.Clear();
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

    protected void modele0_TextChanged(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("CréerBMM.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand cmd2 = new SqlCommand("DELETE FROM  Descriptionbmm WHERE BMMId="+idbmm+"", conn);
        cmd2.ExecuteNonQuery();
         cmd2 = new SqlCommand("DELETE FROM  BMM WHERE Id=" + idbmm + "", conn);
        cmd2.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("CréerBMM.aspx");


    }
}
