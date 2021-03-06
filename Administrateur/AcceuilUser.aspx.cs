﻿using System;
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

public partial class AcceuilUser : System.Web.UI.Page
{

    public List<BMM> listeValide = new List<BMM>();
    public List<BMM> listeNonValide = new List<BMM>();
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Session["userName"].ToString();
        int idUser = Int32.Parse(  Session["id"].ToString());
        if (!Page.IsPostBack)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);
            listeValide = new List<BMM>();
            listeNonValide = new List<BMM>();
            conn.Open();
           string query1 = "SELECT  Code,IdValidateur1,IdValidateur2,idGestionnaire,DateCreation FROM BMM WHERE UtilisateurId=" + idUser + "";
           SqlCommand cmd = new SqlCommand(query1, conn); BMM b; 
           SqlDataReader dr1 = cmd.ExecuteReader(); string s =""; int code; string valid1 = "non validé", valid2 = "non validé", livr = "non livré";
            while (dr1.Read())
            {
                valid1 = "non validé"; valid2 = "non validé"; livr = "non livré";
                code = dr1.GetInt32(0);
                
                if (dr1["IdValidateur1"].ToString() != s)
                {
                    
                    valid1 = "Validé";
                    if (dr1["IdValidateur2"].ToString() != s)
                    {
                        valid2 = "Validé";
                        if (dr1["IdGestionnaire"].ToString() != s)
                        {
                            livr = "Livré";
                            b = new BMM(code, valid1, valid2, livr, dr1["DateCreation"].ToString());
                            listeNonValide.Add(b);
                        }
                        else
                        {
                            b = new BMM(code, valid1, valid2, livr, dr1["DateCreation"].ToString());
                            listeValide.Add(b);
                          

                        }
                    }
                    else
                    {
                        b = new BMM(code, valid1, valid2, livr, dr1["DateCreation"].ToString());
                        listeValide.Add(b);
                       

                    }

                }
                else
                {
                    b = new BMM(code, valid1, valid2, livr, dr1["DateCreation"].ToString());
                    listeValide.Add(b);
                  
                }     
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
   

}