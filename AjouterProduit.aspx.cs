using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class AjouterProduit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);

            try
            {
                conn.Open();
                string query1 = "SELECT Id from TypeProduit WHERE Nom='" + DropDownListType.Text + "'";
                SqlCommand cmd = new SqlCommand(query1, conn);
                SqlDataReader dr1 = cmd.ExecuteReader();
                int idType = 0;
                if (dr1.Read())
                {
                    idType = dr1.GetInt32(0);

                }
                dr1.Close();
         
                query1 = "SELECT Reference FROM Produit where Reference='" + TextBoxReference.Text + "'";
                cmd = new SqlCommand(query1, conn);
                dr1 = cmd.ExecuteReader();
                if (dr1.Read())
                {
                    Label2.Text = "Ce produit existe déja";
                }
                else
                {
                    dr1.Close();
                    query1 = "INSERT INTO Produit VALUES ('" + TextBoxMarque.Text + "','" + TextBoxModele.Text + "','" + TextBoxReference.Text + "','" + TextBoxCodeSH.Text + "','" + TextBoxInventaire.Text + "','" + TextBoxDescription.Text+ "'," + idType +",6,1)";
                    cmd = new SqlCommand(query1, conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Label2.Text = "Produit enregistré";
                    TextBoxMarque.Text = "";
                    TextBoxModele.Text = "";
                    TextBoxReference.Text = "";
                    TextBoxCodeSH.Text = "";
                    TextBoxInventaire.Text = "";
                    TextBoxDescription.Text = "";
                }

            }
            catch (Exception ex)
            {
                Label2.Text = "" + ex;
            }
        }
    }
}