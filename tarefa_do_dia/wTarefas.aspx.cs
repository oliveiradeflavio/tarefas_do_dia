using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tarefa_do_dia
{
    public partial class wTarefas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario_autenticado"] == null)
            {
                Response.Redirect("~/wLogin.aspx");
            }
            else
            {
                lb_usuario_logado.Text = "Olá " + Session["usuario_autenticado"];
            }
        }

        protected void btn_adicionar_tarefa_Click(object sender, EventArgs e)
        {

            if(input_tarefa.Text == "")
            {
                lb_mensagem_tarefa.Text = "Preencha o campo tarefa";
            }
            else
            {
                lb_mensagem_tarefa.Text = "";

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
                cmd.CommandText = "insert into tarefas (tarefa) values (@tarefa)";
                cmd.Parameters.AddWithValue("tarefa", input_tarefa.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                grid_de_tarefas.DataBind();
                input_tarefa.Text = "";
            } 
        }

        protected void grid_de_tarefas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_sair_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/wLogin.aspx");
        }
    }
}