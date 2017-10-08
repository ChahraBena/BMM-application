using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class login2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void TextBoxUser_TextChanged(object sender, EventArgs e)
    {
       
    }

    protected void TextBoxPassword_TextChanged(object sender, EventArgs e)
    {

    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);

         // try
         //{
            conn.Open();
            string query = "SELECT * FROM Utilisateur where UserName='" + TextBoxUser.Text + "' AND MotDePasse='" + TextBoxPassword.Text + "'";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader dr1 = cmd.ExecuteReader();
            if(dr1.Read())
            {
            if (dr1.GetInt32(7) == 2)
            {
                    Session["id"] = dr1.GetInt32(0);
                    Session["userName"] = dr1[3].ToString();
                    Session["DepartementId"] = dr1.GetInt32(6);
                dr1.Close();
               
                Response.Redirect("Utilisateur/AcceuilUser.aspx");
                //Server.Transfer("AcceuilUser.aspx", true);
                }
            else if(dr1.GetInt32(7)==3)
            {
                Session["id"] = dr1.GetInt32(0);
                Session["userName"] = dr1[3].ToString();
                Session["DepartementId"] = dr1.GetInt32(6);
                dr1.Close();

                Response.Redirect("Validateur/AcceuilValidateur.aspx");
            }
            else if (dr1.GetInt32(7) == 4)
            {
                Session["id"] = dr1.GetInt32(0);
                Session["userName"] = dr1[3].ToString();
                Session["DepartementId"] = dr1.GetInt32(6);
                dr1.Close();

                Response.Redirect("Validateur2/AcceuilValidateur.aspx");
            }
            else if(dr1.GetInt32(7)==5)
            {
                Session["id"] = dr1.GetInt32(0);
                Session["userName"] = dr1[3].ToString();
                dr1.Close();

                Response.Redirect("Gestionnaire/AcceuilUser.aspx");
            }
            else if (dr1.GetInt32(7) == 1)
            {
                Session["id"] = dr1.GetInt32(0);
                Session["userName"] = dr1[3].ToString();
                dr1.Close();

                Response.Redirect("Administrateur/AcceuilUser.aspx");
            }
        }
            
            
            else
            {
              LabelError.Text = "Utilisateur non existant";
                dr1.Close();
            }
        }
            
     
      
    
    
}