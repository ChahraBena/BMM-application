using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class Creation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      if(IsPostBack)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);

            try
            {
                conn.Open();
                string query1 ="SELECT Id from Departement WHERE Nom='" + DropDownListStructure.Text + "'";
                SqlCommand cmd = new SqlCommand(query1, conn);
                SqlDataReader dr1 = cmd.ExecuteReader();
                int idDep = 0, idTypeUser = 0;
                if (dr1.Read())
                {
                    idDep = dr1.GetInt32(0);

                }
                dr1.Close();
                string query2 = "SELECT id from TypeUser WHERE Nom='"+DropDownListUser.Text+"'" ;
                SqlCommand cmd2 = new SqlCommand(query2, conn);
                SqlDataReader dr2 = cmd2.ExecuteReader();
                if (dr2.Read())
                {
                    idTypeUser= dr2.GetInt32(0);

                }
                dr2.Close();
                query1 = "INSERT INTO Utilisateur VALUES ('" + TextBoxName.Text + "','" + TextBoxFirstName.Text + "','" + TextBoxUserName.Text + "','"+TextBoxMatricule.Text+"','"+TextBoxPassword.Text+"',"+idDep+","+idTypeUser+",'"+TextBoxEmail.Text+"')";
                cmd = new SqlCommand(query1, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                LabelError.Text = "Utilisateur enregistré";
            }
            catch(Exception ex)
            {
                LabelError.Text = "" + ex;
            }
        }
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
         
        }
    }

    protected void DropDownListStructure_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}