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

public partial class ValiderBMM : System.Web.UI.Page
{
    public List<BMM> listeValide = new List<BMM>();
    int code=0;

   

    protected void Page_Load(object sender, EventArgs e)
    {      
        Label1.Text = Session["userName"].ToString();
        int idUser = Int32.Parse(Session["id"].ToString());
        if (!Page.IsPostBack)
        {
            BMM b; ListItem item = new ListItem();
            DropDownList1.Items.Add(new ListItem("Selectionner un code", "id0"));
            listeValide = new List<BMM>();
            int code; string validation1 = "non validé", validation2 = "non validé", livr = "non livré";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);
            conn.Open();
            string query1 = "SELECT * FROM BMM WHERE IdValidateur1=" + idUser + "";
            SqlCommand cmd = new SqlCommand(query1, conn);
            SqlDataReader dr1 = cmd.ExecuteReader();
            while(dr1.Read())
            {
                code = dr1.GetInt32(7);
                item = new ListItem();
                item.Text = code.ToString();
                item.Value = code.ToString();
                if (dr1["Valid1"].ToString()=="False")
                {
                    b = new BMM(code, validation1, validation2, livr, dr1["DateCreation"].ToString());
                    listeValide.Add(b);
                    DropDownList1.Items.Add(item);
                }
            }
            conn.Close();
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

 

    protected void myButton_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.ToString() != "id0")
        {


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BMM_SHConnectionString"].ConnectionString);
            conn.Open();
            DateTime date = DateTime.Now;
            string query1 = "UPDATE BMM SET Valid1=1 , DateValidation1='"+ date +"' WHERE code=" + DropDownList1.Text + "";
            SqlCommand cmd = new SqlCommand(query1, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect(Request.RawUrl, true);
        }

    }
}