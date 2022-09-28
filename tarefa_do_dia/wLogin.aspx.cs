using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tarefa_do_dia
{
    public partial class wLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_logar_Click(object sender, EventArgs e)
        {
            
            String usuario = input_login.Text;
            String senha = input_password.Text;

            //conferindo os registros no banco 
            //Pegando a String de Conexão
            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/MyWebSiteRoot");
            System.Configuration.ConnectionStringSettings connString;
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings["ConnectionString"];
            //fim

            //cria um objeto de conexão
            SqlConnection con = new SqlConnection();
            con.ConnectionString = connString.ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from usuarios where login = @login and senha = @senha";
            cmd.Parameters.AddWithValue("login", usuario);
            cmd.Parameters.AddWithValue("senha", senha);
            con.Open();


            SqlDataReader registro = cmd.ExecuteReader();
            if (registro.HasRows)
            {
                Session["usuario_autenticado"] = usuario;
                Response.Redirect("~/wTarefas.aspx");
            }
            else
            {
                lb_mensagem_login.Text = "Verifique suas credenciais";             

            }
        }

    }
}