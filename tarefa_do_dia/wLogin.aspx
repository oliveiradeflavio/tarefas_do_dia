<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wLogin.aspx.cs" Inherits="tarefa_do_dia.wLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="~/css/style.css" rel="stylesheet" />
<link rel="shortcut icon" type="image/x-icon" href="~/img/favicon.ico" />


    <title>Tarefa do Dia</title>
</head>
<body>

   <main id="container_login">
       <section>
           <%--<div>
               <asp:Image ID="imagem_login" runat="server" ImageUrl="~/img/tarefa.png" />
           </div>--%>
          <form id="form_login" runat="server">
        <div>
            <asp:Label ID="lb_mensagem_login" runat="server" Font-Size="18px" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="input_login" runat="server" placeholder="Usuário" class="caixa_textos" ></asp:TextBox>
            <br />
            <asp:TextBox ID="input_password" runat="server" type="password" placeholder="Senha" class="caixa_textos"></asp:TextBox>
            <br />
            <asp:Button ID="btn_logar" runat="server" Text="Logar" class="btn" OnClick="btn_logar_Click"  />
             </div>
            </form>
       </section>
    </main>
   

</body>
</html>
