using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class AjouterUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);

            try
            {
                conn.Open();
                string query1 = "SELECT Id from Departement WHERE Nom='" + DropDownListDepartement.Text + "'";
                SqlCommand cmd = new SqlCommand(query1, conn);
                SqlDataReader dr1 = cmd.ExecuteReader();
                int idDep = 0, idTypeUser = 0;
                if (dr1.Read())
                {
                    idDep = dr1.GetInt32(0);

                }
                dr1.Close();
                string query2 = "SELECT id from TypeUser WHERE Nom='" + DropDownListType.Text + "'";
                SqlCommand cmd2 = new SqlCommand(query2, conn);
                dr1 = cmd2.ExecuteReader();
                if (dr1.Read())
                {
                    idTypeUser = dr1.GetInt32(0);

                }
                dr1.Close();
                query2 = "SELECT UserName FROM Utilisateur where UserName='" + TextBoxUsername.Text + "'";
                cmd = new SqlCommand(query2, conn);
                dr1 = cmd.ExecuteReader();
                if (dr1.Read())
                {
                    Label2.Text = " Le nom d utilisateur est déja utilisé";
                    dr1.Close();
                }
                else
                {
                    dr1.Close();
                    query1 = "INSERT INTO Utilisateur VALUES ('" + TextBoxNom.Text + "','" + TextBoxPrenom.Text + "','" + TextBoxUsername.Text + "','" + TextBoxMatricule.Text + "','" + TextBoxMotdepasse.Text + "'," + idDep + "," + idTypeUser + ",'" + TextBoxEmail.Text + "')";
                    cmd = new SqlCommand(query1, conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Label2.Text = "Utilisateur enregistré";


                }


            }
            catch (Exception ex)
            {
                Label2.Text = "" + ex;
            }
        }
    }
}